Received: from wa-out-1112.google.com ([209.85.146.181])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JnuWY-0002YB-3M
	for linux-mtd@lists.infradead.org; Mon, 21 Apr 2008 11:49:31 +0000
Received: by wa-out-1112.google.com with SMTP id v33so2651914wah.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Apr 2008 04:49:28 -0700 (PDT)
Message-ID: <bae050c10804210449w14e75e0wf977815c22423358@mail.gmail.com>
Date: Mon, 21 Apr 2008 19:49:23 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: ubi-utils
In-Reply-To: <1208776123.5965.367.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10804210148g7e36db07vd7df62e286da6490@mail.gmail.com>
	<1208769345.5965.363.camel@sauron>
	<bae050c10804210243l848eeb6m97a33c5a65d5dfc6@mail.gmail.com>
	<1208776123.5965.367.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > unubi need a image file as one of its parameter, its job seems like
> > ubiupdatevol do, but I need an opposite function. I need a tool to
> > generate a volume image
>
> I do not think you got it right because its input file it flash dump,
> but we do not have anything else at the moment.

Yes, its input file is ubi image.
Where is the old ubi-utils' user manual? At least, hope the code
producer give those tools' usage examples and briefly tell those
tools' function. Thanks in advance!

Ok, so I have to build this tool by myself. Cause there's no tools
like mkfs.ubifs for vfat filesystem. That's the only way to generate a
image file the same format like the ubifs.img and all those images can
be integrated by ubinize to generate a final ubi image file, then
nandwrite to complete the Nand flash burn job.

Or, I make all UBIFS volumes in one MTD partition, VFAT as the only
volume in another MTD partition, attache two MTD partition to UBI.
Then I do not need to write any tools, but use traditional nandread,
nandwrite(fixed FF) for VFAT. How about this? Does attach 2 MTD
partition as 2 UBI devices eat system resources a lot? slow down the
Nand read or write speed?

Any suggestion?   Thanks!

-- 
Best wishes,
Nancy
