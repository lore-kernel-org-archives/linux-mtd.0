Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD5C433EF
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Mar 2022 14:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LpR7kB4VaKTBNFN6+zr81T+GugcqNxJQljrwDa12niE=; b=eLrqvNSILPFTqP
	LMlduVBIXKXORFyhdwInN/V64/VY01tBfl7ASDz5NGHLIUcrirqkafWbv+UwOE1QDTrQaaFleWUWv
	z6+EuP5RBgp2YwArnaLcWWmLz51rqVV7lfDMS7R32PY0SQLbzLf/cotcCwJoRoe2IMAdTBpXb3Qhc
	YSGqiWMfWr4AtRGAHJ9Wf1sFWtuiB3jPaNcR9viQHe8o3OuBRfjD45n8A7b+INuGPxvCQeFmfq39p
	/BuDfZl+hXxethpqpQOG2bDZj20fXz3z+PyJxsnSaei4lKiGjvfzV80iMKMKVp0Ohzp4896FmddZF
	ZtQH51nD8b50ULydNZUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nP3Gb-00H0Yi-3t; Tue, 01 Mar 2022 14:14:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nP3GW-00H0XJ-2X; Tue, 01 Mar 2022 14:14:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 k29-20020a05600c1c9d00b003817fdc0f00so1474219wms.4; 
 Tue, 01 Mar 2022 06:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Zk8PlvNVLj3zsm6QqvHsi+2HncJmKCe24BswXG+bh6U=;
 b=hUTlpRP8DWMfVy+AGPLCodyzBQ3bDfUaqhdFrNdGCy6TRhU8K3FW6J70njbztX4Pto
 8MZB7LpDkNIXK7QeqIv2jq5Pj8u5KOlpGxDpFJVVXM8KMCQclIq6GRJiHI3gyXlUVxE9
 zJS2mI/eZBOeOPFDx93nhGjKEIUCwrHD/vgvis8U6KH8ap0azHX1k0p+loqNgZzavpqq
 D81gE/txomsuLQEu4mQvi/A08dEo2gLGQqizsbM7LP2VHsYRsNzPm+8cJlN84inobWVw
 drGbG4+S+A+6+DnAzCYIK14YQ8ASZO80ePOhKsKU4VWfJid7MnamMrOoOezGuANmaLHR
 F6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Zk8PlvNVLj3zsm6QqvHsi+2HncJmKCe24BswXG+bh6U=;
 b=W77Awx0MfP3QHmxlipOx5ac+9RkgOT4FKYqMzyCvbFN/07qflx/VegMkQ5wrHxdzcB
 P9VZVqDsT032INJH//f3LtQa0T36NNHt8nbzAw2b1fQpupI3EarVAQntpH4jB11e9KXv
 mFd0Q5IUm7nslHzlqPv+7MgXIXX3OiNp2si0gXpXGP2UHl4IcEFuOh+wy93J03QpPV5/
 SDlAv0q6LBwbmb2GGGYYdEKcEj11BB/3Mdjuu0Y6GMOqqQQ3VqoIeOld9hcqr/y6L1xA
 Dvvxf5hnkmNvKFnOudL38Rgp4v5CuJXRBRqX8KyPtw1exNWbgOJx39aD2bXNreHmhYcQ
 c6Mg==
X-Gm-Message-State: AOAM531H/0D+CNyZECLBomfoDmjkc87pK05CNe7vUBRtyjTBlkGxpgdR
 JfFHpc2UNMUlg9EIRpQZlcu/oWQJrX46HWX05yc=
X-Google-Smtp-Source: ABdhPJzj7b8RRGfrxKDOxmWi9NEHJE46DzZb4y0bqzGrUE4nE4fuQkB6rQm//wLbNRbzpcU2327l7gyy0tWfoNFgMS0=
X-Received: by 2002:a05:600c:3503:b0:345:858e:cbe8 with SMTP id
 h3-20020a05600c350300b00345858ecbe8mr17425839wmq.73.1646144049283; Tue, 01
 Mar 2022 06:14:09 -0800 (PST)
MIME-Version: 1.0
References: <20220301095640.313852-1-tudor.ambarus@microchip.com>
 <CAEyMn7aWroFEzo9yPfbwQy3g5iwasuWOQvcHhkRA6Nrga-WRTg@mail.gmail.com>
 <afb8df98-e9c9-1cf8-9e82-9c06e131eee8@microchip.com>
In-Reply-To: <afb8df98-e9c9-1cf8-9e82-9c06e131eee8@microchip.com>
From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 1 Mar 2022 15:13:57 +0100
Message-ID: <CAEyMn7ZFUx_K887VmUKsWSOYkkPFqKSsTvf4-DSe6SJDfHERGw@mail.gmail.com>
Subject: Re: [PATCH 0/2] mtd: spi-nor: Fix Quad Enable method for MX25L12835F
To: Tudor.Ambarus@microchip.com
Cc: p.yadav@ti.com, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Nicolas.Ferre@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220301_061412_139546_C7724000 
X-CRM114-Status: GOOD (  13.94  )
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

