Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D96606A32E
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Nov 2026 08:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=a6TpMRiE;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TsS9tAY7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8inmAoxk8sfaAIz1t/6X+D7IYoaC8T0/wl6CKpIoxEY=; b=a6TpMRiEOlNH7WhwOFNKw11p+d
	cgIPWmE48O9b5biUbgtlGlTNzcsoOh95Z6lskdsd+XZwZOIxuAq8i8OL0MYzeQagRMjo4nXjk5dX7
	ctnJu183XkN1h6eHxhg6vAUKNjLnek+tTbXBe886a77NZQtEIFGwiExCso5j2Mg4zoDKQRLmHMyz1
	bnUcVbRWmQKot9OPt8fnd/ZiOAP8VxxGbHfelrvl76Q5roAX4deDQ4zHIlXbPCwjy8Q2p0kwuKbTL
	a1uF+V9Bg9tpSHT/PtmxAy5mIf/Ii3pN4KnYDAp/UpWn08wPiiIL/1UXU7XJXGW14JBRIV4wsmiDe
	Y+b2mTQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFJJ-0000000BYkc-3iBm;
	Fri, 06 Nov 2026 08:28:33 +0000
Received: from mail-vs1-xe2f.google.com ([2607:f8b0:4864:20::e2f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPFJH-0000000BYj7-0KSx
	for linux-mtd@lists.infradead.org;
	Fri, 06 Nov 2026 08:28:32 +0000
Received: by mail-vs1-xe2f.google.com with SMTP id ada2fe7eead31-7cc0892f92cso110143137.3
        for <linux-mtd@lists.infradead.org>; Fri, 06 Nov 2026 00:28:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793953709; cv=none;
        d=google.com; s=arc-20260327;
        b=gsFr8iPCIGOvGbcbmiWYfYa+Bj+b37P8CaTcedS+HqfulB4jNsWHhW0CICXGdJ/DkY
         Rx2vPmA/tvE71UN9odR5jCoDIdcNo0CU5PqYFbrOAoQ6aqYJunRFIYe2e2nPPIk8QBYe
         ljvzfL5ucTytXVujKYkLe0uY29E3lv6cvD23yIbTBHiy7LFbxTCjynG88kxVjcsoKLJc
         fv9j4KK4h1lI2jiPh/Igur0EdYjEvRYJXa24Vi73VpLDSaAe2GrUQwF/alk0ej5V63dJ
         3FriglQuhm82Cwec/DOWdFJXYDDRYl3iamO6GSOsxdUUE2JyRNzfc2Sf4vK9qj4omlID
         ekLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        fh=eW7NtAJrUr2/WFVfoI2cmS9fWOs7jVsvCGRnvrHH1mU=;
        b=djcklJOCbFK3MhKUHOJUpudJLqSSUDM8dC+O9MRNnWsqUhNRloW551LK9Xarj7sbvd
         grUPhB/02C19sfYOQiU/sNRTYL9oH9x4IFNw/RsHDX10WEdbeABs3HH1/FNxxB8+Hfyn
         ibBeB0quCIpJbT8ospij42tYZ4J+oTpL3aaF9OwP5gs6MGYAhautZhXtu2Hsh3uiRV7v
         VSdD5bG4wAX9b9wD6oNRUdILJDcPxfxozN/dO9Z8Pv367TO6XCbxH5KDb2exGoQiWuKZ
         ijauGmb9zpac+7KIaNxr3EKCgbo1dVqeheCwi3kG40WO2l7BfPBnOlhq8Zo7hszRwJGE
         YHDg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793953709; x=1794558509; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=TsS9tAY7F0pviaQtkqfM1/Y+e8rhBm7b/AA1SjtPkLT5JpcLIi5W9XalwlIsEH3NZX
         eFBod5aJcZR8VvlDKAqf/hG4qrCwQRNeBFy/ipHDyFKFwOuY70p4hLsRB5ieS7QxX6OD
         HhCWH/bb/6t7iNv1afioz8Lf98UhLThbQ8MNF86WbpEfqg63rq+2Z7JCgFuwSwmJt9fi
         sXIgW3NsGCCCJdnKqkyoAqFU1gj9UW1dQWkm+2yapkP5rTKwa7RQ8DaInTLgVQxhNo2N
         iF4zMgz8eDbXf+s7Eh+bd+FsUoHluReh4aIcUq51Tzy3Y4/RJP54CDEs2mFZR+srbOkZ
         LKMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953709; x=1794558509;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AtMfTadBLs8nEmS0BloOK+uIClG4rM4IDzYSAxjYFA=;
        b=0n2kSoaTiCr8At9rCAJuie8MlQXcMk6gIHhgsu10p1l6QsUxRjh916I/t++LtxhUDF
         wqAtV5qDJHVCvspZxVue5VRViwJqSQZKQuGZGKNRuJtMzthjcj083caAegIkpfeFz5zN
         RVl359hiYUMbVFqQkhPS79WaNQXPu5c2qkO/iTehjEkAd05mmC7l5v4Vl4ETO66CriFC
         WYAv27WG+D/7kcjSGxkmEvsBiTRJL1ofQKoEKa9TbiyxjHOfKYP9r1dFjVAqB9MI0Es/
         G+iwxwDCqoMcTndDtXzzRO6b5PRP9s41jQ9OLfyw+C/zHLxMoubnQ19k6p/+kp1/8si9
         NZDQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzhhSiHwnNN+kuIIprmFg0rk8QJDDgVO3TGuAxYxBCaDeb+CwIYiKOnRM34yRAI9or3vTIs4h3i+U=@lists.infradead.org
X-Gm-Message-State: APuU4Z/oIeSgxiX+8Y70Ljn3l4v24ApO62dnoyzm+uikx2818OZdN5b7
	Q9T7kzsGu5DZoC7CczYkihr0Tw7gepTCpCXUIxh+lbS0wfI7Hjpo9q50DfVnlCUhLaV5HYDFJVF
	04fFNioYvq/EBud+ngLTEzh5gD9cuBXM=
X-Gm-Gg: AYBFou0Lfodx/Qo2/5+f69/DPEGeTBQj4KD/GKzdDQwIY5qvXeEWnBqNIocEbnf7hA6
	J8y8qlExDICZNFdVtUUzyCgcLHirOL7fF4rlLDSar0eCtAZHqfCbjT5SI1gccd5C/ma4PGhmYgC
	86NarnG7C900qdp/MnMubnAZUxEjMaPJu90laW07kUXED0nf7fDQoF+xAscCVpJzGZIyP6/KQf4
	89i/sWFBiO/VSJi1GhjuLyAPo3+WC1hqoBGf3kkasS92ww8AIjvQKHlrAx2ENhHgjAeLW8Yrru5
	Ooau+C0WXRBrjyPDTBySIpA2EvUSNjEn5TD7YKoblKUq+XEn3xMA7+kBH2cWyD83JO90S4Lxg0b
	dBCd97kD2+pRHdAsjfojmh+ODJvRpuaUE684gNFsv8KFo+/sY+8IrY3W287Pus2s2LQh92D2buS
	voqGGzdlYzVJ6KL5V1ish53WDHssnxbE4CMQw5sVhLPQfLe0uVPsBm5UAVE76UhSheH64Oc0i6x
	5kI/wDSPus1TmCYaMaUORxsPy5s7Q==
X-Received: by 2002:a05:6102:4bca:b0:7c3:8150:83e7 with SMTP id
 ada2fe7eead31-7d2a154169emr1074240137.9.1793953709418; Fri, 06 Nov 2026
 00:28:29 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-0-dca1f6ed29a8@gmail.com>
 <20261105-submit-sunxi-nand-vendor-oob-layout-v1-v10-20-dca1f6ed29a8@gmail.com>
 <20261106-crystal-flat-caracara-ac1b3c@quoll>
In-Reply-To: <20261106-crystal-flat-caracara-ac1b3c@quoll>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 6 Nov 2026 01:28:16 -0700
X-Gm-Features: AclHuK97Q_fmR3tCSb11vsNOkfJ9UktWDyo2C1YoKfEXjUnSy-Rv88kHCKF-O1Y
Message-ID: <CADvTj4rYG01pNxZS3FAKzHw9yOO79W-zMdBzaXvV_hrMs+sp2A@mail.gmail.com>
Subject: Re: [PATCH v10 20/26] dt-bindings: mtd: sunxi: require the H616 AHB reset
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Richard Genoud <richard.genoud@bootlin.com>, 
	Boris Brezillon <bbrezillon@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, 
	Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_002831_122481_8D698686 
X-CRM114-Status: GOOD (  12.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgNiwgMjAyNiBhdCAxOjE54oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDA1LCAyMDI2IGF0IDExOjU1OjM2
QU0gLTA3MDAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+ID4gVGhlIEg2MTYgTkFORCBjb250cm9s
bGVyIG5lZWRzIGl0cyBBSEIgcmVzZXQgdG8gc3RvcCBpbnRlcm5hbCBETUEgYW5kCj4KPiBTbyB3
YXMgdGhlIGRldmljZSB3b3JraW5nIG9yIG5vdD8gQmUgZXhwbGljaXQsIGJlY2F1c2UgdGhpcyBp
cyBhbiBBQkkKPiBicmVhay4KCk5vcm1hbCBOQU5EIHJlYWRzIGFuZCB3cml0ZXMgd29ya2VkLiBU
aGUgZmFpbHVyZSB3YXMgaW4gcmVjb3ZlcnkgYWZ0ZXIKYWJvcnRpbmcgYW4gYWN0aXZlIGludGVy
bmFsIERNQSB0cmFuc2ZlcjogdGhlIGNvbnRyb2xsZXIncyBzb2Z0IHJlc2V0CmNvdWxkIGxlYXZl
IHRoZSBmaXJzdCBzdWJzZXF1ZW50IHJlYWQgZGlzcGxhY2VkLCBzb21ldGltZXMgd2l0aG91dCBh
bgpFQ0MgZXJyb3IuIEkgcmVwcm9kdWNlZCB0aGlzIHRocm91Z2ggZmF1bHQgaW5qZWN0aW9uLCBu
b3Qgb3JkaW5hcnkgSS9PLgoKPgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
