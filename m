Received: from mail.auerswald.de ([212.185.163.229])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F90sm-00051W-Dt
	for linux-mtd@lists.infradead.org; Tue, 14 Feb 2006 09:10:26 -0500
From: Wolfgang =?iso-8859-15?q?M=FCes?= <wolfgang.mues@auerswald.de>
To: linux-mtd@lists.infradead.org
Date: Tue, 14 Feb 2006 15:10:12 +0100
References: <200602091126.10462.manningc2@actrix.gen.nz>
In-Reply-To: <200602091126.10462.manningc2@actrix.gen.nz>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200602141510.12749.wolfgang.mues@auerswald.de>
Subject: Re: Questions about NAND (double)bit errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Charles,

Charles Manning wrote:
> * YAFFS is very conservative on dealing with ECC failures. YAFFS retires a
> block if one ECC failure is seen. JFFS2, IIRC allows five of so failure
> before retiring a block. The Toshiba folk have told me that if a block is
> going bad, it is most likely to start displaying recoverable 1-bit errors
> before displaying non-recoverable multi-bit errors. Thus, YAFFS will
> potentially perform differently in this area.

About bad block detection: what is your oppinion about partitioning the flash 
(the programs in a read-only partition, the data in r/w).

How about detection of ECC errors in read only partitions?

> One important factor, IMHO, is how you handle the write protect pin on the
> NAND. Some people tie the WP to the power supply failure flag. IMHO this is
> a bad thing to do since it can cause incomplete writes to happen if the wp
> is asserted during a write or erase cycle.

I have checked this.

WP is tied to VCC, and VCC is stable at least 500ms after a power fail detect.

best regards
-- 
Wolfgang Muees                    Vor den Grashoefen 1
Auerswald GmbH & Co. KG       	  D-38162 Cremlingen
Hardware Development              Germany
Tel +49 5306 9219 0               Fax +49 5306 9219 94
