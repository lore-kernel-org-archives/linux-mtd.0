Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178cWm-00057D-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 08:51:52 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020517073950.53BD02757@sitemail.everyone.net> 
References: <20020517073950.53BD02757@sitemail.everyone.net> 
To: zeusj@firstlinux.net
Cc: all in MTD mailinglist <linux-mtd@lists.infradead.org>
Subject: Re: Quesion on copying to mtdblock0 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 08:51:50 +0100
Message-ID: <5794.1021621910@redhat.com>
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

zeusj@firstlinux.net said:
>  >Can you show me the image you loaded onto the flash? Just the first
> few  >kilobytes should do.

> Sure,with pleasure. If you dont mind , I send you the whole image in
> the attachment

 <Mailman caught it because it was too large for the list.>

 $ od -t x1 jffs2.img | head -1
0000000 85 19 02 e0 44 00 00 00 1d fb f7 98 01 00 00 00

That's a little-endian image. It ain't gonna work on a Dragonball.

Did it not say 
"Magic bitmask is backwards at offset 0x00000000. Wrong endian filesystem?"?


Make sure you use the '--bigendian' option to mkfs.jffs2.

--
dwmw2
