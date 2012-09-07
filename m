Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TA7gs-0006Un-Dp
 for linux-mtd@lists.infradead.org; Fri, 07 Sep 2012 23:10:23 +0000
Received: by wibhn17 with SMTP id hn17so23190wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 07 Sep 2012 16:10:20 -0700 (PDT)
MIME-Version: 1.0
Sender: linus971@gmail.com
In-Reply-To: <1347057778.26695.68.camel@sbsiddha-desk.sc.intel.com>
References: <1340959739.2936.28.camel@lappy>
 <CA+1xoqdgKV_sEWvUbuxagL9JEc39ZFa6X9-acP7j-M7wvW6qbQ@mail.gmail.com>
 <CA+55aFzJCLxVP+WYJM-gq=aXx5gmdgwC7=_Gr2Tooj8q+Dz4dw@mail.gmail.com>
 <1347057778.26695.68.camel@sbsiddha-desk.sc.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Sep 2012 16:09:59 -0700
Message-ID: <CA+55aFwW9Q+DM2gZy7r3JQJbrbMNR6sN+jewc2CY0i1wD_X=Tw@mail.gmail.com>
Subject: Re: mtd: kernel BUG at arch/x86/mm/pat.c:279!
To: Suresh Siddha <suresh.b.siddha@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-mm <linux-mm@kvack.org>, linux-mtd@lists.infradead.org,
 Sasha Levin <levinsasha928@gmail.com>, Dave Jones <davej@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 7, 2012 at 3:42 PM, Suresh Siddha <suresh.b.siddha@intel.com> wrote:
> -       unsigned long start;
> -       unsigned long off;
> -       u32 len;
> +       resource_size_t start, off;
> +       unsigned long len;

So since the oops is on x86-64, I don't think it's the "unsigned long"
-> "resource_size_t" part (which can be an issue on 32-bit
architectures, though).

The "u32 len" -> "unsigned long len" thing *might* make a difference, though.

I also think your patch is incomplete even on 32-bit, because this:

>         if (mtd->type == MTD_RAM || mtd->type == MTD_ROM) {
>                 off = vma->vm_pgoff << PAGE_SHIFT;

is still wrong. It probably should be

    off = vma->vm_pgoff;
    off <<= PAGE_SHIFT;

because vm_pgoff may be a 32-bit type, while "resource_size_t" may be
64-bit. Shifting the 32-bit type without a cast (implicit or explicit)
isn't going to help.

That said, we have absolutely *tons* of bugs with this particular
pattern. Just do

    git grep 'vm_pgoff.*<<.*PAGE_SHIFT'

and there are distressingly few casts in there (there's a few, mainly
in fs/proc).

Now, I suspect many of them are fine just because most users probably
are size-limited anyway, but it's a bit distressing stuff. And I
suspect it means we might want to introduce a helper function like

    static inline u64 vm_offset(struct vm_area_struct *vma)
    {
        return (u64)vma->vm_pgoff << PAGE_SHIFT;
    }

or something. Maybe add the "vm_length()" helper while at it too,
since the whole "vma->vm_end - vma->vm_start" thing is so common.

Anyway, since Sasha's oops is clearly not 32-bit, the above issues
don't matter, and it would be interesting to hear if it's the 32-bit
'len' thing that triggers this problem. Still, I can't see how it
would - as far as I can tell, a truncated 'len' would at most result
in spurious early "return -EINVAL", not any real problem.

What are we missing?

Sasha, since you can apparently reproduce it, can you replace the
"BUG_ON()" with just a

 if (start >= end) {
    printf("bogus range %llx - %llx\n", start, end);
    return -EINVAL;
  }

or something.

I'm starting to suspect that maybe it's actually that the length is
*zero*, and start == end, and that we should just return zero for that
case. But let's see what Sasha finds..

              Linus
