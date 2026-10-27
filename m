Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F0D606A326
	for <linux-mtd@archiver.kernel.org>; Tue, 27 Oct 2026 10:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xzJasLF2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YgDG5bKL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=RO7+FqDWiMCOGHuM941LDc4xDscaNBwJ4h7Opy1AcRY=; b=xzJasLF2yx59FSvqEywDezIWmK
	1mjMlgEQ8291s36EK89rdNQsP31C/1EHCl0mZTj0IZWEJK6wUb13tzQfP77VkX+BDTgAc+nM5nLiT
	0hpve1kjcFd7Zj4RerhSQZx1ZhkA82swWzL/V3jvWleO5NSwXErbD8R+xLfJLgZiB6DxleAQGzqqy
	gohd5Yzez01O1s0kALxb7N95dJU0ezHEmbgtYOF2NNO4JY0xXFqqj11m1ptcbvU/zAWNDZrTrxv3b
	O9UfeBk9cguEjZYQBTOAQNDaORvv8NJlADy47tlIeZsrdmwYNYwY+o1jwjqxeRiA08+e4NyH0cOWZ
	bDdv81oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLefe-00000004Kdb-2xjR;
	Tue, 27 Oct 2026 10:44:46 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLefc-00000004Kcb-0dwC
	for linux-mtd@lists.infradead.org;
	Tue, 27 Oct 2026 10:44:45 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3535a54bed9so6130559eec.1
        for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2026 03:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793097883; x=1793702683; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8S+4Ca6+ZW0dJ/5s+MHcKgmRM457g71lb2YWMXhZ5MA=;
        b=YgDG5bKLAIKwAhPB/yZClZ+SRXoMFftuuhd554pQA8yWsvs+czLSftXl0HTL2pLmpF
         Fen30WTxX6PUBuEyCAZetoZUX0jBzaqAnZP5EH9H1JBpFn1VADTc1+6l3LPH0HTOVo9D
         mZXD4I7X1CydHYYMN2NS0QDvWO6Zyl0OPMG0vcI5RxplWpDfHFNcoflsC7nequ7YBz8f
         m50rqxmA/SkMm7phD06E+Ldj3mmPokwXBq+CZypJJFLmK2mIZMYAkkPvA8huts/OF1KO
         ZKJHx3Or9rdLMTP9MVWKRsAhLUvufPaaFvUVJb6gehAlGOpAsBySF9zfN+zZ07Xzl1ba
         T6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793097883; x=1793702683;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8S+4Ca6+ZW0dJ/5s+MHcKgmRM457g71lb2YWMXhZ5MA=;
        b=ttUhLWJmQyA29oeD+SVV5FHK/24lJ+wUYalDlQ3JviGo7HUUCMOkqHKkKmORx+HHmX
         7MatZjGeZETIQp6Z3Iyzi2Hf0YqqLdRtK4LK8lK4d0gAaAQAIU3SGcXln0lObDsM/3hU
         Tny5RCAZ2mMwUIykYJkxlDjgorRqtWLpfKoMi+YaNmwjPjviWwEsTrxGADSsTZMQBpuk
         Hc+o/ee5e40U4SgwvK3KEfZ5tcGj7soMUrwyXAPqBVw3Xil0rI9p+DJJuy/EwHdxyZfv
         kwkifERrxep3H5SUHtjNj356AgcQgNDPjiPb1p+LML6OiA2kPiH56JshfjFYebZThNB+
         hBNA==
X-Gm-Message-State: AFq9FYIObJJ+EcxU+r0ANuJJYETaKzi6/D6C70koWMMzKP1iJnnoh3d2
	NJciih9Pul/QuKGK91xq2jTRtxB9D3+81d+wAiLva/m48Ad2H3FqhaIE
