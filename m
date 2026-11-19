Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AA60A2607
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 08:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UclEH7aY;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=n3olcQHA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=hYEoVoOD+VmsEm8HuFw+TuAcvFu5CkPhiPfLeKcReFU=; b=UclEH7aYfW6dH6kOaXWejXdZTZ
	jcB04PkkfTnBlHMLsigSYusl2vC0/oZeUhYelaf4LYfvevCK3GdkfArcD7sjVqZKLIVpAFijbMzlR
	My3hcMjc3jA7ym1dkIzerWRVzBRzd+dKb4YZcWenHwXCTHqt4NpX3WHA9HRzpqAGV4y8RRUJkuue2
	z/dkdmB1ghcB9K+J7OIwNOYLKW835b8Dw+8Wqd75P2hh9iskvYT1KZhNf+z7jG3mA1nK3omUGvzFf
	ShnUJIHl28iNkc4h9sPy7mKUA3UYrKc1Vi+RzbuiVDSB2r1aFAcRy9xIr6MuBISY/2r5TxMPA/S5T
	RzjSP/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx5g-0000000B8D5-0TfM;
	Thu, 19 Nov 2026 08:01:56 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTx5d-0000000B8CQ-2gZh
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 08:01:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so20236915e9.2
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 00:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795075311; x=1795680111; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
        b=n3olcQHA9gkBWi5MR8xYfxKCs+HWCO841yWNNwc4ecSWaj8pP+hEn1rofTA7N8XHEj
         alVr2hYOGnH/GmrMZHeKS9F2qaUPV1pGM9BNRNqsfJYW3jk0yNUsvzS6C0oyXMOj7ilP
         WTH1aFRxrN/QDaRVWaPIzp5C6COBUDw8VXKydDgK68tge6eiPwpMGNB2RLg8BSPekSKM
         XmVs2DPfhGqXbPV5nVf2qwORbx0HNPjJ2ZjiQWqbHO+oHB6arhUdPhrVT3mXWaYkd4/O
         kvsiVDGFaO7/wImTmqgZPwvNIjfHAnreY06GDghTWtDMlxy8anaT2Ewb5wHoA9yGyCR1
         1CNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075311; x=1795680111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TD/zLF3BPhys0bLsFUd/QjGu/MrgT1KFKv1kQ2YB9rY=;
        b=J75OXcOO+FByUQ6qFP8W+Fl56knZ2LMiu1krkL6cjAvyCKM4eDEFRa98dlqoCtnFT9
         BB6fs41HusFsppLRIlYhTnQ1ZmrZw0iSGeoFpSkgZp7IFGEAQ2wA9pJfzg7vvr/E375a
         BfdOs6ZIA6vpO6GpEantet135r93x7TonMBoPliT2X0Ih0CIOIOpMWyDY0qAZiI+fknn
         88DlY+GF9oDj6+OnHqdmtFDIXbtmEzBQvCf24gYropZSJU2WATpluI9LrOGrARikYvIM
         avBudPmf5DXWlG6sjcdufECRFcfVnP1zUulQzVreUhqz1DaYeVLowGktM/djIfQk9WAn
         RZew==
X-Forwarded-Encrypted: i=1; AL+hErE4+LrgmK6cYBoWAHdtz7dYrIQTB3sMLB8q0bE4OCnRg1vcw+Ap1+I2qYQB7Em9jEOMKkPgrEPlbZc=@lists.infradead.org
X-Gm-Message-State: APuU4Z/rV0E0WCVLfipMZPT5K/iouxUM1n9teuNKa/ZDfwQevv/JDAdr
	LayA9rycYxVbwoaoKs/ttBxYDxQtRUdOiMCHW06vbfD6eLKfdmuOlE9kTRJX95L4
X-Gm-Gg: AYBFou21KAEoL+G+1OPghEiYruHwIBlQ+qyBduFqAn+9HG9B584KgPRJgtMsnhCG4AF
	AZqqJRc0l91gisyiuBSkbUl1sQl4Y0Ru5Z0erFXNXuQA9fBgcwHbA+f2LU6bMF2DUTEVullVW8N
	oR8mcFEo0qG4fqRVJAz4/ImeZM13ZVTpS51kSu9lEu1k2xVj4rJdWbx1psv/beslBtxWMJyJUir
	9VIQfEflWgH5LBjgJZmb4vYkgSyRJJcAhfSFo9miMCT/sCDBXfKpKBDUw+4hGRb4yg6QT+oES8M
	a3BCBsuQnrTN3bYuSCdhupfX2WnCMb4+Av4e72CPrwW/5KBIFgoLtLmg1PQGGEMhc9MbJ4xNcAL
	nPhwRUhHe89dM+v64XWGGGFl7HtFRmCnNrijv3FFxm7YQlCvkGOuEq93rpfUaIKonkMdbaX393D
	feNIdUTIDfD5b/TWxNsL/cucyfAA3udScqp2+wLgbp58b890yud6hOTRnOPTxxD3qTpuQ+cYeIC
	+2bQodoX9GcgUr9RFhmyekXJhaYkow1eplFFD7Ske145lIU1tmmqvYXtfxCvVsS8Ug/eIBY79eb
	v1Zf/OAG+0RGBu1AxTCQVA64tGVXzHdkN2x8z+q35SgE0Pydt2cJ/8RmlK/m1YN4GR8N6KivcDs
	/p15LwRRiQKi7C2G/A9W8m947etO1R2XReM6/ICd55TBy4Oc=
X-Received: by 2002:a05:600c:3b8c:b0:4b7:6942:39bf with SMTP id 5b1f17b1804b1-4bb7da3a68bmr107159555e9.28.1795075310807;
        Thu, 19 Nov 2026 00:01:50 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65560882asm9602389f8f.27.2026.11.19.00.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:01:50 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: dwmw2@infradead.org,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] jffs2: reschedule between the data CRC checks of an inode
Date: Thu, 19 Nov 2026 08:01:49 +0000
Message-ID: <20261119080149.311902-1-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-222025@kernel.org>
References: <20261118214045.107562-1-orgads@gmail.com> <20261118214045.107562-2-orgads@gmail.com> <sashiko-outbox-222025@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_000153_692063_179205C5 
X-CRM114-Status: UNSURE (   7.03  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> Should this include: Fixes: df8e96f39103 ("[JFFS2] Improve read_inode
> memory usage, v2.")

Yes. Before that commit, the loop in jffs2_do_read_inode_internal()
called cond_resched() before each node it added to the fragtree, data
check included; the loop that replaced it in
jffs2_build_inode_fragtree() has none.

Richard, can you add the tag when applying, or do you prefer a v2?

Fixes: df8e96f39103 ("[JFFS2] Improve read_inode memory usage, v2.")

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
