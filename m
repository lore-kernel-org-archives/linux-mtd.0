Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF998C282EC
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Mar 2025 14:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AKRbcMjV3c3g9X/MZmuXSfEuF4VvNOrGadEcdPIOGfQ=; b=2tbymwBDjlbmyS
	gTFjt+Y8DUbY/uQMAx7MBJZOkhj3z3eg5r1VvtgJi5c5nXsrAbOCU47pL4otG79rMFEHSlhyglvv+
	nQcKz0fQczHc7SfLxYsLNlCDPJFT6hkMxJzWP6W4qLOFxEF4kK2kePpjo77MaUyZE5W69fLGMwUdk
	7v1hdyToLeofLYZWzCvP7HPTHMryDt7V9vn/c+usm3GUqDnhUHsZ3OQA0IZdYLO28yKG/inZRoeJ8
	wSiTOwb6IijIYQ/RxxF6RfhWK1HO7fhZ1n8jCrbuGR3ICERgDfc+xc9Ot1ew2w/yOZ3i2n8znu7IV
	G48w2eRVrfb4ksCVfgzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCQJ-0000000BEK2-0yzZ;
	Thu, 06 Mar 2025 14:42:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqCQG-0000000BEJV-3jgr
	for linux-mtd@lists.infradead.org;
	Thu, 06 Mar 2025 14:42:06 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ac1f5157c90so121428366b.0
        for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2025 06:42:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741272123; x=1741876923; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KzC8U5Vx4XxENcWpcmaqiUt/gKOGnuEvw78Wov3AGl0=;
        b=xkCpVSNI0mAxx0jh9xiLNghjySKFK+HUSF5rExImYhVnF/eEKwwbEuwNzy1jnjFEhi
         vZe+T1XfDSgoV3bWfxw9147Qz3mVAlbKAadOvMywrNxualxZEgqccx4k5jTaKmn4Iww3
         IrshFSniiyq0JxnUqpn/fLcYRVsDGD7ULmidRTkUd8uAbc4XgLG/e7FZ+g34KOU1uaKq
         LV1j3E/U/3JVzGS44PhJmkLTKOA/xwMRKF1c6eZJlJ5hY3DjEg5jtPNdYVUrnHMrGEAY
         uQVRMpXrSWN7eP9ZjV+/hkPmFv3RS3q4yG8paRKcyJdipjYoD69QYPcYawgV+FKRPmtN
         z3tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741272123; x=1741876923;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KzC8U5Vx4XxENcWpcmaqiUt/gKOGnuEvw78Wov3AGl0=;
        b=NfE3G6sH5pWwo/jDvHcpqJPROfxFamBFJuaksLBkMm5Kybf4tza82HSmx4VauqcMq2
         yL+t90U4wvnvqemxcLldihmP3jt2EY+AOl54+cf20anfRo1QPE41IbZr/za4P8RZqns9
         IaR00MvZM3A1UEfTf0Mzj4l1LC1Zz8k6bz+Pk7thTqNxRhcJkntOCcnMVZvgEV7p5klc
         DUTIzxcxBdrG9Cb6mxaGx9aGNhHnOCsRZFcY72CiGB9UEFW/fqeY3H/uR18vZvT3yCSZ
         86nCTjfm+EXnPbFUfdLJfBVY0kSP5tRpCkKnZCpWLnGMgF4+OVe+4PWiyz3oI2rwo6rU
         K8mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnEfssX2jRtplQPAuZEfxRbqKZKzKc7OTd1gMnOH/7Nrkg9mDtC5oVrX62nnAjRK33nvHGL+ZGZvc=@lists.infradead.org
X-Gm-Message-State: AOJu0YydsK9y03K1VCw7dDrq1LywxO+SKSHVo6EDP6b1zpCnAU7JPqbT
	UGUk1A8l0HknmDizF8DM7PzuPGiPCZEPOjKF144PNfkFLZ7t67Fm3GK7Q4CR3p0=
X-Gm-Gg: ASbGncs5edF6NJIcpYB6barQRvF4IxqdtGYd65jQrHXoCWkIWf6ZUOpA0KbsWmMIcLc
	Xpa1Svy5bUIKuGkKkI2K4VYktH5JCaB5gBKU2Ecc48HKw7h963H5EjIFRwJratr3AENzu2dwTu/
	ib1wRXXKg5gNx+ZZC01Op3892T7iZeGkhKWorxk5p3gv4hKbSAXll8m5ZF/G+Rj1Wb6qvddMXkL
	nOFAGvSg6H/A/su0Jf3DzWoLiVM8kqA55KTxVh11Nkm/TgW3+TOct85RwmIl9UoBHmD1HhKqs0S
	T1e7qSe1Djo5ErU4dnttmweGmg/0ynC9AqWG4rsH1Yw81HNMeCneYQ==
