Received: from [195.142.233.60] (helo=albatros.havelsan.com.tr)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192tBh-0002ue-Ir
	for <linux-mtd@lists.infradead.org>; Tue, 08 Apr 2003 14:30:58 +0100
Message-ID: <009801c2fdd2$eb0d1da0$3064000a@nur>
From: "nur" <nurpinar@e-kolay.net>
To: <linux-mtd@lists.infradead.org>
Date: Tue, 8 Apr 2003 16:29:44 +0300
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: UnitSizeFactor 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"Sorry we don't support UnitSizeFactor of !=1 yet"

I m getting such an error message during boot.
I have kernel 2.2.20. 8MB DoC Millennium Module
32 MB Ram. I have enabled Doc Millennium Only from Kernel and let kernel
find window address of it. And mtd char device nftl support.
DoC512.exb is installed. What should I do ?
Is it safe to install doc42.exb which I think will solve the problem?
Thanks
