Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 445CDC433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 12 Dec 2021 10:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fL0d8xI6vYJH7+l4TJjCA9uLjAY0NdGqzTjblKbFLtY=; b=q9v8u6Ki00CttI
	yfYT2jmfdKVsCSzBA1Rfjb3yDIKlXc3a5HKnYs7+LQMTNqQ6cfc1fcLeaJvHCw95Ntl5BLFQ3KPSJ
	t3+yn+cTVvx5XyvvSsedcJlT67PPMvYNRh4Pv7vIzMBuL2uRJlk8tsHg8Ok6Ntg+IZcM0nm4AJYWt
	NSqgRS3RmsrWCiUnfRznloDwfubqlxeZRFx7FVfnbltRueBNSLyTt7Bv+RzmFfy73Ty5iYvyE7LFR
	lxv4s6V4L+gfytYknJ8CL5GB1Xr2e262J/+clUbVTN2vXHI6IAqzojDdTfMAgiDYKffT9OUB/3gyn
	OoEDWMxoIZ4loYrqsInQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwLhH-006Hob-07; Sun, 12 Dec 2021 10:03:11 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwLhA-006Hnp-Ox
 for linux-mtd@lists.infradead.org; Sun, 12 Dec 2021 10:03:06 +0000
Received: by mail-ua1-f46.google.com with SMTP id n6so24336789uak.1
 for <linux-mtd@lists.infradead.org>; Sun, 12 Dec 2021 02:03:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=LgOMohw04LDTgliOMAxTx9ph3HfS1n9dnCmdkzOvyHo=;
 b=6PISaIxbRJ2UyZ59AJCt3hjChQ5Q+d/iUt48KYmXs0ULOGyk+60yMpnuUTcood6+zc
 RUFgkXWDThBRTCzr/gu+FgC8zIzYNf5RZX/h2RgmMNo5FgmjJRDtImAfWBe/u7lWYYKA
 vbMdQUG93EKr9pZJZ7+8YO5zrK2Rzk1f8j9o8qz6wZ+iKQtAXtYnlCezoGePB7CkC6OS
 WtNEnUalF6tG60Kf7hekQMpqqbFXKDdckxt5DRTIbOSG96N5j3szDnDbOYQAdPhUJ+MV
 cLXj/muFLQt6ZuR/xmCk1BpqMjyhwrO8kS/e8850YeEXv+xSUg0TnRxkx+0WBB0r5yDL
 p9EQ==
X-Gm-Message-State: AOAM530RXEgfs30rfIP9DIxTqIkX85czAITi9YkKUjsANK9zOJEU7VF0
 L8TKbgFRzmj9GsrJeuqZ1mSLQXz5G02SYA==
X-Google-Smtp-Source: ABdhPJyqyZTIX6HazdpneQhQDekLIpBF8+DL+v4Ozvdp+a3Suu8hhX+Iv47gphBJAX9Npf3h+ZZYcg==
X-Received: by 2002:a05:6102:6c9:: with SMTP id
 m9mr23530972vsg.32.1639303381893; 
 Sun, 12 Dec 2021 02:03:01 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com.
 [209.85.222.45])
 by smtp.gmail.com with ESMTPSA id s13sm3337580vkh.32.2021.12.12.02.03.01
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 12 Dec 2021 02:03:01 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id 30so24242558uag.13
 for <linux-mtd@lists.infradead.org>; Sun, 12 Dec 2021 02:03:01 -0800 (PST)
X-Received: by 2002:a05:6102:21dc:: with SMTP id
 r28mr23586293vsg.57.1639303381121; 
 Sun, 12 Dec 2021 02:03:01 -0800 (PST)
MIME-Version: 1.0
References: <20211206070409.2836165-1-hch@lst.de>
 <4bc1b80c-9c43-ccd6-de78-09f9a1627cc8@kernel.dk>
In-Reply-To: <4bc1b80c-9c43-ccd6-de78-09f9a1627cc8@kernel.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 12 Dec 2021 11:02:50 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU0q-W0YSLqjazK32VuE5ZH+eE8H1vbv74o014Dw7wSXg@mail.gmail.com>
Message-ID: <CAMuHMdU0q-W0YSLqjazK32VuE5ZH+eE8H1vbv74o014Dw7wSXg@mail.gmail.com>
Subject: Re: [PATCH] mtd_blkdevs: don't scan partitions for plain mtdblock
To: Jens Axboe <axboe@kernel.dk>
Cc: Christoph Hellwig <hch@lst.de>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 linux-block <linux-block@vger.kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_020304_837613_EAE0A81B 
X-CRM114-Status: GOOD (  25.49  )
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

