Return-Path: <SRS0=9fF3=LE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC768C47094
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:22:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64B5060231
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Jun 2021 15:22:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64B5060231
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uuSG5Dn54Zn0xNU5vDeKjkfBfsYcg0Vc7dRk183YBg4=; b=y6GvVo7NMGvWi0fp1kLJst6LIw
	+Q1FCbi3U9Y50S+vMo+LPhi2TFzUmbZDC/zxp2hXYZS0RYM5cJdCXDwXf7/TCAl24yWWzf1StSSlT
	0FBPjBKvrtv3kKE3YvBZiZaXnFNR/q0rZ3p18lxGD7/ztgns2iWOfYZuulN8o+pAfJA/dZ+dONE+4
	wJyZiKcY8xFO3GUjgWhAygk74Q3ZG0+x1KxD8SKiLmnN8FUW1k8g3pa5E8MwVASYCMojbRxLBr92x
	D7iw96gm5ca91Poq6GJRS84QCongFQUzAn8vVPwiD4+haLvmix/8PomQ3tL8T/5kIYLHx+RnfT8N/
	ep4PMmcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrMVW-001LCV-I9; Thu, 10 Jun 2021 15:22:10 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrMVI-001LAJ-Uh
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 15:21:58 +0000
Received: from mail-wm1-f69.google.com ([209.85.128.69])
 by youngberry.canonical.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <krzysztof.kozlowski@canonical.com>)
 id 1lrMVH-000726-5C
 for linux-mtd@lists.infradead.org; Thu, 10 Jun 2021 15:21:55 +0000
Received: by mail-wm1-f69.google.com with SMTP id
 v20-20020a05600c2154b029019a6368bfe4so3121871wml.2
 for <linux-mtd@lists.infradead.org>; Thu, 10 Jun 2021 08:21:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EWTjDquQxTbWQL7tao6uaX3QOuXXhjaN5XNi3DDASoE=;
 b=tDCbikJi8aHpU/Kl46qU31RFkbZOynF5yCDRGP9F5EyYY3vq53BYUNPLS0/Zz2sAvQ
 qUv63ArTtZOZ6Xu4725LHt3R/jDh+ou2dA8eOICyAbK6dKWxx4mRhVC6YjtG96XsfrR+
 XigzXuTlsFQ9MWCbEBj9/iNZ1mXsrtt7pGwJxI53fNgIi/PPkMrypejQCP7wO6WrFr6/
 ra3Mj/ktBzO2DmUEkzIoGAOtsdHGXKH+ATjKa66okWmHOHkrb8O2zTLsEj8XOUc+gSfY
 ZG6SJmL6JfTiidgZnU52KvRbMVtLFNYP/Z99mFn70sc3KYKWUN8WD3x4mEODy8un3mVr
 SeNg==
X-Gm-Message-State: AOAM531QTrGktjknefc2J0EgW+ucT3MpxmI+YhMX4IfFSVlU3NN59js0
 qmJcHIpBjP2MD6ML2TyVRndfKPQy+SuvbC8E6gyRPBJjvaczknpPd3/nAUYw+SqnZm5PQnpgqxm
 8wkWfWsyZ9Ri8w+Rrg3Sr4bnm8Hha6f6ynMBIilbKeys=
X-Received: by 2002:adf:f94c:: with SMTP id q12mr5943521wrr.417.1623338514782; 
 Thu, 10 Jun 2021 08:21:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJykUgbl4Jm24V1lZxkiY74VTRt613BlK2Ms3DFn4TvvhbYNYSqz3rV2y9063jE43MgGZjez1w==
X-Received: by 2002:adf:f94c:: with SMTP id q12mr5943499wrr.417.1623338514584; 
 Thu, 10 Jun 2021 08:21:54 -0700 (PDT)
Received: from [192.168.1.115] (xdsl-188-155-177-222.adslplus.ch.
 [188.155.177.222])
 by smtp.gmail.com with ESMTPSA id l13sm4200303wrz.34.2021.06.10.08.21.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Jun 2021 08:21:52 -0700 (PDT)
Subject: Re: [PATCH v23 00/18] ARM Primecell PL35x support
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Cc: Michal Simek <monstr@monstr.eu>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Amit Kumar Mahapatra <akumarma@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 helmut.grohne@intenta.de, Srinivas Goud <sgoud@xilinx.com>,
 Siva Durga Prasad Paladugu <sivadur@xilinx.com>
