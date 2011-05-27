Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QPtSG-000153-49
	for linux-mtd@lists.infradead.org; Fri, 27 May 2011 09:35:41 +0000
Received: by fxm14 with SMTP id 14so1599761fxm.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 27 May 2011 02:35:35 -0700 (PDT)
Subject: RE: [PATCH v2] nand: nand_base: Always initialise oob_poi before
	writing OOB data
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "THOMSON, Adam (Adam)" <adam.thomson@alcatel-lucent.com>
In-Reply-To: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A95632E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
References: <E14CAA9D00C5044EACE0C59FC2A1C7F5059A8DF591@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
	<1306396908.2785.152.camel@localhost>
	<E14CAA9D00C5044EACE0C59FC2A1C7F5059A95632E@FRMRSSXCHMBSC1.dc-m.alcatel-lucent.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 27 May 2011 12:30:54 +0300
Message-ID: <1306488654.2922.4.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-05-26 at 17:15 +0200, THOMSON, Adam (Adam) wrote:
> The reason I mentioned 2.6.31 was because it was the earliest kernel I
> had been using when I witnessed this issue. Having looked at the commit
> you mentioned, I have to agree that's where the problem first appeared.
> Do you want me to add the CC with [2.6.20+] (assume that should be part
> of the patch text in the mail)?

Yes, please, add the CC to -stable.

> > 2. I think the right place fir this memset is 
> > 'nand_fill_oob()'. But in this case the first memset from 
> > 'nand_do_write_oob()' has to be removed.
> > 
> 
> Yes, that makes sense. Did consider that afterwards. Will update
> Accordingly.

Thanks!

> No that's fine. Shouldn't be too much to do. Do you want both
> the stable patch and the proper fix submitted around the same
> time,

Yes, please.

>  or are you happy to get the initial fix in first, and follow up
> with the more complete tidying of that code?

Please, send all together. It is anyway too late to merge it to 2.6.40,
so there is no rush.

>  Also am guessing
> the complete patch should be based on the latest and greatest
> Kernel (2.6.39)?

Yes, of course, although the latest kernel is this one:
git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git

But it is OK to _test_ it an older kernel, though. 

> Having looked briefly at the read side code in nand_base.c,
> it does look like it should be enough to remove the second
> memset and leave the read side code as is, but will examine
> it more thoroughly before I post a patch.

Thanks a lot. When you send a patch, please, also explicitly tell
whether you tested it on some HW or only compile-tested.

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
