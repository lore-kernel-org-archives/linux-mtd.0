Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4E60A3812
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Nov 2026 18:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NqqfseA6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vzyt8CA+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SB7Id04d31gDlub+Cq6fHfJgGkx004GDswxHDGTe7vQ=; b=NqqfseA6WQrzdJeolMfTsp4h60
	lHjmri0uJBEm4Twh9BW7YJJEZIk1F2SO1RngmTdR7nC4MysQ+51ZWJNjRyfmSHoaCwf0PoOgeccIi
	Gu/Nr5yYK1vfFMWk93U31ufWgp8UW6JmIaFsbfy0E6DjpgvjAzZv7Ivx8vVnzwDOftwo/jFUH4OZG
	cjgk2yVT6k74Lzg7PGCFsonMSjC1w1qH8oViX2Z21i7Y8cdvZiuVxzlOCxKh3PEjlmy4Osfe+7hJo
	bmJQihXlmtFpJlVKgk+Pgc9DFgxWv7vTz9liuFm01oq6XoB0WaWi5hUgHikOO2dxMn6Sbg3U4p+Hc
	PGMewM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvo1-0000000DqVt-0xth;
	Fri, 13 Nov 2026 18:15:21 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvnw-0000000DqT5-3o0e
	for linux-mtd@lists.infradead.org;
	Fri, 13 Nov 2026 18:15:19 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-825b40f8a26so516830a34.1
        for <linux-mtd@lists.infradead.org>; Fri, 13 Nov 2026 10:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794593716; x=1795198516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=vzyt8CA+c40FCu97hEcoLfsJg3PpQlJbafhmruOGaJ4i763+zTpHnymCup2OEYsHl3
         M+p3ml4xxD9/Ls5HJSbn7ZtF+STWheAyjqPnLDEgLO3JT3upoApMqEwFSW5axx1Qj3Xv
         MiI3htdCyC4i+/Gzq8Pv+ax0RH2oufQWRnMMkiOe6ftDqDLq1KVI8EDpRFm5StCXIJQi
         a5MFSXQKeuKJJ1+u5fQTFIL80VLlkR0sGf60bHIN2SSv9wDLEveC1RNHTwdykmzOn745
         GRzDceXA1MEKC/yMd73jwkCzUPBJGhbNJvZXegjhGTZr1gK2Y0RNI5bZ8pjSWmNkogaq
         FcVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794593716; x=1795198516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=eCLjhwnBnxcNUPhk+CeLmPaCGqqT07JDzy1z78Q4qJFGGcCl7RH7NpJGjpo9z5MULJ
         dma71YjbTuwVE9KPQlVZWKP9lgkIEKNNs+PAojPuFk719tr+ZVxEPsJfuktVCrOtewP9
         oJ8D4Mpvaa/mOdPEcQB4SFBUc0lKRsZdSdLC/r4B1ePdy3wEdm/8n5zXOHbqOY7rsYnp
         KhPS4XgCVld/2pb8yXzVBLiY2uADsxC8ihzbFBQRy9PTr1bhRkm18K5uGLLRUTjLprlc
         VzzIzvPoOsa/EpTGn6uj71Bezw8mXUqwhHau+TsMCU3lkbaZrgpRXpm/qArctZGQQkYM
         0alQ==
X-Gm-Message-State: APuU4Z9/plnELcYKBgz/L/lGkn5b0gWV27lKoAajRUpdVDCId0XSIfCI
	bfpX7bTNGCfv3/jqYIKWzPpmB3CFwWIsoKeYGTnZXWWocuZed+ni6mFV
X-Gm-Gg: AYBFou0xjJEpIB+1QRmUIYKZx3hmAtTXWiDG6Y1n930vxtEqZnyE4d+O9BOuvu+LDOS
	onrJCRKbOM0BslyWYevwMv7qUObJmwKQYSaGRg23ApaWpUU0Ptxy0Ty24yzzcmCUOFAvKRO7Gxm
	e2TXgz+ijrZGkHtIHHxCmBNe/VsmiUqwoBIEZ8Eg+QJy8e75aam0YyPQOtcjVfWuUenFV14bi2e
	MQGtgcDn8Eu9589ce2oypK4p8Q/Ce+nhWa0OpJgOw9SXxiU+OCtPoeuBrSHANBDa8vkj5b2bv9C
	xdGloU4zKh6j/nMecHM2XnMhb0R93fcTZe05C3n7/GVXvjDGPdraYbKhcswMdPfUEXuWd7cz4gD
	YzAKcFVFJZWtDe4N6shF1xhtrQc6283DUvG45+/O899cabyz53Ybk9GOC/56QxhtTyeQ6Bob6RI
	xgxBcuHOadVaN2rIuc7cpya5o9ZakuM/7etJ07PTd1XEGMpZ27AhiYjzQnPNCwIV24TVxcuVWXb
	BI1eUl1gDGcHVCrcH2CX+SBjAcLXSlnJ4n+5iUL/+l8DaEJFbCvD3/3449hqy/E19Wlf7HIW3hU
	zBPDcb0bCVJnczsD3uF48wX9GB03vrLPQ8LGaPBeCBscSG0JJU7n7i+Rfgf4a0gXYnGvj1/hEBS
	pW4rcNkR57yaiZ7v5E43ZaUylnnGr4uymG7s4A75OXP5iyJuRErjsa1KxF8ZKOTMvlgsg62roJY
	qZ2ttxHI9i9XH8mDudajh3G4bgaLRf1ks1O04Z1eBzkbxPWgvc3HJDVWMhk76FbcknAAYK2bok
