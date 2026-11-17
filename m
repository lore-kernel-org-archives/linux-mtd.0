Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695FA606A330
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 22:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b77vmyzr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qLZ5hcYD
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NIxTF6CTZ7T0nZW45xXMk1owZUGzv0mqFoCROGl0Dvo=; b=b77vmyzrwtDlW2OnWc60thu6T7
	/6Oc4dH1GR8uGiuvQMV9ivo0scPfTdMZmqlf1BOd6+nps4jSDRee8gKC5qYAECepxb6iSyJoor5Jn
	VJ4b3QEZ1zWYQ8EzK9ZiUjNpCMCpWP7zN0HKMUGQa2vozE5pA3TEd05QNIEOYMrIG14/3BRMWCRyK
	fVZH+f8fsRMPrOid1FRmqJck3GLGbBvF31toc9f09+zes6leIMw1n9vLWDUxHoWn2JGf+D/UHlmyW
	Lj8KvVWdfgGItpOvZva0TIj5z/PeKZa8fchn8DqjmrOlhUdhhzTt4seMP4nfnyAV/msXtA9IPCcsv
	8Qxi13bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRJr-00000007Bxh-0XEG;
	Tue, 17 Nov 2026 22:06:27 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTRJo-00000007Bwt-2ymf
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 22:06:25 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-49412eb1474so130552f8f.3
        for <linux-mtd@lists.infradead.org>; Tue, 17 Nov 2026 14:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953183; x=1795557983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4QCrSOE103jAJ7lFK0yzz1YlOGkg9iIEGGzfD/JSyU8=;
        b=qLZ5hcYDP8vhVXsI0NffSTsLlfgNWfxX7YLK1/UWJPlrbo2zlzch/3H0sqrMaFyNIY
         CJpP81GNOgBFeFpNZbamqk5qdDN3ynguiv6UVCiPh+6IPOYRja15P8B1D1P101b7XKG2
         Z+PONlmtZN2OiOKwswg5Vg5yO2Yxw+wnsajpyEgN/vCrdsZsb9u8Zb2vekkpthxK3Lis
         G8CkueTNBtyYGInAcJr6ztL5QMlkv9Ac/WnHN3k65/a78H/l2/Ur3gNlEXBZTPTLnhq7
         ikwgIciV9EODC8NH021yR56gMnJDPkw7Fl6CD2ZjySC92G2uw23o/YDf7FSFbgx+MU/7
         GEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953183; x=1795557983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4QCrSOE103jAJ7lFK0yzz1YlOGkg9iIEGGzfD/JSyU8=;
        b=2gML55KQNEgQ3CQGljIerRJ7S/DF3ZwdnTRItDFaKWyoqY7enVcCqg6v190PC/OpHd
         qln5KEc4HqboUvUPrN9VYhmXdHHf3akTpaFqPlOf5OMVJ1owJFRraZ/YkI3Rri60AgZq
         3yQQkwfEIO8cXqzWCwZFRovfSPjHdyKowijs94XVeXkFdHJEvFsqJRWvIuT8ikVvWYhY
         t2PwJINys91qnplpMM02+DOyPrT9ubk8t6fyAd1Ke5n2aEr6uzDCz8KhF97dFHCpZfRX
         whi7FUUYWuxKNyXCB2HAPoD4DFrNbPiO9UKg0zdKTjPBG8adCl1PNxHnFhi75XXcFPf+
         uOhg==
X-Forwarded-Encrypted: i=1; AL+hErF7Sm0hYB2+9DA7nv6LNpojvM32LUu6423LBWuxlubvUy3E/Yrm4335spWC3VtKm2yygcgFCRAVB24=@lists.infradead.org
X-Gm-Message-State: APuU4Z/43Y1smeBf/QOfOP0q3pTXhhPWE3QDOrtXD2g7puebqrQNuo7g
	+3MN8dnPq8i3047Qg0TgOTzNopcvxPn0ChPS84vQdlqwm+J1chlxIVH70M9jBJnUnFM=
X-Gm-Gg: AZFdTZfjR4+zCqjLRNaHJwbrX4WrIr4TYomO2FHuJg+aIRB2AAIKr7s0SSAFEnUpD8g
	crWHxjg8CVzLheEo2F/JsWwrtW/cP+VHt/ZiK1bK9pt1tdK/5fnz/Vtth2Y8/zIWHVVhrm46SH/
	qkoGQrGGHkuy7XmAoD+giqX6xfxSbhm4FWL2E55jn5v5Rpf57u2zu4j7ao40U3jDzd7fgla9FnO
	ZLBBS3tuWpaZFbp1C+MSknjIlDEAe0uoDmZZJt8rg/0Kxo8bN8b2pr6g4DOzb442McB9Od1ldm9
	82wWiTZQpBXSS1vK1Ax+Ec7ZgPFxLVo6YqC6wabMJLxnvFCs0cIl6bveWoUw/uLzX1pe8J20vf6
	8rwfa8Mj9PBT8QqCk8oONAqsQnc64Gu1E+wiw6SbAJ31ipCsLXXOGS4DRpb9FD/ZVllCAnjflSr
	wiRxZR11QDcDArIqZM0OF1vd5iiySEDGFFlEXKGzOq1WQ3Na259ao6gtFIGwh90WxFpJhfzrE+y
	4Pmre7bvwqZU9oJx9sG6sBk0DX2/I9wG7hQTYAGUtBwFcj2I053Vad9HU+RUq3Fw8djc7O/DzjX
	P8JWhejkSKH2D8oKwRAgUheM/KemQyzTPs19a34zuOZZzQXAuQHNfHWijD2C/wfhotArsWf0Bru
	vlYA2xf9bQIjXir5sodffG3D666MHwLDGdx8owZ07ZLbqLUOdQ7Epq+nGrk8Bl/+qddDx
X-Received: by 2002:a05:6000:470b:b0:492:b5d9:f627 with SMTP id ffacd0b85a97d-4a63dd591a7mr1563173f8f.46.1794953182700;
        Tue, 17 Nov 2026 14:06:22 -0800 (PST)
Received: from center.jhjvjihww5qejoy14qwv1cc4td.frax.internal.cloudapp.net ([131.189.143.225])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a655f9f4a7sm1091018f8f.34.2026.11.17.14.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:06:22 -0800 (PST)
From: Orgad Shaneh <orgads@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	tsbogend@alpha.franken.de,
	linux-mtd@lists.infradead.org,
	linusw@kernel.org,
	kaloz@kernel.org,
	ulli.kroll@googlemail.com,
	john@phrozen.org,
	nico@fluxnic.net,
	dwmw2@infradead.org,
	corbet@lwn.net
Subject: Re: [PATCH v4 3/4] MIPS: Octeon: flash: allocate the map per device
Date: Tue, 17 Nov 2026 22:06:20 +0000
Message-ID: <20261117220620.3834899-2-orgads@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <sashiko-outbox-219714@kernel.org>
References: <20261117214141.3826637-1-orgads@gmail.com> <20261117214141.3826637-4-orgads@gmail.com> <sashiko-outbox-219714@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_140624_754078_A6F8D7B1 
X-CRM114-Status: UNSURE (   5.46  )
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

>   Fixes: 7f481716bc90 ("MIPS: OCTEON: Use device tree to probe for flash chips.")

Right, that commit made the init a per-device probe around the one
static map. v5 adds the tag.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
