Received: from florence.buici.com ([206.124.142.26] ident=qmailr)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 18B2wh-0008AH-00
	for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2002 01:00:56 +0000
Date: Sun, 10 Nov 2002 17:31:14 -0800
From: Marc Singer <elf@buici.com>
To: Wolfgang Denk <wd@denx.de>
Cc: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>,
  linux-mtd@lists.infradead.org
Subject: Re: crc32() optimization
Message-ID: <20021111013114.GB27214@buici.com>
References: <006901c288f4$79e2ce20$0200a8c0@telia.com> <20021110210008.7CFF210162@denx.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20021110210008.7CFF210162@denx.denx.de>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

On Sun, Nov 10, 2002 at 10:00:03PM +0100, Wolfgang Denk wrote:
> In message <006901c288f4$79e2ce20$0200a8c0@telia.com> you wrote:
> > 
> > What's "Duff's Device"?
> 
> It's a tricky way to implement general loop unrolling directly in  C.
> Applied  to your problem, code that looks like this (instead of 8 any
> other loop count may be used, but  you  need  to  adjust  the  "case"
> statements then):
> 
> 	register int n = (len + (8-1)) / 8;
> 
> 	switch (len % 8) {
> 	case 0: do {	val = crc32_table ... ;
> 	case 7:		val = crc32_table ... ;
> 	case 6:		val = crc32_table ... ;
> 	case 5:		val = crc32_table ... ;
> 	case 4:		val = crc32_table ... ;
> 	case 3:		val = crc32_table ... ;
> 	case 2:		val = crc32_table ... ;
> 	case 1:		val = crc32_table ... ;
> 		} while (--n > 0);
> 	}

This doesn't look right to me.  You are decrementing n but using the
modulus of len in the switch.  The len modulus is correct when n == 1,
but not when n > 1.  The idea makes sense, but the implementation
appears to be missing a detail.

As for performance problems, I believe that the trouble is evident
from the assembler output.  The reason that the unrolled loop is more
efficient than the simple loop is mainly because you don't jump as
often.  We all know that jumps tend to perturb the instruction fetch
queue and cache.

Here is an example.  I know it is wrong, but it shows how the compiler
implements the switch.  I've marked the problem jump.  It is executed
for every iteration of the loop so it tends to negate other changes
made to the algorithm.

So, the version I posted may not be significantly better that the
original one that unrolled 6 times.  It is just that unrolling to a
power of two sometimes makes the math simpler and sometimes improves
the performance.  The present crop of CPUs performs all simple ALU
functions in a single cycle, so there is little reason to worry about
how many loops to unroll.

BTW, I checked my code and found I made several errors.  The increment
step in for() is a decrement by 8, not a shift.

Cheers.

 --------------------------------------------------
#define ONCE do { ++i; } while (0);

int foo ()
{
  int i = 0;
  int c;

  for (c = 20 ; c > 0; c -= 8) {
    switch (c % 8) {
    case 0: ONCE;
    case 7: ONCE;
    case 6: ONCE;
    case 5: ONCE;
    case 4: ONCE;
    case 3: ONCE;
    case 2: ONCE;
    case 1: ONCE;
    }      
  }
  return i;
}

int main ()
{
  foo ();
}

--------------------------------------------------
	.file	"unroll.c"
	.text
	.align 2
	.p2align 2,,3
.globl foo
	.type	foo,@function
foo:
	pushl	%ebp
	movl	%esp, %ebp
	xorl	%eax, %eax
	pushl	%ebx
	movl	$20, %ecx
	.p2align 2,,3
.L26:
	testl	%ecx, %ecx
	movl	%ecx, %edx
	js	.L29
.L25:
	andl	$-8, %edx
	movl	%ecx, %ebx
	subl	%edx, %ebx
	cmpl	$7, %ebx
	ja	.L4
;;; **** This is the problem jump.
	jmp	*.L23(,%ebx,4)
;;; **** This is the problem jump.
	.section	.rodata
	.align 4
	.align 4
.L23:
	.long	.L7
	.long	.L21
	.long	.L19
	.long	.L17
	.long	.L15
	.long	.L13
	.long	.L11
	.long	.L9
	.text
.L7:
	incl	%eax
.L9:
	incl	%eax
.L11:
	incl	%eax
.L13:
	incl	%eax
.L15:
	incl	%eax
.L17:
	incl	%eax
.L19:
	incl	%eax
.L21:
	incl	%eax
.L4:
	subl	$8, %ecx
	testl	%ecx, %ecx
	jg	.L26
	popl	%ebx
	leave
	ret
	.p2align 2,,3
.L29:
	leal	7(%ecx), %edx
	jmp	.L25
.Lfe1:
	.size	foo,.Lfe1-foo
	.align 2
	.p2align 2,,3
.globl main
	.type	main,@function
main:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	andl	$-16, %esp
	call	foo
	leave
	ret
.Lfe2:
	.size	main,.Lfe2-main
	.ident	"GCC: (GNU) 3.2.1 20020830 (Debian prerelease)"

--------------------------------------------------
