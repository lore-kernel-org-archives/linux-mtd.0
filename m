Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ADAFC04A94
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Aug 2023 08:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f5YvJN4xnF9OSMkDWLZGlTZe2GkUsafd/mb6hchQvlk=; b=d0+FggkUOjDqOE
	8JdK5ZSdi/GSAG241Aqn2l9JIsTM1uP0WfF5xul5NzISZh6m4P/h093xvvYNtC70kBD20U6HqVGmx
	u2krwtqqPsY1aiN6Yv0xgMaTvCU72Kam4bb0zu+6VRCD8i9jWKKn/+HcV05LBrnIRc83VbBoI5Xy2
	RbqJPKvy4NQCl5Tzgfh1M9NGZtPutmxhaIjsEdUMXwV2IpP47kIihDjBJVNXYvZ87/IRLfBEj0ZXO
	h/N8ry7MQF6xr50duPdgjckhTTt04S5oCzQZFJdIteOBSD3N/vm7ZZomvfPj48Jqd6DKnypvoC7xm
	LqxX0aL1bGUiI3p4WMnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSZA-00GQou-2W;
	Mon, 14 Aug 2023 08:04:44 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSZ7-00GQo9-0E
	for linux-mtd@lists.infradead.org;
	Mon, 14 Aug 2023 08:04:42 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-565439b6b3fso2271234a12.2
        for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2023 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692000279; x=1692605079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bL7hF4+TeU8UMhf/a5N4ED2IfNnHn+sEBeyfEZ9NJug=;
        b=JhLpDsL3/Nrp/RTN3+F0UIsL7cuE+o2iJUwXSbkux16tLgbyM47urjfLjnAMy1EqR6
         NOkjFrXLS/RIbobNdOG5qByVXq70JuKCB6DOTmoMgl05LmRXLPL55G1sedCK8+HiHll6
         uxFYUJcwcGSirgnpFAl/Vy9UthwfBjvUS0ROQryEptqiFKdusCHTxBKRpCc9sEEtALGE
         Pt1psdfff4gCEYAgh5M4hlC9tPJDNr0eASGUGcBNch5B9fQHQWMG7/ri4fAOGgny439h
         bW7iTQhhobCwQy0vmu5UGf1nIJwklE7K/mi0sGjrHEsZr5mDXhLNnJVQf7yE2GJ5CBsy
         yEJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692000279; x=1692605079;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bL7hF4+TeU8UMhf/a5N4ED2IfNnHn+sEBeyfEZ9NJug=;
        b=aJEb+YJxjI354ZFSTkxP7W8k3Oduqbn8yQ3SoaNUPYCwcCgVC509RjysAVaOVhLfF8
         Ydlw4I+5YLeyMLuc6tIMdbyQppbWZ2RwBUqksoffQplnmciBsl3s69/R6ARy6It0jm/Q
         TG0CfbTpFphmwcxR+iqHTa3ZDnaY9wOP8KmwXeGCGVlxTJpKEd8pS4rn6JKIeuDp0sfu
         xa1qI36YwvlpCAK6cEtf2kQmPtxwzgP4zoPUdzincH9al9bmETIte5x+8kBeTZLsOXPL
         upcKWCJ1ycD7wnX0FIkz0dzlflquwafzK2hzVV2z5dRJTwczDPIJeCwURIjKncp5Z4g5
         P8xQ==
X-Gm-Message-State: AOJu0YzZP1H6fUAtQNyaDVxHUU+nj25IM0B9XR8Grm/JhLt8lh567Q8S
	pNfDV5RCUlmlI7K+0RulHsIVu4LlJyytztWkqRY=
X-Google-Smtp-Source: AGHT+IG9TljI/9sI4wggqdrHH8xo2QhvGRhEjvPMgvh0mj5D1P5sO0vDCqlT+ayCuyQTg6/m6LwVmAFAHivnVqydPKw=
X-Received: by 2002:a17:90a:a418:b0:269:621e:a673 with SMTP id
 y24-20020a17090aa41800b00269621ea673mr6350896pjp.1.1692000279559; Mon, 14 Aug
 2023 01:04:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com> <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
 <92234e4c5aca657a966d7c4d9d5f219a@kernel.org> <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
 <5c608c4d-ee22-5941-041c-37c6ecd8e4f8@linaro.org>
In-Reply-To: <5c608c4d-ee22-5941-041c-37c6ecd8e4f8@linaro.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Mon, 14 Aug 2023 16:04:28 +0800
Message-ID: <CAAQoYR=1H1vbXDQtT8BQTwgxZcaF4n7dfoyym1cubrO+tqJvKQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Michael Walle <mwalle@kernel.org>, linux-mtd@lists.infradead.org, pratyush@kernel.org, 
	miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_010441_148450_FB329CEA 
X-CRM114-Status: UNSURE (   9.07  )
X-CRM114-Notice: Please train this message.
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

SGkgVHVkb3IKCj4KPgo+Cj4gT24gOC8xMS8yMyAxMDowMywgbGlhbyBqYWltZSB3cm90ZToKPiA+
PiBTbyBiZXR0ZXIgaW5jbHVkZSBzb21lIHByb3ByaWV0YXJ5IHRhYmxlcyBpbiB5b3VyIG5leHQg
Tk9SIGZsYXNoZXMg8J+YiQo+ID4gSW4gbXkgb3BpbmlvbiwgdGhpcyBtYXkgbm90IGEgZ29vZCB3
YXkgYmVjYXVzZSBvZiBTRkRQIGlzIGdyb3dpbmcgdXAKPiA+IHRoZW4gcHJvcHJpZXRhcnkgdGFi
bGVzIG1heSBoYXZlIGNvbmZsaWN0IGFkZHJlc3MgaW4gdGhlIGZ1dHVyZS4KPiA+IFNvIHRoYXQg
TWFjcm9uaXggb2N0YWwgZmxhc2hlcyBkaWRuJ3QgaW5jbHVkZSBpdCBub3cuCj4gPgo+Cj4gU0ZE
UCBhbmQgdmVuZG9yIHRhYmxlcyBjYW4ndCBjb2xsaWRlIGFzIHRoZXkgdXNlIGRpZmZlcmVudCBQ
YXJhbWV0ZXIKPiBJRCBNU0IgaW4gdGhlIFBhcmFtZXRlciBIZWFkZXIuIENoZWNrIHNlY3Rpb24g
Ni4zLjMgaW4gamVzZDIxNmYtMDIuClRoYW5rcy4KRm9yIFNGRFAgdmVuZG9yIHRhYmxlLCBJIHdp
bGwgZGlzY3VzcyB3aXRoIFBNIGludGVybmFsbHkuCgoKVGhhbmtzCkphaW1lCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRp
c2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbXRkLwo=
