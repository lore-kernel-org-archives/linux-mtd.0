Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B8ChH-00087l-0d
	for linux-mtd@lists.infradead.org; Tue, 30 Mar 2004 07:26:03 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
To: tglx@linutronix.de, "William J. Beksi" <wjbeksi@setabox.com>,
	linux-mtd@lists.infradead.org
Date: Tue, 30 Mar 2004 18:35:13 +1200
References: <4068FF5A.8090207@setabox.com>
	<200403300722.22974.tglx@linutronix.de>
In-Reply-To: <200403300722.22974.tglx@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20040330062556.47D3F5206@blood.actrix.co.nz>
Subject: Re: ECC for Samsung nand flash
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 30 March 2004 17:22, Thomas Gleixner wrote:
> On Tuesday 30 March 2004 07:02, William J. Beksi wrote:
> > Has anyone implemented an ECC algorithm for Samsung nand flash devices?
> > The nand_ecc.c in the cvs seems to be specific for Toshiba devices.
>
> He ? What is specific ?
> ECC is a checksum algorithm for error detection and correction and is
> nowhere specific for Toshiba.

nand_ecc.c in mtd and yaffs_ecc.c in YAFFS implement exactly the same 
algorithm which is that specified by SmartMedia. Although nand_ecc.c was 
written by SJHill (then at Toshiba), the algorithm is identical to that in 
the application notes at Samsung.

The only differences between nand_ecc.c and yaffs_ecc.c are:
*yaffs_ecc.c is slightly faster (~15% - CPU dependent)
* yaffs_ecc.c provides two byte orders for storing the ECC.

At the end of the day, the ECC code is a software device and is in no way 
linked to the hardware. ie. the nand chip just blindly stores bytes.

-- Charles
