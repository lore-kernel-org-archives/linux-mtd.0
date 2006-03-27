Received: from mailwasher.lanl.gov ([192.65.95.54] helo=mailwasher-b.lanl.gov)
	by pentafluge.infradead.org with esmtp (Exim 4.60 #1 (Red Hat Linux))
	id 1FNtB4-0006NI-Lt
	for linux-mtd@lists.infradead.org; Mon, 27 Mar 2006 15:58:43 +0100
Received: from godiva.ta-18.lanl.gov (godiva.ta-18.lanl.gov [128.165.164.98])
	by mailwasher-b.lanl.gov (8.12.11/8.12.11/(ccn-5)) with ESMTP id
	k2REwYdb001891
	for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2006 07:58:34 -0700
Message-Id: <200603271504.k2RF4SG3017925@godiva.ta-18.lanl.gov>
Date: Mon, 27 Mar 2006 08:00:33 -0700
To: "Josh Boyer" <jwboyer@gmail.com>, "Benjamin Sapp" <bsapp@lanl.gov>
From: Benjamin Sapp <bsapp@lanl.gov>
In-Reply-To: <625fc13d0603270650g1139d010me8d98fe8c1569f26@mail.gmail.co
 m>
References: <200603271446.k2REkMG3017802@godiva.ta-18.lanl.gov>
	<625fc13d0603270650g1139d010me8d98fe8c1569f26@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; format=flowed
Cc: linux-mtd@lists.infradead.org
Subject: Re: getting an older mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I'm using it on intel to create an image for Freescale's i.MX21 arm 
processor.   I'm not exactly sure what is wrong.  I don't even see any 
warnings.  All I know is when I use version 1.47 to create the ramdisk 
Linux never boots.  I'm using version 2.4.20 of the kernel.  That's an 
older kernel so I imagine there's just some sort of incompatibility.


7:50 AM 3/27/2006, Josh Boyer wrote:
>On 3/27/06, Benjamin Sapp <bsapp@lanl.gov> wrote:
> > Hello,
> >
> > I have version 1.38 of mkfs.jffs2 on a RedHat 7 machine and it works
> > perfectly.  I have  version 1.47 on a Fedora Core 4 machine and it does not
> > work.  I'd like a working version on the Fedora machine.  However, copying
>
>What doesn't work about it?
>
>josh
