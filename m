Received: from mail2.lawo.de ([80.149.95.33] helo=ExchangeEdge1.lawo.de)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WGVRy-0001tM-UH
 for linux-mtd@lists.infradead.org; Thu, 20 Feb 2014 15:22:12 +0000
From: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Date: Thu, 20 Feb 2014 16:21:39 +0100
Subject: AW: AW: AW: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <52EF772D.8080207@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>
 <52EF9FFE.4020405@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>
 <52F1F658.9080701@nod.at>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
 <87txc4w698.fsf@nbsps.com>
In-Reply-To: <87txc4w698.fsf@nbsps.com>
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Richard Weinberger <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm back again now.

> Bill Pringlemeir wrote:
>
> $ printf "\x04\x70\x8a\xe4\x04\x50\x98\xe5\x05\x00\x5a\xe1\x29\x00\x00\x0=
a\x0c\x30\x95\xe5" > crash.dump $ objdump --disassemble-all -m arm -b binar=
y crash.dump=20
>
> crash.dump:     file format binary
>
>
> Disassembly of section .data:
>
> 00000000 <.data>:
>  0:   e48a7004        str     r7, [sl], #4
>    4:   e5985004        ldr     r5, [r8, #4]
>    8:   e15a0005        cmp     sl, r5
>    c:   0a000029        beq     0xb8
>   10:   e595300c        ldr     r3, [r5, #12]
>
> 'r5' is NULL.  It seems to be the same symptom.  If you run your ARM objd=
ump with -S on either vmlinux or '__up_write', it will help confirm that it=
 is the list corrupted again.  The assembler above should match.

I don't have running a objdump on my ARM system at the moment, but rwsem-sp=
inlock.c compiled with debug info,  objdump -S -D gives for __up_write():

...
	sem->activity =3D 0;
 29c:	e3a07000 	mov	r7, #0
 2a0:	e1a0a008 	mov	sl, r8

 2a4:	e48a7004 	str	r7, [sl], #4
 2a8:	e5985004 	ldr	r5, [r8, #4]
	if (!list_empty(&sem->wait_list))
 2ac:	e15a0005 	cmp	sl, r5
 2b0:	0a000029 	beq	35c <__up_write+0xe0>
	/* if we are allowed to wake writers try to grant a single write lock
	 * if there's a writer at the front of the queue
	 * - we leave the 'waiting count' incremented to signify potential
	 *   contention
	 */
	if (waiter->flags & RWSEM_WAITING_FOR_WRITE) {
 2b4:	e595300c 	ldr	r3, [r5, #12]
{
...

Seems to match ...

> What is 'RAVENNA_streame'?  Is this your standard test and not the '8k bi=
nary' copy test or are you doing the copy test with this process also runni=
ng?

This is an application which runs parallel to our copy test. The last days,=
 Emanuel set up another test environment which seems to reproduce the error=
 more reliably (at least on some hardwares, not on all).
At the moment, there are running proprietary applications in parallel, but =
I'll try to strip it down to a sequence which I can provide you, if you lik=
e.

> We have 'IRQs off', which makes sense for __up_write.  Trying 'ftrace_dum=
p_on_oops' as Richard suggests would be helpful to find out what went on be=
fore.  It might also make sense to dump some 'rwsem_waiter' nodes on the er=
ror?  It looks like '__up_write' might normally have an empty list?  > Cert=
ainly an non-empty 'rwsem_waiter' is going to trigger the condition more of=
ten?  I guess I can look to see what might cause this, even if I can not re=
produce it.  The 'preemp_count' has been two every time you have this; is t=
hat true?

We could reproduce the error now with function tracing enabled, so we have =
two hopefully valuable traces. But they are rather big (around 4MB each). S=
hall I use pastebin and cut them in several peaces to provide them? Or off-=
list as email attachment?
The trace Emanuel posted Wednesday may be not valuable. Perhaps there is a =
(different) error triggered due to memory pressure caused by the function t=
racing.


Best regards,
Thorsten
