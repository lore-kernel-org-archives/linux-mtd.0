Received: from antispam01.maxim-ic.com ([205.153.101.182]
 helo=antispam01.maximintegrated.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UuiI7-00060z-US
 for linux-mtd@lists.infradead.org; Thu, 04 Jul 2013 12:05:40 +0000
From: Brian Foster <brian.foster@maximintegrated.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] Init ONFI get/set features in a more logical place
Date: Thu, 4 Jul 2013 14:05:09 +0200
Message-ID: <196135732.t1bWnDcIrg@laclwks004>
In-Reply-To: <CACwUX0NXgTC=uQ7CZoY=anBuMhfyN31GFuYAV5EhBUZT9Nm2_w@mail.gmail.com>
References: <17588192.75Agdljyqk@laclwks004> <2540574.yn0MEqSsGa@laclwks004>
 <CACwUX0NXgTC=uQ7CZoY=anBuMhfyN31GFuYAV5EhBUZT9Nm2_w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart3309804.MFhQkaAGEG"
Content-Transfer-Encoding: 7Bit
Cc: Florian Fainelli <ffainelli@freebox.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--nextPart3309804.MFhQkaAGEG
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"


 Attached (SORRY! see below) is a Patch based on some
 work being done on a v2.6.36-based kernel (with parts
 of more recent MTD/NAND support backported), to add
 support for Micron on-die ECC to Maxim Integrated's
 MAX32590 (JIBE) reference boards.

 This Patch makes a minor change to initialization order
 so code between nand_scan_ident() and nand_scan_tail()
 can easily get (or set) ONFI features.

 Since the original Patch is based on that older kernel,
 I can neither confirm nor deny it builds and works with
 the latest kernel/MTD/NAND source.  However, I also have
 no reason to believe it won't build or work.

 Due to limitations of the e-mail server, the Patch is
 attached rather then being included inline.  Apologies.
 Even so, the bloody server has _probably_ added CRs (\r),
 so you will _probably_ have to run the attached Patch
 through dos2unix(1) before it will apply.  ;-\ 

 CC-ed to the author of the original work.  Since I do
 not regularly read this list (linux-mtd), any e-mail
 not CC-ed to me _may_ not be seen.  Apologies!

cheers!
	-blf-

-- 
Brian Foster
Principal MTS, Software        |  La Ciotat, France
Office:  +33 (0)4 42 98 15 35  |  Fax:  +33 (0)4 42 08 33 19
Maxim Integrated               |  http://www.maximintegrated.com/

--nextPart3309804.MFhQkaAGEG
Content-Disposition: attachment;
	filename="0001-Init-ONFI-get-set-features-in-a-more-logical-place.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-Init-ONFI-get-set-features-in-a-more-logical-place.patch"

>From 400afdd7734c74881e208ae4b7fdb2a3dc2220bb Mon Sep 17 00:00:00 2001
From: Brian Foster <brian.foster@maximintegrated.com>
Date: Thu, 4 Jul 2013 13:35:31 +0200
Subject: [PATCH] Init ONFI get/set features in a more logical place

For some reason the ONFI get/set feature handlers were
being initialized in nand_scan_tail(), making it rather
difficult to use the default handlers after nand_scan_ident(),
which determines whether or not the NAND chip is ONFI-compliant.

Move the handler initialization into nand_set_defaults(),
where most handlers are initialized.

Change-Id: I055179ab3d4ea23780879197f4add02e27e6c0d1
Signed-off-by: Brian Foster <brian.foster@maximintegrated.com>
Cc: Florian Fainelli <ffainelli@freebox.fr>
---
 drivers/mtd/nand/nand_base.c |   11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index dfcd0a5..aab79f7 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2814,6 +2814,11 @@ static void nand_set_defaults(struct nand_chip *chip, int busw)
 		init_waitqueue_head(&chip->controller->wq);
 	}
 
+	/* set for ONFI nand */
+	if (!chip->onfi_set_features)
+		chip->onfi_set_features = nand_onfi_set_features;
+	if (!chip->onfi_get_features)
+		chip->onfi_get_features = nand_onfi_get_features;
 }
 
 /* Sanitize ONFI strings so we can safely print them */
@@ -3446,12 +3451,6 @@ int nand_scan_tail(struct mtd_info *mtd)
 	if (!chip->write_page)
 		chip->write_page = nand_write_page;
 
-	/* set for ONFI nand */
-	if (!chip->onfi_set_features)
-		chip->onfi_set_features = nand_onfi_set_features;
-	if (!chip->onfi_get_features)
-		chip->onfi_get_features = nand_onfi_get_features;
-
 	/*
 	 * Check ECC mode, default to software if 3byte/512byte hardware ECC is
 	 * selected and we have 256 byte pagesize fallback to software ECC
-- 
1.7.9.5


--nextPart3309804.MFhQkaAGEG--
