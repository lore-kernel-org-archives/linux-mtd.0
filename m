Received: from mailout01.sul.t-online.com ([194.25.134.80])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1COMth-00086C-KP
	for linux-mtd@lists.infradead.org; Sun, 31 Oct 2004 16:05:58 -0500
To: Jeff Angielski <jangiels@speakeasy.net>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Sat, 30 Oct 2004 17:35:37 EDT."
	<1099172137.30440.8.camel@nighteyes.localdomain>
Date: Sun, 31 Oct 2004 22:05:35 +0100
Sender: wd@denx.de
Message-Id: <20041031210540.B0558C146B@atlas.denx.de>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: mkfs.jffs2 with DENX 2.4 kernel on MPC8260 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <1099172137.30440.8.camel@nighteyes.localdomain> you wrote:
> 
> Using the default rootfs image from the ELDK toolkit and with the
> MTD/jffs2 debugging turned on, this is what I see:

You may want to update your kernel tree. On our CVS server  you  will
find a kernel tree which includes a much more recent MTD snapshot.

Best regards,

Wolfgang Denk

-- 
See us @ Embedded/Electronica Munich, Nov 09 - 12, Hall A.6 Booth 513
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
A right is not what someone gives you; it's what no one can take from
you.                                                   - Ramsey Clark
