Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14426C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 09:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LUFihDIHPBqDpYbIP+n3pmrBSD6pd1nymakASnAXoAc=; b=NmMdNn5IxzKlDP
	Qk3kB1qDieasEQ4FQgY8grC2Tz8VDtqZFxSnF+kWEAVX0Q0wT+nnsvyy33YzyzAP/nUr0jO+VLuTB
	JJC0oU2KHrwsxMVlVNTOB32McHaXFNRGp+N7XvDI0/gHGwkWJ6joUvNNYgpt26sW8kHX3CPISw89x
	Gx2lcn2cWAM5pbzVSiv5s7AxDK6uNm7ZaF2R/rvDKEhx99FowLIFNyBRxBAD/VW7hCgscXVs1Byf8
	CVdMXEJz3fEhH8DJvnV/kxC2xmWbZbNw8ZvIoBnQtTkcseYOJNQry0eG01bqb1f+qeWpbpHbkwXkk
	BRks1ldGomVgweHUQJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqcg-0080dH-Mt; Mon, 11 Apr 2022 09:46:14 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqcP-0080UT-LF
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 09:45:59 +0000
Received: by mail-wr1-x429.google.com with SMTP id u3so22162949wrg.3
 for <linux-mtd@lists.infradead.org>; Mon, 11 Apr 2022 02:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=b198qKsCSPH7gfzfy4u2xyvLQAEiRiVMpS7bpZx+ZSY=;
 b=M9qpF7g3cWBcjHdulSQYqLsv06hF4R0iYCQJJX0pkjMFCXhA4luKWRawmUycgMrvX9
 mtEGikRv4pcZj6KrQHU8V4zTNqqYQHNnRguM/U6uMQRFE8dLmM7GhHMi2XNs9kZyoGBe
 A57W2slA1xmXVYstxt2IeRfzzPt0ANQJg1vGpUYbczjLERHh5WXlDCr/lXkDajg13opX
 R0PS3l8/MgFGHpS+Av2vwwEDCHWGkOHB/0854XB7aqkxrvwnBWCF/i2IQBzEwju2A32f
 wRm6f6A1+mqOvweF1OWt3SKtK/mWSa2vBwAsxDktRLQZHh2wokgftvQagHj1egEtsbqt
 omQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=b198qKsCSPH7gfzfy4u2xyvLQAEiRiVMpS7bpZx+ZSY=;
 b=yCGrR9yMVnR+fTTrPlVRFhk4KIyuCa01eNk9xC+yEj0G6VRDHXJLcmMXm3vyPsShOs
 9pQiX4kQcI7l+s2HzQV1suojBzGGw8Vm9aqqj255tcEy/HCFZMWLACRlJQKQ2muQL/q7
 QOBbXNy1GGF2/VRwULHQfYyZYIPnNW+MSkOV8lHCYTk+dWyIij4hJKmr8/kYh91Pjtv4
 2uM17enkmoxneSjarKmuFR5Y1C+EmWeUBR9/WmerimqNb6apB7/EeppWMVymB7jKEnCJ
 Km4nQyXVi5TKsS9WJWAk9MgdCAq1Hd0CskeIjvTRETwlkLKFwfF+2qqGydH6Dt0G7F4F
 /MjQ==
X-Gm-Message-State: AOAM532Qc6ZlB2baQ171CBPYhIF4bouUNy1a5e4liz1IM6myb6O06Tx3
 RTBrrxF1deNL7ThTyySHnLuYlQ==
X-Google-Smtp-Source: ABdhPJzkysCMQKH2AW06DpYoYdftSbMItpy/7K4EcBy9BwM+dIOakJTfvnbTDNO+5DO5ZE5DJ+FWzg==
X-Received: by 2002:adf:f981:0:b0:205:c3e1:9eba with SMTP id
 f1-20020adff981000000b00205c3e19ebamr24699249wrr.244.1649670355449; 
 Mon, 11 Apr 2022 02:45:55 -0700 (PDT)
Received: from [192.168.86.34]
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a056000144f00b002079acb2349sm7618565wrx.1.2022.04.11.02.45.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 02:45:54 -0700 (PDT)
Message-ID: <e6343890-2c8c-ea83-636a-61230a1e1759@linaro.org>
Date: Mon, 11 Apr 2022 10:45:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] nvmem: add driver handling U-Boot environment
 variables
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Tom Rini <trini@konsulko.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 u-boot@lists.denx.de, devicetree@vger.kernel.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20220411085926.10925-1-miquel.raynal@bootlin.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20220411085926.10925-1-miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_024557_722192_67D4DC72 
X-CRM114-Status: GOOD (  10.82  )
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

CgpPbiAxMS8wNC8yMDIyIDA5OjU5LCBNaXF1ZWwgUmF5bmFsIHdyb3RlOgo+IE9uIFdlZCwgMjAy
Mi0wNC0wNiBhdCAxNDozMjoyNSBVVEMsID0/dXRmLTg/Yj9VbUZtWWNXQ0lFMXB4WUpsWTJ0cD89
IHdyb3RlOgo+PiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+Cj4+Cj4+
IFUtQm9vdCBzdG9yZXMgaXRzIHNldHVwIGFzIGVudmlyb25tZW50IHZhcmlhYmxlcy4gSXQncyBh
IGxpc3Qgb2YKPj4ga2V5LXZhbHVlIHBhaXJzIHN0b3JlZCBvbiBmbGFzaCBkZXZpY2Ugd2l0aCBh
IGN1c3RvbSBoZWFkZXIuCj4+Cj4+IFRoaXMgY29tbWl0IGFkZHMgYW4gTlZNRU0gZHJpdmVyIHRo
YXQ6Cj4+IDEuIFByb3ZpZGVzIE5WTUVNIGFjY2VzcyB0byBlbnZpcm9ubWVudCB2YXJzIGJpbmFy
eSBkYXRhCj4+IDIuIEV4dHJhY3RzIHZhcmlhYmxlcyBhcyBOVk1FTSBjZWxscwo+Pgo+PiBJdCBj
YW4gYmUgdXNlZCBmb3I6Cj4+IDEuIEFjY2Vzc2luZyBlbnYgdmFyaWFibGVzIGZyb20gdXNlci1z
cGFjZQo+PiAyLiBSZWFkaW5nIE5WTUVNIGNlbGxzIGJ5IExpbnV4IGRyaXZlcnMKPj4KPj4gU2ln
bmVkLW9mZi1ieTogUmFmYcWCIE1pxYJlY2tpIDxyYWZhbEBtaWxlY2tpLnBsPgo+IAo+IEFwcGxp
ZWQgdG8gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbXRk
L2xpbnV4LmdpdCBtdGQvbmV4dCwgdGhhbmtzLgoKSGkgTWlxdWVsLAoKQW55IHJlYXNvbiB3aHkg
dGhpcyBudm1lbSBkcml2ZXIgaXMgdGFrZW4gdmlhIG10ZCB0cmVlPwoKVGhpcyBpcyBnb2luZyB0
byBjb25mbGljdCB3aXRoIG90aGVyIG52bWVtIHBhdGNoZXMgdGhhdCBhcmUgdG91Y2hpbmcgCktD
b25maWcgYW5kIE1ha2VmaWxlCgoKLS1zcmluaQo+IAo+IE1pcXVlbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
