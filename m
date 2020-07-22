Return-Path: <SRS0=7+w2=BB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC479C433E4
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 09:33:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 75233206D7
	for <linux-mtd@archiver.kernel.org>; Wed, 22 Jul 2020 09:33:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XHWi3qID";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=jms.id.au header.i=@jms.id.au header.b="lA4V5SfS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 75233206D7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Npoza4GxWtOaAeFWLxoaCg+cRSJzRhaRnplGr7Cu/Pk=; b=XHWi3qIDeEPsflL53hNkbAjjI
	FixIUxM4PnNCFUmBPB7J6ayAdxObJ1Njy8wbCfCDdky+FanwjnAdXkFdoAMaGdj7/1zTh8yi3DbWC
	JT3EgcHxKhxyyC3ilb6Nk9YTS1HWECO6ZkSYEO0i+TU2FVBGz5Q/Qe6VSrhmBKN0r5n+0Y8IVtveK
	muFfmduetMoW/7TgK8+cZ46cvwTyejFtWuK8WCyR0bNV7R8Bc+YCgpBsJDTgQ4vtNWEXSZu0CKBxy
	s2pnWHN4PnitzKCuESrR7+9ddyJZjg4HiT7+qN2t4p4zmMrqBl2EnDD92lRlgrDNe8GAbv+hwP/am
	iwzxQ1EWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyB6V-0002Yn-Ly; Wed, 22 Jul 2020 09:31:59 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyB6S-0002Xc-A3
 for linux-mtd@lists.infradead.org; Wed, 22 Jul 2020 09:31:57 +0000
Received: by mail-ej1-x641.google.com with SMTP id lx13so1491929ejb.4
 for <linux-mtd@lists.infradead.org>; Wed, 22 Jul 2020 02:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=sqOEYfYuAtbFYQshCOEmc92ess+IPZQc1F+OL5J10Vw=;
 b=lA4V5SfSK/hFUDndm9W7pBH4DWvVwiHjAeQuiPhKTxAvr3I1hVPGGieGjALxJoTKLR
 F+WnK0NmfAe7PzU4ipAgmqaYntjJgTLBkLHXw6qe42KE5qn6JMlNmOqJIJke92yvg7mX
 0y7SQ7bvB5gtZtqUTv1MOFMmsgzSiviVDtKi4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=sqOEYfYuAtbFYQshCOEmc92ess+IPZQc1F+OL5J10Vw=;
 b=UWKLfqEsfLXTawy+vWTK1eGAr4f+eqYr+XhU1dfTuD5kairbR23wE/y6ThpqiW0Twv
 +ZqquXl/izFwO8cym4cda1+e0B/M8aCUsrJF9HGAqXHSXxvyfcsCLHpygBhNgO6SH0Go
 n/oAFH+MWCpObGzsQVQKY6O6Br0UA5lUtoyNnVJq83y0V3AZ0KyE0g+Uai73y05IbFCc
 TsQCoXk/Jxq+rMndVeifnAQ2N/P1+Wq9iN6KIHbyq69dO7kzDEW13YJZNoORaNkl8zdi
 VPuVMrMfruSE277HpjWQnQzpS9p76o/flFqQy69+pxHrmzKuh6iAMxrsisWkkhExgOQb
 yj0A==
X-Gm-Message-State: AOAM533EqcWs3+lxererDELbWB0ekja9GRJtyUAdQXHBGe1bMhhdDzub
 8fF1FKR5iL9dU/8Kasq6Zvv8pHMRfL+QMeot0wI=
X-Google-Smtp-Source: ABdhPJzlGpAL5RJtjD/QpfXT9TfcbuqPdUr2X/sn7PVdVOfcD50BVjqSLYDCrbTndr6uRtWOwQxMWUc/nlewcevECpM=
X-Received: by 2002:a17:906:c187:: with SMTP id
 g7mr28118725ejz.108.1595410315017; 
 Wed, 22 Jul 2020 02:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200722084241.193470-1-joel@jms.id.au>
