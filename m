Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78022C2BA16
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Jun 2024 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z4aQ+w6hF6HvpNFdBjXNmJ1iMUrKWNqzAef64vhigt0=; b=IBLAK/4ss3XsiZ
	OO9p7JAok5geHwm5nbEKJLUREUBFpeiUh4OLsAAScQ6T7OMgjNkzs+h0GPnG6maHHzvER6MsCqUvp
	Ug4d2w7Od07CiqnlmqIXZ4mh1DnoWohLggt5WP7aH8f/ShuR/GY7cw3ttampO079VJ6qLCxVmg0BD
	q9SbyhlVEfM2ukiLuFrY1pMfZCASz5JQDm3VZ9s9Uh9xSDrFVWdyaGqO8APdMO0ZD/4g7Oz3uYdM/
	t0xpx5HHt9OW23pkvCz1pigpJ7psLEBAnjTqSlbLvUlyMZkOBr29Im0a/dtE0jcyoZ9tDg/n6NVW6
	SwPvw/HhECDzISQE8AQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQKl-0000000DGE6-1Iis;
	Wed, 12 Jun 2024 15:56:23 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQKh-0000000DGBM-1ZTq
	for linux-mtd@lists.infradead.org;
	Wed, 12 Jun 2024 15:56:21 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6ae259b1c87so9673096d6.1
        for <linux-mtd@lists.infradead.org>; Wed, 12 Jun 2024 08:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1718207778; x=1718812578; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0JAgWI6yypeQvJHtBsLjxy9EsiTAtsBZFfQkPH4VMNc=;
        b=rX7Bsud9E9W0KKEvRVo9vvePC5oHluX/AQX63C1qV5YfkT+kP1M2N9koFyDpxTruG+
         noq+TYDb1dy8XBnF7LqyPkoF5phpMnSIAKHq4Mi7DJ/Tv9M9V1uR43PoZ0fnNX2DMpf4
         COBnzcz8xnnA1TNMGpIZ7/JaF6lhnh6TEeEic=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718207778; x=1718812578;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JAgWI6yypeQvJHtBsLjxy9EsiTAtsBZFfQkPH4VMNc=;
        b=T8EHDM0JPJQNvip0y8PJbZgG0DRkrZO79iZ0jnSk/QleMo1G8dSl0wo8MHDFWjK/kG
         /fzdkJ2aWwIoVCfxAbh67TGPS9Oxf8rZL2OmPu+xwA0+jvppmuzP+rQIrjJoxt+v65QA
         rRHxywew39gpxQ5/rIohYctLCCRbvae/jp4g7KRlMFy0QqpDLKM2opF95Cuczpbzuo27
         p6KUdSpYn2QBsnaSa1JBAWjDQRTSIi3GLBOp2qsWNQxa4H+CnnN67CBZeqNOKdbFokqA
         twQaqVpTVrSa+Isv0oONq//OBlrCOVOXZpygvpHft7Jt3kDg+K/nYsqukFpasFVFoWmH
         Jj6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWREI5S/wZpgBohwaPMMd7qbwq5XZVE/T3GI/cctUBuWufOy4nywghAiseSNiw2CALJeQStkvWS4klOSXq59SVBDWF/2YhYVBvNu89fRQ==
X-Gm-Message-State: AOJu0YwMpbt56LxsGCX7sTzJlZjBJmXzcGH6KKeMRhW1xGR+g5K1SRd+
	1PZfmwJZRYMymH8vZ7lo8YhPvNX0KMgcowG4SqXdb5ihVv0UZ/AxnGx3PvISrBM=
X-Google-Smtp-Source: AGHT+IH3vJ/Cfk8LzYoeLv9cXT/SgN6Pt3X56xC7VVYFazmjn8i4deMSmAqg4iM25NKqjeo5TBvU1g==
X-Received: by 2002:a05:6214:2a47:b0:6b0:7365:dde0 with SMTP id 6a1803df08f44-6b2a33de160mr1306776d6.18.1718207777691;
        Wed, 12 Jun 2024 08:56:17 -0700 (PDT)
Received: from localhost ([213.195.124.163])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b0884337e9sm22877866d6.16.2024.06.12.08.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 08:56:17 -0700 (PDT)
Date: Wed, 12 Jun 2024 17:56:15 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>, Geert Uytterhoeven <geert@linux-m68k.org>,
	Richard Weinberger <richard@nod.at>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Christoph =?utf-8?Q?B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
	Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Alasdair Kergon <agk@redhat.com>,
	Mike Snitzer <snitzer@kernel.org>,
	Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
	Yu Kuai <yukuai3@huawei.com>,
	Vineeth Vijayan <vneethv@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
	drbd-dev@lists.linbit.com, nbd@other.debian.org,
	linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
	virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
	linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
	linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
Subject: Re: [PATCH 10/26] xen-blkfront: don't disable cache flushes when
 they fail
