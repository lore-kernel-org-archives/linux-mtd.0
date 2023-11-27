Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5F0C4167B
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Nov 2023 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UJ5b6g8VkLPOJVUymIWunV7aCIbIVqjoouneLLsVagI=; b=hdGAW3+nSZeRgJ
	SppcCAF2ybqX7glalI+J6GOb6l8LBlxW9QKDytzrnbOTA8wkSYOd80NehS7saTwS3TUaSK2LK3pFX
	sQ/1PJHKu6qtYXOHvD/7rbk9dvWLoMQzqWPjXCK5PN6J88wgound0vXq0I2RPgS5CpI7hY3ElHfsU
	NfuXD0yBnQP27owu8bMNMQFQcCtgmSxO3IctbffaVm9ptMYtXg/CPk2VOPCl0+lrHOoOePxhVx5uY
	TUYAiKmDTbCLgbajkt0z8ypJgKMoTWOhHiGyv/GRz3ANu6CAjHkXwMB+ebgipFMIufPDJw2qc2RVl
	kOKHMhWJkDV2tEKitw2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7dQG-002nDQ-1C;
	Mon, 27 Nov 2023 15:21:20 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7dQC-002nCr-2q
	for linux-mtd@lists.infradead.org;
	Mon, 27 Nov 2023 15:21:18 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-332e7630a9dso2402879f8f.1
        for <linux-mtd@lists.infradead.org>; Mon, 27 Nov 2023 07:21:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701098474; x=1701703274; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6E3sBDYxbrjQsj/Gw+Bxc1zZCI4IOCH0DU50frkMOME=;
        b=HHX7YwIrWpFBWb7jVxYid72VSzbQJAWEHY0+ujgPr6xMPimApFkp4wJhydqmqZoA7l
         baXjoh4Oa992oLYQ1mFpZP3UuXp/hNWFht8e160frTBQcAYXhRAMKcUB4m+m9E/XrLO0
         Ir4Udb9QpOKDjFXpfVVg4EHvz1RWMge513DqwkaeC+DLgYKwVuVkIWTiVwLtvSB2rEaX
         irU4vtDofYDUK7HxQh4V10PwMgwNt0JXu+l2PKx+IHBkjg/qZlSfdGEUg3fKYXUivRjq
         G7qR5gERevwvnPp6TmDf7SdG3zB5xaErBqbP4M4m150X95q/EqmmuOxWbK7y784RbC5M
         m/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701098474; x=1701703274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6E3sBDYxbrjQsj/Gw+Bxc1zZCI4IOCH0DU50frkMOME=;
        b=Zb4WUUHr+dzepdhtMZLzvzNUMlDPZf0Do0X3wCiwj5nrAwkeobgQcddahFwRo/1Ozz
         sKoRfzrSiVF9GhmIUW6GPducMRwAoRBwuZ1iuoholfyk1XcFDHpe2h5HhCMbh1BNN65J
         uIWc6Vh7UgwWOI+PrFDIwlOHInu+Cel+ewkAHXtwZxCXmUey3UOl0fkqOSv5P5p1OJ4q
         2BvbiGC8qgtkUzTBaoJbp0Pcviw7+V7nlER8MjQvSU3VN+K4jtanplVMCuHmYxNEBuzt
         kFfGDn0TEIjxtwsu4KMS1bYGK64maINd6hyVEeW49RcVSuwv2UneLhya696yhj+BPH1x
         wzTg==
X-Gm-Message-State: AOJu0YzVfYj7NvlLP30TDR5MwkDTRY7aWPS8T3dJU3v7NGh95RiuK+nd
	bAmW/Ygg7QcH0LVWcDXv8Jt2MQ==
X-Google-Smtp-Source: AGHT+IFT6i47Tj9zfJZsHb4r7itfp3bNwYgP1Yz2aDqDc6eN003fgd/jF8Pm4R03OI8+miH1pxKLwA==
X-Received: by 2002:a5d:488f:0:b0:333:19b:d32e with SMTP id g15-20020a5d488f000000b00333019bd32emr1742046wrq.56.1701098474646;
        Mon, 27 Nov 2023 07:21:14 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.75])
        by smtp.gmail.com with ESMTPSA id y14-20020adff6ce000000b0033308db2576sm415271wrp.56.2023.11.27.07.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Nov 2023 07:21:14 -0800 (PST)
Message-ID: <e34cc75e-3060-459f-bf09-2f2b3d99678d@linaro.org>
Date: Mon, 27 Nov 2023 15:21:12 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] mtd: spi-nor: hide flash name when the flash name
 does not exist
Content-Language: en-US
To: Michael Walle <michael@walle.cc>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jaime Liao <jaimeliao.tw@gmail.com>, linux-mtd@lists.infradead.org,
 pratyush@kernel.org, leoyu@mxic.com.tw, jaimeliao@mxic.com.tw
References: <20231127100756.41605-1-jaimeliao.tw@gmail.com>
 <20231127100756.41605-3-jaimeliao.tw@gmail.com>
 <6d362dd698095b04dd895019d3af26d0@walle.cc> <20231127154737.534db375@xps-13>
 <848f3b2e83d363fd69adfc947b197011@walle.cc>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <848f3b2e83d363fd69adfc947b197011@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_072116_923206_BCC0C499 
