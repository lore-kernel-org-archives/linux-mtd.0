Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C194FC77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 09:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArsICG+q6ZWHjjO1WX828eZoUVL5cnbAc5PAq9pXHjw=; b=44fX81JfjouIgu
	f7s2Mq1PYvwrYqgTsrEPsJeVW/UJRgeSPItAuvhrHW2Md4hnFimDu0HH44lXsLkEipw2wpAZ6Gn/x
	wQoRRNR++c97owsmdLazmpm/3mzrSjrPjLBYSAGHFgl41yhPSdGFPrjWCGH6O3VEPS8ExvGwijd5h
	Pzj415Yb1fnxnSDQZDxYS+5cRt7DPsgFBb3EO+2Nr8arjLXoniqAElbgI7pEy3bUKY9BQukzfffQZ
	UdsNjZZgFgY4FpHLsxUeMsEesh8yJxtCodxfA6oOuYyWrCr2Bm0eXowFjn7wWqk2LIXceP7WmVw/o
	4G+PTjUFUyBKfsQ7L/7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6peK-005Hxr-1P;
	Wed, 07 Jun 2023 09:40:16 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6peH-005Hw8-1n
	for linux-mtd@lists.infradead.org;
	Wed, 07 Jun 2023 09:40:14 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5147e8972a1so1161799a12.0
        for <linux-mtd@lists.infradead.org>; Wed, 07 Jun 2023 02:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1686130812; x=1688722812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OKacAnva3Yv49FZ4mmigtapivvs6Pz0X+m8VvMKeakc=;
        b=dCfiHbfC3g2G8d/J9z4HWJRn+4ZM/R3bpLuFPxQw29U/BxQqfJsF3/Pcs7fI41A4gX
         QmjGzJZ4A2vjupZlP6QlquJwygr1R+FDDkAU1dI8tFxGxMQBNhKyKD/kPuOGtcHtWHsN
         KTwy+1yD0l655Rbq6xnYm39sKjIDdP4MTsPmGu5Qrnj6S7RG+MOe/U9goLkbKdoPlXty
         JKXk/P/K/Z5i1goc4SEzvnQut6+E/y0p5im5y9dCvVaH0pV3VQijuFqDyfn3GCXb695U
         7ow15qjqM2IYWuhG0bdltyHA6aebtUZOak/1yjhnxavTWTfQy9rV8KO6L8zOuHlEdvBX
         31YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686130812; x=1688722812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OKacAnva3Yv49FZ4mmigtapivvs6Pz0X+m8VvMKeakc=;
        b=H0wkGAdjP+HqewS+2dEfQVnEOth6EY93N3aAubD8cxMUqOu/cJnJWfYdLercMmnrg9
         Sq2jNQQXj1dMMP2mqCFaqrCW+n1HCyUefKz3IFswvy17xx5q2VsB9KEhcXBVc9Rr6qqK
         HMKrQ2Ae2pcouoXU+qgVDsFqgw6nVn9poyOKMhVovMz+BGaxopGZBFwf9Xy47ulrti6Q
         oMom2yB3EyLwGb87IYHe7G7LfaUN1/WMcGLTSApthxDDrLsXHLc4Qw8aqNIBuDipHw9b
         2y2h/5xWXtVYjXsFVMNT5nbPBIm9iVLWSHXXY6csUxB0KE28Sf0h900XFQA8s7Ns1ZEr
         uUFA==
X-Gm-Message-State: AC+VfDxKZy+DdisUNnTIovIobt/7xthVU/f1DrhCf9dBx4U/X5HvcuPx
	rGi6T8eDfw22Luu7IwsIqTfOKH7XjXglKEzhv+1v3g==
X-Google-Smtp-Source: ACHHUZ6qGErDhBYRK2EQNWjsiTZgthNZdqE08xgi5M9Zl1p8ZDd17beUaKBrj0/jBLtUwBleXb1y7OCzWAlQzI4iqec=
X-Received: by 2002:aa7:c3c3:0:b0:516:3261:17d with SMTP id
 l3-20020aa7c3c3000000b005163261017dmr3772815edr.20.1686130811848; Wed, 07 Jun
 2023 02:40:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230606073950.225178-1-hch@lst.de> <20230606073950.225178-17-hch@lst.de>
