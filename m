Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60B87C87FD2
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Aug 2025 07:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3kL1XNOHW0Z/VdnAP5UJepX3JC496oowk/cAFbYEnIY=; b=QJuy9WKvN3QMHY
	GGGViXfcQn7OxtbojDmDg/E1nqUzDgO3wu5WhFOIsAVbRDzf3qbSewJvxTclgr/9JrSzBNPIUT//j
	oT6+8Dt+ySUYPJIitiMF6JrD7aO41h2OplIlegDwEdrEjID6kOJtX66+AOD7VlcUScEagGAP+hNu8
	78/4/guqYH7G89nmJxbCH9hImhWyAT5QWXMJykyJy/dRZr+l9PaaPrSeF3cFlgzkaPzwwp7PnYqg3
	UCZhMu+m8Jebr6WMmnbzyytYrXrRBUmBmP59o+zIBNbF61gP3EPZoRh4Iq1c2ImJkntrk1dJ9BVML
	rpcV0Vu8mGl6Dw5DwC0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNBG-00000006jrc-2zqW;
	Mon, 11 Aug 2025 07:42:54 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNAm-00000006jpI-1zt1
	for linux-mtd@lists.infradead.org;
	Mon, 11 Aug 2025 07:42:25 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso7323774a12.1
        for <linux-mtd@lists.infradead.org>; Mon, 11 Aug 2025 00:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754898142; x=1755502942; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8BVFXTwveELKbs4OwD70dbHLgAP1n/Ksj561GHwMkQ=;
        b=QpU6Css/LipRs8x7Vz7IBq/Np7KWFaBeXweufHp4SmKePUHtS7CtJ+kSSxS65FyxjD
         mzCVA5/ANDhHZt+JD4UPerxttIFdP1gcKISqTNhyHrxe5uaQts863mjOi0i81ZYwjPO0
         hhqgLqIDAm4XVPNAUgS/pDUPhAXXuj4kvPVciF400bSSySsQYbcbcShg1aHNk5kPXIGn
         ufuaq0SRqT48+/X1CfUXYhdK40jeMHmw+BLGZl2aBvfVUWTuDzAe4trX9qnXMLgKFaNq
         6txAXX+jH8se09V3yIAGOUNwZ1mdMcs6Zuw4t9B59HJgUMQno6Af080+aysuupRtnGET
         dynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898142; x=1755502942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8BVFXTwveELKbs4OwD70dbHLgAP1n/Ksj561GHwMkQ=;
        b=o7QX41lkr5M8O6Alp8dKsndZTMcGYkj6rCSJIeoFuTJmw2OmCi7O5mneJvXgUQ5/es
         cHAG1vj1I42QI2HrDowy8uViFoPCTA9/qcIG147Vj0bV7+q8BXesBBvX9Y+vB0FS56Ut
         CrSgPIOOOrMkfB+Cjtssn8J+EiztseOTsFU+C9ZCQMYZnblcebUrph+jdkSQa+ho67Iz
         TQ9AoN3aDN7te8GW3XQFEwSJU06NWu1WKPs+kHtT+WR+WS4Vw2A8lVzZ6AvoPPvYBFfc
         GdbG+cA444MYLmM3wZ1b8qaAZsVGtYOuS1EH3grWWuK/4nGxdBsPtSa6KCt/oKUk7ssG
         9Fgw==
X-Forwarded-Encrypted: i=1; AJvYcCVxgrXweizOID0jR/4TRQrlA4fWzFm8BkFDXxNXMR6UU/2Thd7EksNviThtYo9yjCD4gTvRRc++Zd0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxmF7UgMnXxKyMIEgSDeazARTNrK0ts88eGLEW9+XWT0Dfo4wIK
	CGG6+PihXwrtJYHJXNhF1fl2mgxrLQrSHtUCGhFyXOMepaeOQ4cTYSprGo6Kmdpf+qVV5NhFNJd
	vsitvXkgfTV8l9WoQwPtupf/w5v0BF9c=
