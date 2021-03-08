Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28B9C433DB
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:46:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51EBC650AE
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 09:46:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51EBC650AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=S8Do4lFp7qqA1ueLcsMSS6H0WU89Qcs/Wka9i+zgGLo=; b=XsU7Of6BfeMpSq197a09E/OK1
	PW4OHTX8dyJoMS9UYqQD4GUcJ8uyTkixxt2h1m0cywhQ8OofR6PZLkklhkVLdU4WaXbnBI1Eu6ADq
	D6oLamnilJANQwjGKRdvLEL5BLmOW3atGItOCgVJiZeeRBvc3yn89014lz+HOVoA6FqGOXtP+hAva
	McfiCDOXss8QXovn5m6VxOoi5qInQKYtQnNhC1bUnKvu4SMvTjNjm52Est3rxJ6PG2d0hUTTw00I5
	WzLG4xmz0t3vy21Pf0u1GoafSEUeYoM0AOrQ3IrKQ4qX+SFy4oZcjpyVcNhHfRlwV3WtBxe60J/Bh
	gKl3OA21w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJCSK-00GFUL-H1; Mon, 08 Mar 2021 09:45:40 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJCSG-00GFSY-5P
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 09:45:37 +0000
Received: by mail-lf1-x134.google.com with SMTP id m22so19988800lfg.5
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 01:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=PkMg8HyUAo2EgfDsqfPoEike2P+I5ZeqjTnpmKUfESg=;
 b=ed8P7aci3K9782uqe3hPoxIbeFHdhSDx80uC8ROz+WNEc5VEuLW7sN9At4il2YKqfW
 UBl8E2zBYghqkMrjjwBDj4ssNsQn0xnVSOmQGx5AHtpCN1Q+kKZO84aYlnd+yb5A6BTn
 dAnI4wEGzvvP0R74NHGvaMtPqdLHW2fLGiQGh78ssM4ACVXtSgvw8x4Pba7p4LmpplyW
 xS4yqQWSzEoSAm6J0o5nAE00KkGG57X/4zwlE9Bfb6YEqPFHwlKgEbXmC4UEwJqxA0q0
 PRzoxz5Nu+FSSVzkFRrYylvqb1QrqS64ojpHm6mgQT5JPIq/W+cG1IE1JGwEX28dsW5B
 JiVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=PkMg8HyUAo2EgfDsqfPoEike2P+I5ZeqjTnpmKUfESg=;
 b=cr5DedWUZ5fQylbdhor9JFN+rLf+bfiKffgae+LQC95FYLe/RUPmNearwSBXDiJSiH
 7P4S8qcn0GG93LFCyBRExCwohEKot25CM54YKDnF9R8CaD9pv2MHzh4WxM+w3kUi8MvF
 ZcOhR1JcaSJhUZGmPbGBlWIR4qnAg+F2nARDHqMdM53uPdoeDBMHCgdw513kKY/7njgK
 H17UBpTRmqlrB90pA9Nn1tLtLGskFfy3zbAJBdWvrJUnc3g0OintLjkWB3ab6mQ2uz/F
 lpFIFsRNoHd5ivajNFU1hsfliQ7s18kY3aacT5BXyq0t9JiRZhwFrg/9fv3280ueep5n
 kH4w==
X-Gm-Message-State: AOAM5315Uq1oLNwXjvB5myaFQst3hV57zQ04ffxYZXrBdtkafVv5VSI8
 bNlCy2Z29pD5BUo7N1/ygeg=
X-Google-Smtp-Source: ABdhPJxlxOjZeFM6CoJXTEgzmcD+UXez6J8LL5sVrVHswDB2SOc1p3MkeVgimlJiugQiZ6XPfyF7Vg==
X-Received: by 2002:a05:6512:2356:: with SMTP id
 p22mr13368252lfu.3.1615196734896; 
 Mon, 08 Mar 2021 01:45:34 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id h17sm1297510lfc.289.2021.03.08.01.45.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 01:45:34 -0800 (PST)
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Document use of nvmem-partitions
 compatible
