Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C634C48291
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Feb 2024 06:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNdRYpgxS4+R6ue0K7RDj4LjMYWZm9z+D/GRL+RbG8g=; b=YuVZEAMp448+ey
	2utVk1iMZIbxlZHuI4dXxWIusNB4NGmSs5D/DhDg0Id33UQjBywBVoiPpJMyWeS8sXJDhNl514pVo
	kMSiHDy9dEVnFOz6oBNkEodsLznpVSO2oKVoqC55akSgmolSpXvpZYqa9ZpCTX8U5RskHMzrp6aDL
	VOaAVlE/X7YU7DgyL7hhRXUqAxk7gtSSsQ2mcnIKJ4foRke1liSgKPNtirBnj8yDPyGMkIRaTA0dl
	UjOHBktYBmy33MYAj+kjnPOoX7gOJKvkRU1UdGpqTLVY0/izoNRjNalx4YkuKDWjzWs4JS0FmW/Xg
	6tW/qJBmOOG5muE73MBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWs1P-000000028GP-0lBI;
	Mon, 05 Feb 2024 05:59:59 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWs1M-000000028Fv-4BC7
	for linux-mtd@lists.infradead.org;
	Mon, 05 Feb 2024 05:59:58 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-40fc654a56dso23324055e9.3
        for <linux-mtd@lists.infradead.org>; Sun, 04 Feb 2024 21:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707112794; x=1707717594; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D4WGTtDnR9E0SIUsmT5nVrBaDyipIOV2EYUhsssGies=;
        b=ek82JK/AV2LIt7BVm7GWZ1pQJ2dtdCJhAa3FuoF3YZIknkwOnNyoybo9S/KXm+nNWW
         YohY56uDXsZ6Qrp7s1324owjxda1H7PqFJoIas7aPpGe/AWFqdkhAv8oLaYbE1DoWyDP
         Pi0B1uSAlSZww/id7tHdBaGLkm7TKqZbKfZvRdLixdKlezYYakKPTGIG4jJEfFC66/YT
         bwjplU+tNwpuCPEAo2GjdKTezzxL2jIRa+9d7i/hQK8BHKJXLIet7SLFCGCO5TfJc1h1
         Ilaxi4oq75bw8qonIoKfAUKQ8pSVJ6L0WNsX1CsUj1anueDpu7DYxD0LRbdm3j4OujoR
         GC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707112794; x=1707717594;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D4WGTtDnR9E0SIUsmT5nVrBaDyipIOV2EYUhsssGies=;
        b=dXogkOXE4/Wgc0RfPJMn9vzLi/ZyHI3sjdDJmp+dG8AOU4IERG8XXlcoWsUtGIhd6n
         EIPDfmOuilvjLxi0gZuWQkCsIwN9tseXhpd47HGsU5UqvTQu7gvXVZlTkR8U+M5A1pIV
         p+0iuJk0l4gGWAyXKWv4FmwkSfa29QGJoey/aEBhpHKoebC3K/0rsj6jqEWi49f08QSD
         LtV8PgvtLgTjVSqu1dd2NiUYRySTJtYr2TcFfnEuIZKe85eJQlcA8dSdbSXQo+U9Tfan
         I4o+6RuI4+kmMROXcHDYaNcGFB98zI19kiEqUh7GBhqeHsB8W3DJU+8Q11jdnm9rXN1x
         8fUg==
X-Gm-Message-State: AOJu0YyPGIHaTmuAZ7Qek2JDP2pNdRnT1OwrENnVsqakR6mbng0rX8hs
	NiDGdFh5uV4oO1BDvpnwQnN/D+PzM29fBOJRhemadmT9YcTTMTvC0/k+0Jbnu54=
