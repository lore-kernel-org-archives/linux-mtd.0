Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01CECC433EF
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Dec 2021 19:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Iphx54ucG40dv6bE08GkGg63XKM/n9IsDz5kzy+rQCk=; b=XfoHHPiJzGn7+nnMea/hQnD7ZG
	PwGIlIuaECxENpyH24oTVwpYKxoQWLVGln1NHdD3+7sBvM8IjDPAKbu3C8n0SfA/h+MazuLX0v6ip
	C84dYj2aCybG/yZNJqG5OVsBeOb8s+zwcmrSs8seXPOW8pQH0HThmqgt3sZpyAHXpNqhJm1gi8wFu
	k9Vnb52qZet6lW157BHxgERSfR7iV0pqOp3BfujtbF4eR6dJc+PB6I0X+8iZjKhkqbUyf7+A34ANu
	WVsH/9c12ghrDSab6R0QxvBbP8xTSUo3W/jT6KcI3btuGgYYLZ06paduPwEDVi7JSwJfRhPVucdBX
	bCzZuu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwUO4-0072sp-Gj; Sun, 12 Dec 2021 19:19:56 +0000
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwUO1-0072rd-6L
 for linux-mtd@lists.infradead.org; Sun, 12 Dec 2021 19:19:54 +0000
Received: by mail-io1-xd30.google.com with SMTP id 14so16230357ioe.2
 for <linux-mtd@lists.infradead.org>; Sun, 12 Dec 2021 11:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3lZYxpFHoHqMrCneiYqxM2dzSIurnwCBe+TMroYiJck=;
 b=FBOecOtaMwOkhlDZ0/J2RlgSx2edE8HMAZwyEgihebjHlovFCXr5/KAvd7O9OPw0l0
 oOHgGZnzouRALI68Xas2MduS55uPE8j3hcXN04AD50aAx0fDMyvGD3l5V4eQ6hTxItzb
 pir4UzAIViHXY7iXSCeh2Eq/ZfANX0dHh6mF3AYt7msBYlyWunE+cuL3HB3qIPbgOBvJ
 EVgpOYjUkYhW1fPm29YsuM2wcEhnQlwbgpp1BYY53+tEjXcztsIAcaCvC2DT+aQpe+4t
 //R9qoZ4plzKwkyM9ksX62V4TLxHWne6Q+RkRBlK0vLaydXnpS8emzE723S1xju8Vnri
 SbmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3lZYxpFHoHqMrCneiYqxM2dzSIurnwCBe+TMroYiJck=;
 b=lk7e50Edk7mNoeZMZfEBqjoJVVPs3jP1iADlpYRlythXKLnIqcl+kijtDe7oJ0m6mw
 zXIc37uioD/Xhr6RcKTb4fiEFE/LlfmKY7d1DUlftbnniy69oV8SsasJ8D5v16sr/aSH
 3VRGe6I1I3s1zk3kIqWY8qMQv4bxVxQf4VaZHAcnBywPWZ6G7Id9gFd16Fj5ofH+CXTF
 teZBVwSqI0z1tTbr6KQnKI0tn74/Ec6hy2n3fQ+amsOvkyZsggQphHfW66iSzmOptqGS
 NYEzboJjm2ILlvq42Z/H9FKiWnv35WAbMC181p77GYARHZ5o+E1mFKBCatnKQBPooNKW
 pNEQ==
X-Gm-Message-State: AOAM530tuQHePZWluAw8gOTwc1QH6hDP4J90SmaEz4jw5aQO9sVjusyO
 dL9PDc31+gowdoei2XMCHRurEg==
X-Google-Smtp-Source: ABdhPJy8YauyTX8Vc2KXDIZeOSGmxTPw/AoCqg0BVxPbFoL9vjndnKCfeQRFl1tsYKRtdhtYNIQXNA==
X-Received: by 2002:a5d:9ec2:: with SMTP id a2mr31833716ioe.44.1639336791259; 
 Sun, 12 Dec 2021 11:19:51 -0800 (PST)
Received: from [192.168.1.116] ([66.219.217.159])
 by smtp.gmail.com with ESMTPSA id 18sm5951719iln.83.2021.12.12.11.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 11:19:50 -0800 (PST)
Subject: Re: [PATCH] mtd_blkdevs: don't scan partitions for plain mtdblock
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 linux-block <linux-block@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20211206070409.2836165-1-hch@lst.de>
 <4bc1b80c-9c43-ccd6-de78-09f9a1627cc8@kernel.dk>
 <CAMuHMdU0q-W0YSLqjazK32VuE5ZH+eE8H1vbv74o014Dw7wSXg@mail.gmail.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <db998e18-6b2b-63b0-c00e-757778cecd89@kernel.dk>
Date: Sun, 12 Dec 2021 12:19:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU0q-W0YSLqjazK32VuE5ZH+eE8H1vbv74o014Dw7wSXg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_111953_328611_29117517 
X-CRM114-Status: GOOD (  20.33  )
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

