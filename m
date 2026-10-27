Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF947606A31A
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 09:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tGfuHTZS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gCk2jnHQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=7ST3LwZA6VMufjc1TV8Ps0vvY+6K+N28NKspZ/DRAmY=; b=tGfuHTZS4oLb08e/TW40tEzdO1
	4z2uO/i9RLuGlvYOMfPmAwG4BaFF4TpQoGztO0VWl4eY+k+RIbdZAz7tfoUkQanfXHlWiO8lVAIQ2
	SXWzOxdGrixNu0LO9XC0jAwnf/ezs62kQwvcqHr9ehdDXlvud523I4YGZtmDrU1b9NRWdUaxXGCOq
	8sSSMadU39CIyB7kKu9iG1OIX0mrJ01R6IXzQGD294o4labrB5htcibVgxP+TOjQHWDc29uNsflJR
	AgtQ1I0UExmpNucBdr2hvedmohonkZ68JJ00YMo8Py7VGEZeg8mrMOPoXUDBkw2D1ul86P4spgbMb
	uQrTLzIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdHt-0000000496a-2Fhl;
	Tue, 27 Oct 2026 09:16:09 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLdHq-0000000496C-3FAv
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 09:16:08 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-35c76e9614aso6134071eec.0
        for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2026 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793092565; x=1793697365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uvIjmI+HRIAkGOyGjy/GnDVEBAcECg6oog9cRdexHmk=;
        b=gCk2jnHQ96oT/yCNenDqUXYoTxKH5WVpgS6rUugROiRR8pm1ChTPQR4gl+SlYjd3jb
         Roof0fAvcUulelCpg4Dqi+cAtOfO5mzsLhwGbXaxw3IuQNHKtWvNCuOkL4NXH8B9zIy1
         3o4hlZ35T5kXuLi7+V7fds8BhhHhA7oaBVHhmZeP8dXnjNTdYRiogex6sMJGWMuIREcG
         YpHa+A6wo4L8SVsNTMXEZRZsLJDU3o0qV36XQ/xQc8lTxv2ng/4ovEz8eAfOa2+KK/0y
         shf5DplrWw9t8x0E3Ya3bAP1d6GoosfbJJDOMQiWvrNS8oJyQMsusIdD58KY060rgxhF
         LeJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793092565; x=1793697365;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uvIjmI+HRIAkGOyGjy/GnDVEBAcECg6oog9cRdexHmk=;
        b=IYfY0CuG9Z6XfGtjcK0WHTFGqLrELV3he4J/hqlhC3OamkLFbXm7JkQnUpw9PLvfro
         0U02hEqdfDkN1FyoNpI74rXigj6nCO5ao8W+wDiNJoFilgLqgMMRVJ46ugnjWGeCyQks
         SGjhVKIfxZOziheeAbql3udo/SWkzxFwg1T+tkS335DAo6g8ub2I4JG2v0PP/h8WRO+E
         58lZXEzVHFpxFbcw+0ieVswezJtYEszBlbJyW3Jn1cJNEiOEgzv6HpK0GPyTDvtZ3FU/
         UfmpUTkKhRgPhq0B1NxZVVHj85FUUN89nhMfI/Odiklwbamhie8ZDCWve522c0MUO0+Z
         l1AA==
X-Forwarded-Encrypted: i=1; AKwUvBzzul9w8slbyzB9jtl8jRhxkO8Llrt7pjeScKCGHh0N90XPYPQGIuWkMt0px7CUE/sIUOFUD4rqs60=@lists.infradead.org
X-Gm-Message-State: AFq9FYKewJPVtWhEZ7+MZZJQKr8cCxSly0TypYaJW59plaH+poncupPU
	j9oNR7jyAFaRcvFmgSU09CK1U5q18ehDboyubFjGeJjJD+zOvzNHyOjI
