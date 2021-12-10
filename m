Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4F5C433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 10 Dec 2021 19:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yw/NPe3FKbzoOVRImKQwUZUGbqFElfp+VjBa8svvUvk=; b=HNACjmZr3ky4832cMewH6MYG1v
	ZOoxqSyFApM3JS1IXTdTD80nLSs0E5fNP4+XbyreSmYpbN91ztzkxYFpQBmaNPJXcSU1VQqYi/rWX
	78CvPXPJ/6KHEm1KroA36G+6nrAqhvVaosHZZHB3zR6dU5CeLgV03acY2pJLQxq1F5bN3iCNJma9d
	Xvd9HECO4ctj/+VvoZQDsVfzkGzUEDCCwD7K4fCt2YF2L8apBVUm0yvr19+VSrSyP9K5m4DB3dsE6
	bi3/UsYlZz0TSsfiBM4gJ0Y9SB+CkGx/KIOPJMnte7Ud0Y3IQFpqo+JLJ2a37HnuI178O6S3La5Gh
	5aE+EpVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvlRS-003UMN-Li; Fri, 10 Dec 2021 19:20:27 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvl0Q-003IzT-LS
 for linux-mtd@lists.infradead.org; Fri, 10 Dec 2021 18:52:32 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 cq22-20020a17090af99600b001a9550a17a5so10085852pjb.2
 for <linux-mtd@lists.infradead.org>; Fri, 10 Dec 2021 10:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=from:subject:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Sck6On44bpX/LHpA1vcA3zK4iwtpxs9f24kXBzByf1o=;
 b=WMf0AKhxR2TjGl/HIlKI7tBoXOWw5s9MMtg4AZbG8Spgkc9etTpBwL4V8flW3R/sXT
 RsuK5JAgFrTsgpt9xIPimbQAK4QE8uqD9d/q0fags8/3w01g0MLFNtwi4LwrTFL5Yr7E
 7T+OjN1tWRRnSnpOb6mH4dD/eWfFfmhnsUulIWbOUlcmseb8LttUytsd6JX1LARZZ3dI
 jBRe+yLd9b9v9KvrX4JsKbFi9lATCITydW+fxvUlHLJZDX+yxfxN5f423J0K9i2Obw7W
 aqwKGYFzRKjMcMwZH/FpD3Zqdmhb/9KH9sM88o6AhqoNH2cYSS/c/TtzHsTua5wmX4B3
 Am+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Sck6On44bpX/LHpA1vcA3zK4iwtpxs9f24kXBzByf1o=;
 b=O/oGcXdALuxSN8dAFJKfw2ytrNrjL0YqfgN6nvHzibnXli7312aiTthWxilmViL3OE
 rQPK4D9pND0o2gx3sbsaHZFGtmORrnXb6tNtTjCPonj/bMNYygPflZ9mwTAs3rTicRkY
 IBttzouezOM9QZVcFQhbUbttZ3J3ePzdkWgLODYGZ01fVaHla7yXTdptnCMHCtksYQGS
 jpWbtX5c/yiC5jCn1/o1Hoo/wQd07diuSVo6nhibqt2vMCiyUG2E+QCFb7U0bwBfa3/Z
 MVY2ZhFu9FuQOMFR9uHcpTo6ks8MM5nrHyThYoL0oV4oa23FIa70jMiSSZ5rt9Z62LoM
 TC0Q==
X-Gm-Message-State: AOAM531Qq2x5Lan6uTs3H9ESCsWPMPyiKs4u0CzWnEEUo4fNf/WdnyxS
 pADzUjUkTHceGw72+5o7LBYqVg==
X-Google-Smtp-Source: ABdhPJw3vhyVAPk6E3z9227z4OJOYgXaX09wd1vyG5fgOYnMhoE6rntg8adUIwcnWyfvGwedp7QaNQ==
X-Received: by 2002:a17:902:d395:b0:141:a913:1920 with SMTP id
 e21-20020a170902d39500b00141a9131920mr77793133pld.81.1639162348388; 
 Fri, 10 Dec 2021 10:52:28 -0800 (PST)
Received: from [172.20.4.26] ([66.185.175.30])
 by smtp.gmail.com with ESMTPSA id p8sm4376422pfo.141.2021.12.10.10.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:52:28 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH] mtd_blkdevs: don't scan partitions for plain mtdblock
To: Christoph Hellwig <hch@lst.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 linux-block <linux-block@vger.kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <20211206070409.2836165-1-hch@lst.de>
Message-ID: <4bc1b80c-9c43-ccd6-de78-09f9a1627cc8@kernel.dk>
Date: Fri, 10 Dec 2021 11:52:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211206070409.2836165-1-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_105230_754241_B60685EF 
X-CRM114-Status: GOOD (  24.46  )
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

