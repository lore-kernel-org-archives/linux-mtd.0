Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 562C0C83F10
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 15:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MQKVH2rfeKKP5g247bKDTi7zixPe4+Zde+DVxUh0y9M=; b=ulEb6GOP+2Ohtn
	Q0Hco+IuXkA3R7+rz3gK8ItgfIV5oqBSSOn+xK/28rQlyzArZQNoRx5yR0H6d1xSPDHRfIZyvcmcs
	PyzDq1Gp564MeBG6haYXJfzhERBEdSfTw8obo7v74yhWPYnbdbwenIDpSNPa+kfwh1DaD//qfy+oy
	BFiEQzDId2e4hqvmzuga0RrQHYabYPyLQt94suPeg7T8WZunW4SRgpmd7XseVM2/lVXyexsiyIyDA
	GdOfgO4y1HGVO6tS93g5cYI1FMwcKQcQyGz26pXJVhIKUSf8bHsxxQuuQRy1vJcJFiQApkYOLXa7k
	UvlUEkjn5l4crTvSFCsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbjcu-00FVa3-1b;
	Thu, 31 Aug 2023 15:30:32 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbjcs-00FVZe-1W
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 15:30:31 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so17218081fa.3
        for <linux-mtd@lists.infradead.org>; Thu, 31 Aug 2023 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693495826; x=1694100626; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kxsD0oSFXtrM1VIFh9Pfyj0ucBTkbmmP9YmAH7jRKLc=;
        b=aKX93IeLDEFAS7fgdBwjtDuyfkCXWtakiTTSskDdQU5jhlMfR2MK6nNt0ivgr5mcay
         JdMMRBqjuB/pN3bQminMotRjQ/prr1//asee4MB8gE+nxefsXUVX52XipoTiWKilOS6s
         mdFiLWZMimOI8PqVPevaj0H48fl9sYMnnOcXmjj4Iw64NOF6u5VEEx276MkfTuOFEjw1
         EkNMrzGYpGA6OMSCg/MIX+m5WCu8cL+ylLrGM+dwLLbXm1ET0dis+5WAk2qYPUVR+ALj
         zxuOfAEDvv7EOrq2EKz7R0n5yAPZoY2O0cjlz09xRLl4UzVddue02esW+A7wps12VHjH
         xh+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693495826; x=1694100626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxsD0oSFXtrM1VIFh9Pfyj0ucBTkbmmP9YmAH7jRKLc=;
        b=h1yD2h4waitn4TMt7iEWNnmjKgMPXJUnt0lA/yXXoN9Rlfj9QgNwayCrVvQtcQpNd1
         oSRMCXbRAmLnpf8rFvxu1fa6Fv20wrndlfw+Dl3ODECfMqud3V6Abx2ZQ3EKU+VG5AqJ
         UTkIXvyjr34eSNoMPKfb53qW4ELFTBLCCI/k5VXK/xByjf+m3DA6UZPL+qwp4hAvKOKW
         4GBqSwVabpLkMo3cv+OoQ/sbotgIKmRyOfZN50/2WBhmsY3o/I2G/8vGNnU7YmJxyHpt
         wE4lwkooQ3SQ+0sVtGwr07GJYHo9Rl1PhaqfBkNVDP72+/9TaeMU5fXJ5vjA3vrYbplr
         lp+w==
X-Gm-Message-State: AOJu0YycktXHUdLkHxxNfsNu4fLp4U95dzcGzVh5LQEHqLLqVlpPLtTH
	MrJ20Nm2LSJy/nUOyvIZVZJH3KOT9uOLix7BIhE=
X-Google-Smtp-Source: AGHT+IHbw99NR6jgY3ua+ZzgviXXkaKDJY6wn7qdQOG2DfL/yYuWMFuJBJPLkraZLTZbrXZhVkcGCxvYyqQrLeleuA4=
X-Received: by 2002:a2e:3207:0:b0:2bc:befb:b602 with SMTP id
 y7-20020a2e3207000000b002bcbefbb602mr4023314ljy.1.1693495826343; Thu, 31 Aug
 2023 08:30:26 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Thu, 31 Aug 2023 17:30:15 +0200
Message-ID: <CACna6rwf3_9QVjYcM+847biTX=K0EoWXuXcSMkJO1Vy_5vmVqA@mail.gmail.com>
Subject: Memory mapped flash access breaks Broadcom NAND controller based access
To: Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, 
	bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, 
	=?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230831_083030_528353_3D8FF1C9 
X-CRM114-Status: UNSURE (   9.66  )
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