To: Rob Herring <robh@kernel.org>
Cc: Ansuel Smith <ansuelsmth@gmail.com>, Richard Weinberger <richard@nod.at>, 
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-4-ansuelsmth@gmail.com>
 <1cf374f1-09d5-9fa9-9b0d-d8079f2f6fbc@gmail.com>
 <20210305222300.GA718014@robh.at.kernel.org>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <9167d2be-067e-4ad3-9c8b-28bb549187aa@gmail.com>
Date: Mon, 8 Mar 2021 10:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210305222300.GA718014@robh.at.kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_094536_274118_1772E118 
X-CRM114-Status: GOOD (  14.99  )
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

T24gMDUuMDMuMjAyMSAyMzoyMywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gV2VkLCBNYXIgMDMs
IDIwMjEgYXQgMTE6MDE6NTVBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3RlOgo+PiBbUm9i
OiBwbGVhc2UgYWR2aXNlXQo+Pgo+PiBPbiAxNi4wMi4yMDIxIDIyOjI2LCBBbnN1ZWwgU21pdGgg
d3JvdGU6Cj4+PiBEb2N1bWVudCBudm1lbS1wYXJ0aXRpb25zIGNvbXBhdGlibGUgdXNlZCB0byB0
cmVhdCBtdGQgcGFydGl0aW9ucyBhcyBhCj4+PiBudm1lbSBwcm92aWRlci4KPj4KPj4gVW50aWwg
bm93IHdlIHdlcmUgdXNpbmcgImNvbXBhdGlibGUiIHN0cmluZyBpbiBwYXJ0aXRpb24gbm9kZSBv
bmx5IGZvcgo+PiBwYXJzZXJzIChsb29raW5nIGZvciBzdWJwYXJ0aXRpb25zKS4gV2UgbmVlZCB0
byB0aGluayBpZiB0aGlzIGNoYW5nZSBjYW4KPj4gYnJlYWsgYW55dGhpbmcgZnJvbSBEVCAvIExp
bnV4IHBlcnNwZWN0aXZlLgo+Pgo+PiBDb21wYXRpYmxlIHN0cmluZ3Mgc2hvdWxkIGJlIHVuaXF1
ZSwgc28gdGhlcmUgaXMgbm8gcmlzayBvZiBjb25mbGljdAo+PiBiZXR3ZWVuIE5WTUVNIGFuZCBw
YXJzZXJzLgo+Pgo+PiBOb3c6IGNhbiB3ZSBldmVyIG5lZWQgbXRkIHBhcnRpdGlvbiB0bzoKPj4g
MS4gQ29udGFpbiBzdWJwYXJ0aXRpb25zCj4+IDIuIFByb3ZpZGUgTlZNRU0KPj4gYXQgdGhlIHNh
bWUgdGltZT8KPj4KPj4gTGV0J3Mgc2F5Ogo+Pgo+PiBwYXJ0aXRpb25AMCB7Cj4+IAljb21wYXRp
YmxlID0gInZlbmRvcixkeW5hbWljLWZpcm13YXJlLXBhcnRpdGlvbnMiLCAibnZtZW0tcGFydGl0
aW9ucyI7Cj4gCj4gSSB0aGluayB5b3UnZCB3YW50IHRoZSAidmVuZG9yLGR5bmFtaWMtZmlybXdh
cmUtcGFydGl0aW9ucyIgcGFyc2VyL2NvZGUKPiB0byBzZXJ2ZSB1cCBhbnkgbnZtZW0gcmVnaW9u
cy4gV2hldGhlciB5b3UgaGF2ZSBhIGZhbGxiYWNrIGhlcmUgZGVwZW5kcwo+IGlmIGFuIE9TIGNv
dWxkIG1ha2UgdXNlIG9mIHRoZSByZWdpb25zIGtub3dpbmcgbm90aGluZyBhYm91dAo+ICJ2ZW5k
b3IsZHluYW1pYy1maXJtd2FyZS1wYXJ0aXRpb25zIi4KClBlcmZlY3QhIEkgZGlkbid0IHRoaW5r
IHRoYXQgZHJpdmVyIGhhbmRsaW5nCiJ2ZW5kb3IsZHluYW1pYy1maXJtd2FyZS1wYXJ0aXRpb25z
IiBtYXkgYWxzbyB0YWtlIGNhcmUgb2YgTlZNRU0uCgpUaGFuayB5b3UuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
