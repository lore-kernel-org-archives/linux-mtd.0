Return-Path: <SRS0=dx8R=G4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAF82C433E0
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 22:25:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9460220756
	for <linux-mtd@archiver.kernel.org>; Mon, 25 Jan 2021 22:25:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9460220756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6XvfJn1cnbLPy0mJnh8S8AVPURukNq8Cfm6qB2/NCJk=; b=f//39Ks0d9jOTxDsNUbgvJjOz
	ENEJt5VJc1cfybmtO0UCHowRyDgUOU902mhOdHPtntS85EM9mU20tsNEdwAFFtWEZHvYfbXRTW6qC
	pLfKHu6u2ll+FdFypDi9hMCPhXF+X1PIyzpmKOL1HIp/23dL8M5wCjwhb9fGm4gQGMXvPtYP5DLAN
	6Z8yKct3sob+zsyXdaJHbzEytKZ2fpqgzKCJ3xN9B07AFHno9BGjASVCawDqepHP6No1cLJv+K6U5
	shhhMK/rssCaD6fZyK+QNRt/eNB5pNVBw/AJMYJluI8ZQHRnDfFdo5EDSZg+T8cZtI4mNt2RR66G8
	vv2caJzkA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4AH9-0000D9-Fr; Mon, 25 Jan 2021 22:23:59 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4AH6-0000Ch-V7
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2021 22:23:57 +0000
Received: by mail-oi1-f170.google.com with SMTP id i25so5085348oie.10
 for <linux-mtd@lists.infradead.org>; Mon, 25 Jan 2021 14:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0NjYeDD1lzj1UZeJ9nl8y/ztWhDb5GAabmpEUTqpWuo=;
 b=j6UQGCaNUukSAeMIgr53Xg6b67UHBA5NLOhlCMPIsqRIu1d+niyWuB2mL0b6wKjPZz
 zDAjMi7rda7R0CEFjoLzppzAbt+gI6bfMI0UD4Wo4AsHCgrCUg+YLMZPMbvMbMn1Ht7k
 7al0YDyeGniSI7Q7zdvKKteAp8WZnjNfljgGkWwqz9Ttllz3gv6kt/t3tvSVojgEblZ9
 ZuBwD2h8hUQFhKCmFemuVki53iCRBvz0pq5j7JBFhK4FpXHYOvIsHDRglr7qVwrD9NZU
 QU3HGfs/gWaaJfeA7WBLsAK1+O7qbQwqPHkfu0Ii2j6/vHroUqsP6S+WRsbzH7D1LSvV
 43WQ==
X-Gm-Message-State: AOAM530LyJE14epIv3HwYlIG3RJRuRMqSSzW6r5NeZJus+JStfoiekhy
 Vj1EY6ckYOmey1SWXrNCwQ==
X-Google-Smtp-Source: ABdhPJyiC85YjLm3GdEPgUAZ01e4BVRyZ2WIvAASAZ4Nfi00rOeQsMsqQRoTcgV1oRHZeeEIutbAsw==
X-Received: by 2002:a05:6808:c:: with SMTP id
 u12mr1364028oic.163.1611613436039; 
 Mon, 25 Jan 2021 14:23:56 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d10sm3459431ooh.32.2021.01.25.14.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 14:23:55 -0800 (PST)
Received: (nullmailer pid 1131708 invoked by uid 1000);
 Mon, 25 Jan 2021 22:23:54 -0000
Date: Mon, 25 Jan 2021 16:23:54 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: mtd: move partition binding to its own
 file
Message-ID: <20210125222354.GA1131674@robh.at.kernel.org>
References: <20210115153901.31052-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210115153901.31052-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210125_172357_004260_396B7D41 
X-CRM114-Status: GOOD (  11.92  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNSBKYW4gMjAyMSAxNjozODo1OSArMDEwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBTaW5nbGUg
cGFydGl0aW9uIGJpbmRpbmcgaXMgcXVpdGUgY29tbW9uIGFuZCBtYXkgYmU6Cj4gMS4gVXNlZCBi
eSBtdWx0aXBsZSBwYXJzZXJzCj4gMi4gRXh0ZW5kZWQgZm9yIG1vcmUgc3BlY2lmaWMgY2FzZXMK
PiAKPiBNb3ZlIGl0IHRvIHNlcGFyYXRlZCBmaWxlIHRvIGF2b2lkIGNvZGUgZHVwbGljYXRpb24u
Cj4gCj4gU2lnbmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+
IC0tLQo+ICAuLi4vbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55YW1sICAgICAgfCAz
MyArLS0tLS0tLS0tLS0tCj4gIC4uLi9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24u
eWFtbCAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0OCBp
bnNlcnRpb25zKCspLCAzMiBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0aXRpb24ueWFt
bAo+IAoKUmV2aWV3ZWQtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
