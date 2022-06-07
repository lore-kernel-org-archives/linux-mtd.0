Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF7BC433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  7 Jun 2022 11:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2LmPg1kaQ+bn9jfKM5RvKItKg8POCl+q379PJ6YXyak=; b=RIvMAK3ioFPZRw
	oJbqtFiVHcwt1CmNHgdupQp8P9FRqcQEkjSmVuI/B+XcrL7zD92Fll9g2h5lOqB/s2XHzAXhsVAud
	3GI6CailTa5jAeUKCcxLTQbwjo6HnQ+2nl0lAvGAFjx7Ptk2feTnQIiR9aONT2DfN4JGfx2hgtYSl
	MmrL5uYiKRxRZdgOqtkyhC6EEiDLiUyGjfNuqdokMNabyglJmExM3TWy7v8sqW59+3z4s/+X2lzl5
	2kH1awcFtjSfbVMydWtHN9KOJGITyOgVzEtg3d4Watcbro5xZORMcrZgWFeI3yJlNnsh28BvoCm7D
	UJW4F2BLOLwCGHFTZS2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyX2T-006w0k-BX; Tue, 07 Jun 2022 11:06:21 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyX2Q-006vzb-Jd
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2022 11:06:20 +0000
Received: by mail-ej1-x629.google.com with SMTP id y19so34441610ejq.6
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 04:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:from:to:cc:subject:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=JYTw8qBceECAtQp7A1kdanNQp5jRY5QBdh0dwqqC9RU=;
        b=Nw5HmIulmE1vH1fMJ8FcWCnuJQHQiHH/x26C400Hk5Bf9PGo6Hw3r8UEWG1iplpkO3
         bn2h1/zeXA+zFIZm1mDr53CRhOeZBRmwk6l3fWcutnWVOBQX8QXyqimHHXhXCV5SW1D9
         xneNpq0uZNxhavrDzIyjaOlg3cRi/GIRrnD6ph4c9sc+7OaVG22cBe4ciXUj1oSePQ8H
         dTk9dRNW6OXOx83c+AUB10I/nvHOjLk6/U8Qxj2b5caJczVcORF4L2HCpp0ebje4/wKs
         EN8zGeT/km2CULPG1J7Sa/caGJwt7KFGxSaItC782x1KKRszWhdDADTmktx1IH/qarM9
         N3bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:from:to:cc:subject:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=JYTw8qBceECAtQp7A1kdanNQp5jRY5QBdh0dwqqC9RU=;
        b=0nG7YHmvTkDkpyOqTmFXKiWDoR0xkczGkRkNWZaJq1wqY2iNpVQzTPbJ4L09is2QgY
         4EQZ8fSCpKgvqzfYdGj3FJtZXDOz3ikve48ck89ybhhNsj0G5LopXLpcvWGwhaf9gRB+
         u8o9EGwbjEN0HxP1epjG1kwWhcy3Tx/xRfdQ2asHqwfVlSoXG07fge9dKn0wHrUnHfkB
         jfQ9MMbN5E9ffmIZqB1kiKyXFOdageDGHdlIO+IOPUVjIUSSeq7AzufTOW1mjaIcMINp
         WTGLQhulod3hRghVcNDGwSYiXwR8HE/cmXDneuEbpIqYhBbrB4aFWm/CC1IsOwBJfj8c
         hI8A==
X-Gm-Message-State: AOAM533rPEzvs3cQnoRo17WVd8pjmdbZLfkbE7MF8fyUsdy/6ngNNkR7
	NeZrFCMoVeG9W9r6JbZk0dI=
X-Google-Smtp-Source: ABdhPJy8xYlbSp5BuzRvztb2RbXiyhlVE5XzRRPnbXnxapSzqknqjm/tCBViCfgB25Q9EmDSXjGvQg==
X-Received: by 2002:a17:907:da3:b0:6fe:f08b:776 with SMTP id go35-20020a1709070da300b006fef08b0776mr26382420ejc.558.1654599976053;
        Tue, 07 Jun 2022 04:06:16 -0700 (PDT)
