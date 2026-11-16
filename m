Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5860A2616
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Nov 2026 06:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WHsVdITw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oc0PmxW6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SB7Id04d31gDlub+Cq6fHfJgGkx004GDswxHDGTe7vQ=; b=WHsVdITwo1RS1ZGr6uSGYr0qoD
	fVS5Fe+ec6RneN8i0DwURAanIAAfvw7b9mqTNm8UTcF8vqTXeiLPLiZm+4c5xSSpkPPG20KYDojGB
	ECRqUTQa/ldmlg9Z9ElKn7+ybODCDHqsZC0HcJfSmtWHMv2L7dOauLAdHseG8cx7jXdgRIfFExGkL
	aapV6U6qJx3sFRPC+SRz7PIjRZnpHFHxCYYKqccAnfR3SDz+2tKfmYaPHhRfxFwNC9QEN9VlkFgTB
	Mv+ECSW2GtIEHNuIn79losWnwKni6RiVD5wlInfX5G6rqyVeaj2Y6+YiZpA413Ij+QCUTYzjteBwr
	n0JgCJCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqDv-00000001Efb-2Mo3;
	Mon, 16 Nov 2026 06:29:51 +0000
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqDr-00000001EdU-3NSN
	for linux-mtd@lists.infradead.org;
	Mon, 16 Nov 2026 06:29:49 +0000
Received: by mail-oo1-xc35.google.com with SMTP id 006d021491bc7-6b19e291cc6so3902560eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 15 Nov 2026 22:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810587; x=1795415387; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=Oc0PmxW6jnZhWiR7jiTJ4l0r6F444peSBXZUxg9PwMScPX+TDYTvRzWSGwr8asne7C
         6ZhPuxqbkN+M5qeoQVWU1E8LFZE1dNs+9Dpul+s/au+b0Pugnm/wcgTRdJUUMJXmyU9V
         WsVDRuq49CV98F3X5y6ibYIrQl48D25pxDD+Io0cfj6vC/HKaZv+ludTWWgE6XAFTDq7
         1Pszflf9MjlHrouCYiOvFM6UF0PFaxBt/HIvdzxglBEnFRq6wV2/3mCsnuJM8HGJQ/rI
         1OxOgy1AXsVUaSnf2PWAetikZ2qhTgRbOodjgQmMDA00+vYsFpq5FK5uuyJXE5q3RJKc
         sRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810587; x=1795415387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=yus5SLA448BBbS9VdbeR8rfXPiQssd2pOoGoZgIGAl5eQkcIlDGuzuw/h4u4d/1Iaf
         JE3hcoLKcs3YaWT+901kw3jOJWu6DT2AU0XQ4b2au6b8DZyZ5/keTk3n5eCEqCV4T3HC
         FStsHeGb+VDsfAhwbSb2ktSvASu4CCJXUmFiss5v2PBPRQbsy8MfwC/HtTnVO4BBxwlO
         RdrCExUpWg/6EfSzPJFSjURn3lQzJ1/qH4fH02KBfRAFG/6ZitPBmJNeRX6JAnM5hBBJ
         hdUz0eNaan1IGq4kX6ckgULTrJpRJ4DxlGJgeOl4HPvPgRSk8TW/2z72ZWcth5C9mVU9
         POXA==
X-Gm-Message-State: APuU4Z+6tJZqlk7cRW8Bmxw71kbNnXJZM6AYdwdhPL5DDMCdJMo+YmLl
	0sZouIg02g7pd5R6iiTpcZK12wnfaU5L9Udtlb3NG8KzMJ99dqL7flNl
X-Gm-Gg: AYBFou1HK/msRoXIAuIrE+P/0KRM1CjKW7nOv3TeXKF+9xoKUX0ZxOPl3JTL303bkOq
	kZaFk3kf5MTdhP1JQ0CMXz6GoFS2thkMHDvMWMG8GCiL7G6oGGAjeiC3CEIn2SUdwBoiR4LCDd0
	pJUV6XBtBtXhWYYR7SWYicZnq9bZygb6NfRrbAAFzFhJJnwvaNqyhfArMlnMh8Iwo0CLnzoCHbw
	T6Xi/kshUK4YemH6B69pgZAu1BQ4OnahUP23Rp7xaEGOp22SmZvwZK0ON/sYe2QX2Wep3HJzziv
	zTMaxnj2Zh9N4FBu0I1Cq0akyAqtTfFVsxzn8Yssd1MmyjlZr/emOx4sxWQadWMo7de6hUBdjoE
	TuyDCJJRA0caTiTr+D3xBUtZc82pDNtD5JXpMJH6JaJLuoVYPIYII+4Etnvzw/Sf8G93/Y/KikM
	jxQ8/hW7DdlM9CwCxc08hPWzX/7JFkNDaw7tgkH87Cy/W7ib9LYPKjr/rdBSXQA5Cc7TJc+ENrB
	cZWmsuoULpjbJgdSkMIPuhGzXlv8ntnyI5G+mFtMDdyDPFgHCsA1dCdfA6aunWsZgT3H71vsy6p
	1yhGJuDzv+jPWcyZ2/FMzdPluP/tq7MujC4fAX7G4TjrTAopdmBlZimaD56rFzotjZ6k4fWYlfN
	yBlG7CS1AQBtDrhzCz5m2jSDdR6ddjqiOgaVLHDxNURQRc2oQQCzazoC76LsgAfVwtxXO7sl7OL
	wXHgHbLXfw0yM7razT6atRheO87DfNfnARA/lq1HCW7yqTDqfMI5Bn8WOexHlJed/mQoSZmueC
X-Received: by 2002:a05:6820:c0cf:20b0:703:10f3:89e4 with SMTP id 006d021491bc7-71ab50704b3mr4810201eaf.42.1794810586798;
        Sun, 15 Nov 2026 22:29:46 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71ab42c41e9sm7994558eaf.6.2026.11.15.22.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:29:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 15 Nov 2026 23:29:17 -0700
Subject: [PATCH v5 02/58] mtd: acquire an MTD handle from a referenced
 class device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-2-cbc49c5c5e74@gmail.com>
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Vadim Fedorenko <vadim.fedorenko@linux.dev>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_222947_857191_E5065EA8 
X-CRM114-Status: GOOD (  17.73  )
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
