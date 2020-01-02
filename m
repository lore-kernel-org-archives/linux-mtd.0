Return-Path: <SRS0=/21v=2X=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF4CEC2D0C2
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 18:41:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1B9321582
	for <linux-mtd@archiver.kernel.org>; Thu,  2 Jan 2020 18:41:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MaTnUWQU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pFuW53PY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1B9321582
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=79FgZKaPx2bQbKqlR7PR58U9vBdU/pwy/Wz8V6nxd9U=; b=MaTnUWQUke3+6O
	BpAL0WyUroSiGmuGHu6tlKnU0yWhsD/NsWYtMhEhj3vxiy4u6NgTdAcOVdcCV5q7CcT5yN4Gf8369
	UX8dL30S4p8REqCGB90fy/11N3eDSq3OFaITl/cIM6A8hFFR1KenAK58EDlh4aJKY/O3Lh/c6+Hho
	7MiHQRexLvjlk/rlRe+Mu+g6cQMhmHr5yX4YupVDpxszjMdx+prraj/dxkEG+FfVIvLXJCHm4ODjn
	curfdEYT45sOb0D6Kc39zmXb1D75lhR/OqBTmi0PUAXhNGELMT9u8gPZhY40yWZ3Lx0KWQRIS6pxQ
	gILh6CAfq2s1JKytJNDA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1in5PQ-00056i-CP; Thu, 02 Jan 2020 18:41:24 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1in5PN-00056N-TA
 for linux-mtd@lists.infradead.org; Thu, 02 Jan 2020 18:41:23 +0000
Received: by mail-ed1-x541.google.com with SMTP id l8so39881556edw.1
 for <linux-mtd@lists.infradead.org>; Thu, 02 Jan 2020 10:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=xysnekgfJ5A6PW+Fa89ON2UdzeB6n5EF0/dNZZi8thM=;
 b=pFuW53PYcZT1JCpqJtrtHIQD58i8XMToJPLA+fEhNS5SvaiK4mJLyNLmgBgKxkERbY
 8UhVP/dJG6bWh/fm9T2R4GpBVlTOYYHpXmcb6hSo5/QE6mDuTCMq9uyf9oyoz7mirZKg
 TwnSSB9Ii2GBMSrwSk0fJIuL0UFavN+CM2AozcDGrmeR/ExO2f0WxClV/ZZ0bnjBhdKV
 ej2Ty6cJnpEpO//IYuuLmRlTPpkWFbGfw3aQdn8kozjH9jq4+S53cB4I34+JUhoOGG3l
 Dzc8l9u0TzEVuh2X6snaMEP/NcHcZ4BreJOX4PCfT7NMCHmhN97C0E+buEi7VjTPt6XG
 y56A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=xysnekgfJ5A6PW+Fa89ON2UdzeB6n5EF0/dNZZi8thM=;
 b=MZ4bn7R1Io4SHmfx5PxRx1MoFuST/7KnbCR8K3LaXRRWDi3TmzZc+y0KdTDmOrf97G
 hlP3jE6HNlddG71SSXqFhkvRHDVinsh6wpm7SRHDiVO3xaXAPF5I4FwYB0dqrfsJFd5C
 nvtf2eBY8WN3eCe7V7V7/ruht8B7jWVCiVtx92U2nvd7fY7c/qVTC9BqFFz/Rjn3pJDf
 fpCcW6ZC7wJBUDBXFIlBR4d3CUfQ4wDOQM145PysusFwupFFZQ6aNkZyNRTsQ/RaiJrm
 MpVAi+qXdWBavUocMByOLP7zRW4/2Gk1McnYke1mjlkkCMpaI1lRL2DizpPKH/AKO8E5
 wSiA==
X-Gm-Message-State: APjAAAXO7zfiy8g7coEYSwf4jYY9lDt7DNj5iyGhLu+q0GELLURkfptH
 CFWl9RdRS6vAdbfrhu9dUwY=
