Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72ABDC6FD1C
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Mar 2023 12:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GIAiDxGkWGZYVwo6ZQhz7ByobvUWVftavLWVyxSUZw=; b=unIleT8uT7iWmo
	iRf6v/B74/kkqdWIjAYgnQ9ryA5fD/TmhczIjCpwJ+pe8rKFGncRFdlQvoqm7ZBN8kHyxlKxFKvTG
	74x/T5SacthJkGE0dz7J1iCGI7NXzdpjR7VV5AMWff6VGvVg8i/LVBbgIiiX4nLLUNefICc1+bKDl
	ul2BLquolsVmRxSKvWhag7Be+7MDDjPGL1ylF+NrZRE/71Fw56blMT/9CnvAt+d5WTFwzRzXIhP5q
	T+VkJDXdpmPCTE4Zyi4vbQSjTVgZ7oFavSvx0P9ztP4czPbQ5V/71TWqdtpFOYe2u57+zjmo2aKQe
	SPjEYKEx9tPPlVDOJykQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKTP-001zY5-1l;
	Thu, 23 Mar 2023 12:55:19 +0000
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfKTN-001zX9-2Q
	for linux-mtd@lists.infradead.org;
	Thu, 23 Mar 2023 12:55:19 +0000
Received: by mail-yb1-xb2c.google.com with SMTP id s67so7824245ybi.5
        for <linux-mtd@lists.infradead.org>; Thu, 23 Mar 2023 05:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679576116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISNE15I6zaSxAQPnN0sxzeTcFnWMQ3qxrhuU6mm7D/g=;
        b=obbXsD6Xkj43SRB5k8Hk63Wj2lWc99tg5p3t2mW3Znfk2VnMSCR3eUFGK0kfrMwksD
         si6pMdZiJw+1YjpGX/mA241glVL/8ubNlEMZXQIaidsvyjo5i7kzwOOjCVF4C5B0HS6A
         lnRYikqPcpPBFhyydCOQZ8zKaBH+PK5d2rzjrd+w+Wz5ob6A1ljdrCODDGfEbe0oRPFe
         gBEIdHZIxmhqh+DL+9RHhnpdFt3Mu4Oz3CcfBpnlkA76LwSsDdUEJP0JXCb8jhWxCK3/
         +ttnZnZt7uUz3by6HT2CCmvyVofvwWbcg2YjjW6q+qDK/sxv16jQUP52k1C3dW4D7C9b
         W1gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679576116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ISNE15I6zaSxAQPnN0sxzeTcFnWMQ3qxrhuU6mm7D/g=;
        b=4lSMf2e/nh3hqilCC2rJwP82cl6J6XQOhr1INLRl30o5IotuwS4gCK1a5Q8OQUfN3B
         fkOL2uNVGoGB8/pB7FKJlJaoqOG/hX8nmlfgZ3k57vyHkXgdzPdaieGN0sBQu+VW5Yxu
         Jqp6gAFGz/09Z6i/uRuYr0O5a9RifY/G+nHtIGNfcNZX9La+mn8TLoH9xTLTgQzsXre+
         FN1CsgO4g1L5bT0YpGRFwHDXzsvSTSPW+Sxn4F6PVKTdx4yTIu/ikvCN+TOexeKZjWmf
         wt3CFQdMwxWW84skaXCApzPX9TWBhWR+pjqbVrpxPcVtJqBorb48LYPtBk83geflkNnv
         8oIg==
X-Gm-Message-State: AAQBX9cpF9QWDR21NHS4wVdQDqJufCwKknmHql9TO34Gw20PIWdw/bAQ
	qcHLpnZcjTStX50xDCiQNEFijlL8t1GVPQthrRo=
