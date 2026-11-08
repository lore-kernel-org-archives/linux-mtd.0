Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E17B606A323
	for <linux-mtd@archiver.kernel.org>; Sun,  8 Nov 2026 22:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kQCjeGPc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnvHVcd2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=82A6ZRGzEynCPO5rE8++AjHtGwqtaRg65aQUGKz4qPY=; b=kQCjeGPcpAR0xxNxBFjwyDepWx
	Zv2RJ0bsQpsivhYAfyOcUzEuOARZz08zNI6ooTAIXYX85YifHdq6yWk5mrBvNpB770JQ/MOmCqZHS
	6Cxjl00JHHuoJLXgPAWyyt01lsoxeAuGIBEzLLHnObQrrSfFlMm0vxANYkKZnayNU/6q2Q+acr1eU
	MPfX4APoJyCgPIMB6dkCdLVxV25Qxee9Ao0yS7iCEyipOJjvSv77F2GDqmsaLo3Lng5bLeXig78a1
	i9DxX0zpnAqA0L6Yn5LsbcAHgUWdyZEKuAxTwzZyacbb+plEMdc/OyYo5+OVciVlDKArGQ63ZXaXk
	/m1S3Aog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBh1-0000000Grr7-1AIG;
	Sun, 08 Nov 2026 22:48:55 +0000
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQBgy-0000000GrqQ-10AJ
	for linux-mtd@lists.infradead.org;
	Sun, 08 Nov 2026 22:48:53 +0000
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-4f66bb2ab57so75948b6e.3
        for <linux-mtd@lists.infradead.org>; Sun, 08 Nov 2026 14:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794178131; x=1794782931; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3bI4CTK0ibSK5GiKKc2cJRvX2UBB1MrQ+kYcnJge6oY=;
        b=DnvHVcd2KEoj85HLFOHwPghFngjY1n6I1MfRBjTztbn4k1m+oon6H6LQ8TPi0Vazku
         flGSrg/xpde/1vzzCJ+D6k6trRO2xS5GyqS342EUCFlz+EB78vveBFJRTwKAtZbKa54H
         cfluL+Dqbqi9X3SD0pcCuYW0f/XqTvF2IBDEizWQLj3QPGtm2RNBtJmusp4x/dSFvuw0
         jsRhxsRueZFZzuVHO8yQf1GrqDdYXD8aWgsSl+wwVJREuaWUaJL0Vg1cSJNL8tvOK4qi
         Bae8f+RKmn9wRuUS3zRjBgbHnlNrHkY+JG4pS3puBxCl2ONbCJ3PeOgiv8PDoxpYr92S
         VjCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794178131; x=1794782931;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=3bI4CTK0ibSK5GiKKc2cJRvX2UBB1MrQ+kYcnJge6oY=;
        b=zHVOdOYxeO78jNPC0oNuq7yYm/+iJetD0AO9e7H6xtFVEL7q7LJSPEga+0BmFWxelt
         5JZt0kz7IlAJ2VkeNnZz9qKcCELeY0+l6NXHvISha4Oksrflnnvcy5qgJh3XteWznzDo
         HaGIggB9j10ym/W7+yccBNYIUUZQvCKj6PQGxp1iTDu7tygChYPK7r2rJiL3ayuLsYgi
         YBlhoko5+kuDVXHdLp3fMQ87pjvqyxaD66J0QUL1vFY7cXAWTSFvXb2V+nzZFsstNnSA
         TeJQcwmEGlaK7/U4eLD7uAMRJGw5AyjyP5m6/Veyc9EOsOn5wHEHfr8w/n6pRYm93YgX
         0A2A==
X-Gm-Message-State: APuU4Z9APzUf6rF9WWwDboKvkufBUsoMNt42fwwNuqIttWam4GCCp6S9
	slz6yMsBRsdhBAWoQDk+EYUPQXJi34zzO8RNATqpfhCM7Wo2iQKNCb9O