X-Gm-Gg: ASbGncv2SsbbIZgfl6M7oBWS3yErdvUUTb20hUAGzSWgR7aZ7Am07wJ+2gGHXO3gRBn
	3IhkqLRVlzWlMg8nOvVrcFHE+Nk2bhei633mn+vusLDIvgQFYeMfCi8viM/XX7geLd+FJufw6S8
	QoI7OtYnt/YDpt9y4ILUD6WxplDW54TnbTRwvmIuT0sKHIYvXk9/8iD9BglMz2bH+k6QhnmlvfB
	Y90tOoF4W/jOubhqlk=
X-Google-Smtp-Source: AGHT+IEkjOj3UKdq5Lw70VWjYIWx4DN1XxZJ/fxcyup/4G5G3izgAHkxlV/d6oXutNrOUGpyT9L56you5OmTyGhnpps=
X-Received: by 2002:a17:907:6d26:b0:ae3:60fb:1b3b with SMTP id
 a640c23a62f3a-af9c654451dmr1188592466b.58.1754898142186; Mon, 11 Aug 2025
 00:42:22 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1754890670.git.zhoubinbin@loongson.cn> <a6b216e6726edc00a910ba543ef8f7a9195b94f7.1754890670.git.zhoubinbin@loongson.cn>
 <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org>
In-Reply-To: <208c1e34-85b4-47d7-a4d3-8b8b7f2caa84@kernel.org>
From: Binbin Zhou <zhoubb.aaron@gmail.com>
Date: Mon, 11 Aug 2025 15:42:09 +0800
X-Gm-Features: Ac12FXykFn-VkPb4s7ncj5ZNyjP62ENy5djpOE4M8jd15rPFnSJRHeLczU_S9rk
Message-ID: <CAMpQs4+OcC_jMvQVc+u9ue9HeBEPcbzWORC0rWkXhj3y90fvSQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] dt-bindings: mtd: loongson,ls1b-nand-controller:
 Document the Loongson-2K0500 NAND controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Huacai Chen <chenhuacai@loongson.cn>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Huacai Chen <chenhuacai@kernel.org>, Xuerui Wang <kernel@xen0n.name>, 
	loongarch@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-mtd@lists.infradead.org, "Rob Herring (Arm)" <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_004224_521167_81B76F24 
X-CRM114-Status: GOOD (  11.17  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgS3J6eXN6dG9mOgoKT24gTW9uLCBBdWcgMTEsIDIwMjUgYXQgMzozMuKAr1BNIEtyenlzenRv
ZiBLb3psb3dza2kgPGtyemtAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiAxMS8wOC8yMDI1IDA4
OjAzLCBCaW5iaW4gWmhvdSB3cm90ZToKPiA+IEFkZCBuZXcgY29tcGF0aWJsZSBmb3IgdGhlIExv
b25nc29uLTJLIE5BTkQgY29udHJvbGxlciB1c2VkIGZvcgo+ID4gTG9vbmdzb24tMkswNTAwIFNv
Qy4KPiA+Cj4gPiBBY2tlZC1ieTogIlJvYiBIZXJyaW5nIChBcm0pIiA8cm9iaEBrZXJuZWwub3Jn
Pgo+Cj4KPiBXaHkgZG8geW91IGFkZCBxdW90ZXM/CgpFbW0uLi4KU29ycnksIEkgZGlkbid0IG5v
dGljZSB0aGF0LgpJIHJlYWNxdWlyZWQgdGhlIFYxIHBhdGNoc2V0IHVzaW5nIOKAnGI0IGFtIHh4
eOKAnSB0byBhdm9pZCBtYW51YWxseQphZGRpbmcgdGFncy4gSSBiZWxpZXZlIGl0IG1heSBiZSBj
YXVzZWQgYnkgdGhlIGBiNGAgY29tbWFuZC4KCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9m
CgotLQpUaGFua3MuCkJpbmJpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