SGksCgpBbSBEaS4sIDEuIE3DpHJ6IDIwMjIgdW0gMTE6NTQgVWhyIHNjaHJpZWIgPFR1ZG9yLkFt
YmFydXNAbWljcm9jaGlwLmNvbT46Cj4KPiBPbiAzLzEvMjIgMTI6MjksIEhlaWtvIFRoaWVyeSB3
cm90ZToKPiA+IEVYVEVSTkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRh
Y2htZW50cyB1bmxlc3MgeW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQo+ID4KPiA+IEhpIFR1
ZG9yLAo+ID4KPiA+IEFtIERpLiwgMS4gTcOkcnogMjAyMiB1bSAxMDo1NiBVaHIgc2NocmllYiBU
dWRvciBBbWJhcnVzCj4gPiA8dHVkb3IuYW1iYXJ1c0BtaWNyb2NoaXAuY29tPjoKPiA+Pgo+ID4+
IEhpLCBIZWlrbywKPiA+Pgo+ID4+IFdvdWxkIHlvdSBwbGVhc2UgYXBwbHkgdGhpcyBwYXRjaCBz
ZXQgb24gdG9wIG9mOgo+ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LW10ZC8yMDIy
MDIyODEzNDUwNS4yMDMyNzAtMS10dWRvci5hbWJhcnVzQG1pY3JvY2hpcC5jb20vCj4gPgo+ID4g
V2hlbiBhcHBseWluZyB0aGF0IHNlcmllcyB0aGUgZmxhc2ggd2lsbCBiZSBwcm9wZXJseSBkZXRl
Y3RlZC4KPiA+Cj4gPiBbICAgIDEuMzIyNjU1XSBzcGktbm9yIHNwaTAuMDogbXgyNWwxMjgzNWYg
KDE2Mzg0IEtieXRlcykKPiA+Cj4KPiBDb29sLiBJJ2xsIHJlc3VibWl0IGEgbmV3IHNlcmllcyB3
aGVyZSBJJ2xsIGFkZCB5b3VyIHRlc3RlZCBieSB0YWcuIEknbGwgYWxzbwo+IHJld29yZCB0aGUg
Y29tbWl0IG1lc3NhZ2VzLgo+Cj4gQWxzbywgY2FuIHlvdSBydW4gc3VjaCBhIHNjcmlwdCB0byB2
ZXJpZnkgZXJhc2Utd3JpdGUtcmVhZD8KPiAjIS9iaW4vc2gKPgo+IGRkIGlmPS9kZXYvdXJhbmRv
bSBvZj0uL3FzcGlfdGVzdCBicz0xTSBjb3VudD02Cj4gbXRkX2RlYnVnIGVyYXNlIC9kZXYvbXRk
NSAwIDYyOTE0NTYKPiBtdGRfZGVidWcgd3JpdGUgL2Rldi9tdGQ1IDAgNjI5MTQ1NiBxc3BpX3Rl
c3QKPiBtdGRfZGVidWcgcmVhZCAvZGV2L210ZDUgMCA2MjkxNDU2IHFzcGlfcmVhZAo+IHNoYTFz
dW0gcXNwaV90ZXN0IHFzcGlfcmVhZAoKSGVyZSBpcyB0aGUgb3V0cHV0OgoKIyBzaCB2ZXJpZnlf
ZXJhc2Vfd3JpdGVfcmVhZC5zaApkZCBpZj0vZGV2L3VyYW5kb20gb2Y9Li9xc3BpX3Rlc3QgYnM9
MU0gY291bnQ9Ngo2KzAgcmVjb3JkcyBpbgo2KzAgcmVjb3JkcyBvdXQKdGltZSBtdGRfZGVidWcg
ZXJhc2UgL2Rldi9tdGQwIDAgNjI5MTQ1NgpFcmFzZWQgNjI5MTQ1NiBieXRlcyBmcm9tIGFkZHJl
c3MgMHgwMDAwMDAwMCBpbiBmbGFzaApyZWFsIDBtIDQzLjI0cwp1c2VyIDBtIDAuMDBzCnN5cyAw
bSAyNC4zN3MKdGltZSBtdGRfZGVidWcgd3JpdGUgL2Rldi9tdGQwIDAgNjI5MTQ1NiBxc3BpX3Rl
c3QKQ29waWVkIDYyOTE0NTYgYnl0ZXMgZnJvbSBxc3BpX3Rlc3QgdG8gYWRkcmVzcyAweDAwMDAw
MDAwIGluIGZsYXNoCnJlYWwgMG0gMTQuNDJzCnVzZXIgMG0gMC4wMHMKc3lzIDBtIDcuODJzCnRp
bWUgbXRkX2RlYnVnIHJlYWQgL2Rldi9tdGQwIDAgNjI5MTQ1NiBxc3BpX3JlYWQKQ29waWVkIDYy
OTE0NTYgYnl0ZXMgZnJvbSBhZGRyZXNzIDB4MDAwMDAwMDAgaW4gZmxhc2ggdG8gcXNwaV9yZWFk
CnJlYWwgMG0gMC41M3MKdXNlciAwbSAwLjAwcwpzeXMgMG0gMC4zOXMKc2hhMXN1bSBxc3BpX3Rl
c3QgcXNwaV9yZWFkCmM3ZmJjNTliMjZmOTEzZWQ5NmYwZTcxMzQ2NTdjMGY5MDc2YzQwYmIgIHFz
cGlfdGVzdApjN2ZiYzU5YjI2ZjkxM2VkOTZmMGU3MTM0NjU3YzBmOTA3NmM0MGJiICBxc3BpX3Jl
YWQKCgo+Cj4gVGhhbmtzIQo+IHRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
