Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C75C2BA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b1qcWiF6jjkQ30kuYSCpx4q3Ec7jAqjEjr1Tv2TDKMU=; b=G0y8BfRSGfLOUT
	TxXtO9ASIGYp2JuCj5u1v/cTmdfi+8LCvJsVHcESJfI4XQkEPURifbRSjEyr5ovVIwYvayASt0JB+
	r7UZrKgtO+SpuDubuBLPhr5x53IC0imamElMuzwwbU8dqUj+aycY1fB8ELP3BPIMA9hZv4ApKVpe+
	CZiasV5p3o4Yvo4TcCcpi5l9rosppgeER1jg+k0D2XL//PzA9OqD/r/hdGh0hxeqlTzz1Mc4L2Ou2
	JgMAyENgcNgluHOT+l2ITogJ9vJcgb8p27Gs4BZM3PYjCZ0/VvTSM0LyNgb7AXe3FPIDe5OBYcFD7
	IsPaO31fvMsqnYjf69mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9nn-0000000AIzC-2MDE;
	Mon, 17 Jun 2024 10:41:31 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9ni-0000000AIwn-22Ro;
	Mon, 17 Jun 2024 10:41:29 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id EDEFF3803D;
	Mon, 17 Jun 2024 10:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718620885; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgtG6m+m1FRqVquXEHPrn3wmZaPvf3OoaYY0kuxzjZY=;
	b=IeFJAWsH75KCYIyv8/qhBGrl5836YIwBOLXQ3jGs9AGu4tCLccHXdaOiEmZNwYilYVnXvA
	SRmfeAJG/mJlmng7doCTF2JrMj/j1v1AtSvyaeFMA6zC9Uo8Apn9VwECptdlpKPI1o/2oN
	26YOZad+Gw/DJeftHbAa4kTM/y28MNI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718620885;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgtG6m+m1FRqVquXEHPrn3wmZaPvf3OoaYY0kuxzjZY=;
	b=uBuChXRm9UIyUB63kLl7vU6i6aEesxd1N6Ygk5vJm28e2KE/5WoIJeYPC8888eXD55Tt/v
	dimXmhyYdWeO0iCQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718620884; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgtG6m+m1FRqVquXEHPrn3wmZaPvf3OoaYY0kuxzjZY=;
	b=tk56hY7XbD+wgCVvAVC5TAAMNdWYTqZxaVADpw5mpu/Frmc+Y8zzf8x9gaIUWi7pHO5rjZ
	Tm01WQr3GPaAKNEgrckaVdo8Qm+/hXaj53GmO1gpM2xNwupMPVgSsIQq7PJCLZa0lbR+XN
	ddtS7T4F7YuLIEsh0v7LCAvj96Hq13s=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718620884;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jgtG6m+m1FRqVquXEHPrn3wmZaPvf3OoaYY0kuxzjZY=;
	b=uAuSy9hbCb4YbUBJdXvIQbCOSketcC7FumfbAwU1hmYHwd+Jx1h140JOgS5gMLtaFdjOqr
	qYR/OoHcbBQkZAAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7B5A113AAA;
	Mon, 17 Jun 2024 10:41:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 5susHdQScGauDQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 17 Jun 2024 10:41:24 +0000
Message-ID: <24322288-fd9f-4f49-9a94-e2aaf97bb700@suse.de>
Date: Mon, 17 Jun 2024 12:41:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/26] block: move the nowait flag to queue_limits
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
 linux-scsi@vger.kernel.org, linux-block@vger.kernel.org
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-20-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240617060532.127975-20-hch@lst.de>
X-Spamd-Result: default: False [-8.29 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[37];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLex1noz7jcsrkfdtgx8bqesde)];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,lst.de:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_034126_702898_2B43A2D5 
X-CRM114-Status: GOOD (  13.66  )
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

T24gNi8xNy8yNCAwODowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSB0aGUgbm93
YWl0IGZsYWcgaW50byB0aGUgcXVldWVfbGltaXRzIGZlYXR1cmUgZmllbGQgc28gdGhhdCBpdCBj
YW4KPiBiZSBzZXQgYXRvbWljYWxseSB3aXRoIHRoZSBxdWV1ZSBmcm96ZW4uCj4gCj4gU3RhY2tp
bmcgZHJpdmVycyBhcmUgc2ltcGxpZmllZCBpbiB0aGF0IHRoZXkgbm93IGNhbiBzaW1wbHkgc2V0
IHRoZQo+IGZsYWcsIGFuZCBibGtfc3RhY2tfbGltaXRzIHdpbGwgY2xlYXIgaXQgd2hlbiB0aGUg
ZmVhdHVyZXMgaXMgbm90Cj4gc3VwcG9ydGVkIGJ5IGFueSBvZiB0aGUgdW5kZXJseWluZyBkZXZp
Y2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+
IC0tLQo+ICAgYmxvY2svYmxrLW1xLWRlYnVnZnMuYyAgICAgICAgfCAgMSAtCj4gICBibG9jay9i
bGstbXEuYyAgICAgICAgICAgICAgICB8ICAyICstCj4gICBibG9jay9ibGstc2V0dGluZ3MuYyAg
ICAgICAgICB8ICA5ICsrKysrKysrKwo+ICAgZHJpdmVycy9ibG9jay9icmQuYyAgICAgICAgICAg
fCAgNCArKy0tCj4gICBkcml2ZXJzL21kL2RtLXRhYmxlLmMgICAgICAgICB8IDE4ICsrKy0tLS0t
LS0tLS0tLS0tLQo+ICAgZHJpdmVycy9tZC9tZC5jICAgICAgICAgICAgICAgfCAxOCArLS0tLS0t
LS0tLS0tLS0tLS0KPiAgIGRyaXZlcnMvbnZtZS9ob3N0L211bHRpcGF0aC5jIHwgIDMgKy0tCj4g
ICBpbmNsdWRlL2xpbnV4L2Jsa2Rldi5oICAgICAgICB8ICA5ICsrKysrLS0tLQo+ICAgOCBmaWxl
cyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25zKCspLCA0MiBkZWxldGlvbnMoLSkKPiAKUmV2aWV3ZWQt
Ynk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFubmVzCi0tIApE
ci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0
ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3
NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgRnJhbmtlbnN0ci4gMTQ2LCA5
MDQ2MSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHRjogSS4gVG90ZXYsIEEu
IE1jRG9uYWxkLCBXLiBLbm9ibGljaAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