T24gMTIvMTIvMjEgMzowMiBBTSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIEplbnMs
Cj4gCj4gT24gRnJpLCBEZWMgMTAsIDIwMjEgYXQgNzo1MiBQTSBKZW5zIEF4Ym9lIDxheGJvZUBr
ZXJuZWwuZGs+IHdyb3RlOgo+PiBPbiBNb24sIERlYyA2LCAyMDIxIGF0IDEyOjA0IEFNIENocmlz
dG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPj4+IG10ZGJsb2NrIC8gbXRkYmxvY2tf
cm8gc2V0IHBhcnRfYml0cyB0byAwIGFuZCB0aHVzIG5ldmV2ZXIgc2Nhbm5lZAo+Pj4gcGFydGl0
aW9ucy4gIFJlc3RvcmUgdGhhdCBiZWhhdmlvciBieSBzZXR0aW5nIHRoZSBHRU5IRF9GTF9OT19Q
QVJUIGZsYWcuCj4+Pgo+Pj4gRml4ZXM6IDFlYmUyZTVmOWQ2OGU5NGMgKCJibG9jazogcmVtb3Zl
IEdFTkhEX0ZMX0VYVF9ERVZUIikKPj4+IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+Pj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhl
bGx3aWcgPGhjaEBsc3QuZGU+Cj4+PiBUZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2Vl
cnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4gCj4+PiBAQCAtMzU1LDkgKzM1NSwxMSBAQCBpbnQgYWRk
X210ZF9ibGt0cmFuc19kZXYoc3RydWN0IG10ZF9ibGt0cmFuc19kZXYgKm5ldykKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICIlcyVjJWMiLCB0ci0+bmFtZSwKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICdhJyAtIDEgKyBuZXctPmRldm51bSAvIDI2LAo+
Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJ2EnICsgbmV3LT5kZXZudW0gJSAy
Nik7Cj4+PiAtICAgICAgIGVsc2UKPj4+ICsgICAgICAgfSBlbHNlIHsKPj4+ICAgICAgICAgICAg
ICAgICBzbnByaW50ZihnZC0+ZGlza19uYW1lLCBzaXplb2YoZ2QtPmRpc2tfbmFtZSksCj4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIiVzJWQiLCB0ci0+bmFtZSwgbmV3LT5kZXZudW0pOwo+
Pj4gKyAgICAgICAgICAgICAgIGdkLT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwo+Pj4gKyAg
ICAgICB9Cj4+Cj4+IE5vdCBzdXJlIHdoeSBJIGRpZG4ndCBzcG90IHRoaXMgdW50aWwgbm93LCBi
dXQ6Cj4+Cj4+IGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmM6IEluIGZ1bmN0aW9uIOKAmGFkZF9t
dGRfYmxrdHJhbnNfZGV24oCZOgo+PiBkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jOjM2MjozMDog
ZXJyb3I6IOKAmEdFTkhEX0ZMX05PX1BBUlTigJkgdW5kZWNsYXJlZCAoZmlyc3QgdXNlIGluIHRo
aXMgZnVuY3Rpb24pOyBkaWQgeW91IG1lYW4g4oCYR0VOSERfRkxfTk9fUEFSVF9TQ0FO4oCZPwo+
PiAgIDM2MiB8ICAgICAgICAgICAgICAgICBnZC0+ZmxhZ3MgfD0gR0VOSERfRkxfTk9fUEFSVDsK
Pj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4K
Pj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdFTkhEX0ZMX05PX1BBUlRf
U0NBTgo+PiBkcml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jOjM2MjozMDogbm90ZTogZWFjaCB1bmRl
Y2xhcmVkIGlkZW50aWZpZXIgaXMgcmVwb3J0ZWQgb25seSBvbmNlIGZvciBlYWNoIGZ1bmN0aW9u
IGl0IGFwcGVhcnMgaW4KPj4KPj4gSG1tPwo+Pgo+PiBJJ20gZ29pbmcgdG8gcmV2ZXJ0IHRoaXMg
b25lIGZvciBub3csIG5vdCBzdXJlIGhvdyBpdCBjb3VsZCd2ZSBiZWVuCj4+IHRlc3RlZCBpbiB0
aGlzIGZvcm0uCj4gCj4gQmVjYXVzZSBuZXh0LTIwMjExMTMwIGFuZCBsYXRlciBoYXZlIGNvbW1p
dCA0NmU3ZWFjNjQ3YjM0ZWQ0ICgiYmxvY2s6Cj4gcmVuYW1lIEdFTkhEX0ZMX05PX1BBUlRfU0NB
TiB0byBHRU5IRF9GTF9OT19QQVJUIikuCgpJIGd1ZXNzIHRoYXQgZXhwbGFpbnMgaXQsIGl0IGVu
ZGVkIHVwIGluIHRoZSB3cm9uZyBicmFuY2guLi4KCi0tIApKZW5zIEF4Ym9lCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBk
aXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW10ZC8K
