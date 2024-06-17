Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A167EC2BA18
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lj0qi4mUxmOoPgLxZBn9HTyKPDBTIQe5HxA294YjaA=; b=yD31LzhV/63kcM
	YMmsErsiPxEkfyAw7UOis6yHEHLYtrTbww2mApDQkpXvsfyxR44eODLnUlShmVXfk6OXMbXrUvXuI
	l7f36F/Rj1nlb4/hMiWv1hA0FkwguSWib6MgpAfHyGiU/ErebbuT0k80YGl927qGG6eqkn5/NGh7X
	HLmLGGL+0mn/i0939vHnvZt1/dvkqw+dPNbm/Ke5vp6LtVllyxxC/rXG4sMB6/Hh9l1ZvhPXqdKf1
	+1N4yBmWitWhDwV7eu8Gbyy8/UxZWqln4h4YIJGfg9LaJ8mAIaIrXRsSXFXWItbXkCmF7MAxvefHt
	zutRWrbXpS/PrOUTxvaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9mV-0000000AIO1-2gqd;
	Mon, 17 Jun 2024 10:40:11 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9mO-0000000AIL7-1Wb9;
	Mon, 17 Jun 2024 10:40:10 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9E7663803B;
	Mon, 17 Jun 2024 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718620802; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Udw7UxW9RD3hNhptJltcmuBZ5/E3Nt3KJ3oFtf1o28Y=;
	b=oOv3IjDDx2wwA/r3rxn0NrWSiorUlzu/LZiijLg8zoFMNTIfIM4KACkJhGKNr5tgCgDFN2
	swyfAOkUz04diI4ZMqo8O9CfOPpwu5I9Mbz5BfhGU7kk82GiUoe9lOYe/FmJo0YDcXy45h
	p6sRFsU8MYD8T30FAykkFiDl4pSJT1Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718620802;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Udw7UxW9RD3hNhptJltcmuBZ5/E3Nt3KJ3oFtf1o28Y=;
	b=Ot8p2izY0JtiMVs7/UuRj91DhFSpICfcz8ETan8iR+o2zqUCceOag3Og+ELTgEFRWMxfbJ
	H8kXANgn0V48g2BA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718620801; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Udw7UxW9RD3hNhptJltcmuBZ5/E3Nt3KJ3oFtf1o28Y=;
	b=Qm6g/5pLH7+rQF9CQcnhh4VfHY9JM1VLyrzusyShCKdjoL8ke6Y5p2a8ZvdRK9QO5njFgF
	YkCNGSzlCWSjguEvmCBuyak35LtQXw/NkOXCaYD3xb3wZfhtp026a65y7DMmmBLXFaq8EC
	tC3POtul8QOovRe401BsrfyBEimwH3I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718620801;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Udw7UxW9RD3hNhptJltcmuBZ5/E3Nt3KJ3oFtf1o28Y=;
	b=I5XoAx519a0gdMtOMGCbku8aSmfojCQpJBFdmrQf3R2hUK40sd4Fa4cUr6ieELRADq/qgE
	4hoN05xE6nA/YkBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1B20313AAA;
	Mon, 17 Jun 2024 10:40:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qgSdBYEScGZBDQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 17 Jun 2024 10:40:01 +0000
Message-ID: <293c79ef-43fe-4a08-8e2d-54aa61d04d43@suse.de>
Date: Mon, 17 Jun 2024 12:40:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/26] block: move the stable_writes flag to queue_limits
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
 <20240617060532.127975-18-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240617060532.127975-18-hch@lst.de>
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCPT_COUNT_TWELVE(0.00)[38];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLex1noz7jcsrkfdtgx8bqesde)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo,lst.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_034004_720948_30B4A597 
X-CRM114-Status: GOOD (  13.90  )
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

T24gNi8xNy8yNCAwODowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSB0aGUgc3Rh
YmxlX3dyaXRlcyBmbGFnIGludG8gdGhlIHF1ZXVlX2xpbWl0cyBmZWF0dXJlIGZpZWxkIHNvIHRo
YXQKPiBpdCBjYW4gYmUgc2V0IGF0b21pY2FsbHkgd2l0aCB0aGUgcXVldWUgZnJvemVuLgo+IAo+
IFRoZSBmbGFnIGlzIG5vdyBpbmhlcml0ZWQgYnkgYmxrX3N0YWNrX2xpbWl0cywgd2hpY2ggZ3Jl
YXRseSBzaW1wbGlmaWVzCj4gdGhlIGNvZGUgaW4gZG0sIGFuZCBmaXhlZCBtZCB3aGljaCBwcmV2
aW91c2x5IGRpZCBub3QgcGFzcyBvbiB0aGUgZmxhZwo+IHNldCBvbiBsb3dlciBkZXZpY2VzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmll
d2VkLWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGxlbW9hbEBrZXJuZWwub3JnPgo+IC0tLQo+ICAgYmxv
Y2svYmxrLW1xLWRlYnVnZnMuYyAgICAgICAgIHwgIDEgLQo+ICAgYmxvY2svYmxrLXN5c2ZzLmMg
ICAgICAgICAgICAgIHwgMjkgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgIGRyaXZl
cnMvYmxvY2svZHJiZC9kcmJkX21haW4uYyB8ICA1ICsrLS0tCj4gICBkcml2ZXJzL2Jsb2NrL3Ji
ZC5jICAgICAgICAgICAgfCAgOSArKystLS0tLS0KPiAgIGRyaXZlcnMvYmxvY2svenJhbS96cmFt
X2Rydi5jICB8ICAyICstCj4gICBkcml2ZXJzL21kL2RtLXRhYmxlLmMgICAgICAgICAgfCAxOSAt
LS0tLS0tLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL21kL3JhaWQ1LmMgICAgICAgICAgICAgfCAg
NiArKysrLS0KPiAgIGRyaXZlcnMvbW1jL2NvcmUvcXVldWUuYyAgICAgICB8ICA1ICsrKy0tCj4g
ICBkcml2ZXJzL252bWUvaG9zdC9jb3JlLmMgICAgICAgfCAgOSArKysrKy0tLS0KPiAgIGRyaXZl
cnMvbnZtZS9ob3N0L211bHRpcGF0aC5jICB8ICA0IC0tLS0KPiAgIGRyaXZlcnMvc2NzaS9pc2Nz
aV90Y3AuYyAgICAgICB8ICA4ICsrKystLS0tCj4gICBpbmNsdWRlL2xpbnV4L2Jsa2Rldi5oICAg
ICAgICAgfCAgOSArKysrKystLS0KPiAgIDEyIGZpbGVzIGNoYW5nZWQsIDI5IGluc2VydGlvbnMo
KyksIDc3IGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJl
QHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAg
ICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBzdXNlLmRlICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNv
bHV0aW9ucyBHbWJILCBGcmFua2Vuc3RyLiAxNDYsIDkwNDYxIE7DvHJuYmVyZwpIUkIgMzY4MDkg
KEFHIE7DvHJuYmVyZyksIEdGOiBJLiBUb3RldiwgQS4gTWNEb25hbGQsIFcuIEtub2JsaWNoCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