X-Gm-Gg: AYBFou0wgyM/OZKvvBYQiISgY2wONFUgZXsI8gVy64FdyqFl7QFMpShXpD053GCHB8n
	BqysCK9SlnD83Y66wL7Xr1uIHjaIuk6Aer2LqQY1tFNPncpB/dVtTYeLtUPXIc2ocag5/StBdqF
	rYmgGj5t8s5viTFgOduP2HKGt27//+wkaFtS7Z784MKCmIvv6DYo+jJjxZ8aymoINjtFEm2krEP
	3jYqWTD97YoRr7wc9mMCTFbv0wtg6pmNbqTwIh8yfeXzmCXmtdhXzmnoNmcVAC98pf3mO/o8Vh3
	8U3SmEopRjQs78T/MLO8eVf2E8nQO6Y3GkVJ+wDbk7pqF1ut5ilhky4Mezl1vFS2DQHJPtVO9P5
	GXKcA6/+wbSZNK6962DqWLz/dj8m4NyJZaFn0G1XabDE5e0w0XUfIc01qsasg09vkBqPykWB7pX
	Dl/m1HLXsoLu6/7xGOXP68L7E0En1UgGNWyuzDjjYwHFCouGlkXfAkXQm4BwFmSeafU9sUL6kpQ
	0fPEe4104fdt2bS61wds8ADkMXEiSEEoDuyddtNJRruhvLZFuJqocn+NwSZYgxvuki1fdy6bYHW
	LLmx+PSS
X-Received: by 2002:a05:7301:1828:b0:369:f9c4:1fda with SMTP id 5a478bee46e88-369f9c42405mr10913555eec.27.1793097883083;
        Tue, 27 Oct 2026 03:44:43 -0700 (PDT)
Received: from Zoro.lan ([2409:4090:2022:b00e:72eb:d31b:8aa6:1b54])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369f27d5bf8sm31955745eec.4.2026.10.27.03.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:44:42 -0700 (PDT)
From: Vishal Satle <vishalsatleit24@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Vishal Satle <vishalsatleit24@gmail.com>
Subject: [PATCH] mtd: virt_concat: Fix device_node reference leaks in mtd_virt_concat_create_item()
Date: Tue, 27 Oct 2026 16:13:45 +0530
Message-ID: <20261027104345.172612-1-vishalsatleit24@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_034444_197883_168C72B7 
X-CRM114-Status: GOOD (  15.17  )
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

In mtd_virt_concat_create_item(), several device_node reference count leaks
and lifecycle bugs exist:

1. of_parse_phandle() returns a device_node with its refcount incremented.
   The validation loop calls mtd_is_part_concat() directly on the returned
   pointer without releasing it, leaking the node reference on every
   iteration and on early return.

2. item->nodes[0] is assigned directly from parts without acquiring a
   reference via of_node_get(). However, mtd_virt_concat_destroy_items()
   and mtd_virt_concat_destroy() call of_node_put() on all item->nodes,
   and mtd_virt_concat_node_create() drops its own reference on parts in
   the next iteration of of_find_node_with_property(), leading to an
   underflow / premature release of parts.

3. If kzalloc_flex() fails for concat, the error path frees item without
   releasing the acquired references in item->nodes[0..count-1].

Fix these issues by releasing next after mtd_is_part_concat() in the
validation loop, taking a reference with of_node_get() when assigning
item->nodes[0], and releasing all acquired node references if concat
allocation fails.

Signed-off-by: Vishal Satle <vishalsatleit24@gmail.com>
---
 drivers/mtd/mtd_virt_concat.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/mtd_virt_concat.c b/drivers/mtd/mtd_virt_concat.c
index 40b300021..6abc88251 100644
--- a/drivers/mtd/mtd_virt_concat.c
+++ b/drivers/mtd/mtd_virt_concat.c
@@ -163,7 +163,11 @@ static int mtd_virt_concat_create_item(struct device_node *parts,
 	int i;
 
 	for (i = 0; i < (count - 1); i++) {
-		if (mtd_is_part_concat(of_parse_phandle(parts, CONCAT_PROP, i)))
+		struct device_node *next = of_parse_phandle(parts, CONCAT_PROP, i);
+		bool is_concat = mtd_is_part_concat(next);
+
+		of_node_put(next);
+		if (is_concat)
 			return 0;
 	}
 
@@ -178,13 +182,15 @@ static int mtd_virt_concat_create_item(struct device_node *parts,
 	 * is defined is the first device in the list of concat
 	 * devices.
 	 */
-	item->nodes[0] = parts;
+	item->nodes[0] = of_node_get(parts);
 
 	for (i = 1; i < count; i++)
 		item->nodes[i] = of_parse_phandle(parts, CONCAT_PROP, (i - 1));
 
 	concat = kzalloc_flex(*concat, subdev, count);
 	if (!concat) {
+		for (i = 0; i < count; i++)
+			of_node_put(item->nodes[i]);
 		kfree(item);
 		return -ENOMEM;
 	}
-- 
2.53.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