In-Reply-To: <20230606073950.225178-17-hch@lst.de>
From: Jinpu Wang <jinpu.wang@ionos.com>
Date: Wed, 7 Jun 2023 11:40:01 +0200
Message-ID: <CAMGffEkXqRMD3yeyjXzTn1ZyHnszmPhqRdP8eN12KXcTdz=9Xw@mail.gmail.com>
Subject: Re: [PATCH 16/31] block: use the holder as indication for exclusive opens
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>, 
	"Md. Haris Iqbal" <haris.iqbal@ionos.com>, Phillip Potter <phil@philpotter.co.uk>, Coly Li <colyli@suse.de>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>, dm-devel@redhat.com, 
	linux-block@vger.kernel.org, linux-um@lists.infradead.org, 
	linux-scsi@vger.kernel.org, linux-bcache@vger.kernel.org, 
	linux-mtd@lists.infradead.org, linux-nvme@lists.infradead.org, 
	linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_024013_618452_25DE46B1 
X-CRM114-Status: GOOD (  15.02  )
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

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCA5OjQw4oCvQU0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+IHdyb3RlOgo+Cj4gVGhlIGN1cnJlbnQgaW50ZXJmYWNlIGZvciBleGNsdXNpdmUgb3Bl
bnMgaXMgcmF0aGVyIGNvbmZ1c2luZyBhcyBpdAo+IHJlcXVpcmVzIGJvdGggdGhlIEZNT0RFX0VY
Q0wgZmxhZyBhbmQgYSBob2xkZXIuICBSZW1vdmUgdGhlIG5lZWQgdG8gcGFzcwo+IEZNT0RFX0VY
Q0wgYW5kIGp1c3Qga2V5IG9mZiB0aGUgZXhjbHVzaXZlIG9wZW4gb2ZmIGEgbm9uLU5VTEwgaG9s
ZGVyLgo+Cj4gRm9yIGJsa2Rldl9wdXQgdGhpcyByZXF1aXJlcyBhZGRpbmcgdGhlIGhvbGRlciBh
cmd1bWVudCwgd2hpY2ggcHJvdmlkZXMKPiBiZXR0ZXIgZGVidWcgY2hlY2tpbmcgdGhhdCBvbmx5
IHRoZSBob2xkZXIgYWN0dWFsbHkgcmVsZWFzZXMgdGhlIGhvbGQsCj4gYnV0IGF0IHRoZSBzYW1l
IHRpbWUgYWxsb3dzIHJlbW92aW5nIHRoZSBub3cgc3VwZXJmbHVvdXMgbW9kZSBhcmd1bWVudC4K
Pgo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IC0tLQo+
ICBibG9jay9iZGV2LmMgICAgICAgICAgICAgICAgICAgICAgICB8IDM3ICsrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0KPiAgYmxvY2svZm9wcy5jICAgICAgICAgICAgICAgICAgICAgICAgfCAg
NiArKystLQo+ICBibG9jay9nZW5oZC5jICAgICAgICAgICAgICAgICAgICAgICB8ICA1ICsrLS0K
PiAgYmxvY2svaW9jdGwuYyAgICAgICAgICAgICAgICAgICAgICAgfCAgNSArKy0tCj4gIGRyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX25sLmMgICAgICAgIHwgMjMgKysrKysrKysrKy0tLS0tLS0KPiAg
ZHJpdmVycy9ibG9jay9wa3RjZHZkLmMgICAgICAgICAgICAgfCAxMyArKysrKy0tLS0tCj4gIGRy
aXZlcnMvYmxvY2svcm5iZC9ybmJkLXNydi5jICAgICAgIHwgIDQgKy0tCkFja2VkLWJ5OiBKYWNr
IFdhbmcgPGppbnB1LndhbmdAaW9ub3MuY29tPiAjIGZvciBybmJkCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
