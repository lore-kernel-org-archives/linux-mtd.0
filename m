Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F68C2BA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GnBpDbpT3YjTe26m7tYQPTTQwzcs1XtlYyJfqsMLnRU=; b=vTIVuQzypaRZ8g
	tBh3GmsqiNZDUrOnHJkXVcLqPT6+REXt8rnA4cZ0a/xMsA3lsd64GFMErS4bsTTknpwaCSpfx0PWe
	5jPQ6iiEJyZQKTQ50KnbwV8+9hVZmEx08/sQ5SiFNywwCjy6u4yV4joGVPp/Rf2XRIWadDuDu35Uk
	9X75kc4hWDCRTVcQawblQCMCZI9B8Sq1OhCicTHYaUv/KGzPbYfr2XcLG4+7EmgcuBHSu1C8GSZur
	amZZOByI3KuDy5AacU8cKAPpUzhjtQGhOPZLvzIgehD4ZzWaGVSWHjMoqdJzZdH3vnhfbNQY6Zhyy
	1ZtGpfNa2SG1yiOrbO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9pU-0000000AJmL-1iNb;
	Mon, 17 Jun 2024 10:43:16 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9pO-0000000AJie-1vp3;
	Mon, 17 Jun 2024 10:43:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D41D35FEE9;
	Mon, 17 Jun 2024 10:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718620989; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eS6cZAP8PrCUOUN3SU0P3EiUgWRFs6k3X4SwgCCySaI=;
	b=cmmSBPs25p4H4sEPwGAIYUiX2uwegnyNhIlwPRzQIpdoOZGj4JzaP3T8DaODLiPWw9mUSz
	s5RMqwmmPfI36ETol7BRoAzdTd/vWZnvteESUa9wQj/IFwaYT5ru7oXBeGITPuMeg/aVw4
	ZM+TU4wok4o8O2S9lA/KuJze2r5v9p0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718620989;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eS6cZAP8PrCUOUN3SU0P3EiUgWRFs6k3X4SwgCCySaI=;
	b=B92gbOLVQD6eAgdjn6Bzl4NFN7iNb0ySX50WmsPod9PQCFGJEWc7mxy6VV5cJV6T7cKH+y
	aEdGgm/8XNL9s8Cw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718620988; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eS6cZAP8PrCUOUN3SU0P3EiUgWRFs6k3X4SwgCCySaI=;
	b=TiRVzeY4b8BgXR1AVgVsNj7xraN6gx3lVPXLO5ki0L3pyeW2PafUroYNXEvKyBSl6Ggs44
	O8c3ELPSkDfeSso6KRmUefFHpezgWAKZGNzsEQ4v1MvPsuF7iSYFfz+y7Q05o2mR/FYIfg
	IE68WQfGWmDYf2Hn74jpq+bs83fGxNo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718620988;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eS6cZAP8PrCUOUN3SU0P3EiUgWRFs6k3X4SwgCCySaI=;
	b=t5CaYJdw/5jN1yYQGG3K3dgg+uYjoVndVeOMh4ZeKdHOePhVDEm+C37+u16j5art4bCLkv
	h7mou1Tr9IUL9RCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 23BEA13AAA;
	Mon, 17 Jun 2024 10:43:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id HfgcCDwTcGYwDgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 17 Jun 2024 10:43:08 +0000
Message-ID: <23e0aac6-9af5-468f-a7d1-a331fe06c3a3@suse.de>
Date: Mon, 17 Jun 2024 12:43:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 22/26] block: move the zoned flag into the features field
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 Richard Weinberger <richard@nod.at>,
 Philipp Reisner <philipp.reisner@linbit.com>,
 Lars Ellenberg <lars.ellenberg@linbit.com>,
 =?UTF-8?Q?Christoph_B=C3=B6hmwalder?= <christoph.boehmwalder@linbit.com>,
 Josef Bacik <josef@toxicpanda.com>, Ming Lei <ming.lei@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
 Mikulas Patocka <mpatocka@redhat.com>, Song Liu <song@kernel.org>,
 Yu Kuai <yukuai3@huawei.com>, Vineeth Vijayan <vneethv@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 linux-m68k@lists.linux-m68k.org, linux-um@lists.infradead.org,
 drbd-dev@lists.linbit.com, nbd@other.debian.org,
 linuxppc-dev@lists.ozlabs.org, ceph-devel@vger.kernel.org,
 virtualization@lists.linux.dev, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, dm-devel@lists.linux.dev,
 linux-raid@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-mtd@lists.infradead.org, nvdimm@lists.linux.dev,
 linux-nvme@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org,
 Damien Le Moal <dlemoal@kernel.org>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-23-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240617060532.127975-23-hch@lst.de>
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLex1noz7jcsrkfdtgx8bqesde)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,lst.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_034310_732261_A6463694 
X-CRM114-Status: UNSURE (   9.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gNi8xNy8yNCAwODowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSB0aGUgem9u
ZWQgZmxhZ3MgaW50byB0aGUgZmVhdHVyZXMgZmllbGQgdG8gcmVjbGFpbSBhIGxpdHRsZQo+IGJp
dCBvZiBzcGFjZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KPiBSZXZpZXdlZC1ieTogRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2VybmVsLm9yZz4K
PiAtLS0KPiAgIGJsb2NrL2Jsay1zZXR0aW5ncy5jICAgICAgICAgICB8ICA1ICsrLS0tCj4gICBk
cml2ZXJzL2Jsb2NrL251bGxfYmxrL3pvbmVkLmMgfCAgMiArLQo+ICAgZHJpdmVycy9ibG9jay91
YmxrX2Rydi5jICAgICAgIHwgIDIgKy0KPiAgIGRyaXZlcnMvYmxvY2svdmlydGlvX2Jsay5jICAg
ICB8ICA1ICsrKy0tCj4gICBkcml2ZXJzL21kL2RtLXRhYmxlLmMgICAgICAgICAgfCAxMSArKysr
KystLS0tLQo+ICAgZHJpdmVycy9tZC9kbS16b25lLmMgICAgICAgICAgIHwgIDIgKy0KPiAgIGRy
aXZlcnMvbWQvZG0tem9uZWQtdGFyZ2V0LmMgICB8ICAyICstCj4gICBkcml2ZXJzL252bWUvaG9z
dC96bnMuYyAgICAgICAgfCAgMiArLQo+ICAgZHJpdmVycy9zY3NpL3NkX3piYy5jICAgICAgICAg
IHwgIDIgKy0KPiAgIGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAgICAgICB8ICA5ICsrKysrKy0t
LQo+ICAgMTAgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25zKC0p
Cj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNoZWVycywK
Ckhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICAgIEtlcm5lbCBT
dG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgsIEZyYW5r
ZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJnKSwgR0Y6
IEkuIFRvdGV2LCBBLiBNY0RvbmFsZCwgVy4gS25vYmxpY2gKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24g
bWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbXRkLwo=