Message-ID: <ZmnFH17bTV2Ot_iR@macbook>
References: <20240611051929.513387-1-hch@lst.de>
 <20240611051929.513387-11-hch@lst.de>
 <ZmlVziizbaboaBSn@macbook>
 <20240612150030.GA29188@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612150030.GA29188@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_085619_446078_8C2833EF 
X-CRM114-Status: GOOD (  32.20  )
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

T24gV2VkLCBKdW4gMTIsIDIwMjQgYXQgMDU6MDA6MzBQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gV2VkLCBKdW4gMTIsIDIwMjQgYXQgMTA6MDE6MThBTSArMDIwMCwgUm9n
ZXIgUGF1IE1vbm7DqSB3cm90ZToKPiA+IE9uIFR1ZSwgSnVuIDExLCAyMDI0IGF0IDA3OjE5OjEw
QU0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiBibGtmcm9udCBhbHdheXMg
aGFkIGEgcm9idXN0IG5lZ290aWF0aW9uIHByb3RvY29sIGZvciBkZXRlY3RpbmcgYSB3cml0ZQo+
ID4gPiBjYWNoZS4gIFN0b3Agc2ltcGx5IGRpc2FibGluZyBjYWNoZSBmbHVzaGVzIHdoZW4gdGhl
eSBmYWlsIGFzIHRoYXQgaXMKPiA+ID4gYSBncmF2ZSBlcnJvci4KPiA+IAo+ID4gSXQncyBteSB1
bmRlcnN0YW5kaW5nIHRoZSBjdXJyZW50IGNvZGUgYXR0ZW1wdHMgdG8gY292ZXIgdXAgZm9yIHRo
ZQo+ID4gbGFjayBvZiBndWFyYW50ZWVzIHRoZSBmZWF0dXJlIGl0c2VsZiBwcm92aWRlczoKPiAK
PiA+IFNvIGV2ZW4gd2hlbiB0aGUgZmVhdHVyZSBpcyBleHBvc2VkLCB0aGUgYmFja2VuZCBtaWdo
dCByZXR1cm4KPiA+IEVPUE5PVFNVUFAgZm9yIHRoZSBmbHVzaC9iYXJyaWVyIG9wZXJhdGlvbnMu
Cj4gCj4gSG93IGlzIHRoaXMgc3VwcG9zZWQgdG8gd29yaz8gIEkgbWVhbiBpbiB0aGUgd29yc3Qg
Y2FzZSB3ZSBjb3VsZAo+IGp1c3QgaW1tZWRpYXRlbHkgY29tcGxldGUgdGhlIGZsdXNoIHJlcXVl
c3RzIGluIHRoZSBkcml2ZXIsIGJ1dAo+IHdlJ3JlIHJlYWxseSBseWluZyB0byBhbnkgdXBwZXIg
bGF5ZXIuCgpSaWdodC4gIEFGQUlDVCBhZHZlcnRpc2luZyAiZmVhdHVyZS1iYXJyaWVyIiBhbmQv
b3IKImZlYXR1cmUtZmx1c2gtY2FjaGUiIGNvdWxkIGJlIGRvbmUgYmFzZWQgb24gd2hldGhlciBi
bGtiYWNrCnVuZGVyc3RhbmQgdGhvc2UgY29tbWFuZHMsIG5vdCBvbiB3aGV0aGVyIHRoZSB1bmRl
cmx5aW5nIHN0b3JhZ2UKc3VwcG9ydHMgdGhlIGVxdWl2YWxlbnQgb2YgdGhlbS4KCldvcnN0IGNh
c2Ugd2UgY2FuIHByaW50IGEgd2FybmluZyBtZXNzYWdlIG9uY2UgYWJvdXQgdGhlIHVuZGVybHlp
bmcKc3RvcmFnZSBmYWlsaW5nIHRvIGNvbXBsZXRlIGZsdXNoL2JhcnJpZXIgcmVxdWVzdHMsIGFu
ZCB0aGF0IGRhdGEKaW50ZWdyaXR5IG1pZ2h0IG5vdCBiZSBndWFyYW50ZWVkIGdvaW5nIGZvcndh
cmQsIGFuZCBub3QgcHJvcGFnYXRlIHRoZQplcnJvciB0byB0aGUgdXBwZXIgbGF5ZXI/CgpXaGF0
IHdvdWxkIGJlIHRoZSBjb25zZXF1ZW5jZSBvZiBwcm9wYWdhdGluZyBhIGZsdXNoIGVycm9yIHRv
IHRoZQp1cHBlciBsYXllcnM/Cgo+ID4gU3VjaCBmYWlsdXJlIGlzIHRpZWQgb24gd2hldGhlciB0
aGUgdW5kZXJseWluZyBibGtiYWNrIHN0b3JhZ2UKPiA+IHN1cHBvcnRzIFJFUV9PUF9XUklURSB3
aXRoIFJFUV9QUkVGTFVTSCBvcGVyYXRpb24uICBibGtiYWNrIHdpbGwKPiA+IGV4cG9zZSAiZmVh
dHVyZS1iYXJyaWVyIiBhbmQvb3IgImZlYXR1cmUtZmx1c2gtY2FjaGUiIHdpdGhvdXQga25vd2lu
Zwo+ID4gd2hldGhlciB0aGUgdW5kZXJseWluZyBiYWNrZW5kIHN1cHBvcnRzIHRob3NlIG9wZXJh
dGlvbnMsIGhlbmNlIHRoZQo+ID4gd2VpcmQgZmFsbGJhY2sgaW4gYmxrZnJvbnQuCj4gCj4gSWYg
d2UgYXJlIGp1c3QgdGFsa2luZyBhYm91dCB0aGUgTGludXggYmxrYmFjayBkcml2ZXIgKEkga25v
dyB0aGVyZQo+IHByb2JhYmx5IGFyZSBhIGZldyBvdGhlciBpbXBsZW1lbnRhdGlvbnMpIGl0IHdv
bid0IGV2ZXJ5IGRvIHRoYXQuCj4gSSBzZWUgaXQgaGFzIGNvZGUgdG8gZG8gc28sIGJ1dCB0aGUg
TGludXggYmxvY2sgbGF5ZXIgZG9lc24ndAo+IGFsbG93IHRoZSBmbHVzaCBvcGVyYXRpb24gdG8g
cmFuZG9tbHkgZmFpbCBpZiBpdCB3YXMgcHJldmlvdXNseQo+IGFkdmVydGlzZWQuICBOb3RlIHRo
YXQgZXZlbiBibGtmcm9udCBjb25mb3JtcyB0byB0aGlzIGFzIGl0IGZpeGVzCj4gdXAgdGhlIHJl
dHVybiB2YWx1ZSB3aGVuIGl0IGdldHMgdGhpcyBub3RzdXBwIGVycm9yIHRvIG9rLgoKWWVzLCBJ
J20gYWZyYWlkIGl0J3MgaW1wb3NzaWJsZSB0byBrbm93IHdoYXQgdGhlIG11bHRpcGxlIGluY2Fy
bmF0aW9ucwpvZiBhbGwgdGhlIHNjYXR0ZXJlZCBibGtiYWNrIGltcGxlbWVudGF0aW9ucyBwb3Nz
aWJseSBkbyAoRnJlZUJTRCwKTmV0QlNELCBRRU1VIGFuZCBibGt0YXAgYXQgbGVhc3QgSSBrbm93
IG9mKS4KCj4gPiBPdmVyYWxsIGJsa2JhY2sgc2hvdWxkIGVuc3VyZSB0aGF0IFJFUV9QUkVGTFVT
SCBpcyBzdXBwb3J0ZWQgYmVmb3JlCj4gPiBleHBvc2luZyAiZmVhdHVyZS1iYXJyaWVyIiBvciAi
ZmVhdHVyZS1mbHVzaC1jYWNoZSIsIGFzIHRoZW4gdGhlCj4gPiBleHBvc2VkIGZlYXR1cmVzIHdv
dWxkIHJlYWxseSBtYXRjaCB3aGF0IHRoZSB1bmRlcmx5aW5nIGJhY2tlbmQKPiA+IHN1cHBvcnRz
IChyYXRoZXIgdGhhbiB0aGUgY29tbWFuZHMgYmxrYmFjayBrbm93cyBhYm91dCkuCj4gCj4gWWVz
LiAgVGhlIGluLXRyZWUgeGVuLWJsa2JhY2sgZG9lcyB0aGF0LCBidXQgZXZlbiB3aXRob3V0IHRo
YXQgdGhlCj4gTGludXggYmxvY2sgbGF5ZXIgYWN0dWFsbHkgbWFrZXMgc3VyZSBmbHVzaGVzIHNl
bnQgYnkgdXBwZXIgbGF5ZXJzCj4gYWx3YXlzIHN1Y2NlZWQgZXZlbiB3aGVuIG5vdCBzdXBwb3J0
ZWQuCgpHaXZlbiB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIGZlYXR1cmUgaW4gdGhlIGJsa2lmIGhl
YWRlciwgSSdtIGFmcmFpZAp3ZSBjYW5ub3QgZ3VhcmFudGVlIHRoYXQgc2VlaW5nIHRoZSBmZWF0
dXJlIGV4cG9zZWQgaW1wbGllcyBiYXJyaWVyIG9yCmZsdXNoIHN1cHBvcnQsIHNpbmNlIHRoZSBy
ZXF1ZXN0IGNvdWxkIGZhaWwgYXQgYW55IHRpbWUgKG9yIGV2ZW4gZnJvbQp0aGUgc3RhcnQgb2Yg
dGhlIGRpc2sgYXR0YWNobWVudCkgYW5kIGl0IHdvdWxkIHN0aWxsIHNhZGx5IGJlIGEgY29ycmVj
dAppbXBsZW1lbnRhdGlvbiBnaXZlbiB0aGUgZGVzY3JpcHRpb24gb2YgdGhlIG9wdGlvbnMuCgpU
aGFua3MsIFJvZ2VyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
