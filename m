Received: from nm31-vm1.bullet.mail.bf1.yahoo.com ([72.30.239.9])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VUKj1-00081f-Cj
 for linux-mtd@lists.infradead.org; Thu, 10 Oct 2013 18:12:39 +0000
Message-ID: <1381428732.71524.YahooMailBasic@web125604.mail.ne1.yahoo.com>
Date: Thu, 10 Oct 2013 11:12:12 -0700 (PDT)
From: Flash K <bootloader99@yahoo.com>
Subject: lzari errors observed when accessing data from NAND Flash
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
In-Reply-To: <1381397050.60858.YahooMailNeo@web125601.mail.ne1.yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


 Hi,
 1. I am presently working on porting a 2.4 BSP
 to a 3.0.=20
 2. The 2.4 based system uses the JFFS2 File system that
 supports LZARI compression.=20
 3. Now the support for LZARI compression is not present in
 the 3.0 Kernel.
 4. However as some of the files on the Embedded system need
 to be retained=20
 during the upgrade (from 2.4 to 3.0) we have explicitly
 added suppport for LZARI.=20
 5. This includes modifying the kconfig file, adding the
 compr_lzari.c at the location fs\jffs2\=20
 and building the lzari support in the Kernel.
 After booting the Kernel, we see the following messages when
 trying to access files
 output of dmesg:
 [ 6480.539070] Error: jffs2_decompress returned -1
 [ 6480.543887] read_cache_page() returned error: -1
 [ 6480.548657] Error garbage collecting node at 010a5018!
 [ 6480.572338] Decompressor "lzari" returned -1
 [ 6480.577397] Error: jffs2_decompress returned -1
 [ 6480.582214] read_cache_page() returned error: -1
 [ 6480.586983] Error garbage collecting node at 010a5018!
 [ 6480.609512] Decompressor "lzari" returned -1
 [ 6480.614579] Error: jffs2_decompress returned -1
 [ 6480.619404] read_cache_page() returned error: -1
 [ 6480.624176] Error garbage collecting node at 010a5018!
 =A0
 These errors are crashing the File system.
 Hardware Details: ARM iMX21 based processor, Micron
 NAND Flash
 =A0
 I am presently trying to debug this.=20
 Could somebody help in guiding me how to debug file system
 errors?
 I need to find the root cause and fix this. I have begun going through the=
 jffs2 filesystem drivers but am not able to make significant progress.

 Regards,
 Flash
=20
 