X-Gm-Gg: AYBFou3RRMtwMtOz5YBBbVJLzZfQuEKY1/TykPOYjygmr74P+P+2u2QwB3xajCxSfmz
	cmtQTvCt6iG0ILaF9FiASWBYrbnLpSMr9CRrDklGBVbkQ8CF0WAH04bWs4MqMeZpMXTJh5QN5AT
	Pb1RqvTpsfcZyufbCRsuLlRVp/LXK669j/oGSMBoPfv9dmZNQpkWwdSlluDOzc8sIkfHyn82RrX
	SSHzRgzWOPJTz2FLRyGqGmDmd8Ez5Vhu8zMV68HwjF+hS9pGnexSUktWUtZDPl+5Y+Ru4PXXV7V
	Ob0pgNeEi0Dq+GpYIZm0Ih6pHPMDWFTXp9bHHqFwfkgOyMw3+B7m4p+d+f03pfk3NJVQtNrPC5q
	+lYHgTBi1TEacOWCrbNqug7BsDbGVGurkblQMigrig80gv0dECkJsqE4LBq5/q3mml+N8R63dnA
	kKvS0NMa7Vcfj2cdPXmav57GPwp8dakR3YF+SI2qhHQORMoFBJXb4FqTBjyYwi2EJsUTCt8a0H0
	XC3WrwXm+l3ipuNIo9ScDD6Wf0fsb08mHQrB0fYFt1ZOjb8VfZBkh30jWAdStE/TdwVwObDpJa/
	M9qCe1PvOw==
X-Received: by 2002:a05:7301:fc10:b0:36a:1008:5815 with SMTP id 5a478bee46e88-36a10085e66mr2611715eec.5.1793092565123;
        Tue, 27 Oct 2026 02:16:05 -0700 (PDT)
Received: from Zoro.lan ([2409:4090:2022:b00e:72eb:d31b:8aa6:1b54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ee71f5sm41232082eec.28.2026.10.27.02.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 02:16:04 -0700 (PDT)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: Richard Weinberger <richard@nod.at>,
	Daniel Golle <daniel@makrotopia.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Vignesh Raghavendra <vigneshr@ti.com>
Cc: Zhihao Cheng <chengzhihao1@huawei.com>,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>
Subject: [PATCH] mtd: ubi: nvmem: Fix device_node leak in ubi_nvmem_add()
Date: Tue, 27 Oct 2026 14:45:07 +0530
Message-ID: <20261027091507.130294-1-vishalsatleit24@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_021606_816691_8C7BD9F4 
X-CRM114-Status: GOOD (  14.12  )
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

ubi_nvmem_add() calls of_get_child_by_name() to verify that the UBI
volume device node contains an "nvmem-layout" subnode.
of_get_child_by_name() returns a pointer to the child device_node
with its reference count incremented.

Because the returned pointer was only evaluated as a boolean condition
and not retained or put, the reference count of the "nvmem-layout" node
was leaked whenever an NVMEM-enabled UBI volume was registered.

Assign the child node to a local variable and release it with
of_node_put() once existence has been validated.

Fixes: 34a5d8525b6a ("mtd: ubi: add NVMEM support")
Cc: stable@vger.kernel.org
Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
 drivers/mtd/ubi/nvmem.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/ubi/nvmem.c b/drivers/mtd/ubi/nvmem.c
index 2dade9727..15737d511 100644
--- a/drivers/mtd/ubi/nvmem.c
+++ b/drivers/mtd/ubi/nvmem.c
@@ -61,6 +61,7 @@ static int ubi_nvmem_reg_read(void *priv, unsigned int from,
 static int ubi_nvmem_add(struct ubi_volume_info *vi)
 {
 	struct device_node *np = dev_of_node(vi->dev);
+	struct device_node *layout;
 	struct nvmem_config config = {};
 	struct ubi_nvmem *unv;
 	int ret;
@@ -68,9 +69,12 @@ static int ubi_nvmem_add(struct ubi_volume_info *vi)
 	if (!np)
 		return 0;
 
-	if (!of_get_child_by_name(np, "nvmem-layout"))
+	layout = of_get_child_by_name(np, "nvmem-layout");
+	if (!layout)
 		return 0;
 
+	of_node_put(layout);
+
 	if (WARN_ON_ONCE(vi->usable_leb_size <= 0) ||
 	    WARN_ON_ONCE(vi->size <= 0))
 		return -EINVAL;
-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