In-Reply-To: <20200722084241.193470-1-joel@jms.id.au>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 22 Jul 2020 09:31:42 +0000
Message-ID: <CACPK8XcxkAiAD2UWVmVH-6TxNKyrv9z3cOB9ptxVw+kiQgCuqA@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: Remove unused spi-nor.o rule
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Boris Brezillon <bbrezillon@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200722_053156_559299_41837C19 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAyMiBKdWwgMjAyMCBhdCAwOTowMCwgSm9lbCBTdGFubGV5IDxqb2VsQGptcy5pZC5h
dT4gd3JvdGU6Cj4KPiBJbiAibXRkOiBzcGktbm9yOiBQcmVwYXJlIGNvcmUgLyBtYW51ZmFjdHVy
ZXIgY29kZSBzcGxpdCIgdGhlIGZpbGUgd2FzCj4gcmVmYWN0b3JlZCBpbnRvIHNlcGVyYXRlIGZp
bGVzLCBzbyB0aGUgcnVsZSBpcyBubyBsb25nZXIgcmVxdWlyZWQuCgpQbGVhc2UgaWdub3JlIHRo
aXMgcGF0Y2guIEkgbWlzdW5kZXJzdG9vZCBob3cgc3BpLW5vci1vYmpzIHdvcmtlZCwgYW5kCmRp
ZG4ndCBwcm9wZXJseSB0ZXN0IHRoZSBwYXRjaC4KCkkgYW0gc3RpbGwgYSBiaXQgY29uZnVzZWQg
YXMgdG8gaG93IHNwaS1ub3IubyBnZXRzIGxpbmtlZCBpbiwgYXMKdGhlcmUncyBubyBzcGktbm9y
Lm8gb24gbXkgZmlsZXN5c3RlbS4gQ2FuIHNvbWVvbmUgZXhwbGFpbiBob3cgaXQKd29ya3M/Cgo+
IEZpeGVzOiBhMDkwMGQwMTk1ZDIgKCJtdGQ6IHNwaS1ub3I6IFByZXBhcmUgY29yZSAvIG1hbnVm
YWN0dXJlciBjb2RlIHNwbGl0IikKPiBSZXBvcnRlZC1ieTogQ8OpZHJpYyBMZSBHb2F0ZXIgPGNs
Z0BrYW9kLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1
Pgo+IC0tLQo+ICBkcml2ZXJzL210ZC9zcGktbm9yL01ha2VmaWxlIHwgMSAtCj4gIDEgZmlsZSBj
aGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tdGQvc3BpLW5v
ci9NYWtlZmlsZSBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvTWFrZWZpbGUKPiBpbmRleCA2NTM5MjM4
OTYyMDUuLjJlZGU1ZWY3OWIwMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL210ZC9zcGktbm9yL01h
a2VmaWxlCj4gKysrIGIvZHJpdmVycy9tdGQvc3BpLW5vci9NYWtlZmlsZQo+IEBAIC0xNyw2ICsx
Nyw1IEBAIHNwaS1ub3Itb2JqcyAgICAgICAgICAgICAgICAgICs9IHNzdC5vCj4gIHNwaS1ub3It
b2JqcyAgICAgICAgICAgICAgICAgICArPSB3aW5ib25kLm8KPiAgc3BpLW5vci1vYmpzICAgICAg
ICAgICAgICAgICAgICs9IHhpbGlueC5vCj4gIHNwaS1ub3Itb2JqcyAgICAgICAgICAgICAgICAg
ICArPSB4bWMubwo+IC1vYmotJChDT05GSUdfTVREX1NQSV9OT1IpICAgICAgKz0gc3BpLW5vci5v
Cj4KPiAgb2JqLSQoQ09ORklHX01URF9TUElfTk9SKSAgICAgICs9IGNvbnRyb2xsZXJzLwo+IC0t
Cj4gMi4yNy4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
