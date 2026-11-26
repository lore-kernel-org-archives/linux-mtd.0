Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71956606A31C
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Nov 2026 06:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=OVTuEJOx;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BumL/BMv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wZcwnTDjHxlz5PHX/WvKpjuvFVTdGiOPlJOACyuXfr4=; b=OVTuEJOxdwqVGvjfh+unyJ/s91
	HAOVZsPmXh8B8AAnb4QB/c5HafJYePTctvgHparXkzy3CF57pfVsw9XyXuq6nuVax17zEr98/UcXC
	HDtK1l+fKosQts0BTDtxM1RJUqOOF++daJVnCLzZKy+ayH2/ZYcK0fzv9TRSPlBxN0afzd5tfkoxf
	LPHuJeIHRbEXCFewkP1tnU/hG9wTEmHJYjvWPYNzik09FVIkoJQc6wkcvezvcUjratfP4colTelfm
	SEb8loluWcn5Qx0t6DzwntV7LAJ5FceNtzJ3DuyZa8KYY8t+GnPW0hW4K0eZ6FLMCKAATywvM30Jh
	TPY2jmUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSYr-0000000C9lJ-3CY9;
	Thu, 26 Nov 2026 06:02:25 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWSYo-0000000C9kk-3Wme
	for linux-mtd@lists.infradead.org;
	Thu, 26 Nov 2026 06:02:24 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2f020d0169eso33663055ad.0
        for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2026 22:02:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795672942; x=1796277742; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+z/YCWGdnXyLJzZ8AU4hcI/OlyYCJGPBekNYtY5GceY=;
        b=BumL/BMvnWGmVnk3iSI+nPFoAMRrOOmzy9qPAGxpLNTIEuOtxBRPH0vUfvCWZhFD/7
         ySygYpETfpecpeMVo2paah8DA6PPZdAl0nP2zxiKcyNGkjl7o7X/znQlo+3gIIuHDtH6
         WKTK+EuUFgkUzXl8kFRO83fiqTWlt1EImLUKbqBSPgmmLlOGZMg6aboHfm8TFdkKfcv4
         bQL33UMp58Hubshb31CBa1iKnwDfEkDeaAyzyDEcIY+KYhCaSkvGsVvA3TAzeOC8ArMA
         VMt7ldXSgnPxgXM4JQOFMU+Wyt5mDECko1Waj/O1f59VN/0HhMsr9SPkX8wvlUgdOWjE
         I3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795672942; x=1796277742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+z/YCWGdnXyLJzZ8AU4hcI/OlyYCJGPBekNYtY5GceY=;
        b=cncXr1GdNlbPmMUy0nMUJYvjyctiZ/7jYhUQ+/fitly8U4VFyB1XjvxDrzkaOftOcr
         wzO688GN7tFbmZURRzXz1kV4JGxoMmeZgEH7MZ0sqUnYhhnNi2nwDjSZIHo2o+NL6Qc5
         LsTmyMueUh5k6vUEjwMLOZYccnbb1k+Rf4wWZqtAtXNI/SGuqTC6sXGIXeQQiFklFyem
         GwybwNko22Ps2SDwMOZKEGWS2XiVliaulbaEgfjMSiiud6f10X1HQKtZv0nU3LQsIDjP
         ZtQdHHXUM4QRks+1LuAoqT+pjvSOXXoTHSZ+BIXFZjMqxFtaEw2bU+kQCf1SMCOAMauH
         UgQg==
X-Gm-Message-State: APuU4Z+9bjIx+tWWQaDJ58OuqwbhUZpw/uHQJhuo9B03KpQHp3b0a+wC
	csPMSzWbf0vo9hzeXQn94huYCd32+xhHvaZQQB0IvXRkcvALifgvYr9F
X-Gm-Gg: AZFdTZfmZN1lqxBy+nwIXFuamww8ZW/xhtp4KgKruMeapEE1JftNb3mJCtqu8frCxoJ
	cICIXUmFVIoryjkOE7HNUWuWktoLPH4e4zZ9BfwWHEYCWoPYq+kghFTxgmKfI9pSsx2NqxmvUC0
	rykXckYco8KaRNPW0naMjMdJdYZGNABjeZ7rCLukkkuKgmJU0NquxgS7VOAWsLnoNbG4Kas+OY2
	vJsywUjkphtIALsP5RnRwJAljc3ELFuQJwk9sbA8Aqy87QTcEzv4Vesu86EvE/PnrNWnuer2UUx
	W6iF6ch9H98jX1PC84cPnIVZG9osC8Sev/r2GZKLWpHtFpZHD+TmWRZFB6EDOtmzYUFUjFD1DI5
	iDqysE/e4wMwI8Ks3P9542XdmaTKLVacP9s8pNOoPcRnxbQRwcNNAelh8ZmxszYPYh8j5sJgN37
	x3NQmnVkrFdrH1bVcSez3C4XG8zdp8ctPHYclg18q7k9RFb03e9AVXyU+hpbzls4URye5I4uBlI
	c39st0xpJKFlAWLAe9LaaE9h4w5Qki6Mqoe0FBZTAnYqWK/LChG6U/NrF17knX+Oz2JIAzo4YTR
	usA8PQy6kc9UWfZy85NexonC70G0SmKN/Q==
X-Received: by 2002:a17:903:4b07:b0:2ef:de9a:e59 with SMTP id d9443c01a7336-2f03f1a1767mr184808665ad.23.1795672941840;
        Wed, 25 Nov 2026 22:02:21 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c6e50sm98125525ad.13.2026.11.25.22.02.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:02:21 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [PATCH v5 3/3] mtd: rawnand: r852: declare NAND_USES_DMA
Date: Thu, 26 Nov 2026 14:02:16 +0800
Message-Id: <20261126060216.3155872-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <87cxrtyss2.fsf@bootlin.com>
References: <87cxrtyss2.fsf@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_220222_884703_066C4EBF 
X-CRM114-Status: UNSURE (   8.96  )
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

From: leeonion.muyu@gmail.com

Hi Miquel,

> Wasn't in this driver a bounce buffering operation that is no
> longer needed?

With our patch in place, a vmalloc'd buffer now gets bounced by
the core through chip->data_buf.  But data_buf comes from a bare
kmalloc(), and kmalloc() does not guarantee the returned address
to be 512-aligned (with SLUB debug options, for instance, the
redzone padding shifts the object placement).  So the check in
r852_do_dma() -- (unsigned long)buf & (R852_DMA_LEN - 1) -- still
has something to catch, and I believe it cannot be removed.

The second reason to keep it is that the local bounce is also the
fallback when dma_map_single() fails.

Ping

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
