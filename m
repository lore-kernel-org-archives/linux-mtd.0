Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18752C433DB
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 07:54:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E0364EF5
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 07:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E0364EF5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=taFWp4nMFGbycfGgg5vKD08S3LJEJ8VuZx6aa/ZOg0I=; b=MMGOTnd8CRSoG1CrKu1ZG5fYU
	iHh3JXzvO/amPEjq8dTJVX+lKJ/CMnHQm25+izfjiHdZknzft67h87mmNobUJ+bgWnuKkzx13DUEU
	WvHcOoC8ja/MxhYSsd0zsChUxjbE4JewphriwKhhuni9LgUPAd7Ux79bfNtHnF1xui62uNM6zNM3V
	g2IkNv/2uIdagLrVRrdBZMMKmFUnphPdRRmtPmumcNTOMV60kH2/FrnUrxw83Y/mXsD1QlvVsHzk2
	6pIyV/U509MeBk7RslTC92/6eq1JiwP0Ga39hPqKAG6aG2VcOtzIuzBOsbQkXPPQTb8jlYXhwm9HC
	yCoEGfgbA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFBTW-0006F7-I9; Thu, 25 Feb 2021 07:54:18 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFBTT-0006EA-KR
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 07:54:16 +0000
Received: by mail-wm1-x329.google.com with SMTP id w7so3824263wmb.5
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2021 23:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/YTWgHJSzDoLcdRHp3K06tTL/4voTQM5gU7wWtCbIhs=;
 b=X9oY7LgKI8IICMXKkoWol/GMZJkZNjUPRisxcOjqbWEpjFZo+59sbSQqp9xe7+GGw1
 /wpo5nXwa8TfzQEMX4dcNmXllvS5Omeg3Cwcw1dZ2Nz8EYDKLgib3SZxKCDfUKsCvKmN
 /JdKMqfEdj2mLW/ksaGxa9gfnluFw05I6olmE6lBSloHxBdp5CEBBvC0f+Jn2VsOMpe6
 KCrrxQR9oBNya4XpjW5MeIAjfkDJgvoR/IjjKwDmhsUBTD3IfFQXzoamqHXLji4Aq1XG
 bE9u4P1NnQ0E40JKsfchTMEXK4C02EfDDC9Y6akI0AJz142TgN1LII4XHIc282lpcu5t
 hAvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=/YTWgHJSzDoLcdRHp3K06tTL/4voTQM5gU7wWtCbIhs=;
 b=XZgY78FJE17693LaDugRc2TN66RpdC9f9SY6iJA3iNHVPzWLyZ95k3sI7NuX3h1ehQ
 hnfHzc80qSiNvbpzzjL6Vl72AftByc+5Ser1e9Hb9BoWWpowLk10LvdajHkvveBrMtKu
 tNbnMbzi3GbYkKMsId9RjKIY5VPpH5if7mvWJQN2C7IJa2JANXtcx9zTAsKCpVSkn2R9
 JqInErJb+BG6e3jtG/AEmnfRzjR4mn/m5rqgkaHrm5thAuSAuEbgzT+Vtrp2fZIX3VwE
 m3k16oUBpRB5FNW91c3goosBCfZYCVidJoKqC8IhkLGVMa/5C5Z1521BvqWvwOPIwrbJ
 4omw==
X-Gm-Message-State: AOAM533G4ilXJULtYtWyOsUBl+EQ7QZSAZBu/vESuT5vDCzKoSgDQCmG
 tfp5lE92Q5VTwxytYkC0P00=
X-Google-Smtp-Source: ABdhPJz0IELhpxpt5w7rC65AC6Uu+FtdxGUxq5GrLncfYR0FdKcAZEswxwvCeaCNCpIxFwPTlovmZQ==
X-Received: by 2002:a7b:c083:: with SMTP id r3mr1904293wmh.177.1614239651927; 
 Wed, 24 Feb 2021 23:54:11 -0800 (PST)
