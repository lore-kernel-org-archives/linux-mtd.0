Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pu3S4-0002K4-Sz
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2011 13:47:53 +0000
Received: by wyf23 with SMTP id 23so3784973wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 28 Feb 2011 05:47:51 -0800 (PST)
Subject: Re: Slab memory leak in JFFS2 filesystems
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Johns Daniel <johns.daniel@gmail.com>
In-Reply-To: <AANLkTikT13ZM0fKHL9tdMei2txxS5a4MzQ8e6ccXFErc@mail.gmail.com>
References: <AANLkTimN5eBifpcyfJYo9s51U+kEi1ZemFnOm7p2rcxQ@mail.gmail.com>
	<1298637524.2798.103.camel@localhost>
	<AANLkTimvqdu1k3ZL4rqC-DBiMkNmytBXZ1YWXNE0Gs6F@mail.gmail.com>
	<1298651278.2346.2.camel@koala>
	<AANLkTikT13ZM0fKHL9tdMei2txxS5a4MzQ8e6ccXFErc@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Feb 2011 15:46:25 +0200
Message-ID: <1298900785.2809.22.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 11:11 -0600, Johns Daniel wrote:
> On Fri, Feb 25, 2011 at 10:27 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > On Fri, 2011-02-25 at 10:12 -0600, Johns Daniel wrote:
> >> On Fri, Feb 25, 2011 at 6:38 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> >> > On Thu, 2011-02-24 at 18:41 -0600, Johns Daniel wrote:
> >> >> I have discovered a kernel memory leak associated with JFFS2
> >> >> filesystems. I have verified the leak in kernels 2.6.28 and 2.6.36 on
> >> >> a Freescale PowerPC board using this script:
> >> >>
> >> >> while :; do FN=$(mktemp /jffs2fs/TMP.XXXXXXXX); \
> >> >>    cat /proc/slabinfo |grep "dentry\|size-64 "; sleep 1; /bin/rm $FN; done
> >> >
> >> > Please, check whether they go away after:
> >> >
> >> > echo 3 > /proc/sys/vm/drop_caches
> >> >
> >> > See Documentation/sysctl/vm.txt for more information about what this
> >> > means.
> >>
> >> Thanks for that suggestion, Artem! Here is what I tried:
> >
> > Hi, you can try to play with kmemleak - this is a kernel feature which
> > slows down the system a lot but is great in catching memory leaks. It
> > may have false positives sometimes, though. You can read about kmemleak
> > in the Documentation/ directory. I think if there are leaks in JFFS2 -
> > kmemleak would spot them.
> >
> 
> Unfortunately, the kmemleak feature is not supported on PPC even in
> 2.6.36. And I don't have a supported system available with the JFFS2
> filesystem.

Well, I cannot help you with JFFS2, sorry. Just few ideas, may be you'll
find them helpful.

I can suggest you thought to run a test on a PC + nandsim (or mtdram if
you have NOR). If it is possible, compile a similar kernel for PC and
test with the simulator. If you can reproduce the issue, you will have
kmemleak.

> One more data point. After running the script like this:
> 
> while :; do FN=$(mktemp /jffs2fs/TMP.XXXXXXXX); \
>    echo 3 > /proc/sys/vm/drop_caches; sleep 1; \
>    grep  "dentry\|size-64 " /proc/slabinfo; /bin/rm $FN; done
> 
> it looks like the leak may only be in "size-64" (and not "dentry").

Well, this comes from kmalloc(33-64) AFAIU. You can just instrument your
kernel yourself - add a small piece of code to kmalloc for the "size-64"
case. Make this code to do the following:

Define something like:

struct mem_user {
	void *addr;
	void *caller_addr;
}

You can pre-allocate few megs of bootmem and use that memory for these
objects.

Then, plug some code to kmalloc which will for create "struct mem_user"
object for each allocation and insert it into an RB-tree indexed by
'addr', where the 'addr' is the address of the allocated memory, so it
will be the key.

On kfree() - delete corresponding object from the RB-tree.

This way you will always be able to see who made an allocation. You can
add a debugfs file and print the list of memory users. You can store not
only caller address, but also whole or partial stackdump.

I did like this in UBI and even submitted the code in the first UBI
submittion - you can find it in LKML.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