X-Gm-Gg: AYBFou2dLQwVPEkW+cZVM13C0Kxf78gDh4JG5/9HqsctATjHPjwuBdb0Wsboe5jy9xy
	S54KAT6FqH6+CDwE14WHmLE3EUbyw1GNKkzMyhB3dVoVuRpxT1ucbAI7qZoHls0Hf81iWl28RPf
	k+FOzJcYe0IC1rjcOVBAQZ7fYvc/qZOoYlNuHp3jnPVoasC0XgZxm+j5P6uvqc7nFopRqNW3W91
	1dnHROoHcG9sjuHDJrnTIbIfQ42yU8ShSS7k/eCe620A1qrW8FYVi5jFYe17w7NeGQL3ZIcdA7O
	+V+7NEMj4gArNZOhH/v3fFWqUxsYUyadAvXb56uc0bhpMRFtN5iYLRBBg5oYDANPtZcETaiOVNh
	L62xNeTrix+NZoZzNHt2gsg5eDJZ5b+CR63svLjxYtvBlI6WbZJ0YzWA93dSbdHJZXu7UX9QHHi
	fLlxoGhRm2uhszZhkjwjYO0KarWQ7FadZPwWZ47NPFWUc0kqSk87bBvZyjoZn+mNTZoZV08pOg+
	rN+CaIxB6Xte45E+h1AJWQE1m6fvkNUF0jGcbdZbf6u8c09Jx4wVmC9IzzTwlz+POYu7QMAPFPw
	++7AEhGYfxOyO0QOQS1htzGHX3owwWTL5MJjtll/6hRu9CCExpMzN0rB+lzJHW1MUX4fn5dq6Ob
	vrzZszKMsD+wfA2AMsBL+k+fCnS9sVGvAGvj2N9wLr/4fkea6y551KwWVUkagnQx3HoAdHZWPl+
	hXCZ8Fypex8LtXATg7IPUF7RDdoBh2tpLs3MRxXLq4Nq3/KqV53b8=
X-Received: by 2002:a05:6808:c1c8:b0:53b:11c7:2da0 with SMTP id 5614622812f47-568146ed248mr1427843b6e.21.1794178131013;
        Sun, 08 Nov 2026 14:48:51 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56813c71b08sm2885540b6e.3.2026.11.08.14.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:48:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 08 Nov 2026 15:48:48 -0700
Subject: [PATCH v2] mtd: leave the device type unset when naming fails
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-submit-mtd-devname-retry-v1-v2-1-09f576bcc51f@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ7CIBCFr2JYO1pA28aV9zBd8DNtMUINILFpe
 nehvYDJzOK9mfflLSSgNxjI7bAQj8kEM7ks2PFA1CjcgGB01oRVrKa0aiF8pDURbNSgMTlhETx
 GP0OiwPtGSYa6rVpOMuHtsTffjf7odp3jT1SxIMuHFAFBeuHUWKxMPZfdU/k+mhAnP2/1Ei2c/
 5rkoSDqpuecqetF6/tghXmd1GRJt67rD5XGa4j4AAAA
X-Change-ID: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>, 
 Edward Adam Davis <eadavis@qq.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_144852_291591_096D56BC 
X-CRM114-Status: GOOD (  14.32  )
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

add_mtd_device() uses dev.type to reject a second registration of the
same MTD. It sets that field before dev_set_name(), but the failure path
for the name allocation leaves it set even though no device was
registered. Retrying registration then warns and fails with -EEXIST.

Set the type only after naming succeeds. The later registration error
paths already clear it before releasing the device.

Fixes: 6697dae1e2da ("mtd: capture device name setting failure when adding mtd")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v2:
- Correct the Fixes tag to identify the commit that added the
  device-name allocation error path.
- Link to v1: https://patch.msgid.link/20261108-submit-mtd-devname-retry-v1-v1-1-a67f332c54dd@gmail.com

To: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>
To: Vignesh Raghavendra <vigneshr@ti.com>
To: Edward Adam Davis <eadavis@qq.com>
Cc: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/mtd/mtdcore.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 491a27d0315f..4f62a13dc481 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -798,12 +798,12 @@ int add_mtd_device(struct mtd_info *mtd)
 	/* Caller should have set dev.parent to match the
 	 * physical device, if appropriate.
 	 */
-	mtd->dev.type = &mtd_devtype;
 	mtd->dev.class = &mtd_class;
 	mtd->dev.devt = MTD_DEVT(i);
 	error = dev_set_name(&mtd->dev, "mtd%d", i);
 	if (error)
 		goto fail_devname;
+	mtd->dev.type = &mtd_devtype;
 	dev_set_drvdata(&mtd->dev, mtd);
 	mtd_check_of_node(mtd);
 	of_node_get(mtd_get_of_node(mtd));

---
base-commit: 1c1a342aceec79528b3ba51f376eca2be5928fe7
change-id: 20261108-submit-mtd-devname-retry-v1-3f7cb2ed8083

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
