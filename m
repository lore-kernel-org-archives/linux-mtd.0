Received: from smtprelay05.ispgateway.de ([80.67.31.98])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vm0Bg-0001jm-BC
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 11:55:17 +0000
Received: from [217.170.184.113] (helo=XSRWWSEX01.xse.local)
 by smtprelay05.ispgateway.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.68) (envelope-from <Philipp.Rosenberger@xse.de>)
 id 1Vm0An-0006LY-LN
 for linux-mtd@lists.infradead.org; Thu, 28 Nov 2013 12:54:21 +0100
From: "Rosenberger, Philipp" <Philipp.Rosenberger@xse.de>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: [PATCH] of_mtd: Fix header file include guard
Date: Thu, 28 Nov 2013 11:53:39 +0000
Message-ID: <52972EEE.8070704@xse.de>
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <B0376FD92223AD4EBC9A41BD4C404556@xse.local>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It seems the include guard was copied from of_net.h.
---
 include/linux/of_mtd.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/of_mtd.h b/include/linux/of_mtd.h
index 6f10e93..cb32d9c 100644
--- a/include/linux/of_mtd.h
+++ b/include/linux/of_mtd.h
@@ -7,7 +7,7 @@
  */

 #ifndef __LINUX_OF_MTD_H
-#define __LINUX_OF_NET_H
+#define __LINUX_OF_MTD_H

 #ifdef CONFIG_OF_MTD

-- 1.7.9.5

XS Embedded GmbH
Peterzeller Strasse 8
D-78048 Villingen - Schwenningen

Telefon +49 (7721) 4060 - 428
Fax     +49 (7721) 4060 - 499

www.xse.de
Philipp.Rosenberger@xse.de

:::::::::: based.on.visions ::::::::::


XS Embedded GmbH
Gesch=E4ftsf=FChrung: Michael Maier, Rainer Oder

Handelsregister: Amtsgericht Freiburg i.Br., HRB 705237
Sitz der Gesellschaft: Peterzeller Strasse 8, 78048 Villingen-Schwenningen
USt-Id Nummer: DE268786819

Confidentiality Notice: This e-mail message, including any attachments, is =
for the sole use of the intended recipient(s) and may contain confidential =
and privileged information. Any unauthorized review, use, disclosure or dis=
tribution is prohibited. If you are not the intended recipient, please cont=
act the sender by return e-mail and destroy all copies of the original mess=
age.
