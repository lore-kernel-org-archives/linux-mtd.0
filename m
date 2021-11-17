Return-Path: <SRS0=s0lc=QE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F63C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 08:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A243361BD2
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Nov 2021 08:08:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A243361BD2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EYXvQQLvJNe3LSwm8cRhKhQIF2miJF+cnx2+47HWY7k=; b=Vkmu1YBgGtkJej
	QjFQEFPWtqDXvuwlbX+ITXw5OqNA9RgTeMIT4P5/ErtnADzMHgJZIDoeIkpFn443AMw4XBR3bFGLj
	OBznOzezVrPrO5ryPbjIlIDq3R8DL8mjL6Kwxl4KlJBzDmQxoF7lNcUQS7x/x+Sb4nYQEwhIADZRA
	yJdDYw9wVI6S3T8U3BLiltbH793CBsdCWBmM/iA/OqvWQGezXfl4YfLjqrasYPngGTkjko0IhBMPC
	ESIe4I8NQjSz3Enrau4PcmUnNtM+trXjRgGhSMmU5QWIDzULWRbLQcVuxPkPfvZ6rCHTBD3+OGsuU
	5AVLoIZyYrLvraHSxs9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnFyQ-003tgr-0K; Wed, 17 Nov 2021 08:07:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnFyN-003tgJ-3Y
 for linux-mtd@lists.infradead.org; Wed, 17 Nov 2021 08:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637136430;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nilW13qTD/48ImqC9DdVhzc/yeDogF+YeNeQ4Gj89IE=;
 b=D1eMC9fhieQAVVpCvoGTfaNvLYpcQJ5hk83TyY6lcBTkWmzsFo0+f5EsIkiBJbTjwKY1pJ
 bIl1aOoHcAuLWxB7CtOMRKCydJINBn0V+/WwJ1DIJEGKb424LVDvveib2KdNLc5a6rggPS
 U9wy/w9edkc4PV7RqseOPe6o13V8818=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-P6Z69iaeNAiUp-WUxpRxFA-1; Wed, 17 Nov 2021 03:07:04 -0500
X-MC-Unique: P6Z69iaeNAiUp-WUxpRxFA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 38B101923761;
 Wed, 17 Nov 2021 08:07:02 +0000 (UTC)
