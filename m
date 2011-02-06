Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pm65I-0000Uz-3K
	for linux-mtd@lists.infradead.org; Sun, 06 Feb 2011 14:59:29 +0000
Received: by ewy20 with SMTP id 20so1794823ewy.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 06 Feb 2011 06:59:26 -0800 (PST)
Subject: Re: ubifs_scan() error handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: twebb <taliaferro62@gmail.com>
In-Reply-To: <AANLkTikfW_KDcBcJZ8RFq=v1CvRtdmjAVB8yQ_kQEP9F@mail.gmail.com>
References: <AANLkTilwqK96Btosh4kzW0kMDjRWzWskrG_ymekpV9Uz@mail.gmail.com>
	<1278995289.16634.126.camel@localhost>
	<1278995528.16634.129.camel@localhost>
	<AANLkTi==-biDcaFozVvkHUwXMYqMWk4=mbD16_TJ1JOO@mail.gmail.com>
	<1296322698.2400.10.camel@localhost>
	<AANLkTikfW_KDcBcJZ8RFq=v1CvRtdmjAVB8yQ_kQEP9F@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Feb 2011 16:58:30 +0200
Message-ID: <1297004310.4460.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lei Wen <leiwen@marvell.com>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-01-31 at 20:26 -0500, twebb wrote:
> >> It's been awhile but I wanted to reopen the discussion on this topic.
> >> Could you take a look at this proposed patch?  Essentially this change
> >> results in the LEB being cleaned/recovered regardless of whether
> >> is_last_write() is true or not.  There may be a better way to do this
> >> earlier in the same function, but I'm not familiar enough with it to
> >> know the significance of the is_last_write() call.
> >
> > But I think I explained why this check is there. Why exactly it does not
> > work for your flash? I think you need to get better understanding what
> > is happening in your case. I am reluctant to take this patch because it
> > is more of a band-aid but not a proper solution.
> >
> 
> I don't recall an explanation about why that check is there, but
> regardless, I'll try to explain why things are failing on my flash:

Well, I explained it in various threads, probably not in this one. But
I've just pushed a patch to the ubifs-2.6.git tree which should shed
some light:
http://git.infradead.org/ubifs-2.6.git/blobdiff/c8aa892b861cda6fc29526feae5d41db69523c36..5b1791a1529ccd4e49c59fe9f8fb6575f74c569e:/fs/ubifs/recovery.c


> Let's take the case of a read or write disturb error causing multiple
> bit flips in the empty space of a LEB (not in the common header node
> magic number location).  I believe this type of error is very common
> with MLC (since ECC will generally handle bit flips in non-FF areas.)
> 
> LEB: | good nodes | 0xFFs | bit flip | 0xFFs | bit flip | 0xFFs|

What will happen if I write to the space which goes after "good nodes"
and contain bit-flips? If I fill that space with UBIFS nodes, will they
be all-right? Is it safe? Because this is what UBIFS will do. 

... snip ...

> However, because of the nature of the "corruption", if
> ubifs_recover_leb() ignores is_last_write() result and instead calls
> clean_buf() and sets need_clean = 1, then fix_unclean_leb() ultimately
> fixes the bit flip via the ubi_leb_change() call and without data
> loss.

We can do this, but if your flash is so weak that you can never rely on
empty space being 0xFFed, then you are screwed anyway. Because UBIFS
will write nodes to other LEBs with empty space damaged by bit-flips.

With such weak flash we'd need to do much more than the patch you've
sent.

This is why I think your change is a hack which hides the problem, not
fixes.

And BTW, can you confirm that with your patch your system can survive
stress tests and good power-cut testing? Did you do this, can you
describe how you stress your system?

If the answer is "yes", then I doubt the reason for those bit-flips is
read-disturb. If "yes", then I really suspect the reason for bit-flips
is somewhat similar to the unstable bits problem reported by Matthieu
CASTET and discussed here. His problem is SLC-specific.

The idea of the issue is that if you cut the power just after you
started writing to the NAND page X, you then may find that it becomes
unstable. You can sometimes read all 0xFFs from there, some-times have
bit-flips, sometimes even hard ECC errors. UBIFS does not currently deal
with this issue and I'm going to work on it as soon as I have time. UBI
also needs fixes to deal with this issue.

I did start doing some work some time ago and documented the issue in my
UBI development tree:
http://git.infradead.org/ubi-2.6.git/blobdiff/0d3d5b3db2e2a0c6eed40714a3e9505031769508..a3353e9ebd42c710396ed6e8db0bda0a600bb1a5:/drivers/mtd/ubi/scan.c

So, probably in case of MLC the unstable bit problem becomes something
more severe.

Thus, if you'd invest time and more properly explore the nature of these
bit-flips you have, if you experimented properly and if you could give
exact description about how they appeared, not just "I guess these are
read-disturbs", then we can think how to really fix the issue.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
