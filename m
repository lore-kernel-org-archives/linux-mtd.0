Return-Path: <SRS0=AumS=GX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3314C433E0
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BDD23356
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Jan 2021 15:02:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33BDD23356
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u71T48xSr58tzJhLSQMmv+o5s4Aq+Sn8qKG2g18NQpU=; b=KMfLNuNCEeFdPWOq+VsEKBpLI
	3cVgrLIDX2Ks1zl3VdKw/SYdusBfJ19dPE2kY4dwsP/5ZtAGdXvosB2GpMTEK6JUBGOmJCDYelvxg
	cnXkSyi+a6A41no/W+TsvzvRrLkTW+hSkWJywDXzJAvuT5pE3oH965ngNPJd7cZQEL7OBHs42Lwj6
	U2QTY61ymvxs3yqyVBQ0SWxbOO7QQ9JIqDBdO4WM0w0tWdpvtgHffkS8vEbu6qiJUD+ee7LiKlI4g
	8oIdLE2tvFLvXh+iUfPKIVkVupEDdu/4vYnO9gfNEEGZHFby7ulHlvxzo7XMVLA70qt+Q9bnWptCG
	LV/gLkZfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2Ezu-0002Gd-IJ; Wed, 20 Jan 2021 15:02:14 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2Ezr-0002Ee-7Z
 for linux-mtd@lists.infradead.org; Wed, 20 Jan 2021 15:02:12 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 714C622727;
 Wed, 20 Jan 2021 16:02:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1611154925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUHuaCPz16VMa7CYH8WbEw6Xdv8BgjZHYjL6590ZBPc=;
 b=uheoepFQtsTTigNWCwM48rCQ2vQd7kXwLLUWWEAbcWX0dujmbKPuCDvw0EPLqiG2FG5eNe
 Xi9jnS/JNKVvt9Knkf+e2CxjLqYd/q6j5+P1ISsc/Cy5Q4P2nX3xTK1v5C8iLW9XARHeKQ
 upEs8IEhrxDY2E3FDw2bHDIvyrL2y3Q=
MIME-Version: 1.0
Date: Wed, 20 Jan 2021 16:02:05 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: sst: Add support for Global Unlock
 on sst26vf
In-Reply-To: <ad0cc416-73b7-f626-115f-d192fac17957@microchip.com>
References: <20210120131914.277363-1-tudor.ambarus@microchip.com>
 <20210120131914.277363-2-tudor.ambarus@microchip.com>
 <b3a61abec8927c7229c27415d2c769a8@walle.cc>
 <ad0cc416-73b7-f626-115f-d192fac17957@microchip.com>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <447aca9c61a45b05f7869b9747e2c301@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_100211_387707_66117736 
X-CRM114-Status: GOOD (  10.54  )
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
Cc: vigneshr@ti.com, richard@nod.at, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Kavyasree.Kotagiri@microchip.com,
 miquel.raynal@bootlin.com, p.yadav@ti.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

QW0gMjAyMS0wMS0yMCAxNTo1Miwgc2NocmllYiBUdWRvci5BbWJhcnVzQG1pY3JvY2hpcC5jb206
Cj4gT24gMS8yMC8yMSA0OjA1IFBNLCBNaWNoYWVsIFdhbGxlIHdyb3RlOgo+Pj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMgYi9kcml2ZXJzL210ZC9zcGktbm9yL3NzdC5j
Cj4+PiBpbmRleCAwMGU0OGRhMDc0NGEuLmQ2ZTEzOTZhYmI5NiAxMDA2NDQKPj4+IC0tLSBhL2Ry
aXZlcnMvbXRkL3NwaS1ub3Ivc3N0LmMKPj4+ICsrKyBiL2RyaXZlcnMvbXRkL3NwaS1ub3Ivc3N0
LmMKPj4+IEBAIC04LDYgKzgsMzkgQEAKPj4+IAo+Pj4gwqAjaW5jbHVkZSAiY29yZS5oIgo+Pj4g
Cj4+PiArc3RhdGljIGludCBzc3QyNnZmX2xvY2soc3RydWN0IHNwaV9ub3IgKm5vciwgbG9mZl90
IG9mcywgdWludDY0X3QgCj4+PiBsZW4pCj4+PiArewo+Pj4gK8KgwqDCoMKgIHJldHVybiAtRU9Q
Tk9UU1VQUDsKPj4+ICt9Cj4+PiArCj4+PiArc3RhdGljIGludCBzc3QyNnZmX3VubG9jayhzdHJ1
Y3Qgc3BpX25vciAqbm9yLCBsb2ZmX3Qgb2ZzLCB1aW50NjRfdAo+Pj4gbGVuKQo+Pj4gK3sKPj4+
ICvCoMKgwqDCoCBpZiAob2ZzID09IDAgJiYgbGVuID09IG5vci0+cGFyYW1zLT5zaXplKQo+Pj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gc3BpX25vcl9nbG9iYWxfYmxvY2tfdW5s
b2NrKG5vcik7Cj4+IAo+PiAKPj4gU29tZSBibG9ja3MgbWlnaHQgbm90IGJlIHVubG9ja2VkIGJl
Y2F1c2UgdGhleSBhcmUgcGVybWFuZW50bHkKPj4gbG9ja2VkLiBEb2VzIGl0IG1ha2Ugc2Vuc2Ug
dG8gcmVhZCBCUE5WIG9mIHRoZSBjb250cm9sIHJlZ2lzdGVyCj4+IGFuZCBhZGQgYSBkZWJ1ZyBt
ZXNzYWdlIGhlcmU/Cj4gCj4gSXQgd291bGQsIHllcy4gSWYgYW55IGJsb2NrIGlzIHBlcm1hbmVu
dGx5IGxvY2tlZCBpbiB0aGUgdW5sb2NrX2FsbCAKPiBjYXNlLAo+IEknbGwganVzdCBwcmludCBh
IGRiZyBtZXNzYWdlIGFuZCByZXR1cm4gLUVJTlZBTC4gU291bmRzIGdvb2Q/CgpzcGlfbm9yX3Ny
X3VubG9jaygpLCBhdG1lbF9hdDI1ZnNfdW5sb2NrKCkgYW5kIGF0bWVsX2dsb2JhbF91bnByb3Rl
Y3QoKQp3aWxsIHJldHVybiAtRUlPIGluIGNhc2UgdGhlIFNSIHdhc24ndCB3cml0YWJsZS4KCi1t
aWNoYWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
