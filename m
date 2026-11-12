Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96092606A324
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Nov 2026 01:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K/QQ8vEv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TyoyCIFT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pKYsR8JR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vKgWzwt1TVbm1fEIqMqx+a8Bqz9PXA/BK6aNde9AZHU=; b=K/QQ8vEvVcF5S+xukCkPRi36NH
	tLjOKarSGvSNZuc+eks/BlkNZWOoPWYw0nzIv1Ai7GU5uuzCIl7VvE/WUm6uTlWAsfvDE3SQ7hJwl
	ZSApauEgyfNrCSuApt7SM6hX1z1AYZlVjJsXiAXdLj7ZpuIGodY75ZUxzBEdty9Xtt63EOj94/I5e
	27WBvTEF0L90oAI4Mmls32fdcSbKdwX2R4YhaWl7UY6wWjOrZGa4qJI9o4SRrB5FcDTDzfeA1gs0o
	t50ogv9T304n9EvuTZTb2a6wIZhYatQv7PJpV0QLp0QiCoYjesMz0loysk8c4+THMCKvXhIRqhD3k
	W+vM5QRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJe4-00000008Ohp-3Dg5;
	Thu, 12 Nov 2026 01:30:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJdM-00000008NFA-3snv
	for linux-mtd@bombadil.infradead.org;
	Thu, 12 Nov 2026 01:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=; b=TyoyCIFT9XCY/9MhxcQCTW4W43
	7BeTdL+MdWGFXrJ9Lecw9xQQgw4ow7LQFVLXXye9VKH1GirspOgPvndDFc160LgkoOQBFdRrndH+M
	2BYlR6P/OLkuOQhqi72zrKJmz9XgWYkedK2YV1+WwalyxDgO9UzLo9xqGlriiq/2t7G+GxsbFaynR
	a15NBC9tRjcmMJ8NQHcbWgMoqSRWexuuWnJ6g46wJF8mfGRjzy2YSaEYzLUDNhhvetwdhFCy7estb
	08EbhJgMP8zeQ21friKVy+mydrfWeVLD0E/tjeixnYd9LCcxR2t1Rh+Y2LKAQBk0qcDtHATw/7Ucv
	BRcIHIsA==;
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJd6-00000009mzM-0FpP
	for linux-mtd@lists.infradead.org;
	Thu, 12 Nov 2026 01:29:47 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-843cf077f10so4667457a34.1
        for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2026 17:29:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794446970; x=1795051770; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=pKYsR8JRJOTuwbXz4scgJLaqYqn/dZNXGuFVFvwnpBuSJYDAwjTKtA60vZu8XKeKoA
         Gfj8WVjqs5wb6Y/7xh+G7veaviwmJUm8zYe+knq+nJtjS7GveXXxNNhfVl1C0EyBl5fI
         fiUzqDfnHRtaf2PlaX47B8E6fNesksFUW4koe0LuIWKac2uL0NjyCluCIxhY/zhgZDbN
         NCWahf+3nE9/o7pl1gMHVwtxAu4OXCTdVoiyHao7csJoZtXEurKqpE1sbw4MBqbq7eJl
         Ib70YcH5wiUgeiZ4/cfI87SCzJOKprqSsBJjeynxJFRLCcI/9Cheim8oviteIT2GOKlp
         PWOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794446970; x=1795051770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGpueUFDO/4JlzqoVmNEn+tm9ExIAV5i21q5rfUYjvo=;
        b=zRVWrNwq02K69hGSbdtB3d3+bxqgeg2ArupNI08MI4OC7RH/9D/699noEc8HcI7lcy
         jTpTZl1+22boKnD1ulN15wuVACAUf5JZv4Ws4XQmbb/fdmYB6N5GDbEUVhTXqP23pzKG
         3xP6f1RPwz5lIdxdtyKSZgpSQMoSQatI63AydKDDCHZ+qyZVDajShgp8nwVVdef3mbbB
         koneXbOeLBCaGciiiOQutVm73HdA7cZ1FNjgmZnn1giLhwZntZCHhFtierk1mn2Ha0pE
         4dLI9Tb9HFO/CEefEZYsRzSNuRnc7iWoHBE4he+vwKwTIcvaKnR74FR1aoIBR9oCjZrh
         sX7g==
X-Gm-Message-State: APuU4Z/BhUnZC0LdFAML/4/gGG0DTGY0XX+aUEOxYXJQS++uVQL/JxQL
	ct7xRa+RVWz89PEmjxaNx+RHxfZtGO4+3LN/P44jYpIkvdrtY0X8mhxc
