Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75694606A31C
	for <linux-mtd@archiver.kernel.org>; Mon,  9 Nov 2026 00:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4OQyULfe;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=grhjNn5J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=2Bi4egdj3AZloFcO+J3Khi1X521JgXJmLFn0zBsHBn4=; b=4OQyULfeqe5was0etivewo2PjN
	a1VImDCwD/2aB/ZSJ+bIPrEWIszvOkrrVPxLCcrJtradRAElWlW5uXxrsnzaaaFkmKcQv7CecaZRi
	QrpjPGcSc5l9i6nUyvLcY4fBmSQjoOP5SFtHkgMnAOJpqCvzNwVFcv7EGH7BSBgVpBjVtZ+JrTlUH
	m92NYaR3j/tBhh8xlAp420IJXaaV9HtkEzwv/uf5UpTagJ4qyErM4zarkLoAW5v01QZW4XJ4/Qj7z
	EMJk2QvE+I/7Vk0lEo/0XqGUs5WYRpgFbBAW9ehhbfU8Q/kACqKeYMjU3U07bZSPNRq2kRcB2FWWl
	wj+LoViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQD8E-0000000Gwvh-3pwj;
	Mon, 09 Nov 2026 00:21:06 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQD8C-0000000GwvL-1rg0
	for linux-mtd@lists.infradead.org;
	Mon, 09 Nov 2026 00:21:05 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-706113e92f9so188556eaf.2
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 16:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794183663; x=1794788463; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GeBJObAnqhNEGePn+mfWF29BOCD0obOgEYIt4FeXOvI=;
        b=grhjNn5Ja4Tw9EmJa8KDD1yXAORz6o7j8FKdXLbXTfMTLExjgkE/xHjCt76oO9IkML
         UrTjx9w2GgQY9nZum4NpZxb+PeMYlGy6lHdNipH22fsWNjkbwFnuHIdl1VUyBm4LyuTR
         xuaxrLY0vz7ZtjZxID6DCEJPat4b9XwTyyTGVLumx3Hm83YCnVHtjctpRvOfFpfzPg/+
         Gv3s6jBxva4/5VR2z0KKNIbEvaCorvfNjaxHAy8YmgOSMzO7SWN2n9L01Z81JSFOI+cy
         Ybx5X3LbjS+CzPt1KX99xZ7rO8SNn4RpsQ5RKPk8yWr0L26D3L3KL7FCxHADuzHA2lvI
         V8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794183663; x=1794788463;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GeBJObAnqhNEGePn+mfWF29BOCD0obOgEYIt4FeXOvI=;
        b=QICQxugHAHvVSitvbDVMw3sLtoEsI6Aa3LDS+7RUxY6/Aw4Fop/Kj5FdO7vPSZYelb
         xrNznxOr0PxFSJAG1ACxsDRJmJZbciHLmSpH+rp9Hl08P5wNRcYK1ykwLIb6pmqwE7MM
         sB6+tJ6ckMKOljaqRjQZ+UWbqL8YvvnhTCjyHXajxu5mtEJJ8YqQgQ0y5nReDmclax/f
         4i0l2sAErILY9mbLJlMBWr14yIazUpi6UddMloBiosD5SXxjoymQBeMayJ9qEwLpBqoI
         2ylwpCrPdoGCJQQOJTD+DANk+aP1yoNobNbfi4XISyXDK9ZVMzrG8x4I0LECyARsf2t6
         30gQ==
X-Gm-Message-State: APuU4Z/UXUgYw8T9FOj6eZC3gkrN0N1VTzD1Yyq9GZk0t9liPTMCp7oD
	aNUpPZ/+jj+bpo8n/nU1ougM6rH/5diDdXdFRmmyalMs+JAwSFeFI6gx
