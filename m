Received: from nf-out-0910.google.com ([64.233.182.189])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JfAP2-0002Wv-Lv
	for linux-mtd@lists.infradead.org; Fri, 28 Mar 2008 08:57:37 +0000
Received: by nf-out-0910.google.com with SMTP id h3so311555nfh.22
	for <linux-mtd@lists.infradead.org>;
	Fri, 28 Mar 2008 01:57:35 -0700 (PDT)
Message-ID: <47ECB2F7.6010402@tiscali.it>
Date: Fri, 28 Mar 2008 09:57:27 +0100
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: NAND flash ST NAND16GW3C4A not properly supported
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
From: Jaws <mlafauci@tiscali.it>
Sender: Domenico La Fauci <mimjaws@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In my custom board with AVR32 I'm using at the moment a NAND flash ST NAND16GW3C4A 
(http://www.stmicroelectronics.com/stonline/products/literature/ds/13631/nand16gw3c4a.pdf)
that is internally built as to 1G nand flash integrated, with 2 enable 
pins and 2 ready/busy pins. The nand driver at moment present in avr32-linux branch does not forseen more nand devices in a single chip.
How is it possible to manage it with the current driver? I have to use it as two 1G partitions?
Any suggestions?

Thanks in advance Jaws
