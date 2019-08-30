Return-Path: <SRS0=5B27=W2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D765DC3A5A7
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 15:47:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A644C23407
	for <linux-mtd@archiver.kernel.org>; Fri, 30 Aug 2019 15:47:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hLqToEZB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A644C23407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=decadent.org.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZW+QeFrPH7QC2cFDW7jpYh3LMeSljb6T+g6DULZhaG0=; b=hLqToEZBmnZv2AnCDT5gcUUxp
	T2PmMGxTTELmMiShk3YUg9CHa1XZcsi7EN5wxts1sDrEnq4vgUDUSIgt45RvzyHbTIrxiQJcHIefl
	Z8bP+pbBVWwqttZaE/8E3bn6gH2aI5cC6SH5mEohYvoKuUs7aQDr0HZEGU+GEG2AdkRCyOJrLUVP2
	z7WEFV64Q/5yYC8QduUFzUsG6EBybKWhcJ26JFT/2HLjWi5rkBYn1+HidaFVN7if5046+228pvsNE
	kd/wb6EeHg5RUZgtGS/hDq2fPG2KW+V5HVF5bV9KxOerpAh8sx3csTzaDj/fVhcBnYL1YaTrjXTX2
	jqRtioatw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i3j7h-0005zK-Et; Fri, 30 Aug 2019 15:47:37 +0000
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i3j7f-0005yX-4t
 for linux-mtd@lists.infradead.org; Fri, 30 Aug 2019 15:47:36 +0000
Received: from ben by shadbolt.decadent.org.uk with local (Exim 4.89)
 (envelope-from <ben@decadent.org.uk>)
 id 1i3j7R-0007T1-0P; Fri, 30 Aug 2019 16:47:21 +0100
Date: Fri, 30 Aug 2019 16:47:20 +0100
From: Ben Hutchings <ben@decadent.org.uk>
To: jmorris@namei.org
Message-ID: <20190830154720.eekfjt6c4jzvlbfz@decadent.org.uk>
References: <20190830154549.vss6h5tlrl6d5r5y@decadent.org.uk>
MIME-Version: 1.0
In-Reply-To: <20190830154549.vss6h5tlrl6d5r5y@decadent.org.uk>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: ben@decadent.org.uk
Subject: [PATCH 2/2] mtd: phram,slram: Disable when the kernel is locked down
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on shadbolt.decadent.org.uk)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190830_084735_340436_FA52B24C 
X-CRM114-Status: GOOD (  15.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: David Howells <dhowells@redhat.com>, linux-mtd@lists.infradead.org,
 linux-security-module@vger.kernel.org, Joern Engel <joern@lazybastard.org>,
 Matthew Garrett <mjg59@google.com>
Content-Type: multipart/mixed; boundary="===============7459016279458644054=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7459016279458644054==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r2t5f3x5aksjeqpl"
Content-Disposition: inline


--r2t5f3x5aksjeqpl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

These drivers allow mapping arbitrary memory ranges as MTD devices.
This should be disabled to preserve the kernel's integrity when it is
locked down.

* Add the HWPARAM flag to the module parameters
* When slram is built-in, it uses __setup() to read kernel parameters,
  so add an explicit check security_locked_down() check

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
Cc: Matthew Garrett <mjg59@google.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Joern Engel <joern@lazybastard.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/devices/phram.c | 6 +++++-
 drivers/mtd/devices/slram.c | 9 ++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
index c467286ca007..9c18b4bb2ed9 100644
--- a/drivers/mtd/devices/phram.c
+++ b/drivers/mtd/devices/phram.c
@@ -294,7 +294,11 @@ static int phram_param_call(const char *val, const str=
uct kernel_param *kp)
 #endif
 }
=20
-module_param_call(phram, phram_param_call, NULL, NULL, 000);
+static const struct kernel_param_ops phram_param_ops =3D {
+	.set =3D phram_param_call
+};
+__module_param_call(MODULE_PARAM_PREFIX, phram, &phram_param_ops, NULL,
+		    000, -1, KERNEL_PARAM_FL_HWPARAM | hwparam_iomem);
 MODULE_PARM_DESC(phram, "Memory region to map. \"phram=3D<name>,<start>,<l=
ength>\"");
=20
=20
diff --git a/drivers/mtd/devices/slram.c b/drivers/mtd/devices/slram.c
index 28131a127d06..d92a2461e2ce 100644
--- a/drivers/mtd/devices/slram.c
+++ b/drivers/mtd/devices/slram.c
@@ -43,6 +43,7 @@
 #include <linux/ioctl.h>
 #include <linux/init.h>
 #include <linux/io.h>
+#include <linux/security.h>
=20
 #include <linux/mtd/mtd.h>
=20
@@ -65,7 +66,7 @@ typedef struct slram_mtd_list {
 #ifdef MODULE
 static char *map[SLRAM_MAX_DEVICES_PARAMS];
=20
-module_param_array(map, charp, NULL, 0);
+module_param_hw_array(map, charp, iomem, NULL, 0);
 MODULE_PARM_DESC(map, "List of memory regions to map. \"map=3D<name>, <sta=
rt>, <length / end>\"");
 #else
 static char *map;
@@ -281,11 +282,17 @@ static int __init init_slram(void)
 #ifndef MODULE
 	char *devstart;
 	char *devlength;
+	int ret;
=20
 	if (!map) {
 		E("slram: not enough parameters.\n");
 		return(-EINVAL);
 	}
+
+	ret =3D security_locked_down(LOCKDOWN_MODULE_PARAMETERS);
+	if (ret)
+		return ret;
+
 	while (map) {
 		devname =3D devstart =3D devlength =3D NULL;
=20

--r2t5f3x5aksjeqpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAl1pRQgACgkQ57/I7JWG
EQky4w//f9aD0LvA83V3Xs9vTI9OkxLhLzgXazInwgg2N0l4WjPGmtGtSybKzxKM
L+lgfLV5iXGmUJjFqjRu5QvWx7ZkUhJnkA/LnZgSnuJjRTf2auVASxqk5KXdfeYz
MK9d3kT9iUPSv/5N21fxO3hDZyOGYzBKFcEtzT100ny6Q1Gm8VLZn2an0j2YxPLz
Bz8/XAb+KdTRQvvSJS4Pl/00LYIppZg8IaukYVorjC7z0XHaSo7dDh47bC+ea320
p7R1EMON+eCXqXmja88tR3aVcntYcxk8+rEtR9hlcwyVSzHPta/Pwe+2Nrp5m5g0
yJabwkHRZk9/sHJnwhixJQ6j7a2SAD7FPriyijSlnOsOk+b2kHsFCkn6HGgKHhNX
xAABgln6PGwEej2HBger/25ZIvm3XmqE2SFTnx8m0YbQyVUIQnC5RT7fzwCy5cYb
6Sex57lcZL3MaSjioH3+U7W5aq56WLoWuxOPXt01Qq0GqmoM0+nG6wE6VmnDHJmF
NsKKSOWtCP1d/ZhtWHVpnXrzdYbrqMF8WX1n6NKN6885mi2c5v5+9CR44t+3zBT6
HdJFquw3CsppA1NGqoT5OrkrxojExiJdfRlcQ1MgZRhskk562PBC1N5/KcEtMbIz
DnSA0WxIpaoSQbpy07UvdqjkbUf+P0D+mTO+SIrgZoqyI9pES28=
=IHMt
-----END PGP SIGNATURE-----

--r2t5f3x5aksjeqpl--


--===============7459016279458644054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7459016279458644054==--