Received: from macbook-pro-alvaro.lan
 (170.red-88-1-105.dynamicip.rima-tde.net. [88.1.105.170])
 by smtp.gmail.com with ESMTPSA id z9sm6873830wrv.56.2021.02.24.23.54.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 24 Feb 2021 23:54:11 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v2] nand: brcmnand: fix OOB R/W with Hamming ECC
From: =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20210225084838.34bbdbff@xps13>
Date: Thu, 25 Feb 2021 08:54:09 +0100
Message-Id: <4DF5654C-1412-4E89-BF21-60C649EEDF4F@gmail.com>
References: <20210222201655.32361-1-noltari@gmail.com>
 <20210224080210.23686-1-noltari@gmail.com>
 <CAN8TOE_Eg6zYqy8wLtrNcTiCQdcihM7wGM5JHw=bh4=b1CL-_A@mail.gmail.com>
 <20210225084838.34bbdbff@xps13>
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_025415_686080_BC9EFF78 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>,
 Linux Kernel <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWlxdWVsLAoKPiBFbCAyNSBmZWIgMjAyMSwgYSBsYXMgODo0OCwgTWlxdWVsIFJheW5hbCA8
bWlxdWVsLnJheW5hbEBib290bGluLmNvbT4gZXNjcmliacOzOgo+IAo+IEhpIMOBbHZhcm8sCj4g
Cj4gQnJpYW4gTm9ycmlzIDxjb21wdXRlcnNmb3JwZWFjZUBnbWFpbC5jb20+IHdyb3RlIG9uIFdl
ZCwgMjQgRmViIDIwMjEKPiAxMzowMToxMyAtMDgwMDoKPiAKPj4gT24gV2VkLCBGZWIgMjQsIDIw
MjEgYXQgMTI6MDIgQU0gw4FsdmFybyBGZXJuw6FuZGV6IFJvamFzCj4+IDxub2x0YXJpQGdtYWls
LmNvbT4gd3JvdGU6Cj4+PiBGaXhlczogMjdjNWIxN2NkMWIxICgibXRkOiBuYW5kOiBhZGQgTkFO
RCBkcml2ZXIgImxpYnJhcnkiIGZvciBCcm9hZGNvbSBTVEIgTkFORCBjb250cm9sbGVyIikgIAo+
PiAKPj4gRldJVywgSSBjb3VsZCBiZWxpZXZlIHRoaXMgd2FzIGJyb2tlbi4gV2Ugd2VyZW4ndCB0
ZXN0aW5nIEhhbW1pbmcgRUNDCj4+IChub3IgSkZGUzIpIGF0IHRoZSB0aW1lLCBzbyBpdCBjb3Vs
ZCBlYXNpbHkgaGF2ZSBvYnZpb3VzIGJ1Z3MgbGlrZQo+PiB0aGlzLgo+IAo+IFJpZ2h0LCB5b3Ug
c2hvdWxkIHByb2JhYmx5IGxpbWl0IHRoZSBiYWNrcG9ydCB0byB0aGUgdGltZSB3aGVuIHJhdwo+
IGFjY2Vzc29ycyBnb3QgaW50cm9kdWNlZC9maXhlZC4KCldoYXQgZG8geW91IG1lYW4/ClRob3Nl
IGFjY2Vzc29ycyBoYXZlIGJlZW4gdGhlcmUgc2luY2UgdGhlIGZpcnN0IGNvbW1pdCAoMjdjNWIx
N2NkMWIxMDU2NGZhMzZmOGY1MWU0YjRiNDE0MzZlY2MzMik6Cmh0dHBzOi8vZ2l0aHViLmNvbS90
b3J2YWxkcy9saW51eC9ibG9iLzI3YzViMTdjZDFiMTA1NjRmYTM2ZjhmNTFlNGI0YjQxNDM2ZWNj
MzIvZHJpdmVycy9tdGQvbmFuZC9icmNtbmFuZC9icmNtbmFuZC5jI0wxODk2LUwxODk5Cgo+IAo+
IFRoYW5rcywKPiBNaXF1w6hsCgpCZXN0IHJlZ2FyZHMsCsOBbHZhcm8uCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