X-Google-Smtp-Source: APXvYqypRP80Zw4aY4g0YBNWwJ6Cvs8slqoUK5vn55x0biZZ1nbPgEgbYBpUFpwKBy3b/hbQoQz9iQ==
X-Received: by 2002:a17:906:8299:: with SMTP id
 h25mr60444957ejx.128.1577990479536; 
 Thu, 02 Jan 2020 10:41:19 -0800 (PST)
Received: from [10.67.50.49] ([192.19.223.252])
 by smtp.googlemail.com with ESMTPSA id d19sm6915477ejd.21.2020.01.02.10.41.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 02 Jan 2020 10:41:18 -0800 (PST)
Subject: Re: [RFC PATCH 0/3] Fix proposal for the Micron shallow erase issue
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>, linux-mtd@lists.infradead.org
References: <20191231192656.16376-1-miquel.raynal@bootlin.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Autocrypt: addr=f.fainelli@gmail.com; prefer-encrypt=mutual; keydata=
 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
 G10n8gCguORqNGMsVRxrlLs7/himep7MrCc=
Message-ID: <a2199251-882a-5067-fe4c-47f1c8a252fe@gmail.com>
Date: Thu, 2 Jan 2020 10:41:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191231192656.16376-1-miquel.raynal@bootlin.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200102_104121_973630_FB5AAC8F 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: Zoltan Szubbocsev <zszubbocsev@micron.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, tglx@linutronix.de,
 Piotr Wojtaszczyk <WojtaszczykP@cumminsallison.com>,
 Bean Huo <beanhuo@micron.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTIvMzEvMTkgMTE6MjYgQU0sIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gSGVsbG8sCj4gCj4g
QWZ0ZXIgYSBmaXJzdCBwcm9wb3NhbCBieSBUaG9tYXMgR2xlaXhuZXIgYW5kIHRoZW4gYW5vdGhl
ciBwcm9wb3NhbCBieQo+IEJlYW4gSHVvIChNaWNyb24pLCB0aGlzIGlzIGFuIGF0dGVtcHQgdG8g
bWFpbmxpbmUgdGhlIGZpeCBmb3IgTWljcm9uJ3MKPiAic2hhbGxvdyBlcmFzZSIgaXNzdWUuIElN
SE8gdGhpcyBpcyBhICJwcmV0dHkgd2F5Iiwgbm90IHNvIGludmFzaXZlLAo+IHdpdGggYSBsaW1p
dGVkIHBlcmZvcm1hbmNlIHBlbmFsdHkuCj4gCj4gSXQgaGFzIG9ubHkgYmUgKmNvbXBpbGUtdGVz
dGVkKiBhbmQgdGhpcyBpcyBqdXN0IHRvIGtub3cgaWYgdGhlCj4gYXBwcm9hY2ggaXMgZmluZSBv
ciBub3QsIHRoZW4gSSB3aWxsIG9wdGltaXplLCBtYXliZSByZXdyaXRlIGEgYml0IGFuZAo+IGZv
cmNpYmx5IChhc2sgdG8pIHRlc3QgaXQuCj4gCj4gSGFwcHkgbmV3IHllYXIhCj4gTWlxdcOobAo+
IAo+IAo+IE1pcXVlbCBSYXluYWwgKDMpOgo+ICAgbXRkOiByYXduYW5kOiBBZGQgdGhlIG5hbmRf
Y2hpcC0+ZXJhc2UgaG9vawo+ICAgbXRkOiByYXduYW5kOiBBZGQgdGhlIG5hbmRfY2hpcC0+d3Jp
dGVfb29iIGhvb2sKPiAgIG10ZDogcmF3bmFuZDogbWljcm9uOiBBZGRyZXNzIHRoZSBzaGFsbG93
IGVyYXNlIGlzc3VlCj4gCj4gIGRhdGFfYnVmICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAy
OTA5OSArKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZGF0YWJ1ZiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB8IDI5MDk5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKwoKVGhvc2Ug
dHdvIGZpbGVzIGFib3ZlIHNob3VsZCBwcm9iYWJseSBub3QgYmUgcGFydCBvZiB0aGUgcGF0Y2gg
c3VibWlzc2lvbi4KLS0gCkZsb3JpYW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