SGksCgpCcm9hZGNvbSBOb3J0aHN0YXIgcGxhdGZvcm0gaGFzIFNQSSBjb250cm9sbGVyIGFuZCBO
QU5EIGNvbnRyb2xsZXIKdjYuMS4gRGV2aWNlcyBjYW4gY29tZSB3aXRoIHNlcmlhbCBvciBOQU5E
IGZsYXNoZXMgKG9yIGJvdGgpLgoKVG8gcHJvdmlkZSBlYXJseSBhY2Nlc3MgdG8gY29uZmlndXJh
dGlvbiBkYXRhIChOVlJBTSkgc3RvcmVkIG9uIGZsYXNoCk5vcnRoc3RhciBwcm92aWRlcyBNTUlP
IG1hcHBpbmdzOgojZGVmaW5lIFNJX05TX05BTkRGTEFTSCAgICAgICAgICAgIDB4MWMwMDAwMDAg
ICAgLyogTm9ydGhTdGFyIE5BTkQgZmxhc2ggYmFzZSAqLwojZGVmaW5lIFNJX05TX05PUkZMQVNI
ICAgICAgICAgICAgMHgxZTAwMDAwMCAgICAvKiBOb3J0aFN0YXIgTk9SIGZsYXNoIGJhc2UgKi8K
Ckl0J3MgcG9zc2libGUgdG8gaW9yZW1hcCB0aG9zZSBhbmQgcmVhZCBmbGFzaCBjb250ZW50LiBE
ZXRhaWxzOgpEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbnZtZW0vYnJjbSxudnJh
bS55YW1sCmRyaXZlcnMvbnZtZW0vYnJjbV9udnJhbS5jCgpUaGUgcHJvYmxlbSBpcyB0aGF0IHJl
YWRpbmcgZmxhc2ggdGhhdCB3YXkgYnJlYWtzIE5BTkQgY29udHJvbGxlcgpiYXNlZCBhY2Nlc3Mg
dXNpbmcgYnJjbW5hbmQgZHJpdmVyLiBBIHNpbXBsZSByZWFkYigpIHRyaWdnZXJzIGVycm9ycwps
aWtlOgpbICAxMjAuMDk4NDM5XSBTUVVBU0hGUyBlcnJvcjogeHogZGVjb21wcmVzc2lvbiBmYWls
ZWQsIGRhdGEgcHJvYmFibHkgY29ycnVwdApbICAxMjAuMTA1MzcxXSBTUVVBU0hGUyBlcnJvcjog
RmFpbGVkIHRvIHJlYWQgYmxvY2sgMHgzYjhjMDI6IC01ClsgIDEyMC4xMTExNThdIFNRVUFTSEZT
IGVycm9yOiBVbmFibGUgdG8gcmVhZCBtZXRhZGF0YSBjYWNoZSBlbnRyeSBbM2I4YzAwXQpbICAx
MjAuMTE3ODc3XSBTUVVBU0hGUyBlcnJvcjogVW5hYmxlIHRvIHJlYWQgaW5vZGUgMHg2NzYwNzg1
Cm9yClsgICAgMy4xMjA1MjddIHViaTAgZXJyb3I6IDB4YzA0ZjBiM2M6IFBFQiAwIGNvbnRhaW5z
IGNvcnJ1cHRlZCBWSUQKaGVhZGVyLCBhbmQgdGhlIGRhdGEgZG9lcyBub3QgY29udGFpbiBhbGwg
MHhGRgpbICAgIDMuMTMwNjY0XSB1YmkwIGVycm9yOiAweGMwNGYwYjRjOiB0aGlzIG1heSBiZSBh
IG5vbi1VQkkgUEVCIG9yIGEKc2V2ZXJlIFZJRCBoZWFkZXIgY29ycnVwdGlvbiB3aGljaCByZXF1
aXJlcyBtYW51YWwgaW5zcGVjdGlvbgoKSSBhc3N1bWUgdGhhdCB3aGF0ZXZlciBoYXJkd2FyZSBw
cm92aWRlcyBNTUlPIGJhc2VkIGFjY2VzcyBpdAppbnRlcmZlcmVuY2VzIHdpdGggTkFORCBjb250
cm9sbGVyLgoKSXMgdGhhdCBzb21ldGhpbmcgdGhhdCBjb3VsZCBiZSBzb2x2ZWQgaW4gYnJjbW5h
bmQ/IE9yIHNob3VsZCBMaW51eApqdXN0IGRvbid0IHVzZSBNTUlPIHBvc3QtYm9vdGluZyAoYWZ0
ZXIgYnJjbW5hbmQgaW5pdGlhbGl6ZXMpPyBJcwp0aGVyZSBzb21lIGdlbmVyaWMgY3Jvc3Mtc3Vi
c3lzdGVtIG1ldGhvZCB0byBhY2hpZXZlIHRoYXQ/CgotLSAKUmFmYcWCCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