X-Gm-Gg: AYBFou38rQ9SNQFwVpCDTu+KDdwpi+thCxDBmVHl2XGXT+1hUE/5ZDxUIvKw0w5/Hz0
	R9QPvL5/k9nd6CU8DmzT5joTpFanFFrI5sMelWk2bDtqBv+ctVY9NR+k8J0jE+2nvRLDwQuM/iw
	J2kMH4u3gp7Y3lBy6cBhKyND6xn+hz8b2sOo43otaPZFoSwPNVq8U8c0VngC3I7rK9QyjORjpyX
	/ZzEe64ZQGSmzAV/hFOumKoZ2EC0CNZxIkRsPtnVTSMKeiMuWUzrcRZ+PI95FBHRLS4B4mmOT7C
	g/IkO4BYaNubQlKmFd+ch0u0yVUYxZqNmyzQKnl9Y/sktiQSOak7yCp20Dv9kWn+//TlLnjY8Qc
	+1GyY6rCT9GHKTL+4O4hR2KFbh2ythFi9LlJwzDkeNMyRsHwGadVfanhNPhei/WWdXVCgM5fE3c
	BSvZyWjEWQ0aSWxvXovYHkWhZd+hCTSWS0kTM7FZ8abYZ0KiUTnWtfevHYufcUkphhUw7GyD9xQ
	Sp1eHU0f+tPh65nf/2vK+ySrR+QNpdttdL0iKIz52vgehfbPbpHe613vyY0a+QPc4d5uQjmziEk
	VKwNiB41j7lHY6pOJGt50hAZYKJAFGGcb8DxTtdqv6KJw905l9GrCLakv0Wp0ezEMBMmgIBDpUM
	m/FmosypIKHZIUNHdXj36H8tBgopYfYke1pWm3lFWL5rKqufGdZ4C38zp4NTQ9E/UviVs0584+Z
	BChzuF/9qZwEKNpxxajF4xPLjHcfyOW6Giblaw7IYG/FALGA/zten3II8kkYlUcrSR8NIVleMF
X-Received: by 2002:a05:6820:1356:b0:6de:aeea:5c89 with SMTP id 006d021491bc7-7170f2b53ccmr1343158eaf.23.1794183663143;
        Sun, 08 Nov 2026 16:21:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7170f8cbcb9sm2219207eaf.6.2026.11.08.16.21.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:21:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 17:20:55 -0700
Subject: [PATCH] mtd: rawnand: r852: disable the engine when card
 registration fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-r852-registration-unwind-v1-v1-1-e54be2c652c2@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWN0QqDMAxFf0XyvLBW1in7lbGHtkbNwGyk1Qniv
 69uL4Fzufdkg0TKlOBWbaC0cOKXFLCnCuLoZSDkrjDUpr5aa1pMc5g4o7auRqWBU1afywhn+bB
 0uFh0sYnUX4LzjYEieiv1vP6e3B9/LpYnxXyYj0bwiTColzge0ZS7s3gph9YM+/4F+PqjvqYAA
 AA=
X-Change-ID: 20261108-submit-r852-registration-unwind-v1-5c7cef4b5a70
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Maxim Levitsky <maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_162104_497265_6CF6C2B6 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

r852_register_nand_device() enables the NAND engine before scanning and
registering the card. If sm_register_device() or device_create_file()
fails, the error path leaves the engine enabled while card_registered
remains clear.

A subsequent removal work item sees no registered card and skips
unregistration. The device removal path also returns immediately from
r852_unregister_nand_device() in this state, so neither path disables
the engine.

Disable the engine in the common registration-failure path after any
required NAND cleanup.

Fixes: 67e054e91924 ("mtd: nand: Add driver for Ricoh xD/SmartMedia reader")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/sashiko-outbox-204169@kernel.org/
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/r852.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/raw/r852.c b/drivers/mtd/nand/raw/r852.c
index 92c47d351c27..073f96f73be3 100644
--- a/drivers/mtd/nand/raw/r852.c
+++ b/drivers/mtd/nand/raw/r852.c
@@ -656,6 +656,7 @@ static int r852_register_nand_device(struct r852_device *dev)
 	WARN_ON(mtd_device_unregister(nand_to_mtd(dev->chip)));
 	nand_cleanup(dev->chip);
 error1:
+	r852_engine_disable(dev);
 	/* Force card redetect */
 	dev->card_detected = 0;
 	return -1;

---
base-commit: 30daaf3e7897b4a8d9b72e5b0c86dd6e2a4d7d85
change-id: 20261108-submit-r852-registration-unwind-v1-5c7cef4b5a70

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