X-Gm-Gg: AYBFou1I+vdpoLmIBKSM8uWtcQGHXR+aqYkOfMX6DVdcOBGHqqjF0YPRby08M7MphAh
	sGrYZBxnH6y16+TZlo7GtLfNhclvNzegT3yw6Jrba6ZsYUt1LS22QkD1KHmAXod0n0e4X9TBC/e
	1RFVvCwuipkawjg0JbZOJoCqERrfuy/ehE1D8ebRKUKp667b3YYkyaWIDNScSol3Eb4bHHZTrpS
	umkx7UTiEdFtutKLokZmHqrydHvWeFCS0I1/iba42f3lOEATA1nSupbfpsHmFt5QDwvSMM0MiTo
	chfo89JjeYPuYYxpd0D959wbZumSN0+tEtX8UWnRmd8ekFw9HteY1+SAFPKWsmSSHzFlvTQ9CVy
	X8EFfJs0AEs7v05glf5/ZowZUFimAqvCkHOtnwlfwUTnjXrH23miUzNKefHTqxsEOcrMfv40WBt
	/k9npUTC4sThQeUd/GkrZgI+j/hUQ7vibzbii9CsgwwgawNUueNp5LpyGGPbvy3jiOjpTExvExF
	9s04saUMCoXf5W6V44m+dewjztwPSKzgXCboV8N5zFMd6/gp7zypiOMNXjWYs2MDcasueBqaNQg
	OUX8pWZenzt6UZ+2oojwz8AE3RavTU4bEQTzKZBk+CrfTX4M+SIJzIZz9mvbguq+h89uME0/VS5
	70FgTOen/0zKPKudrc/22ylrrangmobztLFbLtPhBEutm6DuFz9DDkCX/j+z0C/OEnRIK2K1rVi
	XuFfkJQlvc9dYDEJKl6ngK1Q9IXjNRPkYFANWFGec1dUi1MWf9rSyF
X-Received: by 2002:a05:6808:150d:b0:4ea:686e:fe86 with SMTP id 5614622812f47-56b98227486mr4063488b6e.63.1794446969874;
        Wed, 11 Nov 2026 17:29:29 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905738049sm6823481b6e.10.2026.11.11.17.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 17:29:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 11 Nov 2026 18:28:35 -0700
Subject: [PATCH v3 56/58] mtd: rawnand: nandsim: retain chip state across
 removal
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-56-ce537999741d@gmail.com>
References: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
In-Reply-To: <20261111-submit-rawnand-retained-handle-lifetime-v1-v3-0-ce537999741d@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_012943_168564_83F7D809 
X-CRM114-Status: GOOD (  14.16  )
X-Spam-Score: 0.1 (/)
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

A failed registration or subsequent debugfs initialization can unwind
after MTD handles have been acquired. Disconnect before freeing the
simulated media, and retain chip metadata until the final MTD put. Use
the shared lifetime cleanup for both initialization rollback and module
removal.

Run NAND cleanup during disconnection; the final core-owned put only
releases retained allocation and layout data.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/nandsim.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/nandsim.c b/drivers/mtd/nand/raw/nandsim.c
index 6716eafb4b00..dd000c766ed3 100644
--- a/drivers/mtd/nand/raw/nandsim.c
+++ b/drivers/mtd/nand/raw/nandsim.c
@@ -2263,6 +2263,7 @@ static int __init ns_init_module(void)
 	struct nand_chip *chip;
 	struct nandsim *ns;
 	int ret;
+	bool retained = false;
 
 	if (bus_width != 8 && bus_width != 16) {
 		NS_ERR("wrong bus width (%d), use only 8 or 16\n", bus_width);
@@ -2317,8 +2318,6 @@ static int __init ns_init_module(void)
 		chip->options |= NAND_BUSWIDTH_16;
 	}
 
-	nsmtd->owner = THIS_MODULE;
-
 	ret = ns_parse_weakblocks();
 	if (ret)
 		goto free_ns_struct;
@@ -2377,6 +2376,10 @@ static int __init ns_init_module(void)
 	ret = ns_parse_badblocks(ns, nsmtd);
 	if (ret)
 		goto free_ns_object;
+	ret = nand_set_lifetime(chip, nand_get_controller_data(chip));
+	if (ret)
+		goto free_ns_object;
+	retained = true;
 
 	/* Register NAND partitions */
 	ret = mtd_device_register(nsmtd, &ns->partitions[0], ns->nbparts);
@@ -2392,11 +2395,16 @@ static int __init ns_init_module(void)
 unregister_mtd:
 	WARN_ON(mtd_device_unregister(nsmtd));
 free_ns_object:
+	if (retained)
+		nand_disconnect(chip);
 	ns_free(ns);
 free_ebw:
 	kfree(erase_block_wear);
 cleanup_nand:
-	nand_cleanup(chip);
+	if (retained)
+		mtd_put_master(nsmtd);
+	else
+		nand_cleanup(chip);
 free_gp_list:
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2413,7 +2421,8 @@ static int __init ns_init_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 free_ns_struct:
-	kfree(ns);
+	if (!retained)
+		kfree(ns);
 
 	return ret;
 }
@@ -2431,9 +2440,9 @@ static void __exit ns_cleanup_module(void)
 
 	ns_debugfs_remove(ns);
 	WARN_ON(mtd_device_unregister(nsmtd));
+	nand_disconnect(chip);
 	ns_free(ns);
 	kfree(erase_block_wear);
-	nand_cleanup(chip);
 
 	list_for_each_safe(pos, n, &grave_pages) {
 		list_del(pos);
@@ -2450,7 +2459,7 @@ static void __exit ns_cleanup_module(void)
 		kfree(list_entry(pos, struct weak_block, list));
 	}
 
-	kfree(ns);
+	mtd_put_master(nsmtd);
 }
 
 module_exit(ns_cleanup_module);

-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
