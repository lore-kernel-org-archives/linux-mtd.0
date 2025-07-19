Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54048C83F27
	for <linux-mtd@archiver.kernel.org>; Sat, 19 Jul 2025 12:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ssn+GNPbattQP1xZy8nySRJU1pnNiKz9wnL04ZGbiJs=; b=osQv9241g94wYd
	xr1NkpMRAebG1YqOBg2NruPm3vkY7TIxM/UTvmTRH4rrmiBSDfNFrRhhexDCwJRGXYnVuq/tFGkAH
	hcM8DuIDBwxUnTKkk3SZk8M6dwefr1GBBMkDANTQCIYSjN9rS4sBg8cDyE2hv2QFZGVN4FKg/SMOG
	Uzrt4EAGB/PZY7o1pNSSxXyULPDVjyqR4Q2uuKu3VXAoMCDVPE4OfNVr7PIvyRGL+ObvDsHDV1Df4
	nm2ZNK74xkOsztTP0RNYp9jPwILWVCPiD6ti0wpZ15X7TMZmxsXslbl37IF6E7YamympSVqcDakLA
	nS7eXugXgV+iIZrFenoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud6Lh-0000000EDa1-0B6j;
	Sat, 19 Jul 2025 12:07:29 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ud6LB-0000000EDX4-3jON
	for linux-mtd@lists.infradead.org;
	Sat, 19 Jul 2025 12:06:59 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso1754455f8f.2
        for <linux-mtd@lists.infradead.org>; Sat, 19 Jul 2025 05:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752926816; x=1753531616; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SAYxuxbarDVKTOv5KTcPmqdU578ljPfscuxrv251wl8=;
        b=NOKFq0N6HeZ1Pj6OCc2K9dN0Vh0GcnUVeugzkP5gTS+esaXv7eOfXX+w2CQiM1xk86
         OPohrSmcUbUGmFpZWZ1CXXKjrF5xaOyRSKc5weNLkORVq6uU0Faz4tFAr4bfV5llYT66
         A22bvc7Y5a5vGjfH7pY8WiYn1rb+Wo8Ng32YXp99cGYXe8E6YcI2XbQj/cF8ZMDc61NM
         MQ3PAG+3C7/UcbfSro4xZMd8hJf9C2PwoNQSfc3Y8Vq/835otH/+ql3huqbcCdyu5wGk
         9ziFqaVWn4tV4tWrtcCw1bnx+cj4kRDFEeIXWIte7iSbxLJG7trrFQFLJQvI+FSxYXH3
         W5Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752926816; x=1753531616;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAYxuxbarDVKTOv5KTcPmqdU578ljPfscuxrv251wl8=;
        b=YtBqR5VjyzvI1/r9ZwF1/2AgQyfR8hC1p7mys53SVfZpIi9NoWu0oNx+lh8/uLq+LZ
         MOrDa8gqVWm91QScpBmlgISNkq9euFwhmptjzrrZXoya0TXhsvkj3yCyRQwDEWntCyy7
         EI2gj9lF1hT5Ma9EO4FiJugUlu6bjO0/8fDZhowCmtG9Tk1O6L0jcXE/cKCl85bZd2aZ
         atZzDy/Q7ZVGWnyH8F5dAQpXnQO+ApOFH2ZPBbxphRV5yf5ti6jr5Y4m/90sBttXnUG4
         hmI3mntRM6nx2OWzCtpxR9bsiR++G8CRKf3naQCYT4LGNoXwrZHbt4sEAeyzx83wrvgj
         mjbg==
X-Forwarded-Encrypted: i=1; AJvYcCWy9LawPvy92nv5cojFzeWSo8HApEf3VxLUaNq+Hody5Xpgj8JGfDSWe1XPpOA1GL1DufNhVi8mKvI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6s0MrDuTAu9K0nmG2B94XDa2fAgPRxTYu7Zicev3Ejo1H8O/1
	+lrkclYas2aH2lIs7qs6+wub0xL5YDUD91OA3NOPPiB1hDwZfKUmaNXwoAXwBA==
X-Gm-Gg: ASbGnctiwhfNZeLdJSimPQqbKTRT+gTqSEAbovyGaaWi1r6qlilepKs6iXs+vntsYO3
	74uCOeeA32sf2M0rqWPEIc6wPUnfwYN5ZFyTStK0TFbuhpWlfm7jmG8IFeNlUxRXo2z2k1cefmY
	O2K50gxFnZSbXGP6miXnr7ppBf5KOnQiUillOOeoVJsAF8WYRZAzSgBwz6me26Dni9VrIF7EJaa
	4SW7i0GMWGJs1oRZAfPoTGJ/C7s5SoakhhtIFSP7hVVuk2hyduPvz23iGc3i2qQ92VtbVYRw9IQ
	drcGchxa9NU/a0sGFho1fZErT5eSp0+UgA0MyE72m87I8wmlyZ2U9kSiOicwkva12IISDFtWuI8
	jfHKx5C7/K4D3oJr/wwijIl73TnzeCblrQervjHpwCAiA7rGdhng=
