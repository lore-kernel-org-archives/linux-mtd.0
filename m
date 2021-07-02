Return-Path: <SRS0=pn6g=L2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06267C11F67
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 01:56:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD02E61402
	for <linux-mtd@archiver.kernel.org>; Fri,  2 Jul 2021 01:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD02E61402
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:Subject:
	From:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FJwQe1szrc5IOkqgl7NgQGyPPXPDZxsKpEmc8RSu2w=; b=e4damQTZ2xmTwEBB1cgVx8miLt
	ewGTshtiv9W1o68eOkL8qWbOjdegpBZ7TNb0EMCdrskghQ7Og9Q/zaRh7Hk2KP473pBAfG3eaZ9FC
	8TbQoQusyLgq8mmbeQT+puJ6UK6/smMmoRue0Gsqe4bhVVD0cIS2R5kqIlX/JJfCXIA8qaTXh/arQ
	u07iiuW+BF13FSeAs/W2Bu5j8AzYdSrXvmyxmReN0iYo/AirvzXBwEMYknUTnMSdhvBQWXJyyfQN1
	JSuXkAOyt0Uw41ewzZwY8mAt2vXzT4EChTOECrk66rqHSslDVgBToN/PLf2pL8TJH9TcSWoF9so6q
	Y2/cJCCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lz8Og-001n36-ME; Fri, 02 Jul 2021 01:55:14 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lz8Oc-001n2j-Pg
 for linux-mtd@lists.infradead.org; Fri, 02 Jul 2021 01:55:12 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id
 v3-20020a4ac9030000b029024c9d0bff49so2111896ooq.0
 for <linux-mtd@lists.infradead.org>; Thu, 01 Jul 2021 18:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WaoPoeTCrAC2vIfpSCgYtHuCtmyF+Wrtr0uyihf3GIs=;
 b=WwDH+tynJJgVTcXCwrORn3XIs6Y3FBPejoM2o3hmZ1icCnWKFWUUZo93K9jeso/iVm
 hCGBnade7YaC3IhopOHBTgaEmclSIXcVWR4R7GveF8NPU5zNO9JhyqActjyxzXPKRKfJ
 qLXuBR26kwBQNoNybjgmzLRO3JOX+TVK6LLWnCVY825WBy4SGZRtGTtALkePPaUPHa3P
 7E86Kh2w+v8Gbhlmm/lbnOxMtvnduT+oTVETEOj/QpjoUkuZztQ4XcKsnWFxMKkCEZB6
 PLMqObKMMQLd/rYlyBdFFaxbb2JJxmKEA34GMgld0V3DgIGoY4JzvyBYP96cZGfeDmAi
 s70w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WaoPoeTCrAC2vIfpSCgYtHuCtmyF+Wrtr0uyihf3GIs=;
 b=OyPW1VnGNAVexEgleXJyqsWhbUWYYSydoSRC3CVjsBKmAfVwGYVojZfHjdFCu711mb
 01tbzj/nSho/xEBIbzrMRyUKBPp22k0QQdrnFsRNeCx0JDxZp9hP0XmKH0RAj4KOiqz4
 RMdW12rhr9XMNhwjS55BvY8aCgiySvjRqCg9KBLUb0IOLbZDOesMI256INyXAHZ+6bfz
 Bnum2wjIJaZ+hZ+J8OTln/D345X+BmcMw77FXsJYCESU1YcPF7tL2TZtZJ70XutMgaoE
 rFxau7wAseXWe6nP7psetOwAT4sxMhvmvGOLv6xDv9BLSw4QbYCnDEm9GiA1A+5dNoIc
 +Yzw==
X-Gm-Message-State: AOAM532avz6H6QF+LEurqUeZU/ROrEpJ+2zsBBMy/loIKklcDlJW2mH4
 FGxVwampzutDbdFW2ZhoOkQ=
X-Google-Smtp-Source: ABdhPJxcRnLem9fQUbYpz5NizuRSnByRt59qSD4DN6QnvDJVfXCkpZRqCZ3uV99e96l8Rt4CtgUKPg==
X-Received: by 2002:a05:6820:168:: with SMTP id
 k8mr2311001ood.76.1625190909863; 
 Thu, 01 Jul 2021 18:55:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 o17sm370466oie.56.2021.07.01.18.55.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Jul 2021 18:55:09 -0700 (PDT)
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20210424110608.15748-1-michael@walle.cc>
 <20210424110608.15748-6-michael@walle.cc>
 <20210701213420.GA1131789@roeck-us.net>
 <f48661d2d54b37db395fb73af8b52359@walle.cc>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH v2 5/5] mtd: core: add OTP nvmem provider support
