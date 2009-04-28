Received: from co203.xi-lite.net ([149.6.83.203])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lypy6-0006xS-Hf
	for linux-mtd@lists.infradead.org; Tue, 28 Apr 2009 16:16:01 +0000
Received: from ONYX.xi-lite.lan (unknown [193.34.35.244])
	by co203.xi-lite.net (Postfix) with ESMTP id F252A6581C4
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Apr 2009 16:15:32 +0000 (GMT)
Message-ID: <49F72BA3.3030506@parrot.com>
Date: Tue, 28 Apr 2009 18:15:31 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH - resend] m25p80 : add m45pe10 ids
Content-Type: multipart/mixed; boundary="------------060309060106010506040904"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--------------060309060106010506040904
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

this patch add m45pe10 [1] chip support to m25p80 driver.

[1] http://www.numonyx.com/Documents/Datasheets/M45PE10.pdf

Signed-off-by: Matthieu CASTET <matthieu.castet@parrot.com>


--------------060309060106010506040904
Content-Type: text/x-diff; name="m45pe10.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline; filename="m45pe10.diff"

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 76a7675..a888299 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -528,6 +528,7 @@ static struct flash_info __devinitdata m25p_data [] = {
 	{ "m25p64",  0x202017,  0, 64 * 1024, 128, },
 	{ "m25p128", 0x202018, 0, 256 * 1024, 64, },
 
+	{ "m45pe10", 0x204011,  0, 64 * 1024, 2, },
 	{ "m45pe80", 0x204014,  0, 64 * 1024, 16, },
 	{ "m45pe16", 0x204015,  0, 64 * 1024, 32, },
 


--------------060309060106010506040904--
