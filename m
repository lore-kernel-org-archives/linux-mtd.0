Received: from anchor-post-36.mail.demon.net ([194.217.242.86])
	by canuck.infradead.org with esmtp (Exim 4.61 #1 (Red Hat Linux))
	id 1FYKl4-000832-Lw
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 06:27:08 -0400
Received: from mailgate.cabletime.com ([80.177.138.66] helo=cabletime.com)
	by anchor-post-36.mail.demon.net with esmtp (Exim 4.42)
	id 1FYKl2-000CSn-Jp
	for linux-mtd@lists.infradead.org; Tue, 25 Apr 2006 10:27:00 +0000
Received: from adh.cabletime.com ([191.53.51.21] helo=adh)
	by cabletime.com with smtp (Exim 3.35 #1 (Debian))
	id 1FYKkx-0004fU-00
	for <linux-mtd@lists.infradead.org>; Tue, 25 Apr 2006 11:26:55 +0100
From: "Andy Hawkins" <a.hawkins@cabletime.com>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 25 Apr 2006 11:26:55 +0100
Message-ID: <003301c66852$c7371280$153335bf@cabletime.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <BAY19-F25626592BB956CC2B586828BBF0@phx.gbl>
Subject: RE: squashfs and NAND flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> Should mtd handle bad blocks when using squashfs?

I suspect you will have to write a simple 'translation layer' that
automatically skips bad blocks. This is something we had to do in our
device.

Basically, if (for example) block 4 is bad, then any request for block 4
should actually return block 5. Also, any request for block 5 should return
block 6 etc. etc. etc.

Hope this helps.

Andy
