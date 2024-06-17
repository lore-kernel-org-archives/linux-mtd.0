Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74442C2BA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oke9rhQRx4mxNfjv5DmWzYKCW46u+Tv9MlNXkNoDwUU=; b=ZzJx2l4vByzw4J
	EQ684Pr0pPUY/94YZT6NFFOwufbknHQvg+W136v+KGhANzIrFdBOSYXpGMFRB/BnQ0FpnaM9GBIWY
	1fSnMJNS1lI5zZ35gP8pH2Ma1ZlSPV1PGvJ1XSdjYY3u3M/XP+ygcUBpSH21KUgb2jMPZDiZwDsda
	/tCpUpDITyuzA8v1kDkO/QK67UZNbx9xIWErj9qMh8ejK8hs+J7r6eymlAWq4LSFVHAIaCn1eN20x
	si3monLgHvFfUzWMMTj00RCWkNREwvxCM6VrUZEIYwsyBWPdHFZm2OVXTGA0H+/Q/6o8sn2dEjlPg
	wpfdaUISBuJ73QQpfmbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9kv-0000000AHpK-3oyd;
	Mon, 17 Jun 2024 10:38:33 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9kt-0000000AHoi-0p5E;
	Mon, 17 Jun 2024 10:38:32 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D55E65FCD9;
	Mon, 17 Jun 2024 10:38:29 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 337B2139AB;
	Mon, 17 Jun 2024 10:38:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id WyrSCyUScGbNDAAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 17 Jun 2024 10:38:29 +0000
Message-ID: <74df67d6-3d02-4987-becb-eebf60492d26@suse.de>
Date: Mon, 17 Jun 2024 12:38:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/26] block: move the add_random flag to queue_limits
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
 <20240617060532.127975-16-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240617060532.127975-16-hch@lst.de>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: D55E65FCD9
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_033831_397965_49DF5CEB 
X-CRM114-Status: GOOD (  11.99  )
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

T24gNi8xNy8yNCAwODowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSB0aGUgYWRk
X3JhbmRvbSBmbGFnIGludG8gdGhlIHF1ZXVlX2xpbWl0cyBmZWF0dXJlIGZpZWxkIHNvIHRoYXQg
aXQKPiBjYW4gYmUgc2V0IGF0b21pY2FsbHkgd2l0aCB0aGUgcXVldWUgZnJvemVuLgo+IAo+IE5v
dGUgdGhhdCB0aGlzIGFsc28gcmVtb3ZlcyBjb2RlIGZyb20gZG0gdG8gY2xlYXIgdGhlIGZsYWcg
YmFzZWQgb24KPiB0aGUgdW5kZXJseWluZyBkZXZpY2VzLCB3aGljaCBjYW4ndCBiZSByZWFjaGVk
IGFzIGRtIGRldmljZXMgd2lsbAo+IGFsd2F5cyBzdGFydCBvdXQgd2l0aG91dCB0aGUgZmxhZyBz
ZXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4g
UmV2aWV3ZWQtYnk6IERhbWllbiBMZSBNb2FsIDxkbGVtb2FsQGtlcm5lbC5vcmc+Cj4gLS0tCj4g
ICBibG9jay9ibGstbXEtZGVidWdmcy5jICAgICAgICAgICAgfCAgMSAtCj4gICBibG9jay9ibGst
c3lzZnMuYyAgICAgICAgICAgICAgICAgfCAgNiArKystLS0KPiAgIGRyaXZlcnMvYmxvY2svbXRp
cDMyeHgvbXRpcDMyeHguYyB8ICAxIC0KPiAgIGRyaXZlcnMvbWQvZG0tdGFibGUuYyAgICAgICAg
ICAgICB8IDE4IC0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgZHJpdmVycy9tbWMvY29yZS9xdWV1ZS5j
ICAgICAgICAgIHwgIDIgLS0KPiAgIGRyaXZlcnMvbXRkL210ZF9ibGtkZXZzLmMgICAgICAgICB8
ICAzIC0tLQo+ICAgZHJpdmVycy9zMzkwL2Jsb2NrL3NjbV9ibGsuYyAgICAgIHwgIDQgLS0tLQo+
ICAgZHJpdmVycy9zY3NpL3Njc2lfbGliLmMgICAgICAgICAgIHwgIDMgKy0tCj4gICBkcml2ZXJz
L3Njc2kvc2QuYyAgICAgICAgICAgICAgICAgfCAxMSArKystLS0tLS0tLQo+ICAgaW5jbHVkZS9s
aW51eC9ibGtkZXYuaCAgICAgICAgICAgIHwgIDUgKysrLS0KPiAgIDEwIGZpbGVzIGNoYW5nZWQs
IDEwIGluc2VydGlvbnMoKyksIDQ0IGRlbGV0aW9ucygtKQo+IApSZXZpZXdlZC1ieTogSGFubmVz
IFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMg
UmVpbmVja2UgICAgICAgICAgICAgICAgICBLZXJuZWwgU3RvcmFnZSBBcmNoaXRlY3QKaGFyZUBz
dXNlLmRlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkgOTExIDc0MDUzIDY4OApT
VVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBGcmFua2Vuc3RyLiAxNDYsIDkwNDYxIE7DvHJu
YmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyksIEdGOiBJLiBUb3RldiwgQS4gTWNEb25hbGQs
IFcuIEtub2JsaWNoCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