X-Google-Smtp-Source: AKy350ajsSH3bjPX97LUk0SQpzJRBv6W0MBm7d3pkgLTNBNI2ud97ge35PAHVbP9tprvCQnq6q1iOAiH+rWW76PA/x4=
X-Received: by 2002:a05:6902:1586:b0:b6c:a94:9bf3 with SMTP id
 k6-20020a056902158600b00b6c0a949bf3mr2200866ybu.9.1679576116524; Thu, 23 Mar
 2023 05:55:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230323124510.2484808-1-noltari@gmail.com> <20230323124510.2484808-3-noltari@gmail.com>
 <3e0fa788-173d-a014-20d5-0b4ca4d890b4@linaro.org>
In-Reply-To: <3e0fa788-173d-a014-20d5-0b4ca4d890b4@linaro.org>
From: =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Date: Thu, 23 Mar 2023 13:55:05 +0100
Message-ID: <CAKR-sGfnKdWmbGwTSgu9qiuJF+qFS=AiwORFDMcKf1x1PpY4Ng@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: nand: raw: macronix: allow disabling block protection
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	masonccyang@mxic.com.tw, linux-mtd@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_055517_793614_255148EA 
X-CRM114-Status: GOOD (  13.51  )
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

RWwganVlLCAyMyBtYXIgMjAyMyBhIGxhcyAxMzo0NywgVHVkb3IgQW1iYXJ1cwooPHR1ZG9yLmFt
YmFydXNAbGluYXJvLm9yZz4pIGVzY3JpYmnDszoKPgo+IEhpLAo+Cj4gT24gMy8yMy8yMyAxMjo0
NSwgw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzIHdyb3RlOgo+ID4gU29tZSBkZXZpY2VzIGhhbmcg
d2hlbiBibG9jayBwcm90ZWN0aW9uIGlzIGVuYWJsZWQsIHNvIGxldCdzIGFkZCBhIGJvb2xlYW4K
PiA+IHByb3BlcnR5IHRvIGFsbG93IGRpc2FibGluZyBpdC4KPiA+Cj4KPiBXaHkgZG8gdGhleSBo
YW5nPwoKQXQgZmlyc3QgSSB0aG91Z2h0IGl0IHdvdWxkIGJlIGR1ZSB0byB0aGUgbG93IGxldmVs
IG9wIG5vdCBiZWluZwpzdXBwb3J0ZWQgb24gQkNNNjMyNjggYnJjbW5hbmQgY29udHJvbGxlcnMs
IGJ1dCBhZnRlciBkZWJ1Z2dpbmcgaXQKc2VlbWVkIHRvIGJlIHdvcmtpbmcuLi4KClRoaXMgaXMg
dGhlIGxvZyB3aXRoIGJsb2NrIHByb3RlY3Rpb24gZGlzYWJsZWQ6ClsgICAgMC40OTU4MzFdIGJj
bTYzNjhfbmFuZCAxMDAwMDIwMC5uYW5kOiB0aGVyZSBpcyBub3QgdmFsaWQgbWFwcyBmb3IKc3Rh
dGUgZGVmYXVsdApbICAgIDAuNTA0OTk1XSBuYW5kOiBkZXZpY2UgZm91bmQsIE1hbnVmYWN0dXJl
ciBJRDogMHhjMiwgQ2hpcCBJRDogMHhmMQpbICAgIDAuNTExNTI2XSBuYW5kOiBNYWNyb25peCBN
WDMwTEYxRzE4QUMKWyAgICAwLjUxNTU4Nl0gbmFuZDogMTI4IE1pQiwgU0xDLCBlcmFzZSBzaXpl
OiAxMjggS2lCLCBwYWdlIHNpemU6CjIwNDgsIE9PQiBzaXplOiA2NApbICAgIDAuNTIzNTE2XSBi
Y202MzY4X25hbmQgMTAwMDAyMDAubmFuZDogZGV0ZWN0ZWQgMTI4TWlCIHRvdGFsLAoxMjhLaUIg
YmxvY2tzLCAyS2lCIHBhZ2VzLCAxNkIgT09CLCA4LWJpdCwgQkNILTQKWyAgICAwLjUzNTkxMl0g
QmFkIGJsb2NrIHRhYmxlIGZvdW5kIGF0IHBhZ2UgNjU0NzIsIHZlcnNpb24gMHgwMQpbICAgIDAu
NTQ0MjY4XSBCYWQgYmxvY2sgdGFibGUgZm91bmQgYXQgcGFnZSA2NTQwOCwgdmVyc2lvbiAweDAx
ClsgICAgMC45NTQzMjldIDkgZml4ZWQtcGFydGl0aW9ucyBwYXJ0aXRpb25zIGZvdW5kIG9uIE1U
RCBkZXZpY2UgYnJjbW5hbmQuMAouLi4KClRoaXMgaXMgdGhlIGxvZyB3aXRoIGJsb2NrIHByb3Rl
Y3Rpb24gZW5hYmxlZDoKWyAgICAwLjQ5NTA5NV0gYmNtNjM2OF9uYW5kIDEwMDAwMjAwLm5hbmQ6
IHRoZXJlIGlzIG5vdCB2YWxpZCBtYXBzIGZvcgpzdGF0ZSBkZWZhdWx0ClsgICAgMC41MDQyNDld
IG5hbmQ6IGRldmljZSBmb3VuZCwgTWFudWZhY3R1cmVyIElEOiAweGMyLCBDaGlwIElEOiAweGYx
ClsgICAgMC41MTA3NzJdIG5hbmQ6IE1hY3Jvbml4IE1YMzBMRjFHMThBQwpbICAgIDAuNTE0ODc0
XSBuYW5kOiAxMjggTWlCLCBTTEMsIGVyYXNlIHNpemU6IDEyOCBLaUIsIHBhZ2Ugc2l6ZToKMjA0
OCwgT09CIHNpemU6IDY0ClsgICAgMC41MjI3ODBdIGJjbTYzNjhfbmFuZCAxMDAwMDIwMC5uYW5k
OiBkZXRlY3RlZCAxMjhNaUIgdG90YWwsCjEyOEtpQiBibG9ja3MsIDJLaUIgcGFnZXMsIDE2QiBP
T0IsIDgtYml0LCBCQ0gtNApbICAgIDAuNTM5Njg3XSBCYWQgYmxvY2sgdGFibGUgbm90IGZvdW5k
IGZvciBjaGlwIDAKWyAgICAwLjU1MDE1M10gQmFkIGJsb2NrIHRhYmxlIG5vdCBmb3VuZCBmb3Ig
Y2hpcCAwClsgICAgMC41NTUwNjldIFNjYW5uaW5nIGRldmljZSBmb3IgYmFkIGJsb2NrcwpbICAg
IDAuNjAxMjEzXSBDUFUgMSBVbmFibGUgdG8gaGFuZGxlIGtlcm5lbCBwYWdpbmcgcmVxdWVzdCBh
dCB2aXJ0dWFsCmFkZHJlc3MgMTAyNzdmMDAsIGVwYyA9PSA4MDM5Y2U3MCwgcmEgPT0gODAxNmFk
NTAKKioqIERldmljZSBoYW5ncyAqKioKCkFzIHlvdSBjYW4gc2VlLCB3aGVuIGJsb2NrIHByb3Rl
Y3Rpb24gaXMgZW5hYmxlZCwgdGhlIGJhZCBibG9jayB0YWJsZQppc24ndCBmb3VuZCBhbmQgd2hl
biB0aGUgZGV2aWNlIGlzIHNjYW5uZWQgZm9yIGJhZCBibG9ja3MgaXQganVzdApoYW5ncy4uLgoK
SWYgeW91IHdhbnQgbWUgdG8gZGVidWcgc29tZXRoaW5nIEkgd291bGQgYmUgaGFwcHkgdG8gZG8g
aXQsIGJ1dCBJCm5lZWQgc29tZSBndWlkYW5jZSBoZXJlLi4uCgpCZXN0IHJlZ2FyZHMsCsOBbHZh
cm8uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
