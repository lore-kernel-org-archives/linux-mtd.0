Received: from mail.fst.it ([213.255.39.254] helo=fst.it)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19SBUO-00040I-UL
	for <linux-mtd@lists.infradead.org>; Tue, 17 Jun 2003 09:06:49 +0100
Message-ID: <006801c334a8$3aa7c750$a970a8c0@topo>
From: "Luca Contini" <luca.contini@mediaenabling.com>
To: "linux-mtd-request@lists.infradead.org" <linux-mtd@lists.infradead.org>
Date: Tue, 17 Jun 2003 10:12:43 +0200
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: Please help, nftl question
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi all,
does anybody know wich is the role of the nftl in the nand flash driver
stack?
I konw there ere for layers:
1. File system layer (e.g. JFFS2 or DOS-FAT)
2. MTD
3. Nand generic driver
4. Hardware specific driver

where can the nftl be located in the stack?
is nftl a filesystem or a low level driver?

thanx


Luca Contini
-------------------------------------------------------
Mediatech s.r.l. 
System Engineer
Office: (+39) 070 2466 5503
Mobile: (+39) 328 911 6656
Fax: (+39) 070 2466 5111
luca.contini@mediaenabling.com
URL: http://www.mediaenabling.com
--------------------------------------------------------
