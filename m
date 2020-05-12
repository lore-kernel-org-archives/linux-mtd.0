Return-Path: <SRS0=zmx6=62=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F451C2D0F7
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 20:10:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0845620753
	for <linux-mtd@archiver.kernel.org>; Tue, 12 May 2020 20:10:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cn1kaprs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="lxGwy4u/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0845620753
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cxYYYn/CKxp9mi+4wDlbHk53zISTdoYbZBYBcYI8Ano=; b=cn1kaprsyK0mUe
	clKCTt0Qv5Lt8ovTXZ2Szf8iQHCTG1NadDUcnVtJGxYXoVaE1HVWmCGCraUrCuqaU7BC9JoSmaMt0
	IklNcuLf8Zmmd7tl3gHLMFCq5/zwKWQDF70EARcOdG08B4WB/ZmcnTOv0iYOyd9Pb/91sZhDpIFGj
	UO9L8Tg9Ii59pJTIKy5VLjwXuE1V2rzhDho863Xd1o83cCYi4YFNNWeHC8fQyUE53VMnLAdGB2MZq
	DGsvmsqwUh20qE1s5pPYHRDstd5ZmMZb8kbIYosSkeREfbSdjgXxEMi0E+1gOMsjnbOaYOmCsgOzA
	wdXSYjXNF+NOn5nYvd3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jYbE0-0005fb-Bn; Tue, 12 May 2020 20:10:00 +0000
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jYbDw-0005f1-U0
 for linux-mtd@lists.infradead.org; Tue, 12 May 2020 20:09:58 +0000
Received: by mail-lf1-x142.google.com with SMTP id z22so11696722lfd.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2020 13:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3xTvH/2ngkA65w8laOlMrD8FnzSgyD5dtueeCH1jUe8=;
 b=lxGwy4u/9XFJ6fpgUCLJlcqgguw/nFIL43u2qkiqz5Yna97/bL6+0+tjoddXwZi+WA
 W/5vIj9hBs0GQk+zgUiAzfw1P2JBzt2u1jxW/FgbIv7lApyppqYNdqRiNDGLt7visZhT
 0qyGXadBVAeMiVGY+upaOB9Dsd5Q800GX7v7kbQusR2W2eHVyE+3RUfjygNRjBDXE7El
 mLD1PzFw5pXLwVudVLU/4zj1FpcmA1vnk3YGtwjFbzrfG5a9+Y4xlSw1OM6/yofPDepQ
 qaWAIOr0ugXvGqQj4zfRJB6dKZ61DewXd7jsuzKrgLrJgwpFkGEe+KQtPE5IKtnyRQAy
 o7xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3xTvH/2ngkA65w8laOlMrD8FnzSgyD5dtueeCH1jUe8=;
 b=FUAjU8uRMjOR8bAL4x2W6itwqVnySWqdNuprJU0BAvtPYTUNa5xoPr2kVdNPqUcXg0
 W4fbkmLJyds3FIt7LvkHkuHQFOX51YViakppJfRu0ZBe/oJhYbH+wtc6yyA+nCi/RsbJ
 wsphgO7JYFXuz5hxi+zmQyhSBkyCfN/WgZe7Qv3231dQL1WLQTfSag5TIJCbXy22YF8n
 92NU2Rzcg/OAzS7y10ji987Q2bGysQyzQTml1b9B8/i4g+q++WAxhQdHlD1FSaRK8Kd8
 AJ+Rz8C3Tm3S1EE8ugDxGQPo/IXm/0c8I9leZ785W1EQ1umKAJMJqqzAe/VqU7OhgeaP
 ugYg==
X-Gm-Message-State: AOAM532GzDDE21wNDj6h90sjzOx1kuHxcLX/wiN0YuVvQNGwTVAjsD1a
 sspezjcpBrMuv1agTA/v4TGcyw==
X-Google-Smtp-Source: ABdhPJxzwMP1PptuWP+lxYO0cCrGiJMcu0idmPkbGGvfB6uRsxyal/VBa9SpT26EILnGjEs5TAWKSg==
X-Received: by 2002:a19:cb57:: with SMTP id b84mr15360967lfg.112.1589314193937; 
 Tue, 12 May 2020 13:09:53 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4436:fac1:c633:e333:4a04:ab9c])
 by smtp.gmail.com with ESMTPSA id w24sm14559929lfk.47.2020.05.12.13.09.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 12 May 2020 13:09:53 -0700 (PDT)
Subject: Re: [PATCH 45/62] mtd: rawnand: r852: Stop using nand_release()
To: Miquel Raynal <miquel.raynal@bootlin.com>
References: <20200510121220.18042-1-miquel.raynal@bootlin.com>
 <20200510121220.18042-46-miquel.raynal@bootlin.com>
 <fd705f87-2d40-bb2f-99cb-6583e775e2c5@cogentembedded.com>
 <20200511151038.62727bbd@xps13>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <4b166086-7d9e-a35b-8816-822c8d48a10a@cogentembedded.com>
