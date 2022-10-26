Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD118C38A2D
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Oct 2022 19:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvoWEw/4K/SO33LnnGNZ8op2lEtfW0OX6cJ6A99mhjo=; b=JPG5sEATbCYkaD
	VOTQjP3n20tuQmBP+PXYKjf59SWl5e91NPSLJaJJYmRd1QWRNPKOaBT1XIT0k24tglFoGP0xMNY/L
	FTo8R/2nmzqi7TQ9mDjvTLrj02mBhrvjGKAwz1q6AhzIkGG0bw0++26jAFSQgwfDvmsGhOFgPx423
	nYB+3+PK2ZuwLqN6FRQtdlMoGUX8RSiBJgeEY8iQnS15yD8LLr0vMOni1BKuGZJsvYcd3th6HcAmi
	BS4cNqx5NL+XZxzx8IjUbVmfdofGzfV4BVDLvtV4Q+Q/I6VVyTvZykw6U44eL+KiQu9S56MWAaJzK
	MPi4DJaoaQNiZ+A0qNrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmHD-00AoNQ-Co; Wed, 26 Oct 2022 19:41:23 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onmHB-00AoMT-6S
	for linux-mtd@lists.infradead.org; Wed, 26 Oct 2022 19:41:22 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-13bef14ea06so7813593fac.3
        for <linux-mtd@lists.infradead.org>; Wed, 26 Oct 2022 12:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TPHONoWIoiJZTFgcTi0/G6lMn83E2o6AmOqzxyIw2bs=;
        b=fiE4ZRvUod5F3fwtVnSNDKcE8z3I9iQn9TAS28Y/lrUOa0YMP5TvHMPCu9r7s0GUlW
         t8upiaDrcqvlA7c99FJ9ZCL3sKhnHRAvPrqHJ3HRRLSQsp7CRJalwUN018B6NzQ3nYxk
         c2lkYxll8p5uxjIrqWrtUs6rZKBHY7ergiiZtnAsw5vPJ+xs+D7W8fSK3farPe9KWjtu
         uqr7kyOOS9QcV48VU6VLSe/xu5LrZ3mf3mz6dWuWNKlAsi5/4SYib3WCAdzgxXYwOJug
         H9Xyp+ypjnw6tfzzRVlaCsi3Xm4GtW6T5gRzG73na2CHhMg4YHHHj/Pc0vLC6AuZnWbo
         TByw==
X-Gm-Message-State: ACrzQf2QPAQ5isQ5gwz6na+ayJp1Wscn5cN659O/+r/inPg5MAkUJhbT
	P6MpIR2O+crSxMFrWecdyA==
X-Google-Smtp-Source: AMsMyM4QwTUCtNMwN5OtnKfodKO29IN4opAIzj4qcr/bDuqdr1/vA0ZASc7FopWtKVyVaVnnMpIatA==
X-Received: by 2002:a05:6870:f59e:b0:132:bcd:565f with SMTP id eh30-20020a056870f59e00b001320bcd565fmr3169738oab.254.1666813279179;
        Wed, 26 Oct 2022 12:41:19 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y18-20020a056870429200b0010c727a3c79sm3630583oah.26.2022.10.26.12.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Oct 2022 12:41:18 -0700 (PDT)
Received: (nullmailer pid 1046234 invoked by uid 1000);
	Wed, 26 Oct 2022 19:41:20 -0000
Date: Wed, 26 Oct 2022 14:41:20 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Wolfram Sang <wsa+renesas@sang-engineering.com>, Jens Axboe <axboe@kernel.dk>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Mikhail Zhilkin <csharper2005@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, Richard Weinberger <richard@nod.at>, "Martin K . Petersen" <martin.petersen@oracle.com>, Vignesh Raghavendra <vigneshr@ti.com>, Chaitanya Kulkarni <kch@nvidia.com>, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH V3 1/2] dt-bindings: mtd: partitions: support marking
 rootfs partition
Message-ID: <166681327937.1046171.12755634067676619192.robh@kernel.org>
References: <20221022211318.32009-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221022211318.32009-1-zajec5@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_124121_252714_ACA8754C 
X-CRM114-Status: GOOD (  15.80  )
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

T24gU2F0LCAyMiBPY3QgMjAyMiAyMzoxMzoxNyArMDIwMCwgUmFmYcWCIE1pxYJlY2tpIHdyb3Rl
Ogo+IEZyb206IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5wbD4KPiAKPiBMaW51eCBu
ZWVkcyB0byBrbm93IHdoYXQgdG8gdXNlIGFzIHJvb3QgZGV2aWNlLiBPbiBlbWJlZGRlZCBkZXZp
Y2VzIHdpdGgKPiBmbGFzaCB0aGUgb25seSBjb21tb24gd2F5IHRvIHNwZWNpZnkgdGhhdCBpcyBj
bWRsaW5lICYgcm9vdD0gcGFyYW1ldGVyLgo+IAo+IFRoYXQgc29sdXRpb24gd29ya3Mgd2l0aCBV
LUJvb3Qgd2hpY2ggaXMgTGludXggJiBjbWRsaW5lIGF3YXJlIGJ1dCBpc24ndAo+IGF2YWlsYWJs
ZSB3aXRoIGFsbCBtYXJrZXQgYm9vdGxvYWRlcnMuIEFsc28gdGhhdCBtZXRob2QgaXMgZnJhZ2ls
ZToKPiAxLiBSZXF1aXJlcyBzcGVjaWZpYyBwcm9iaW5nIG9yZGVyIG9uIG11bHRpLWZsYXNoIGRl
dmljZXMKPiAyLiBVc2VzIGhhcmRjb2RlZCBwYXJ0aXRpb25zIGluZGV4ZXMKPiAKPiBBIGxvdCBv
ZiBkZXZpY2VzIHVzZSBkaWZmZXJlbnQgcGFydGl0aW9uaW5nIG1ldGhvZHMuIEl0IG1heSBiZQo+
ICJmaXhlZC1wYXJ0aXRpb25zIiBvciBzb21lIGR5bmFtaWMgcGFydGl0aW9uaW5nIChlLmcuIGJh
c2VkIG9uIHBhcnRzCj4gdGFibGUpLiBGb3Igc3VjaCBjYXNlcyBhbGxvdyAibGludXgscm9vdGZz
IiBwcm9wZXJ0eSB0byBtYXJrIGNvcnJlY3QKPiBmbGFzaCBwYXJ0aXRpb24uCj4gCj4gU2lnbmVk
LW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IC0tLQo+IFYyOiBV
c2UgImxpbnV4LHJvb3RmcyIgYXMgbW9yZSBhY2N1cmF0ZS4gVGhhbmtzIFJvYi4KPiAtLS0KPiAg
Li4uL2RldmljZXRyZWUvYmluZGluZ3MvbXRkL3BhcnRpdGlvbnMvZml4ZWQtcGFydGl0aW9ucy55
YW1sICB8IDEgKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tdGQvcGFydGl0aW9ucy9wYXJ0
aXRpb24ueWFtbCAgICAgICAgIHwgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspCj4gCgpSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