X-Google-Smtp-Source: AGHT+IFLdTuYjVFtB4WcOmac/pGDIhuVUnjQRk2cKqBAlO+EeqLEYXAwpa1uN2KYem4Bij1+GuQ4pQ==
X-Received: by 2002:a05:6000:2811:b0:3a5:8565:44d1 with SMTP id ffacd0b85a97d-3b60dd78e32mr8146812f8f.25.1752926815752;
        Sat, 19 Jul 2025 05:06:55 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b61ca48970sm4681883f8f.57.2025.07.19.05.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Jul 2025 05:06:55 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Sat, 19 Jul 2025 14:06:48 +0200
Subject: [PATCH] mtd: expose ooblayout information via sysfs
MIME-Version: 1.0
Message-Id: <20250719-mtd-ooblayout-sysfs-v1-1-e0d68d872e17@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFeKe2gC/x3MQQ5AMBBA0avIrE2ihOIqYlFMmQSVDkLE3TWWb
 /H/A0KeSaCOHvB0srBbA1QcQT+ZdSTkIRjSJM0TrSpc9gGd62Zzu2NHucUKam1skasu01kJodw
 8Wb7+a9O+7wciHUjSZQAAAA==
X-Change-ID: 20250719-mtd-ooblayout-sysfs-77af651b3738
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250719_050657_934149_C7DA5273 
X-CRM114-Status: GOOD (  15.97  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add two new sysfs device attributes which allows to determine the OOB
layout used by a given MTD device. This can be useful to verify the
current layout during driver development without adding extra debug
code. The exposed information also makes it easier to analyze NAND
dumps without the need of cravling out the layout from the driver code.

The content of the new sysfs files is similar to this:

    # cat /sys/class/mtd/mtd0/ooblayout_ecc
    0      0   49
    1     65   63
    # cat /sys/class/mtd/mtd0/ooblayout_free
    0     49   16

Also update the ABI documentation about the new attributes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-mtd | 14 +++++++++++
 drivers/mtd/mtdcore.c                     | 40 +++++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-class-mtd b/Documentation/ABI/testing/sysfs-class-mtd
index f77fa4f6d46571175b156113a1afeeb9f5f51c0f..fd3000b9cc7aee4ea9069d1869f310fefa24f97a 100644
--- a/Documentation/ABI/testing/sysfs-class-mtd
+++ b/Documentation/ABI/testing/sysfs-class-mtd
@@ -240,3 +240,17 @@ Contact:	linux-mtd@lists.infradead.org
 Description:
 		Number of bytes available for a client to place data into
 		the out of band area.
+
+What:		/sys/class/mtd/mtdX/ooblayout_ecc
+What:		/sys/class/mtd/mtdX/ooblayout_free
+Date:		July 2025
+KernelVersion:	6.17
+Contact:	linux-mtd@lists.infradead.org
+Description:
+		Newline separated list of the regions in the out of band area.
+
+		Each line contains three decimal numbers separated by spaces.
+		The first number indicates the index of the region. The second
+		number describes the starting offset within the out of band
+		area. The last number specifies the amount of bytes available
+		in the region.
diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 429d8c16baf045e6a030e309ce0fb1cbec669098..552d12f749e43b7d9abb07e0235a3ef2d2a98546 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -254,6 +254,44 @@ static ssize_t mtd_oobavail_show(struct device *dev,
 }
 MTD_DEVICE_ATTR_RO(oobavail);
 
+static ssize_t mtd_ooblayout_show(struct device *dev,
+				  struct device_attribute *attr, char *buf,
+				  int (*iter)(struct mtd_info *, int section,
+					      struct mtd_oob_region *region))
+{
+	struct mtd_info *mtd = dev_get_drvdata(dev);
+	ssize_t size = 0;
+	int section;
+
+	for (section = 0;; section++) {
+		struct mtd_oob_region region;
+		int err;
+
+		err = iter(mtd, section, &region);
+		if (err)
+			break;
+
+		size += sysfs_emit_at(buf, size, "%-3d %4u %4u\n", section,
+				      region.offset, region.length);
+	}
+
+	return size;
+}
+
+static ssize_t mtd_ooblayout_ecc_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	return mtd_ooblayout_show(dev, attr, buf, mtd_ooblayout_ecc);
+}
+MTD_DEVICE_ATTR_RO(ooblayout_ecc);
+
+static ssize_t mtd_ooblayout_free_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	return mtd_ooblayout_show(dev, attr, buf, mtd_ooblayout_free);
+}
+MTD_DEVICE_ATTR_RO(ooblayout_free);
+
 static ssize_t mtd_numeraseregions_show(struct device *dev,
 		struct device_attribute *attr, char *buf)
 {
@@ -366,6 +404,8 @@ static struct attribute *mtd_attrs[] = {
 	&dev_attr_subpagesize.attr,
 	&dev_attr_oobsize.attr,
 	&dev_attr_oobavail.attr,
+	&dev_attr_ooblayout_ecc.attr,
+	&dev_attr_ooblayout_free.attr,
 	&dev_attr_numeraseregions.attr,
 	&dev_attr_name.attr,
 	&dev_attr_ecc_strength.attr,

---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250719-mtd-ooblayout-sysfs-77af651b3738

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
