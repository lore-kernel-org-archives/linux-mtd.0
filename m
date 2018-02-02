Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ehg90-0003So-85
 for linux-mtd@lists.infradead.org; Fri, 02 Feb 2018 18:33:03 +0000
Received: by mail-wm0-x22b.google.com with SMTP id x4-v6so3808043wmc.0
 for <linux-mtd@lists.infradead.org>; Fri, 02 Feb 2018 10:32:51 -0800 (PST)
MIME-Version: 1.0
From: M D <dsmm4444@gmail.com>
Date: Fri, 2 Feb 2018 10:32:49 -0800
Message-ID: <CACUY3eq657UD+wB53wbRpNGA-SwFdfyATTSZq0ZSf_RJW+kCVA@mail.gmail.com>
Subject: Integration of Samsung On-Die ECC Nand Flash
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Processor                 :  ARM imx21
NAND Flash             :  On Die ECC Flash (K9F1G08U0F)

We are presently using an ARM imx21 processor interfaced with a Nand
chip that does not support on die ECC (samsung e-die). The Nand Flash
Controller on board the processor, calculates ECC for the data that is
read/written to /from the Flash. The device driver reads the ECC
status register to make a decision on the Integrity of the data. The
NFC supports 1 bit error correction.

We now want to integrate the new Samsung F-Die chip that supports on
die ECC calculation and correction. The On Die ECC logic does not use
the Spare/OOB area of the Nand Flash to store the ECC information. The
on die ECC flash logic will process the data and correct errors and
provide this to the NFC. The NFC can then proceed to further correct
data as suitable.


Example  - The page being read has < 4 bit errors

1) NFC requests data from the F-Die Nand Flash
2) F-Die on die ECC will calculate and correct ECC errors on the whole
(Main + Spare) Area data and provide this information to the NFC
3) The NFC will then read the Main area and not find any errors


Example - The page being read has > 4 bit erros

1) NFC requests data from the F-Die Nand Flash
2) F-Die on die ECC will calculate and fail to correct >4 bit ECC
errors on the whole (Main + Spare) Area data and provide this
information to the NFC
3) The NFC will then read the Main area and find > 1 bit error. NFC
will report this status to the above mtd layers

>From the above two analysis, we think that we do not need any code
changes in the driver to integrate the Samsumg F-die on chip ECC

Regards
Max
