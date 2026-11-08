Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED4B9606A320
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 21:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ywa//o03;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jq8rcn2S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=bJfKiRVDbhj97cgswHjg2atrpUNCU2VJrylOTHZ8nOw=; b=ywa//o036wzPqiIqgqkvZeDliZ
	YW2ujR3MXzj0AS/Wua/Nv8vYm8eiD5uShLdl59vkADzSOAy51twl2NNxe61cyf7Rfpnxjbuk8vdA4
	GCUK0JeoGbk8wZtlsGIPqKYSSorbP+l0cvkbamZ10ZkLIYaLK4LHC4QKuOvWfRwwjqeeBtSwO2vXV
	Ysndejrntb/+dd+f7uAXODV1XSgqIm6xjYc4ixvwkN5pUICBjE+rPQTB99BqkO1Jo9riiC5zIlItK
	GZnr2vndRLK5w8v65+QZ8vjYTpcptRlAwyNiaFyoQYFr4bFBpfC7jYKs5luwXY7T3oVWV248r4glm
	et4dWsIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQABz-0000000Ggvy-0en3;
	Sun, 08 Nov 2026 21:12:47 +0000
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQABw-0000000GgvL-01zS
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 21:12:45 +0000
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-48e9476e26aso79062fac.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 13:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794172363; x=1794777163; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qlC9xsQzooMGZMAFZeEoUmEZJVGfQC5/v/wrYEO4uww=;
        b=jq8rcn2Soa87Fm+fME/QE4FMkwxwEbu13Yd7BlIWLlPwYfGWsq8FTyQHTJwYMkJbyH
         qkv/vLSWGtPFhHXDbxUQRq6pRquUMEDXTjaWs57HeGrI0702qLxJ6l+8Gb3xenxVn0f/
         dCtTkQ5Vh9dCNnmG7AjkzcyBFL6drXiZjCF8FS0ZYAWLeeHK3R7I7RFfsdV9MOZc1QL3
         EPl5TAncqUY0mtByip0F4ph/e4bfOYOI7XVUeqfi2KqgmoZ0Sw/OfYUojUjiQNbAGD+t
         8VFy6eshhXobFGHIYgNYzSjbdMG8gPvY373HcQa0k9kRCJHjFGriJi5BaqQMQGgWvdCJ
         GOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794172363; x=1794777163;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qlC9xsQzooMGZMAFZeEoUmEZJVGfQC5/v/wrYEO4uww=;
        b=k/L19lPAKVsaywy8oSSrHQNQcydB2NCnaoix0AbALAJPDl0wmzL7cPucP7Uqerpugb
         bBfLry56HiLH6IvVFPcVfHE5NeT7r+My3fS9gQRKqPpSqwrhngXI1kbhyLyFpeWzq8z1
         ulkCSrSy2HeQjVWan/PF8P7SCKhN3zpm3BbpgnXRjdQBRxMGDDiXU205RmSQYsr5WsCd
         laji5SoCbQbx53GwRxVRiF02MlvliA0WzmMUvbiJWLU+nFCj0zXJNzBLVczZDxC6aKyZ
         qgjvp2VofVlb1lZ/NpTnmYM18iYNVDWg06bzuLDK9H0iC4AbCSUP198bRWqBncE0G3n+
         A2Pw==
X-Gm-Message-State: APuU4Z8D4hGbUmfL3mx0LoNMGnbxZvaJKc6+U0I0QEgKAFpHYjtixIki
	jBawwcTduMTa5KdUA70TP0Vx0KgKljtoimxqbA4pVkJJ9UuC91zLaq/n