Received: from T590 (ovpn-8-24.pek2.redhat.com [10.72.8.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2B86F5BAE5;
 Wed, 17 Nov 2021 08:06:50 +0000 (UTC)
Date: Wed, 17 Nov 2021 16:06:45 +0800
From: Ming Lei <ming.lei@redhat.com>
To: yangerkun <yangerkun@huawei.com>
Cc: damien.lemoal@wdc.com, axboe@kernel.dk, miquel.raynal@bootlin.com,
 richard@nod.at, vigneshr@ti.com, linux-block@vger.kernel.org,
 linux-mtd@lists.infradead.org, yi.zhang@huawei.com,
 yebin10@huawei.com, houtao1@huawei.com
Subject: Re: [QUESTION] blk_mq_freeze_queue in elevator_init_mq
Message-ID: <YZS4FYxtxYAXjtFJ@T590>
References: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d9113bf8-4654-cb04-f79c-38e11493cb2c@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211117_000715_266975_2FA049B9 
X-CRM114-Status: GOOD (  21.84  )
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

T24gV2VkLCBOb3YgMTcsIDIwMjEgYXQgMTE6Mzc6MTNBTSArMDgwMCwgeWFuZ2Vya3VuIHdyb3Rl
Ogo+IE5vd2RheXMgd2UgbWVldCB0aGUgYm9vdCByZWdyZXNzaW9uIHdoaWxlIGVuYWJsZSBsb3Rz
IG9mIG10ZGJsb2NrCgpXaGF0IGlzIHlvdXIgYm9vdCByZWdyZXNzaW9uPyBBbnkgZG1lc2cgbG9n
PwoKPiBjb21wYXJlIHdpdGggNC40LiBUaGUgbWFpbiByZWFzb24gd2FzIHRoYXQgdGhlIGJsa19t
cV9mcmVlemVfcXVldWUgaW4KPiBlbGV2YXRvcl9pbml0X21xIHdpbGwgd2FpdCBhIFJDVSBnYXAg
d2hpY2ggd2FudCB0byBtYWtlIHN1cmUgbm8gSU8gd2lsbAo+IGhhcHBlbiB3aGlsZSBibGtfbXFf
aW5pdF9zY2hlZC4KClRoZXJlIGlzbid0IFJDVSBncmFjZSBwZXJpb2QgaW1wbGllZCBpbiB0aGUg
YmxrX21xX2ZyZWV6ZV9xdWV1ZSgpIGNhbGxlZApmcm9tIGVsZXZhdG9yX2luaXRfbXEoKSwgYmVj
YXVzZSB0aGUgLnFfdXNhZ2VfY291bnRlciB3b3JrcyBhdCBhdG9taWMgbW9kZQphdCB0aGF0IHRp
bWUuCgo+IAo+IE90aGVyIG1vZHVsZSBsaWtlIGxvb3AgbWVldHMgdGhpcyBwcm9ibGVtIHRvbyBh
bmQgaGFzIGJlZW4gZml4IHdpdGgKCkFnYWluLCB3aGF0IGlzIHRoZSBwcm9ibGVtPwoKPiBmb2xs
b3cgcGF0Y2hlczoKPiAKPiAgMjExMmY1YzEzMzBhIGxvb3A6IFNlbGVjdCBJL08gc2NoZWR1bGVy
ICdub25lJyBmcm9tIGluc2lkZSBhZGRfZGlzaygpCj4gIDkwYjcxOTgwMDFmMiBibGstbXE6IElu
dHJvZHVjZSB0aGUgQkxLX01RX0ZfTk9fU0NIRURfQllfREVGQVVMVCBmbGFnCj4gCj4gVGhleSBj
aGFuZ2UgdGhlIGRlZmF1bHQgSU8gc2NoZWR1bGVyIGZvciBsb29wIHRvICdub25lJy4gU28gbm8g
bmVlZCB0bwo+IGNhbGwgYmxrX21xX2ZyZWV6ZV9xdWV1ZSBhbmQgYmxrX21xX2luaXRfc2NoZWQu
IEJ1dCBpdCBzZWVtcyBub3QKPiBhcHByb3ByaWF0ZSBmb3IgbXRkYmxvY2tzLiBNdGRibG9ja3Mg
Y2FuIHVzZSAnbXEtZGVhZGxpbmUnIHRvIGhlbHAKPiBvcHRpbWl6ZSB0aGUgcmFuZG9tIHdyaXRl
IHdpdGggdGhlIGhlbHAgb2YgbXRkYmxvY2sncyBjYWNoZS4gT25jZSBjaGFuZ2UKPiB0byAnbm9u
ZScsIHdlIG1heSBtZWV0IHRoZSByZWdyZXNzaW9uIGZvciByYW5kb20gd3JpdGUuCj4gCj4gY29t
bWl0IDczN2ViNzhlODJkNTJkMzVkZjE2NmQyOWFmMzJiZjYxOTkyZGU3MWQKPiBBdXRob3I6IERh
bWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5jb20+Cj4gRGF0ZTogICBUaHUgU2VwIDUg
MTg6NTE6MzMgMjAxOSArMDkwMAo+IAo+ICAgICBibG9jazogRGVsYXkgZGVmYXVsdCBlbGV2YXRv
ciBpbml0aWFsaXphdGlvbgo+IAo+ICAgICAuLi4KPiAKPiAgICAgQWRkaXRpb25hbGx5LCB0byBt
YWtlIHN1cmUgdGhhdCB0aGUgZWxldmF0b3IgaW5pdGlhbGl6YXRpb24gaXMgbmV2ZXIKPiAgICAg
ZG9uZSB3aGlsZSByZXF1ZXN0cyBhcmUgaW4tZmxpZ2h0ICh0aGVyZSBzaG91bGQgYmUgbm9uZSB3
aGVuIHRoZSBkZXZpY2UKPiAgICAgZHJpdmVyIGNhbGxzIGRldmljZV9hZGRfZGlzaygpKSwgZnJl
ZXplIGFuZCBxdWllc2NlIHRoZSBkZXZpY2UgcmVxdWVzdAo+ICAgICBxdWV1ZSBiZWZvcmUgY2Fs
bGluZyBibGtfbXFfaW5pdF9zY2hlZCgpIGluIGVsZXZhdG9yX2luaXRfbXEoKS4KPiAgICAgLi4u
Cj4gCj4gVGhpcyBjb21taXQgYWRkIGJsa19tcV9mcmVlemVfcXVldWUgaW4gZWxldmF0b3JfaW5p
dF9tcSB3aGljaCB0cnkgdG8KPiBtYWtlIHN1cmUgbm8gaW4tZmxpZ2h0IHJlcXVlc3Qgd2hpbGUg
d2UgZ28gdGhyb3VnaCBibGtfbXFfaW5pdF9zY2hlZC4KPiBCdXQgZG9lcyB0aGVyZSBhbnkgZHJp
dmVycyBjYW4gbGVhdmUgSU8gYWxpdmUgd2hpbGUgd2UgZ28gdGhyb3VnaAo+IGVsZXZhdG9yX2lu
aXRfbXHvvJ8gQW5kIGlmIG5vLCBtYXliZSB3ZSBjYW4ganVzdCByZW1vdmUgdGhpcyBsb2dpY2Fs
IHRvCj4gZml4IHRoZSByZWdyZXNzaW9uLi4uCgpTQ1NJIHNob3VsZCBoYXZlIHBhc3N0aHJvdWdo
IHJlcXVlc3RzIGF0IHRoYXQgbW9tZW50LgoKCgpUaGFua3MsCk1pbmcKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