X-CRM114-Status: GOOD (  16.76  )
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

CgpPbiAxMS8yNy8yMyAxNDo1NiwgTWljaGFlbCBXYWxsZSB3cm90ZToKPiBIaSwKPiAKPj4+ID4g
KG51bGwpIHdpbGwgcHJpbnQgd2hlbiBmbGFzaCBJRCBmb3VuZGVkIGluIElEIHRhYmxlIGJ1dAo+
Pj4gPiB0aGUgZmxhc2ggbmFtZSBkaWRuJ3QgaW5jbHVkZSBpbiBpdC4KPj4+ID4KPj4+ID4gTWFr
ZSBpbmZvLT5uYW1lIG9wdGlvbmFsIGluIHRoZSBwcmludCBmb3Igc2hvd2luZyBmbGFzaCBuYW1l
Cj4+PiA+IGFuZCBmbGFzaCBzaXplLgo+Pj4gPgo+Pj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWltZUxp
YW8gPGphaW1lbGlhb0BteGljLmNvbS50dz4KPj4+ID4gLS0tCj4+PiA+wqAgZHJpdmVycy9tdGQv
c3BpLW5vci9jb3JlLmMgfCAyICstCj4+PiA+wqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCj4+PiA+Cj4+PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYyBiL2RyaXZlcnMvbXRkL3NwaS1ub3IvY29yZS5jCj4+PiA+IGluZGV4IDFj
NDQzZmU1NjhjZi4uNzM0MDViZWQyYTVhIDEwMDY0NAo+Pj4gPiAtLS0gYS9kcml2ZXJzL210ZC9z
cGktbm9yL2NvcmUuYwo+Pj4gPiArKysgYi9kcml2ZXJzL210ZC9zcGktbm9yL2NvcmUuYwo+Pj4g
PiBAQCAtMzUxOCw3ICszNTE4LDcgQEAgaW50IHNwaV9ub3Jfc2NhbihzdHJ1Y3Qgc3BpX25vciAq
bm9yLCBjb25zdAo+Pj4gY2hhciA+ICpuYW1lLAo+Pj4gPsKgwqDCoMKgwqAgLyogTm8gbXRkX2lu
Zm8gZmllbGRzIHNob3VsZCBiZSB1c2VkIHVwIHRvIHRoaXMgcG9pbnQuICovCj4+PiA+wqDCoMKg
wqDCoCBzcGlfbm9yX3NldF9tdGRfaW5mbyhub3IpOwo+Pj4gPgo+Pj4gPiAtwqDCoMKgIGRldl9p
bmZvKGRldiwgIiVzICglbGxkIEtieXRlcylcbiIsIGluZm8tPm5hbWUsCj4+PiA+ICvCoMKgwqAg
ZGV2X2luZm8oZGV2LCAiJXMgKCVsbGQgS2J5dGVzKVxuIiwgaW5mby0+bmFtZSA/OiAiIiwKPj4+
Cj4+PiBNYXliZSBwcmludCB0aGUgamVkZWMgaWQgaWYgdGhlIG5hbWUgaXMgZW1wdHkuCj4+Cj4+
IFdoYXQgYWJvdXQgYWx3YXlzIHByaW50aW5nIHRoZSBqZWRlYyBpZCBpZiBuYW1lcyBhcmVuJ3Qg
cmVsaWFibGUKPj4gZW5vdWdoPwo+IAo+IEknbSBmaW5lIHdpdGggdGhhdCwgdG9vLiBBY3R1YWxs
eSBJJ3ZlIGNvbnNpZGVyZWQgdGhhdCBteXNlbGYsIGJ1dAo+IG1heWJlIFR1ZG9yIG9yIFByYXR5
dXNoIHdhbnQgdG8ga2VlcCB0aGUgb3V0cHV0IGJhY2t3YXJkcyBjb21wYXRpYmxlLgo+IAoKV2Ug
d29uJ3QgcmVtb3ZlIHRoZSBuYW1lcyBmb3IgZmxhc2hlcyB0aGF0IGFscmVhZHkgaGF2ZSBhIG5h
bWUgZGVmaW5lZCwKd29uJ3Qgd2U/IFdlIGp1c3QgZGVwcmVjYXRlIHRoZSBuYW1lIGZpZWxkIGFu
ZCBub3QgdXNlIGl0IGFueW1vcmUgd2l0aApuZXcgZmxhc2ggYWRkaXRpb25zLiBObyBiYWNrd2Fy
ZCBjb21wYXRpYmlsaXR5IHByb2JsZW0uCgpCVFcsIHRoYXQgcHJpbnQgc2hvdWxkIGJlIGxvd2Vy
ZWQgdG8gZGV2X2RiZywgbGV0J3Mgbm8gbG9uZ2VyIHBvbGx1dGUKdGhlIGtlcm5lbCBsb2cuIERy
aXZlcnMgc2hvdWxkIGJlIHF1aWV0IGlmIGFsbCBnb2VzIHdlbGwuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
