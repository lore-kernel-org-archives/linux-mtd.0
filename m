Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED93E60A2622
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B82gSaeh;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gIZAcu4s
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SB7Id04d31gDlub+Cq6fHfJgGkx004GDswxHDGTe7vQ=; b=B82gSaehk19n7YhY7792C9LXa6
	ct+uVKuDwRLfoes0+uTG+ELY0+5YOrTNphgeicRv27UmpSRZcCqRN84icPB0/lehrG6amodi9GKSa
	Z6aOBmS8RR8Y4k1ZRgCgZYk3whOd8/lfeACP+SUiob7FWO9smhBWEC7Noz3jX8GVj9zn+epDsdRby
	06BuHPmYlnnz1gbVTTri7i3td6vMy/F43TijxojAscUnF9Jc6PEGZEUrAJcfzEuitXTv+j2RihTBs
	35YVju6HT+gppydDBZSgPhlmat6J1ug8x+2v4gTLdVlUrCz+x6JqRLVRVgdbg+iky8TEq3uOaaZFo
	N9U/pUmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJcG-00000008LE4-2V4W;
	Thu, 12 Nov 2026 01:28:40 +0000
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJc7-00000008L94-0dWG
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:28:34 +0000
Received: by mail-oi1-x235.google.com with SMTP id 5614622812f47-4b28d9537bcso295810b6e.0
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446910; x=1795051710; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=gIZAcu4s8geEil6TO5qQWpwbfpzhzEqUvFqnqM/qeja4i/nH5TB3T+yLl7yWsyPla0
         Z1Rs+C5vIGXqSGRzqmNGRnhywS3c7VDTHqUxhuf8fda1AlG3A+Yo8WUQZ68raeb7SBif
         p1tyszuHa26VOSbiV+i/zFB3NA7krs3mHJ7TnG8cYvi3qfaUVc25YrwyfC41AzpnXuU7
         QtQedji6MUUHEhjITwrPOCScJ3NVXgpDnt3h+FlImb6wCTnPWjJy7DK2UnblrrCrIBC2
         pObZX138PG2zD5mx/ngH75v1qWfLPTNkChojxT0usMAq5PpO9+hNIjdzMsF3QNpKxfpv
         +WEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446910; x=1795051710;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QgxpQ5gLKHclnmBlbj5HtHG0Ac9P6Hp7mPD4KZc1uro=;
        b=hmDoeED2guXtXI1xXY/0pitjn2r5V+gNsXdKFRn65vEdy2t+7FIzWQxZw70DzwcChR
         1VlJyFh4KzGRQ+BSAjKF3k+NKabCZzPUUC/Odk/hEanp3ZEn4dKDwFx1a9Aj+Dh9wadv
         ixosNxtVvsoRkbjZCXQwIgmFCnjnrY94a2OLPPAKDfU9IguBG3HQIS+dtMRjXMmtrIJ1
         IL3J38YFWeiteqeYYcJ7yqltSrtQwzdU/CPdI5jGy1gj/cPCTpBheosyYgyaADAMYzZF
         jjVtuZqI8INrTLIAW02+e3U0HqCEjbKYYRn1rW8SAKpSAMWY5dTNbHuZEkU58AvxfVpw
         Hi6w==
X-Gm-Message-State: APuU4Z8sxe733FwH/GgRxHO9yF9ntQqLcqGzG3QrTn3pKGk2OELQ3Mfd
	Yaw+fr2Go8YFhSf9XFnIonrO69/O2yoEAS7WiaRvVEx/YvHXALbq83NG
X-Gm-Gg: AYBFou1zGK4bxuuZhQysx+SpsFhZ4hAdRidO8lmjSKEiUGwApHEsxxnZKSLkHJE+Wla
	U3JN1stCUDJfBdPziXf3saFEETDUlCuEE82FDq8YIofKvzLjJJ7aRvPUGuDHxgG4asLxocHDt6W
	aSU5ThPurmiGrY4LvrsobGEqyu7l/MCPeK2CVwRU3xNFJzmhJdLB0kDeEFfU3H//ggo41FNQIRe
	FaKJh31EBupNjwrYpfA9bifuPvbEMiZgaStYeQ15A23NTFBAJfIeke9KotSSOziGM06dH4DVlom
	ToYnfyB1m9GQoviwfWvkPYBRQc7eTISVD/cPbbFfjsCZdE0R4MaAKtstBqJzHmOBnOizcolMQhi
	Q5a9ZdkKGCc3xMkHcoDy1v7/SuRamWjeL1dn1CUldk9vxOCNRbwjEj/PObSgIDnkbViPiJz7A7q
	rw6fi+ljhvvPNcS6UNJNPsrOeSOxtWZQX8RmeE/IVGBFZsvm9zPVFAh4DF0hRmqixAR/OwjFABU
	YKB1vZInl4tzHJgRdYPnzr+n0oqDMmKKKszjXbLN8nQ6eZ+K7UW/W/EF3wL1Wo8fZY2xjjVWfO6
	Psbv2lNE79mD55NAq29cAJcK/lQ26bu8h5dEirBglVInAd9Ivky0criqKJWj74qaWGADKi4+F7m
	X9p9mx9gXlCUU26kpiJmL9zUQLIJCYudZkvm3hT8G6BzDJXD91vo9LtrRNTEzQfZet5Nshd8tMP
	sWPnjeTlfl2eGSIk6Zk0bl+8AGjN0wL8HPQXhxfXfbjOlE8eFzOrP3
X-Received: by 2002:a05:6808:1792:b0:564:3fe1:2f9a with SMTP id 5614622812f47-56cd614086emr1127864b6e.17.1794446910057;
        Wed, 11 Nov 2026 17:28:30 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:28:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:27:41 -0700
Subject: [PATCH v3 02/58] mtd: acquire an MTD handle from a referenced
 class device
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-2-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
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
X-CRM114-CacheID: sfid-20261111_172831_216053_2348117F 
X-CRM114-Status: GOOD (  18.10  )
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