Date: Tue, 12 May 2020 23:09:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200511151038.62727bbd@xps13>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200512_130957_169722_4DA2F642 
X-CRM114-Status: GOOD (  16.81  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Maxim Levitsky <maximlevitsky@gmail.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-mtd@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMDUvMTEvMjAyMCAwNDoxMCBQTSwgTWlxdWVsIFJheW5hbCB3cm90ZToKCj4+PiBUaGlzIGhl
bHBlciBpcyBub3QgdmVyeSB1c2VmdWwgYW5kIHZlcnkgb2Z0ZW4gcGVvcGxlIGdldCBjb25mdXNl
ZDoKPj4+IHRoZXkgdXNlIG5hbmRfcmVsZWFzZSgpIGluc3RlYWQgb2YgbmFuZF9jbGVhbnVwKCku
Cj4+Pgo+Pj4gTGV0J3Mgc3RvcCB1c2luZyBuYW5kX3JlbGVhc2UoKSBieSBjYWxsaW5nIG10ZF9k
ZXZpY2VfdW5yZWdpc3RlcigpIGFuZAo+Pj4gbmFuZF9jbGVhbnVwKCkgZGlyZWN0bHkuCj4+Pgo+
Pj4gU2lnbmVkLW9mZi1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBib290bGluLmNv
bT4KPj4+IENjOiBNYXhpbSBMZXZpdHNreSA8bWF4aW1sZXZpdHNreUBnbWFpbC5jb20+Cj4+PiAt
LS0KPj4+ICAgZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jIHwgNiArKysrLS0KPj4+ICAgMSBm
aWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9tdGQvbmFuZC9yYXcvcjg1Mi5jIGIvZHJpdmVycy9tdGQvbmFuZC9y
YXcvcjg1Mi5jCj4+PiBpbmRleCA3Nzc3NDI1MGZiMTEuLmY4NjVlM2E0N2IwMSAxMDA2NDQKPj4+
IC0tLSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L3I4NTIuYwo+Pj4gKysrIGIvZHJpdmVycy9tdGQv
bmFuZC9yYXcvcjg1Mi5jCj4+PiBAQCAtNjUxLDcgKzY1MSw4IEBAIHN0YXRpYyBpbnQgcjg1Ml9y
ZWdpc3Rlcl9uYW5kX2RldmljZShzdHJ1Y3Qgcjg1Ml9kZXZpY2UgKmRldikKPj4+ICAgCWRldi0+
Y2FyZF9yZWdpc3RlcmVkID0gMTsKPj4+ICAgCXJldHVybiAwOwo+Pj4gICBlcnJvcjM6Cj4+PiAt
CW5hbmRfcmVsZWFzZShkZXYtPmNoaXApOwo+Pj4gKwlXQVJOX09OKG10ZF9kZXZpY2VfdW5yZWdp
c3RlcihuYW5kX3RvX210ZChkZXYtPmNoaXApKSk7ICAKPj4KPj4gICAgIFNvbWV0aW1lcyB5b3Ug
ZGVjbGFyZSBhIHZhcmlhYmxlIHRvIHJlY2VpdmUgdGhlIHJlc3VsdCwgc29tZXRpbWVzIChtb3Jl
IHNlbGRvbSkgeW91IGRvbid0Li4uIFdoYXQgZ3VpZGVzIHlvdT8KPiAKPiBBYnNvbHV0ZWx5LiBU
aGUgbG9naWMgKGlmIGFueSkgd2FzOgo+IAo+IFVzZSAicmV0IiwgdW5sZXNzIEkgdGhpbmsgaXQg
ZG9lcyBub3QgZml0IHZlcnkgd2VsbCB0aGUgZHJpdmVyJ3Mgc3R5bGUKPiBvciB0aGUgbG9jYXRp
b24gd2hlcmUgSSBwdXQgaXQuIFNvIGluIHRoZSBlbmQsIGFzIEkgY29uc2lkZXIgdGhhdCBib3Ro
Cj4gYXJlIHRvdGFsbHkgZmluZSwgaXQncyBhIGJpdCBtaXhlZCBhbmQgdGhlIGNob2ljZSB2ZXJ5
IHBlcnNvbm5hbC4gRG8geW91Cj4gdGhpbmsgaXQgaXMgYSBwcm9ibGVtPwoKICAgTm8sIEkgd2Fz
IGRvdWJ0ZnVsIGFib3V0IHRoZSBvbmUtdGltZSBldmFsdWF0aW9uIG9mIHRoZSBXQVJOX09OKCkn
cyAxc3QgYXJndW1lbnQKYnV0IHRoZW4gcmVhbGl6ZWQgdGhhdCBpdCdzIHRha2luZyBjYXJlIG9m
Li4uCgo+IFRoYW5rcywKPiBNaXF1w6hsCgpNQlIsIFNlcmdlaQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9u
IG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LW10ZC8K