X-Google-Smtp-Source: AGHT+IHfceypMXflxij/F6RMQ9oZmVEMDniJh1Ac33s6vhrs2mCfTc4dmPRbZTDckaO3mSjcRB0VJQ==
X-Received: by 2002:a17:907:d92:b0:abf:4bde:51b1 with SMTP id a640c23a62f3a-ac20d9e8f1cmr619555866b.21.1741272122939;
        Thu, 06 Mar 2025 06:42:02 -0800 (PST)
Received: from [192.168.0.14] ([79.115.63.206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac2390fe76csm106804366b.0.2025.03.06.06.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Mar 2025 06:42:02 -0800 (PST)
Message-ID: <d674f1bc-b596-46d5-b56d-1e2fb509c684@linaro.org>
Date: Thu, 6 Mar 2025 14:42:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: macronix: Add post_sfdp fixups for
 Quad Input Page Program
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: pratyush@kernel.org, mwalle@kernel.org, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, alvinzhou@mxic.com.tw, leoyu@mxic.com.tw,
 Cheng Ming Lin <chengminglin@mxic.com.tw>
References: <20250211063028.382169-1-linchengming884@gmail.com>
 <20250211063028.382169-2-linchengming884@gmail.com>
 <e5458a0e-528f-44ec-a0f0-543472ad3b85@linaro.org>
 <bb9f8a80-4662-4ab1-b9ad-6899977c3827@linaro.org>
 <CAAyq3SamyhtCkd47939dKWCZN3ejaDvM6EJzwizWVqhNW=27bA@mail.gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAAyq3SamyhtCkd47939dKWCZN3ejaDvM6EJzwizWVqhNW=27bA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_064204_934168_252B1F09 
X-CRM114-Status: GOOD (  10.75  )
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

CgpPbiAzLzYvMjUgMTE6MzkgQU0sIENoZW5nIE1pbmcgTGluIHdyb3RlOgo+IEhpIFR1ZG9yLAo+
IAo+IFR1ZG9yIEFtYmFydXMgPHR1ZG9yLmFtYmFydXNAbGluYXJvLm9yZz4g5pa8IDIwMjXlubQz
5pyINuaXpSDpgLHlm5sg5LiL5Y2INzowMeWvq+mBk++8mgo+Pgo+Pgo+Pgo+PiBPbiAyLzExLzI1
IDc6MjAgQU0sIFR1ZG9yIEFtYmFydXMgd3JvdGU6Cj4+PiBPbiAyLzExLzI1IDY6MzAgQU0sIENo
ZW5nIE1pbmcgTGluIHdyb3RlOgo+Pj4+ICAgICAgICAgICAgICAuZml4dXBfZmxhZ3MgPSBTUElf
Tk9SXzRCX09QQ09ERVMsCj4+Pj4gKyAgICAgICAgICAgIC5maXh1cHMgPSAmbWFjcm9uaXhfcXBw
NGJfZml4dXBzLAo+Pj4gRm9yIHlvdXIgbmV4dCBwYXRjaCB0aGF0J2xsIGRyb3AgdGhlIHJlZHVu
ZGFudCBmbGFzaCBpbmZvIGZpZWxkcywgeW91Cj4+PiBjYW4gZHJvcCBTUElfTk9SXzRCX09QQ09E
RVMgYXMgd2VsbCBpZiB0aGVzZSBmbGFzaGVzIGRlZmluZSB0aGUgNGJhaXQKPj4+IHNmZHAgdGFi
bGUuCj4+Cj4+IEFueSBwbGFuIGluIGRvaW5nIHRoaXMsIHBsZWFzZT8KPiAKPiBTb3JyeSBmb3Ig
dGhlIGxhdGUgcmVwbHkuCj4gCj4gVGhpcyBtYXR0ZXIgaXMgY3VycmVudGx5IGluIHByb2dyZXNz
LiBTaW5jZSBjb2xsZWN0aW5nIGFsbCB0aGUgY2hpcHMKPiB3aWxsIHRha2Ugc29tZSBtb3JlIHRp
bWUsIHRoZSBwcm9qZWN0IGhhcyBiZWVuIGRlbGF5ZWQuIE9uY2UgSQo+IGhhdmUgYWxsIHRoZSBj
aGlwcywgSSB3aWxsIHN0YXJ0IHRoZSB2ZXJpZmljYXRpb24gcHJvY2VzcyBpbW1lZGlhdGVseS4K
PiBUaGFua3MgZm9yIHRoZSByZW1pbmRlci4KPiAKClRoYW5rcywgQ2hlbmcuIFN3aXRjaGluZyB0
aGVtIG9uZSBieSBvbmUgaXMgZmluZSB0b28uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBs
aXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRk
Lwo=