X-Received: by 2002:a05:6830:2709:b0:861:57d7:d6a8 with SMTP id 46e09a7af769-862898a6184mr2651838a34.21.1794593716076;
        Fri, 13 Nov 2026 10:15:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628817d979sm3253414a34.22.2026.11.13.10.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:15:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 13 Nov 2026 11:14:18 -0700
Subject: [PATCH v4 02/58] mtd: acquire an MTD handle from a referenced
 class device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-2-556b1d7c6221@gmail.com>
References: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
In-Reply-To: <20261113-submit-rawnand-retained-handle-lifetime-v1-v4-0-556b1d7c6221@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_101516_970018_2C93A3CD 
X-CRM114-Status: GOOD (  17.68  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

PTP OCP locates flash through the device hierarchy and uses driver data
directly. A class-device reference does not keep an MTD registered or own
the backing object needed by an erase or write.

Look up the exact device under mtd_table_mutex and acquire an ordinary MTD
handle before returning it. Use that handle for the OCP update and release
it on every exit. A removed device cannot be confused with a replacement
that reuses its name or number.

Cc: Richard Cochran <richardcochran@gmail.com>
Cc: Jonathan Lemon <jonathan.lemon@gmail.com>
Cc: Vadim Fedorenko <vadim.fedorenko@linux.dev>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c   | 23 +++++++++++++++++++++++
 drivers/ptp/ptp_ocp.c   |  7 ++++++-
 include/linux/mtd/mtd.h |  1 +
 3 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 30b16f135f07..620326279957 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1329,6 +1329,29 @@ struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num)
 EXPORT_SYMBOL_GPL(get_mtd_device);
 
 
+/**
+ * get_mtd_device_by_dev - acquire the MTD associated with a class device
+ * @dev: referenced MTD class device
+ *
+ * Return: a referenced MTD, or an error if the device has been removed.
+ */
+struct mtd_info *get_mtd_device_by_dev(struct device *dev)
+{
+	struct mtd_info *mtd;
+	int err;
+
+	guard(mutex)(&mtd_table_mutex);
+	mtd_for_each_device(mtd) {
+		if (&mtd->dev != dev)
+			continue;
+		err = __get_mtd_device(mtd);
+		return err ? ERR_PTR(err) : mtd;
+	}
+	return ERR_PTR(-ENODEV);
+}
+EXPORT_SYMBOL_GPL(get_mtd_device_by_dev);
+
+
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
diff --git a/drivers/ptp/ptp_ocp.c b/drivers/ptp/ptp_ocp.c
index 3d26ec1f7b9e..459aeb24ae6b 100644
--- a/drivers/ptp/ptp_ocp.c
+++ b/drivers/ptp/ptp_ocp.c
@@ -2083,7 +2083,7 @@ static int
 ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
 		      const struct firmware *fw)
 {
-	struct mtd_info *mtd = dev_get_drvdata(dev);
+	struct mtd_info *mtd;
 	struct ptp_ocp *bp = devlink_priv(devlink);
 	size_t off, len, size, resid, wrote;
 	struct erase_info erase;
@@ -2091,6 +2091,10 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
 	const u8 *data;
 	int err;
 
+	mtd = get_mtd_device_by_dev(dev);
+	if (IS_ERR(mtd))
+		return PTR_ERR(mtd);
+
 	err = ptp_ocp_devlink_fw_image(devlink, fw, &data, &size);
 	if (err)
 		goto out;
@@ -2120,6 +2124,7 @@ ptp_ocp_devlink_flash(struct devlink *devlink, struct device *dev,
 		resid -= len;
 	}
 out:
+	put_mtd_device(mtd);
 	return err;
 }
 
diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index cd7b4671c456..745655e0d462 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -684,6 +684,7 @@ extern int mtd_device_parse_register(struct mtd_info *mtd,
 	mtd_device_parse_register(master, NULL, NULL, parts, nr_parts)
 extern int mtd_device_unregister(struct mtd_info *master);
 extern struct mtd_info *get_mtd_device(struct mtd_info *mtd, int num);
+struct mtd_info *get_mtd_device_by_dev(struct device *dev);
 extern int __get_mtd_device(struct mtd_info *mtd);
 extern void __put_mtd_device(struct mtd_info *mtd);
 extern struct mtd_info *of_get_mtd_device_by_node(struct device_node *np);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
