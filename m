Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE3CC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 12:15:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 04EA2651C5
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 12:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 04EA2651C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0zpWGKfJc29sB9z9am+gZlqAH66mc0ozi5bHHxayPCY=; b=f/CTZgGJbY4etTAJxW0QXOKCa
	immSfi+LxLbhEencncy+XOk1oTlFNu4pj8SOMWTQOh2NNsJjpkKH/KPi0gfD9j/Zl4aZk+WU9Thet
	9LUvkRbrCcWN/LFCIH1kCuhxRvLhvadvMFTH5kyoVQWQpbv0zVckIrdx9qBXawiy4GnxalErm0W/R
	DG3HcqBJApMyrV3YT+wU4uexvkZ3YPAAwLbjoOj4WrKEBKorRBT1XdvEt76T2SKm+/N1528GjGA7Y
	VvWj4hFFb4dSnaeKD8ovAEhHwcOrpVd9OdIkh/h8zRFBjzcv784mBjyp5pkuG/e3bgsGrepJ+GSto
	1D/mU2CcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJEm8-00GzN5-Px; Mon, 08 Mar 2021 12:14:17 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJEm1-00GzLE-TC
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 12:14:14 +0000
Received: by mail-ej1-x62f.google.com with SMTP id p8so19877516ejb.10
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 04:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6WsXzkZKIYmpOl1DOZ8e9KcUHnOCDuB8xzdtvk/6Xdo=;
 b=tY67xB9c8hqIQkvjIng0PppegIpOpcGXasj6a9/dnB5oZi7Ot/Xx00Gehas46AW7fR
 EkaW2sabLLQMC5l++v1yktxVbbb4i0jbQYWLDJNcGDD6kdRLjLFv+mFiAkjftQt6k96E
 fqRtvb/LpnBstc18gjbfyL/c0Yb/Vauj6vPQ8SOIOiHhYZkG2AWgmkWN1Ob3mdgkWZbA
 Yqvvr3/rVNgR96LVaPrLZRLM29P+SzxxOvinZvYXlaYVyYpNnVV0o8U9TKp4Gvm0Mj4G
 +xzEDPDJmBNoklaYh4+Mymv+ap84mK1GpeaJMmVMGAiJ77BYz4hnVPRyREeX4H1pVFgx
 0JHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6WsXzkZKIYmpOl1DOZ8e9KcUHnOCDuB8xzdtvk/6Xdo=;
 b=YBUT8BWwNwkDAWMxyw7gcglWfkiybyN31vSEE41srhWWJ0W0N7a+uLmXXsoHXjDNuc
 THGMvoqqz4WFBVN9Ct+1wePVlrwonHkH2bfVOLOPJtFr9pNfkb0KNWcvwqhfzkpvgnDa
 5nQYpSav9L0WOXfLKiSP5jldPiQvrvbzq9mNeJ/ufh1koSOSdJ7PF2XCFLWG83VXSl8n
 KqLywwveR9a/J/G8hYS5uSF53aplxbNiM58/Z5U+zMh0/IavM4RzcEi3J55aC1uR9tk2
 Ro//jgVxBbPwIFrA8XDlzFsbjA2jGWw2olEEQmRBFpzfcF6pYb1hhz70nMA74P+i3RrU
 BGuQ==
X-Gm-Message-State: AOAM531On9ajtkMrVEwXeDMkcX7fTZHy/xOTX28L430XPlPaj2YzOGoc
 2tn1yuKTezVvlJNeALIQ6jk=
X-Google-Smtp-Source: ABdhPJySpce7SOXohqD5qYMyCqCZyhKpRu5rz4gqkNl/Cr51BXCwbGbx1NgeJLOYzTl6Ma10oQsxBg==
X-Received: by 2002:a17:907:1b1c:: with SMTP id
 mp28mr14355219ejc.243.1615205648310; 
 Mon, 08 Mar 2021 04:14:08 -0800 (PST)
Received: from Ansuel-xps.localdomain
 (host-82-61-23-35.retail.telecomitalia.it. [82.61.23.35])
 by smtp.gmail.com with ESMTPSA id kj3sm6545922ejc.117.2021.03.08.04.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 04:14:07 -0800 (PST)
Date: Sun, 7 Mar 2021 18:04:50 +0100
From: Ansuel Smith <ansuelsmth@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Document use of
 nvmem-partitions compatible
Message-ID: <YEUHsoC4V+H6PCHL@Ansuel-xps.localdomain>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-4-ansuelsmth@gmail.com>
 <ee596471-db9b-43e4-c085-9bd938101587@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee596471-db9b-43e4-c085-9bd938101587@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_121410_295026_CCDC84C9 
X-CRM114-Status: GOOD (  13.75  )
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

T24gTW9uLCBNYXIgMDgsIDIwMjEgYXQgMTA6NDg6MzJBTSArMDEwMCwgUmFmYcWCIE1pxYJlY2tp
IHdyb3RlOgo+IE9uIDE2LjAyLjIwMjEgMjI6MjYsIEFuc3VlbCBTbWl0aCB3cm90ZToKPiA+IERv
Y3VtZW50IG52bWVtLXBhcnRpdGlvbnMgY29tcGF0aWJsZSB1c2VkIHRvIHRyZWF0IG10ZCBwYXJ0
aXRpb25zIGFzIGEKPiA+IG52bWVtIHByb3ZpZGVyLgo+IAo+IEknbSBqdXN0IHdvbmRlcmluZyBp
ZiAibnZtZW0tcGFydGl0aW9ucyIgaXMgYWNjdXJhdGUgZW5vdWdoLiBQYXJ0aXRpb25zCj4gYml0
IHNvdW5kcyBhIGJpdCBhbWJpZ3VvdXMgaW4gdGhlIG10ZCBjb250ZXh0Lgo+IAo+IFdoYXQgZG8g
eW91IHRoaW5rIGFib3V0ICJtdGQtbnZtZW0tY2VsbHMiIG9yIGp1c3QgIm52bWVtLWNlbGxzIj8K
CkkgcmVhZCBzb21ld2hlcmUgdGhhdCBtdGQgaXMgbm90IHNvIHN0YW5kYXJkIHNvICJudm1lbS1j
ZWxscyIgc2hvdWxkIGJlIHRoZQpyaWdodCBjb21wYXRpYmxlLgpUbyBzdW0gdXAsIHdpdGggdjIg
SSBzaG91bGQgY2hhbmdlIHRoZSBjb21wYXRpYmxlIG5hbWUgYW5kIGp1c3QgcHVzaCB0aGUKMiBh
bmQgMyBwYXRjaC4gKHdhaXRpbmcgeW91ciBmaXggdG8gYmUgYWNjZXB0ZWQpIENvcnJlY3Q/CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