Message-ID: <e89da7a0-2e46-349c-9b25-f0b555a72b46@roeck-us.net>
Date: Thu, 1 Jul 2021 18:55:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <f48661d2d54b37db395fb73af8b52359@walle.cc>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_185510_898427_A9C05F35 
X-CRM114-Status: GOOD (  27.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNy8xLzIxIDM6MTAgUE0sIE1pY2hhZWwgV2FsbGUgd3JvdGU6Cj4gSGkgR3VlbnRlciwKPiAK
PiBBbSAyMDIxLTA3LTAxIDIzOjM0LCBzY2hyaWViIEd1ZW50ZXIgUm9lY2s6Cj4+IEhpLAo+Pgo+
PiBPbiBTYXQsIEFwciAyNCwgMjAyMSBhdCAwMTowNjowOFBNICswMjAwLCBNaWNoYWVsIFdhbGxl
IHdyb3RlOgo+Pj4gRmxhc2ggT1RQIHJlZ2lvbnMgY2FuIGFscmVhZHkgYmUgcmVhZCB2aWEgdXNl
ciBzcGFjZS4gU29tZSBib2FyZHMgaGF2ZQo+Pj4gdGhlaXIgc2VyaWFsIG51bWJlciBvciBNQUMg
YWRkcmVzc2VzIHN0b3JlZCBpbiB0aGUgT1RQIHJlZ2lvbnMuIEFkZAo+Pj4gc3VwcG9ydCBmb3Ig
dGhlbSBiZWluZyBhIChyZWFkLW9ubHkpIG52bWVtIHByb3ZpZGVyLgo+Pj4KPj4+IFRoZSBBUEkg
dG8gcmVhZCB0aGUgT1RQIGRhdGEgaXMgYWxyZWFkeSBpbiBwbGFjZS4gSXQgZGlzdGluZ3Vpc2hl
cwo+Pj4gYmV0d2VlbiBmYWN0b3J5IGFuZCB1c2VyIE9UUCwgdGh1cyB0aGVyZSBhcmUgdXAgdG8g
dHdvIGRpZmZlcmVudAo+Pj4gcHJvdmlkZXJzLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IE1pY2hh
ZWwgV2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+Cj4+Cj4+IFRoaXMgcGF0Y2ggY2F1c2VzIGEgYm9v
dCBmYWlsdXJlIHdpdGggb25lIG9mIG15IHFlbXUgdGVzdHMuCj4+IFdpdGggdGhlIHBhdGNoIGlu
IHBsYWNlLCB0aGUgZmxhc2ggZmFpbHMgdG8gaW5zdGFudGlhdGUuCj4+Cj4+IFvCoMKgwqAgMS4x
NTY1NzhdIENyZWF0aW5nIDMgTVREIHBhcnRpdGlvbnMgb24gInBoeXNtYXAtZmxhc2giOgo+PiBb
wqDCoMKgIDEuMTU3MTkyXSAweDAwMDAwMDAwMDAwMC0weDAwMDAwMDA0MDAwMCA6ICJVLUJvb3Qg
Qm9vdGxvYWRlciIKPj4gW8KgwqDCoCAxLjE4NDYzMl0gMHgwMDAwMDAwNDAwMDAtMHgwMDAwMDAw
NjAwMDAgOiAiVS1Cb290IEVudmlyb25tZW50Igo+PiBbwqDCoMKgIDEuMjAxNzY3XSAweDAwMDAw
MDA2MDAwMC0weDAwMDAwMDgwMDAwMCA6ICJGbGFzaCIKPj4gW8KgwqDCoCAxLjIyMjMyMF0gRGVs
ZXRpbmcgTVREIHBhcnRpdGlvbnMgb24gInBoeXNtYXAtZmxhc2giOgo+PiBbwqDCoMKgIDEuMjIy
NzQ0XSBEZWxldGluZyBVLUJvb3QgQm9vdGxvYWRlciBNVEQgcGFydGl0aW9uCj4+IFvCoMKgwqAg
MS4zMDM1OTddIERlbGV0aW5nIFUtQm9vdCBFbnZpcm9ubWVudCBNVEQgcGFydGl0aW9uCj4+IFvC
oMKgwqAgMS4zNjg3NTFdIERlbGV0aW5nIEZsYXNoIE1URCBwYXJ0aXRpb24KPj4gW8KgwqDCoCAx
LjQzMDYxOV0gcGh5c21hcC1mbGFzaDogcHJvYmUgb2YgcGh5c21hcC1mbGFzaCBmYWlsZWQgd2l0
aCBlcnJvciAtNjEKPj4KPj4gLTYxIGlzIC1FTk9EQVRBLgo+Pgo+PiBPdGhlciBib290IHRlc3Rz
IHdpdGggZGlmZmVyZW50IGZsYXNoIGNoaXBzIGNhbiBzdGlsbCBib290Lgo+PiBSZXZlcnRpbmcg
dGhpcyBwYXRjaCAoYXMgd2VsbCBhcyB0aGUgZm9sbG93LXVwIHBhdGNoZXMpIGZpeGVzCj4+IHRo
ZSBwcm9ibGVtLgo+Pgo+PiBJIGRvIG5vdCBrbm93IGlmIHRoaXMgaXMgYSBwcm9ibGVtIHdpdGgg
cWVtdSBvciBhIHByb2JsZW0gd2l0aCB0aGUKPj4gcGF0Y2gsIGJ1dCwgYXMgSSBtZW50aW9uZWQs
IG90aGVyIGZsYXNoIGNoaXBzIGRvIHN0aWxsIGluc3RhbnRpYXRlLgo+Pgo+PiBEbyB5b3UgaGF2
ZSBhbiBpZGVhIHdoYXQgdG8gbG9vayBmb3Igd2hlbiBJIHRyeSB0byB0cmFjayBkb3duIHRoZSBw
cm9ibGVtID8KPiAKPiBJJ2Qgc3RhcnQgYnkgbG9va2luZyBhdCB0aGUgcmV0dXJuIGNvZGUgb2Yg
bXRkX290cF9zaXplKCkgYmVjYXVzZSB0aGF0Cj4gc2hvdWxkIGJlIHRoZSBvbmx5IGZ1bmN0aW9u
IHdoaWNoIGNvbW11bmljYXRlcyB3aXRoIHRoZSBmbGFzaCBhdCBwcm9iZQo+IHRpbWUuCj4gCj4g
Q2FuIHlvdSBzaGFyZSBob3cgdG8gcmVwcm9kdWNlIHRoYXQgcHJvYmxlbT8gTGlrZSB0aGUgcWVt
dSBjb21tYW5kbGluZQo+IGFuZCBpbnZvbHZlZCBpbWFnZXM/Cj4gCgpxZW11LXN5c3RlbS1hcm0g
LU0gejIgLWtlcm5lbCBhcmNoL2FybS9ib290L3pJbWFnZSAtbm8tcmVib290IFwKICAgICAtc25h
cHNob3QgLWRyaXZlIGZpbGU9L3RtcC9mbGFzaCxmb3JtYXQ9cmF3LGlmPXBmbGFzaCBcCiAgICAg
LS1hcHBlbmQgInJvb3Q9L2Rldi9tdGRibG9jazIgY29uc29sZT10dHlTMCIgXAogICAgIC1ub2dy
YXBoaWMgLW1vbml0b3IgbnVsbCAtc2VyaWFsIHN0ZGlvCgpUaGlzIGlzIHdpdGggcWVtdSB2Ni4w
IGFuZCBweGFfZGVmY29uZmlnLiBUaGUgYWN0dWFsIGZsYXNoIGltYWdlIGRvZXNuJ3QKcmVhbGx5
IG1hdHRlciAoYW4gZW1wdHkgZmlsZSB3aXRoIGEgc2l6ZSBvZiAxMDI0KjEwMjQqOCBieXRlcyBp
cyBzdWZmaWNpZW50KS4KCkRlYnVnZ2luZyBzaG93cyB0aGF0IC1FTk9EQVRBIGlzIHJlcG9ydGVk
IGJ5IGNmaV9pbnRlbGV4dF9vdHBfd2FsaygpLAp0aGFua3MgdG86CgpbICAgIDAuNzM3MjQ0XSAj
IyMjIEZlYXR1cmVTdXBwb3J0OiAweDAgTnVtUHJvdGVjdGlvbkZpZWxkczogMQoKd2hpY2ggc2Vl
bXMgdG8gc3VnZ2VzdCB0aGF0IHRoZXJlIGFyZSBpbmRlZWQgZmxhc2ggY2hpcHMgd2hpY2ggZG9u
J3Qgc3VwcG9ydApPVFAgZGF0YS4gV2l0aCB0aGlzIGluIG1pbmQsIGlzIGl0IGluZGVlZCBhcHBy
b3ByaWF0ZSB0byBkaXNhYmxlIHN1cHBvcnQgZm9yCmFsbCBmbGFzaCBjaGlwcyB3aGljaCBkb24n
dCBzdXBwb3J0IE9UUCBkYXRhID8KClRoYW5rcywKR3VlbnRlcgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
