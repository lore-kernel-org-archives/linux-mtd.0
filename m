Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25227606A320
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Nov 2026 09:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NcJuICU1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oJIfG8/N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yntoeDisUaBLCnka00VxJ1v5pBAeOJKX3NSVH1KjWVU=; b=NcJuICU1QWBTWgpyGJwc67iEUW
	bh6lIggadbqAdCFjNARak+TmWCIY3WHNcdIjbBB+unpftRYJ0tXP3WsjoYHamNfn2Vvqxpkb4NfJR
	alnVMJlGruf+8u7EICIRJCZVf3Oo/TnnhLx2AoPg0TDoBRZq1JxNjO0niPaoCdtiyBg+a3gghrLr6
	3hBag8P6qZjQ4XB85RKvPMnN4I1vZRwzgPGcLcrjoSHS8lvA3AncNK3L1446GM5itFK7RS2Zbk3V2
	pVL4d1jMaEWnKGjG21tARLFQ/o8tiM9gedxq5TEAm06p5uvHxRDibhnUJI7LkuuwqaJtDTHmy4BON
	Da466IKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTycM-0000000BQf5-2SS4;
	Thu, 19 Nov 2026 09:39:46 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTycK-0000000BQeA-1AEb
	for linux-mtd@lists.infradead.org;
	Thu, 19 Nov 2026 09:39:46 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-cdddc79a4afso962208a12.1
        for <linux-mtd@lists.infradead.org>; Thu, 19 Nov 2026 01:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081183; x=1795685983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWuVI8HxR7JfjA1t+/23RskheqcPsWvO6jyOlH8EQmk=;
        b=oJIfG8/Nr10bw3bmwyd1Dyz92USf57mRU8jrepqJgLXMF6k9dPxDIHrD7VwXBfbj+8
         K4GO3sa22IIkvUCXuTrkhrBeLhihZLlNz2bY0h+Dbxo2NJtKrdWIr20pw4Lxb993Lnm9
         GCO06csYuntM0ayx8SU5OEW272uXbYbUnBMx6LIElT0EumwfCpdx040RMvZqy8+hqGaw
         hH0UEoqKoxX43TAIn6H5yUvJETX2OCXyReLeizZUqTs9yHqR82x8zcl4fCR5oCim7Sj1
         s1Bohxw6S1vWWDZA7BhtLohvzITHHIljuLfqcK5KOHWFcMHwxsEEI1etMhC+rtUm2mgV
         T/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081183; x=1795685983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWuVI8HxR7JfjA1t+/23RskheqcPsWvO6jyOlH8EQmk=;
        b=hGsUS78d0CqV1MlXc4AYprrNlxMmBpg3Pfsv7Cc3JkfA3cAZqTsFuZSGRsYFvI1OPJ
         qYmHq1EO1OCR10cNzhc6/5GRBraz5UsvDhz4WammS16utcaZ/Nb1W6Fjzr6plVlvrnjv
         /Z/Wd1lZJc+Cml761ItW8ST5FfEhD+FeXrTp2vG9LSCIDzaUFlgpxVNKJn/QhKDsQO/v
         cjh/KkxiIpidAW42Il07N8+J3hAxuzZwBiQaAI6vObujlRdEI9pAzBdf/ME2olXVHt79
         yiBl7nWiPBY347PKinnQMmQDNSJSk0yfbIyWtN6LZDhOv/O9Zq4qaTnCJUE9aBNOUlxz
         ONBw==
X-Gm-Message-State: APuU4Z/SarYJbf1wC+WfueNE8hXtHHY6PcSu6CK0gXpCRk9ktv/Y3pMO
	375UYAUhabjNkuNGi73WJe6nEuKFJXxuX1K2QZiFJ+iFE6e034clVJRh
X-Gm-Gg: AZFdTZdK+lAwCW+2NmOIiWhgTAcgNxxKDiUhRzeAezbAi5gKnDXotKz1VYZWonKiz61
	KWdK9GNrfKVMZBb+5dksi4NkGBpJX/+XToWc/YzxHy76T90vff3F80Dwo8pwgHOFccqNN0ZeJEn
	FtEvDOAC8FWCQgSogZVQJk2d4Bj4a1Kx6jBTdVOuvhVKoWZownmq0WUg+FcyyzOnT1ztBajofto
	jLOpDY8FfJeFkZVyPuHYnx4pWMTOUN8VkdGVOKyZ93ux+VVvVkgUmrpMfMuk0QXsW1WMqRl5AKe
	S4OrHudtQvSiIJ0t0o1xxHFv/Ehd6Zv02+0qFXsvIvrB/Mrxvnt/ukDEQdbB10DsvcIvCXC1mQQ
	L7sZ31sEZLANB84CD3KpeQvroW3Buf+OF8D1UUmBm+FF5sd1nLPrn9rzhJdZZ2OqDD+akRRcvsS
	/dR0qmXOGKUR8RNlryBlEj8yOwL6lRFsFfLT/2qdsJTBkM9Y3dD5BwMdD6Qc+LRKDMQLkzCgZgv
	8EyDSabClPgu5VhwvlpyxkGWJKQiJJ7kuY7Wjg3mfTnAgEs7jskAvGFWlAW212YKgblC0jVTX7m
	sElcrluhCePFWV8+0AnywoPFvJszJMtCyA==
X-Received: by 2002:a17:90b:2b4b:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b3d07b92dcmr4575955a91.33.1795081183316;
        Thu, 19 Nov 2026 01:39:43 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm2085855a91.8.2026.11.19.01.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:39:42 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:39:39 +0800
Message-Id: <20261119093939.1451208-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119093801.1447618-1-leeonion.muyu@gmail.com>
References: <20261119093801.1447618-1-leeonion.muyu@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_013944_316221_0401595E 
X-CRM114-Status: UNSURE (   6.28  )
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

Apologies for the duplicate -- that was a resend glitch on my side;
the two messages are identical, please disregard one of them.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