Received: from Ansuel-xps. (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.gmail.com with ESMTPSA id w21-20020aa7d295000000b0042dd482d0c4sm10115552edq.80.2022.06.07.04.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 04:06:15 -0700 (PDT)
Message-ID: <629f3127.1c69fb81.2590d.39ac@mx.google.com>
X-Google-Original-Message-ID: <Yp74rG6DVmeU+QCQ@Ansuel-xps.>
Date: Tue, 7 Jun 2022 09:05:16 +0200
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] dt-bindings: mtd: qcom_nandc: document
 qcom,boot-pages binding
References: <20220519190112.6344-1-ansuelsmth@gmail.com>
 <20220519190112.6344-3-ansuelsmth@gmail.com>
 <20220607091522.GB5410@thinkpad>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220607091522.GB5410@thinkpad>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_040618_698537_D112EC7B 
X-CRM114-Status: GOOD (  27.13  )
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

T24gVHVlLCBKdW4gMDcsIDIwMjIgYXQgMDI6NDU6MjJQTSArMDUzMCwgTWFuaXZhbm5hbiBTYWRo
YXNpdmFtIHdyb3RlOgo+IE9uIFRodSwgTWF5IDE5LCAyMDIyIGF0IDA5OjAxOjEyUE0gKzAyMDAs
IEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IERvY3VtZW50IG5ldyBxY29tLGJvb3QtcGFnZXMgYmlu
ZGluZyB1c2VkIHRvIGFwcGx5IHNwZWNpYWwKPiA+IHJlYWQvd3JpdGUgY29uZmlndXJhdGlvbiB0
byBib290IHBhZ2VzLgo+ID4gCj4gPiBRQ09NIGFwcGx5IGEgc3BlY2lhbCBjb25maWd1cmF0aW9u
IHdoZXJlIHNwYXJlIGRhdGEgaXMgbm90IHByb3RlY3RlZAo+ID4gYnkgRUNDIGZvciBzb21lIHNw
ZWNpYWwgcGFnZXMgKHVzZWQgZm9yIGJvb3QgcGFydGl0aW9uKS4gQWRkCj4gPiBEb2N1bWVudGF0
aW9uIG9uIGhvdyB0byBkZWNsYXJlIHRoZXNlIHNwZWNpYWwgcGFnZXMuCj4gPiAKPiA+IFNpZ25l
ZC1vZmYtYnk6IEFuc3VlbCBTbWl0aCA8YW5zdWVsc210aEBnbWFpbC5jb20+Cj4gPiAtLS0KPiA+
ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcWNvbSxuYW5kYy55YW1sICAgfCAyNiArKysr
KysrKysrKysrKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKykKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cWNvbSxuYW5kYy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9x
Y29tLG5hbmRjLnlhbWwKPiA+IGluZGV4IDg0YWQ3ZmYzMDEyMS4uYTU5YWU5NTI1ZjRlIDEwMDY0
NAo+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL210ZC9xY29tLG5h
bmRjLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQv
cWNvbSxuYW5kYy55YW1sCj4gPiBAQCAtMTAyLDYgKzEwMiwzMCBAQCBhbGxPZjoKPiA+ICAgICAg
ICAgICAgICAtIGNvbnN0OiByeAo+ID4gICAgICAgICAgICAgIC0gY29uc3Q6IGNtZAo+ID4gIAo+
ID4gKyAgLSBpZjoKPiA+ICsgICAgICBwcm9wZXJ0aWVzOgo+ID4gKyAgICAgICAgY29tcGF0aWJs
ZToKPiA+ICsgICAgICAgICAgY29udGFpbnM6Cj4gPiArICAgICAgICAgICAgZW51bToKPiA+ICsg
ICAgICAgICAgICAgIC0gcWNvbSxpcHE4MDZ4LW5hbmQKPiA+ICsKPiA+ICsgICAgdGhlbjoKPiA+
ICsgICAgICBwcm9wZXJ0aWVzOgo+ID4gKyAgICAgICAgcWNvbSxib290LXBhZ2VzOgo+IAo+IEV2
ZW50aG91Z2ggdGhlIHBhZ2UgbGF5b3V0IGlzIHdoYXQgbWFraW5nIHRoZSBkaWZmZXJlbmNlLCBo
ZXJlIHRoZSBib290Cj4gcGFydGl0aW9uIG9mZnNldCBhbmQgc2l6ZSBhcmUgZ2V0dGluZyBzcGVj
aWZpZWQuIFNvIGhvdyBhYm91dCwgY2hhbmdpbmcgaXQKPiB0byAicWNvbSxib290LXBhcnRpdGlv
bnMiPwo+IAo+IFRoYW5rcywKPiBNYW5pCj4KClllcCwgeW91IGFyZSBjb3JyZWN0IGFuZCB0aGUg
bmFtaW5nIGlzIGNvbmZ1c2luZy4gV2lsbCBkbyB0aGUgY2hhbmdlLgpEaWQgeW91IGNoZWNrIHRo
ZSBjb2RlIGlmIHlvdSBub3RpY2Ugc29tZXRoaW5nIHRvIGltcHJvdmUgLyBhbiBpZGVhIG9mIGEK
YmV0dGVyIGltcGxlbWVudGF0aW9uIG9yIGJldHRlciBuYW1pbmc/Ckp1c3QgdG8gc2tpcCBzZW5k
aW5nIG11bHRpcGxlIHJldmlzaW9uIHdpdGggc21hbGwgY2hhbmdlcy4KCj4gPiArICAgICAgICAg
ICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1tYXRyaXgKPiA+
ICsgICAgICAgICAgaXRlbXM6Cj4gPiArICAgICAgICAgICAgaXRlbXM6Cj4gPiArICAgICAgICAg
ICAgICAtIGRlc2NyaXB0aW9uOiBvZmZzZXQKPiA+ICsgICAgICAgICAgICAgIC0gZGVzY3JpcHRp
b246IHNpemUKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246Cj4gPiArICAgICAgICAgICAgU29t
ZSBzcGVjaWFsIHBhZ2UgdXNlZCBieSBib290IHBhcnRpdGlvbiBoYXZlIHNwYXJlIGRhdGEKPiA+
ICsgICAgICAgICAgICBub3QgcHJvdGVjdGVkIGJ5IEVDQy4gVXNlIHRoaXMgdG8gZGVjbGFyZSB0
aGVzZSBzcGVjaWFsIHBhZ2UKPiA+ICsgICAgICAgICAgICBieSBkZWZpbmluZyBmaXJzdCB0aGUg
b2Zmc2V0IGFuZCB0aGVuIHRoZSBzaXplLgo+ID4gKwo+ID4gKyAgICAgICAgICAgIEl0J3MgaW4g
dGhlIGZvcm0gb2YgPG9mZnNldDEgc2l6ZTEgb2Zmc2V0MiBzaXplMiBvZmZzZXQzIC4uLj4KPiA+
ICsKPiA+ICsgICAgICAgICAgICBSZWZlciB0byB0aGUgaXBxODA2NCBleGFtcGxlIG9uIGhvdyB0
byB1c2UgdGhpcyBzcGVjaWFsIGJpbmRpbmcuCj4gPiArCj4gPiAgcmVxdWlyZWQ6Cj4gPiAgICAt
IGNvbXBhdGlibGUKPiA+ICAgIC0gcmVnCj4gPiBAQCAtMTM1LDYgKzE1OSw4IEBAIGV4YW1wbGVz
Ogo+ID4gICAgICAgICAgbmFuZC1lY2Mtc3RyZW5ndGggPSA8ND47Cj4gPiAgICAgICAgICBuYW5k
LWJ1cy13aWR0aCA9IDw4PjsKPiA+ICAKPiA+ICsgICAgICAgIHFjb20sYm9vdC1wYWdlcyA9IDww
eDAgMHg1OGEwMDAwPjsKPiA+ICsKPiA+ICAgICAgICAgIHBhcnRpdGlvbnMgewo+ID4gICAgICAg
ICAgICBjb21wYXRpYmxlID0gImZpeGVkLXBhcnRpdGlvbnMiOwo+ID4gICAgICAgICAgICAjYWRk
cmVzcy1jZWxscyA9IDwxPjsKPiA+IC0tIAo+ID4gMi4zNC4xCj4gPiAKPiAKPiAtLSAKPiDgrq7g
rqPgrr/grrXgrqPgr43grqPgrqngr40g4K6a4K6k4K6+4K6a4K6/4K614K6u4K+NCgotLSAKCUFu
c3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