X-Gm-Gg: AYBFou0k5CFGRSPClWNZUQ168LfmGiKEhVJka9sXH2H1CDX43yUA6lBnaa2aidC4SnX
	o5aFmP7CE+Nju1DnZif3fK/CBIm0LYigAFRtnvsWytHLn7P/1b/JT9nSZQxPgToE1ZvDgpf3V12
	D+Gb3If7UKl7qrlvhsn4widJPLqb2t3BW5eWEWz+hGpbxCg3d6AyKhopI52dCBWiTl9v9tqDhMe
	moqcJBILs6p230LDXuofqUE2iuHsa7mP6J9FsmsFkhfusdrLtanqdFyATeZA2+BAw91RizevK3Q
	H1iN8jatVubpW6FHgiHnWQMHHLZlD1+TtgJk1O3G80dH8bdRBryaG9bMaCo1gCLmmGbNwRSDG54
	mU/ZQkGsN8GbTBqaU/v5l0IW8EePA4jnaG7rqoxUECtC3TBhJaSjSsvm0GRw+q9ZqpIyzUKUtG6
	sVAroebm9PPWbx4PJBTQkRPcm3X2IAuDdd+nK070HBnaMP3uux3jy9ZwN5C1HbaGm5PLOHrjdS1
	Yl0n9ixPHn3JXI9amLDxeTt3DWXhO+Rp3cxyH96xfWbEL84Fe78dKQzszFRfBqasPBpy2LtHQwY
	0Tz+CSvfCg7qU24yaagTLZtPzB4KUV5x8CFT2oNNpb/g0y+IBvARQCCsWR1s+AjiSEOqsAVRjf9
	N2/FbXO0+Y7hQdYBxPKujdi66sci1V3cQaUoucYVZ4Rcy4/VAX6HlsAtMnHvCtrs/y9N1TcAAdH
	Dv6rk2MugnmJccMH/H5C4XHO7hVwgV/9YW6dHCCW3QCDC7txfIdds=
X-Received: by 2002:a05:6808:2211:b0:551:eea6:9397 with SMTP id 5614622812f47-5681463f7b5mr1400461b6e.59.1794172362919;
        Sun, 08 Nov 2026 13:12:42 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813ac62d0sm2795191b6e.2.2026.11.08.13.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:12:42 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 14:12:39 -0700
Subject: [PATCH] mtd: take a reference when opening an unpartitioned master
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtd-master-open-reference-v1-v1-1-871aac8c6e05@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNSw7CMAxEr1JljUVTQYu4Cuoin4EaKWkVhwqp6
 t1J6MKLN/Y8b0qQGKLuzaYSVhaeYwF9apSbTHyB2BdWXdv1Wrc3ko8NnClkT8FIRqJ5QaSEJxK
 iA62ajLbDtffO4zKoYlrKlr//L4/x4KJ5w+WqrhfWCMgmE91Uo2I/1zla+/4Dh3SPI6cAAAA=
X-Change-ID: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_131244_058101_6AA17EC4 
X-CRM114-Status: GOOD (  11.79  )
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

CONFIG_MTD_PARTITIONED_MASTER controls whether a master is registered
alongside its partitions. Without that option, an unpartitioned device
is still registered as a master and can be opened directly.

__get_mtd_device() skips the master while walking the parent chain and
only takes its reference when CONFIG_MTD_PARTITIONED_MASTER is enabled.
A direct open therefore leaves the registration reference as the sole
reference. Unregistering the device releases its device-model and NVMEM
state while the handle remains open.

Take and release the master reference for direct opens as well. Retain
the existing behavior for partition handles whose master is not
registered. Decide from the original handle before walking the parent
chain so get and put use the same condition.

Fixes: 264725e35fbc ("mtd: Clean refcounting with MTD_PARTITIONED_MASTER")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/mtdcore.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..444615804236 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -1330,6 +1330,7 @@ EXPORT_SYMBOL_GPL(get_mtd_device);
 int __get_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 	int err;
 
 	if (master->_get_device) {
@@ -1350,7 +1351,7 @@ int __get_mtd_device(struct mtd_info *mtd)
 		mtd = mtd->parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_get(&master->refcnt);
 
 	return 0;
@@ -1435,6 +1436,7 @@ EXPORT_SYMBOL_GPL(put_mtd_device);
 void __put_mtd_device(struct mtd_info *mtd)
 {
 	struct mtd_info *master = mtd_get_master(mtd);
+	bool master_ref = mtd == master || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER);
 
 	while (mtd) {
 		/* kref_put() can relese mtd, so keep a reference mtd->parent */
@@ -1445,7 +1447,7 @@ void __put_mtd_device(struct mtd_info *mtd)
 		mtd = parent;
 	}
 
-	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
+	if (master_ref)
 		kref_put(&master->refcnt, mtd_device_release);
 
 	module_put(master->owner);

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-master-open-reference-v1-a1b756dcde47

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
