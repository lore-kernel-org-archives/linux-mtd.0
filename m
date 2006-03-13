Received: from [66.174.76.155] (helo=njbrsmtp1.vzwmail.net)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FIan7-0000mu-Eb
	for linux-mtd@lists.infradead.org; Sun, 12 Mar 2006 19:20:07 -0500
From: "Chuck Meade" <chuckmeade@mindspring.com>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
Date: Sun, 12 Mar 2006 19:07:09 -0500
Message-ID: <IIEEICKJLNEPBBDJICNGAEKAKEAA.chuckmeade@mindspring.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-reply-to: <20060312221442.GB7525@wohnheim.fh-wedel.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: cmdlinepart.c patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > ...
> > The attached patch defines the "unspecified offset" value as 0xffffffff and
> > makes the changes needed to support partitions that explicitly start at
> > offset 0x0, but are not necessarily listed first on the cmdline.
>
> I don't have any objections against your patch.  And seeing that it
> was submitted at least three times without any other objections
> either, it looks like it could go in.
>
> And it also appears to indicate that few people care much about
> cmdline.c. ;)
>
> Any objections against inclusion?

Hi Jörn,

I received email on this patch from Atsushi Nemoto, who submitted the earlier
patches for the same problem.  His patch has a couple of other nice features,
such as using UINT_MAX rather than 0xffffffff.  So if you want to use his
patch version that would be fine.

Thanks for getting back to me on this patch.

Regards,
Chuck
