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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74FEC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:30:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5925364DA3
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 13:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5925364DA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3nuRln0hNkcFSMrBqoyD5upAC+YFsmnx6jCFwj8BITA=; b=IxOlx5fDbJZUXb3WZ5Lr3Re9g
	kwkM+zpYbOO/H1RMp8RoRREUPc63eevd1Sz4RSgEc3Kh6vDKMOx2BXSDZNSAOFqi+qM0SMDk7g7/H
	mZEOk0rnn2d7iM7kw8VG/YO/1vUs1UW1Jdkh/lCZbuc+zRv1oReIVB3EXpgqMCuJSuccabYTTHXma
	92URAMi1Z06SHQOa6snsTeqniTWV9mff94ZS1MiD5ZouMPUymYfs8R2/gR5BeU8bWI3gn881QK7Sq
	dBD48oiCCD25jVfm9ZdDsL+798kSdIadob+ACvUQjGoFMjjIexHer1FOIvqixtCCxOvd6j5ksgTAD
	mrIDLvR9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJFwX-00HRxd-ST; Mon, 08 Mar 2021 13:29:06 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJFwT-00HRw4-8f
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 13:29:03 +0000
Received: by mail-lj1-x230.google.com with SMTP id p15so16023665ljc.13
 for <linux-mtd@lists.infradead.org>; Mon, 08 Mar 2021 05:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bH8SgOAbKuUs4jdIWtf1T+ZPNzyaRHJ+Vj2NV4QS1yE=;
 b=SIZd0IssvVu6rbJjVXw5WIFXllzIe5pTt4e3qzSIb+igzodeKSvYtlC5u7t5Lx/Zlu
 itvaOx1Jqh62hPA8IhRGP7YjL56pmJP/fPMIC83rjzzrBgI7kq3FoVXe828ZlvnGgVAa
 haVoVGySaDBc/UWdSqDH7u775B9Z5zG/wKg+Nuz1mAol7UtILOf7ya5Ej32I4ZzW7vT1
 IkPjxr2H8Nwgj2Y34DkPvCjLsk+VjqQd1P3kZykPVnRHLmxUjZUmCyfPLVFIo20A9QjV
 /ExFyTijZ3e7qqPa8+lab7Zgghb62lYzjkZxP7jPIOq+OM8QrsNd5XFh/EBbHyvefFkO
 UfKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bH8SgOAbKuUs4jdIWtf1T+ZPNzyaRHJ+Vj2NV4QS1yE=;
 b=szSeNNM/HOUsir90677fzXm7W17Nw1xl0lypv0aYXfWztuEHzSj51Mv2XGOIoK/GKc
 gk+N3Y2XV2QcBLCFzQFdGi8eg1TVZOjbf49B/TdXyzHikYF7z6nG8bOijsuMnAoAYYJH
 TdbwYeEhbCL4gbHXklzagwnsuD0atWadWl7CJlGgZiPa+HJpsP+IuVhE3G1SkIHpaXJO
 iSV6rmG9aEw966WBq0eGPAsWIjHPwyTBDltdV7g/C51RU0g/5eZ7Co3YNj9bw5IHyL67
 D2vOVZ4w0HinI4J2gSVh/zavwI5rveOJ7wkw3rdYKm3+sxZ7JleGD94uO63vgyD1MyGm
 YriQ==
X-Gm-Message-State: AOAM532aEgoaNF2obNonKNauNCD7cfaojHARu5hOGcNC602RJ9hTHYyl
 ZWooXthBel1QqVJ1Vm9kNO0=
X-Google-Smtp-Source: ABdhPJyXIxkH6O2Bd6Dpg4hkRhrQU6UkSZPfe9uFeLBtYL+S4vLkHA1PThDqujc4cOUgKeKWxe+v/Q==
X-Received: by 2002:a05:651c:2005:: with SMTP id
 s5mr11473619ljo.491.1615210140467; 
 Mon, 08 Mar 2021 05:29:00 -0800 (PST)
Received: from localhost.localdomain
 (ip-194-187-74-233.konfederacka.maverick.com.pl. [194.187.74.233])
 by smtp.googlemail.com with ESMTPSA id t7sm1394599lfd.180.2021.03.08.05.28.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Mar 2021 05:28:59 -0800 (PST)
Subject: Re: [PATCH v2 3/3] dt-bindings: mtd: Document use of nvmem-partitions
 compatible
To: Ansuel Smith <ansuelsmth@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, devicetree@vger.kernel.org,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20210216212638.28382-1-ansuelsmth@gmail.com>
 <20210216212638.28382-4-ansuelsmth@gmail.com>
 <ee596471-db9b-43e4-c085-9bd938101587@gmail.com>
 <YEUHsoC4V+H6PCHL@Ansuel-xps.localdomain>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Message-ID: <9ca010ed-930a-2387-2be1-18e3b558d83d@gmail.com>
Date: Mon, 8 Mar 2021 14:28:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <YEUHsoC4V+H6PCHL@Ansuel-xps.localdomain>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_132901_381473_D286A4BC 
X-CRM114-Status: GOOD (  17.70  )
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

T24gMDcuMDMuMjAyMSAxODowNCwgQW5zdWVsIFNtaXRoIHdyb3RlOgo+IE9uIE1vbiwgTWFyIDA4
LCAyMDIxIGF0IDEwOjQ4OjMyQU0gKzAxMDAsIFJhZmHFgiBNacWCZWNraSB3cm90ZToKPj4gT24g
MTYuMDIuMjAyMSAyMjoyNiwgQW5zdWVsIFNtaXRoIHdyb3RlOgo+Pj4gRG9jdW1lbnQgbnZtZW0t
cGFydGl0aW9ucyBjb21wYXRpYmxlIHVzZWQgdG8gdHJlYXQgbXRkIHBhcnRpdGlvbnMgYXMgYQo+
Pj4gbnZtZW0gcHJvdmlkZXIuCj4+Cj4+IEknbSBqdXN0IHdvbmRlcmluZyBpZiAibnZtZW0tcGFy
dGl0aW9ucyIgaXMgYWNjdXJhdGUgZW5vdWdoLiBQYXJ0aXRpb25zCj4+IGJpdCBzb3VuZHMgYSBi
aXQgYW1iaWd1b3VzIGluIHRoZSBtdGQgY29udGV4dC4KPj4KPj4gV2hhdCBkbyB5b3UgdGhpbmsg
YWJvdXQgIm10ZC1udm1lbS1jZWxscyIgb3IganVzdCAibnZtZW0tY2VsbHMiPwo+IAo+IEkgcmVh
ZCBzb21ld2hlcmUgdGhhdCBtdGQgaXMgbm90IHNvIHN0YW5kYXJkIHNvICJudm1lbS1jZWxscyIg
c2hvdWxkIGJlIHRoZQo+IHJpZ2h0IGNvbXBhdGlibGUuCj4gVG8gc3VtIHVwLCB3aXRoIHYyIEkg
c2hvdWxkIGNoYW5nZSB0aGUgY29tcGF0aWJsZSBuYW1lIGFuZCBqdXN0IHB1c2ggdGhlCj4gMiBh
bmQgMyBwYXRjaC4gKHdhaXRpbmcgeW91ciBmaXggdG8gYmUgYWNjZXB0ZWQpIENvcnJlY3Q/CgpZ
ZXMsIEkgYmVsaWV2ZSBzbwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