SGkgSmVucywKCk9uIEZyaSwgRGVjIDEwLCAyMDIxIGF0IDc6NTIgUE0gSmVucyBBeGJvZSA8YXhi
b2VAa2VybmVsLmRrPiB3cm90ZToKPiBPbiBNb24sIERlYyA2LCAyMDIxIGF0IDEyOjA0IEFNIENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+IG10ZGJsb2NrIC8gbXRkYmxv
Y2tfcm8gc2V0IHBhcnRfYml0cyB0byAwIGFuZCB0aHVzIG5ldmV2ZXIgc2Nhbm5lZAo+ID4gcGFy
dGl0aW9ucy4gIFJlc3RvcmUgdGhhdCBiZWhhdmlvciBieSBzZXR0aW5nIHRoZSBHRU5IRF9GTF9O
T19QQVJUIGZsYWcuCj4gPgo+ID4gRml4ZXM6IDFlYmUyZTVmOWQ2OGU5NGMgKCJibG9jazogcmVt
b3ZlIEdFTkhEX0ZMX0VYVF9ERVZUIikKPiA+IFJlcG9ydGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2
ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3Bo
IEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiBUZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cgo+ID4gQEAgLTM1NSw5ICszNTUsMTEgQEAgaW50IGFk
ZF9tdGRfYmxrdHJhbnNfZGV2KHN0cnVjdCBtdGRfYmxrdHJhbnNfZGV2ICpuZXcpCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMlYyVjIiwgdHItPm5hbWUsCj4gPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAnYScgLSAxICsgbmV3LT5kZXZudW0gLyAyNiwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICdhJyArIG5ldy0+ZGV2bnVtICUg
MjYpOwo+ID4gLSAgICAgICBlbHNlCj4gPiArICAgICAgIH0gZWxzZSB7Cj4gPiAgICAgICAgICAg
ICAgICAgc25wcmludGYoZ2QtPmRpc2tfbmFtZSwgc2l6ZW9mKGdkLT5kaXNrX25hbWUpLAo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICIlcyVkIiwgdHItPm5hbWUsIG5ldy0+ZGV2bnVtKTsK
PiA+ICsgICAgICAgICAgICAgICBnZC0+ZmxhZ3MgfD0gR0VOSERfRkxfTk9fUEFSVDsKPiA+ICsg
ICAgICAgfQo+Cj4gTm90IHN1cmUgd2h5IEkgZGlkbid0IHNwb3QgdGhpcyB1bnRpbCBub3csIGJ1
dDoKPgo+IGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmM6IEluIGZ1bmN0aW9uIOKAmGFkZF9tdGRf
YmxrdHJhbnNfZGV24oCZOgo+IGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmM6MzYyOjMwOiBlcnJv
cjog4oCYR0VOSERfRkxfTk9fUEFSVOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBm
dW5jdGlvbik7IGRpZCB5b3UgbWVhbiDigJhHRU5IRF9GTF9OT19QQVJUX1NDQU7igJk/Cj4gICAz
NjIgfCAgICAgICAgICAgICAgICAgZ2QtPmZsYWdzIHw9IEdFTkhEX0ZMX05PX1BBUlQ7Cj4gICAg
ICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn4KPiAgICAg
ICB8ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgR0VOSERfRkxfTk9fUEFSVF9TQ0FOCj4g
ZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYzozNjI6MzA6IG5vdGU6IGVhY2ggdW5kZWNsYXJlZCBp
ZGVudGlmaWVyIGlzIHJlcG9ydGVkIG9ubHkgb25jZSBmb3IgZWFjaCBmdW5jdGlvbiBpdCBhcHBl
YXJzIGluCj4KPiBIbW0/Cj4KPiBJJ20gZ29pbmcgdG8gcmV2ZXJ0IHRoaXMgb25lIGZvciBub3cs
IG5vdCBzdXJlIGhvdyBpdCBjb3VsZCd2ZSBiZWVuCj4gdGVzdGVkIGluIHRoaXMgZm9ybS4KCkJl
Y2F1c2UgbmV4dC0yMDIxMTEzMCBhbmQgbGF0ZXIgaGF2ZSBjb21taXQgNDZlN2VhYzY0N2IzNGVk
NCAoImJsb2NrOgpyZW5hbWUgR0VOSERfRkxfTk9fUEFSVF9TQ0FOIHRvIEdFTkhEX0ZMX05PX1BB
UlQiKS4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQK
Ci0tCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