X-Google-Smtp-Source: AGHT+IGXn61jlSi4RvY14FatcobDmAkZsz7KOBqBLow2gctkyLnTk01XjZlKq0Rlq5qi7XkdKOgIhQ==
X-Received: by 2002:a05:600c:1f06:b0:40f:b45c:85a5 with SMTP id bd6-20020a05600c1f0600b0040fb45c85a5mr3748014wmb.22.1707112794700;
        Sun, 04 Feb 2024 21:59:54 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV0Guy3hR60V4XRRiHyi3xvJXeRWL0WVMj5UBTaXPBp6La3qE7+hNOK+/ZaH/nEm8ZhRs+B52jfKTNcnXiVG2oDcYZEpZMZD9bYG5OA4vhlpjFIgNRVnHPe1/iUOgKXjwnVH9j3bsx99ZdKtJIocyu4/Z5YCh1NpeeUrbfXD8M3c481o2xXa5ZG7Z3II9ujNQen1v7ebM9L9bgaUMVmMs/28Uc2UGO+GO7Z15ySltxf1bP81RBmtNoEVK3nE0ElTOb4UKVbHCuy9Icz
Received: from [192.168.0.173] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id h17-20020a05600c315100b0040fddec19d7sm135266wmo.0.2024.02.04.21.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 21:59:54 -0800 (PST)
Message-ID: <f84e5084-0750-41fe-aa08-33cd0a2575a6@linaro.org>
Date: Mon, 5 Feb 2024 07:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: rework struct
 spi_nor_erase_region
To: Takahiro Kuwano <tkuw584924@gmail.com>, Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, pratyush@kernel.org,
 miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 Bacem.Daassi@infineon.com, Takahiro Kuwano <Takahiro.Kuwano@infineon.com>
References: <cover.1705996635.git.Takahiro.Kuwano@infineon.com>
 <3911ebbfdb74ce938055eddcd34ca047e934c74d.1705996635.git.Takahiro.Kuwano@infineon.com>
 <c424d55002d9817e5b08f8995c321036@walle.cc>
 <e7e08fe6-ee44-4ac7-9ae8-dc36a92ea4cc@gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Content-Language: en-US
In-Reply-To: <e7e08fe6-ee44-4ac7-9ae8-dc36a92ea4cc@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_215957_093093_2F54EAF3 
X-CRM114-Status: UNSURE (   8.10  )
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

CgpPbiAwNS4wMi4yMDI0IDA2OjIxLCBUYWthaGlybyBLdXdhbm8gd3JvdGU6Cj4+PiDCoHN0YXRp
YyB1NjQgc3BpX25vcl9yZWdpb25faXNfbGFzdChjb25zdCBzdHJ1Y3Qgc3BpX25vcl9lcmFzZV9y
ZWdpb24gKnJlZ2lvbikKPj4+IMKgewo+Pj4gLcKgwqDCoCByZXR1cm4gcmVnaW9uLT5vZmZzZXQg
JiBTTk9SX0xBU1RfUkVHSU9OOwo+Pj4gK8KgwqDCoCByZXR1cm4gcmVnaW9uLT5mbGFncyAmIFNO
T1JfTEFTVF9SRUdJT047Cj4+PiDCoH0KPj4gRG8geW91IHRoaW5rIHdlIGNhbiBnZXQgcmlkIG9m
IHRoaXMsIHRvbz8gSnVzdCBzYXZlIHRoZSBudW1iZXIKPj4gb2YgZXJhc2UgcmVnaW9ucyBpbnN0
ZWFkIG9mIGhhdmluZyB0aGlzIGZsYWcuIElJUkMgVHVkb3IgaGFkIGFsc28KPj4gc3VnZ2VzdGVk
IHRoaXMuCj4+Cj4gWWVzLCBJIHdpbGwgcmVtb3ZlIHRoaXMgYW5kIHJld29yayByZWxhdGVkIGZ1
bmN0aW9ucy4KPiAKPiBJZiB3ZSByZW1vdmUgdGhpcyBmbGFnLCB0aGUgU05PUl9PVkVSTEFJRF9S
RUdJT04gd2lsbCBiZSBvbmx5IG9uZSBmbGFnLgo+IEhvdyBhYm91dCByZW1vdmluZyB0aGUgU05P
Ul9PVkVSTEFJRF9SRUdJT04gYXMgd2VsbCwgYW5kIGNoYW5nZSAncmVnaW9uLT5mbGFncycKPiB0
byBhIGJvb2wgdmFsdWUgbGlrZSAncmVnaW9uLT5vdmVybGFpZCc/Cgpzb3VuZHMgZ29vZCwgeWVz
LiBUaGFua3MhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