References: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <5639e973-c5a0-abbc-6a9d-212d33dd28bf@canonical.com>
Date: Thu, 10 Jun 2021 17:21:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610082040.2075611-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210610_082157_020327_58853122 
X-CRM114-Status: GOOD (  15.77  )
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

T24gMTAvMDYvMjAyMSAxMDoyMCwgTWlxdWVsIFJheW5hbCB3cm90ZToKPiBIZWxsbywKPiAKPiBJ
IGFtIHRha2luZyBvdmVyIE5hZ2EncyBzZXJpZXMsIGhlcmUgYXJlIHRoZSBtYWpvciBjaGFuZ2Vz
Ogo+ICogQ2xlYW5pbmcgb2YgdGhlIFNNQyBidXMgYmluZGluZyBmaWxlIChhbmQgeWFtbCBjb252
ZXJzaW9uKQo+ICogU3VwZXJmaWNpYWwgY2xlYW5pbmcgYW5kIGdyZWF0IHNpbXBsaWZpY2F0aW9u
IG9mIHRoZSBTTUMgYnVzIGRyaXZlcgo+ICogQWRkaXRpb24gb2YgYSB5YW1sIGZpbGUgZGVzY3Jp
YmluZyB0aGUgTkFORCBjb250cm9sbGVyCj4gKiBGdWxsIHJld29yayBvZiB0aGUgTkFORCBjb250
cm9sbGVyIGRyaXZlci4gSkZGUzIgYW5kIFVCSUZTIG5vdCB0ZXN0ZWQKPiAgIHlldCwgb25seSBi
YXJlIHRlc3QgdG9vbHMgaGF2ZSBiZWVuIHVzZWQgdG8gcHJvb3ZlIGJhc2ljIGNvcnJlY3RuZXNz
Cj4gICBvZiB0aGUgaGVscGVycy4KPiAqIEFkZGl0aW9uIG9mIGEgY291cGxlIG9mIE1BSU5UQUlO
RVJTIGVudHJpZXMuCj4gCj4gQSBHaXRodWIgYnJhbmNoIG5hbWVkIHBsMzUzIGlzIGF2YWlsYWJs
ZSBvbiBteSByZXBvc2l0b3J5Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9taXF1ZWxyYXluYWwvbGlu
dXgvCj4gCj4gVGhhbmtzLAo+IE1pcXXDqGwKPiAKPiBDaGFuZ2VzIGluIHYyMzoKPiAtIENvbGxl
Y3RlZCBOYWdhIEFja2VkLWJ5J3MuCj4gLSBVc2VkIGNvbnN0IGluc3RlYWQgb2Ygc2luZ2xlIGVu
dW0gZW50cmllcyBpbiB0aGUgYmluZGluZ3MuCj4gLSBEcm9wcGVkIHRoZSBhZGRyZXNzLWNlbGxz
L3NpemUtY2VsbHMgc3VwZXJmbHVvdXMgZGVmaW5pdGlvbnMgb3V0IG9mCj4gICB0aGUgTkFORCBj
b250cm9sbGVyIGJpbmRpbmcuCj4gLSBFbmhhbmNlZCB0aGUgU01DIHJlZyBwcm9wZXJ0eSBkZXNj
cmlwdGlvbiB0byBtZW50aW9uIHRoYXQgdGhlIHZhcmlvdXMKPiAgIENTIGFyZSBkZXNjcmliZWQg
aW4gdGhlIHJhbmdlcyBwcm9wZXJ0eS4KPiAtIEZpeGVkIHRoZSBTTUMgY2hpbGQgbm9kZXMgcmVn
ZXggdG8gbWF0Y2ggUm9iJ3MgcmVxdWlyZW1lbnRzLgo+IAoKSSdsbCBhcHBseSB0aGUgbWVtb3J5
IHBhdGNoZXMgaGVyZSAtIGR0LWJpbmRpbmdzIHdoaWNoIGhhcyBSb2IncyBhY2sgYW5kCmRyaXZl
ciBjaGFuZ2VzLiBJdCdzIGdldHRpbmcgdG9vIGxhdGUgaW4gdGhlIGN5Y2xlIGFuZCBzb29uIGFy
bS1zb2MKd29uJ3QgYWNjZXB0IHN1Y2ggYmlnIHBhdGNoc2V0LgoKCkJlc3QgcmVnYXJkcywKS3J6
eXN6dG9mCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
