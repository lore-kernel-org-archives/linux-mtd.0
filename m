Received: from mail-ew0-f208.google.com ([209.85.219.208])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MeW7G-00036A-Ka
	for linux-mtd@lists.infradead.org; Fri, 21 Aug 2009 15:33:27 +0000
Received: by ewy4 with SMTP id 4so752651ewy.27
	for <linux-mtd@lists.infradead.org>;
	Fri, 21 Aug 2009 08:33:20 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 21 Aug 2009 11:33:20 -0400
Message-ID: <3e5be67b0908210833g3f4a4c3fr50058b42a15d8aa7@mail.gmail.com>
Subject: 4K blocks of zeros in JFFS2 filesystem
From: Jeremy Slater <jasl8r@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I am having file corruption problems on my JFFS2 partition where
eventually 4K blocks of files will end up as 4K blocks of zeros.  I am
running a 2.6.12 kernel on an at91rm9200 processor with 128MB of NOR
flash spanning two concatenated chips.

I am running a simple test to recreate this issue: 10000 static files
are periodically scanned via md5sum.  Another process fills the file
system with data until there is only 2MB free, deletes all the files
and repeats.  After 1 to 10 hours there will be a small number of
files failing the md5sum and containing the blocks of zeros.

I am still working to collect more kernel output, but here is a
snippet that appeared up a short time before a corrupt file was
detected:

Node CRC 4c4e2482 != calculated CRC b69a14b7 for node at 0214000c
Node CRC 2e5eb6c0 != calculated CRC f4ebfeae for node at 01e4000c
Node CRC ae8a5503 != calculated CRC 59093d5e for node at 000bdfa0
Node CRC 4081f13e != calculated CRC 216eb339 for node at 0168000c
Node header CRC failed at 014a000c. But it must have been OK earlier.
Node was: { ffff, ffff, ffffffff, ffffffff }
Node CRC 10e840d9 != calculated CRC 5ee4806a for node at 0147e3b0

You will notice that I also get a lot of CRC errors, which I am not
sure if that is normal.

This test is reliably failing with a 112MB mtd partition.  I have run
variations of this test on smaller (12MB to 64MB) mtd partitions and
have not seen any failure yet.  I have also run the test on a 100MB
mtdram partition and have not seen any failures.

Does anyone have suggestions on what I can do to uncover the source of
this corruption?

Thanks,
Jeremy
