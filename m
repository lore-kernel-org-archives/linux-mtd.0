Received: from gate.epygi.de ([212.126.211.241] helo=ally.epygi.de)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 197Zas-0001Vi-P6
	for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2003 12:36:18 +0100
Received: from pcstephan (pc-stephan.epygi.de [10.20.0.32])
	by ally.epygi.de (8.12.9/8.12.9) with SMTP id h3LBaQkg006755
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Apr 2003 13:36:26 +0200 (METDST)
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Linux-Mtd" <linux-mtd@lists.infradead.org>
Date: Mon, 21 Apr 2003 13:36:26 +0200
Message-ID: <FCEAKDJJAPHPLJFINDAJIEBIDAAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: "verify NAND page writes" and & partial write 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I try to use the "verify NAND page writes" option but but it always failes when YAFFS tries to do a partial write on the OOB area.
Is it intentional that this option failes with partial writes? Everything works fine when I disable this feature.

Thanks, Stephan