T24gTW9uLCBEZWMgNiwgMjAyMSBhdCAxMjowNCBBTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4gd3JvdGU6Cj4KPiBtdGRibG9jayAvIG10ZGJsb2NrX3JvIHNldCBwYXJ0X2JpdHMgdG8g
MCBhbmQgdGh1cyBuZXZldmVyIHNjYW5uZWQKPiBwYXJ0aXRpb25zLiAgUmVzdG9yZSB0aGF0IGJl
aGF2aW9yIGJ5IHNldHRpbmcgdGhlIEdFTkhEX0ZMX05PX1BBUlQgZmxhZy4KPgo+IEZpeGVzOiAx
ZWJlMmU1ZjlkNjhlOTRjICgiYmxvY2s6IHJlbW92ZSBHRU5IRF9GTF9FWFRfREVWVCIpCj4gUmVw
b3J0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cj4g
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gVGVzdGVkLWJ5
OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgo+IC0tLQo+ICBk
cml2ZXJzL210ZC9tdGRfYmxrZGV2cy5jIHwgNiArKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL210
ZC9tdGRfYmxrZGV2cy5jIGIvZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYwo+IGluZGV4IDExM2Y4
NmRmNzYwMzguLjI0M2YyOGEzMjA2YjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tdGQvbXRkX2Js
a2RldnMuYwo+ICsrKyBiL2RyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMKPiBAQCAtMzQ2LDcgKzM0
Niw3IEBAIGludCBhZGRfbXRkX2Jsa3RyYW5zX2RldihzdHJ1Y3QgbXRkX2Jsa3RyYW5zX2RldiAq
bmV3KQo+ICAgICAgICAgZ2QtPm1pbm9ycyA9IDEgPDwgdHItPnBhcnRfYml0czsKPiAgICAgICAg
IGdkLT5mb3BzID0gJm10ZF9ibG9ja19vcHM7Cj4KPiAtICAgICAgIGlmICh0ci0+cGFydF9iaXRz
KQo+ICsgICAgICAgaWYgKHRyLT5wYXJ0X2JpdHMpIHsKPiAgICAgICAgICAgICAgICAgaWYgKG5l
dy0+ZGV2bnVtIDwgMjYpCj4gICAgICAgICAgICAgICAgICAgICAgICAgc25wcmludGYoZ2QtPmRp
c2tfbmFtZSwgc2l6ZW9mKGdkLT5kaXNrX25hbWUpLAo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICIlcyVjIiwgdHItPm5hbWUsICdhJyArIG5ldy0+ZGV2bnVtKTsKPiBAQCAtMzU1
LDkgKzM1NSwxMSBAQCBpbnQgYWRkX210ZF9ibGt0cmFuc19kZXYoc3RydWN0IG10ZF9ibGt0cmFu
c19kZXYgKm5ldykKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiJXMlYyVjIiwg
dHItPm5hbWUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJ2EnIC0gMSArIG5l
dy0+ZGV2bnVtIC8gMjYsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJ2EnICsg
bmV3LT5kZXZudW0gJSAyNik7Cj4gLSAgICAgICBlbHNlCj4gKyAgICAgICB9IGVsc2Ugewo+ICAg
ICAgICAgICAgICAgICBzbnByaW50ZihnZC0+ZGlza19uYW1lLCBzaXplb2YoZ2QtPmRpc2tfbmFt
ZSksCj4gICAgICAgICAgICAgICAgICAgICAgICAgICIlcyVkIiwgdHItPm5hbWUsIG5ldy0+ZGV2
bnVtKTsKPiArICAgICAgICAgICAgICAgZ2QtPmZsYWdzIHw9IEdFTkhEX0ZMX05PX1BBUlQ7Cj4g
KyAgICAgICB9CgpOb3Qgc3VyZSB3aHkgSSBkaWRuJ3Qgc3BvdCB0aGlzIHVudGlsIG5vdywgYnV0
OgoKZHJpdmVycy9tdGQvbXRkX2Jsa2RldnMuYzogSW4gZnVuY3Rpb24g4oCYYWRkX210ZF9ibGt0
cmFuc19kZXbigJk6CmRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmM6MzYyOjMwOiBlcnJvcjog4oCY
R0VOSERfRkxfTk9fUEFSVOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlv
bik7IGRpZCB5b3UgbWVhbiDigJhHRU5IRF9GTF9OT19QQVJUX1NDQU7igJk/CiAgMzYyIHwgICAg
ICAgICAgICAgICAgIGdkLT5mbGFncyB8PSBHRU5IRF9GTF9OT19QQVJUOwogICAgICB8ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fgogICAgICB8ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgR0VOSERfRkxfTk9fUEFSVF9TQ0FOCmRyaXZlcnMvbXRkL210
ZF9ibGtkZXZzLmM6MzYyOjMwOiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmllciBpcyBy
ZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbgoKSG1tPwoK
SSdtIGdvaW5nIHRvIHJldmVydCB0aGlzIG9uZSBmb3Igbm93LCBub3Qgc3VyZSBob3cgaXQgY291
bGQndmUgYmVlbgp0ZXN0ZWQgaW4gdGhpcyBmb3JtLgoKLS0gCkplbnMgQXhib2UKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
