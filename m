Received: from mail.artecdesign.ee ([62.65.32.9] helo=postikukk.artecdesign.ee)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1GrV9g-0003fE-KW
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 02:56:00 -0500
Received: from malvek.artecdesign.ee ([62.65.32.4] helo=liivakast)
	by postikukk.artecdesign.ee with smtp (Exim 4.50) id 1GrV9P-0000ls-B0
	for linux-mtd@lists.infradead.org; Tue, 05 Dec 2006 09:55:48 +0200
From: =?iso-8859-4?B?SvxyaSBQ9WxkcmU=?= <Jyri.Poldre@artecdesign.ee>
To: <linux-mtd@lists.infradead.org>
Subject: Jffs2 for sram filesystem
Date: Tue, 5 Dec 2006 09:55:52 +0200
Message-ID: <JJEGJLLALGANNBPNAIMMIEPJDNAA.Jyri.Poldre@artecdesign.ee>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-4"
Content-Transfer-Encoding: 7bit
Reply-To: Jyri.Poldre@artecdesign.ee
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,


Arm CPU based system running 2.6.15 kernel is using 128 Kbytes accumulator
backed up sram for storing keying material. If system is powered off for
more
than 2 days accumulator discharges and file system gets corrupt. At boot the
mount command gives lots of errors but most of the time succeeds even though
file contents can be corrupt or files missing.

My question is:  Is jffs2 filesystem suitable for sram where fault model is
different than flash?

It is ok to erase SRAM, main issue is to keep it from coming up with corrupt
data.


Sincerely,

Jyri Poldre,
Artec Design.
