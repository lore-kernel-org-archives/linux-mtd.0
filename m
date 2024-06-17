Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA729C2BA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hs79d48yXVydZGpR5LpZmQtN/Vd7cRVmRt6LkS5enUE=; b=wVbX539jqtSxMH
	pjBuiE1n0I26KmP0cICj278Fw6ZDJowFBspWUu91/9qT/SvEqyy09zoelQivQ+gnQ15wfu96xOpPG
	kl5hBvaxWwGLncuc+mg1xYF5z338BvHd++smEExsTu+itVbkzx4ITxlhZEfwTaQYaiRYqoRm/IiS/
	C3DXZzwRgsue3IWnt5zuH6um2oYvyCJcGvu3/CMJMEscDYUKK2Y2aU9IzMYVLzbW65QXN5ojCDruT
	4/A4bfbMtKZQzunPfxpSWgOMZ7JJjZAVSQpBTssQVzX9zhGwSLaiZMUSkmm0bBUkDisS1bab0M+zl
	ADHu+xSZiLENcMcyMYRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9oy-0000000AJWC-32SX;
	Mon, 17 Jun 2024 10:42:44 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9oq-0000000AJRW-1Izq;
	Mon, 17 Jun 2024 10:42:43 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id AB3C95FEE7;
	Mon, 17 Jun 2024 10:42:34 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D7F6813AAA;
	Mon, 17 Jun 2024 10:42:33 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MDskNBkTcGb/DQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 17 Jun 2024 10:42:33 +0000
Message-ID: <10acf40f-b4e0-40d1-ab6c-5c2baa178362@suse.de>
Date: Mon, 17 Jun 2024 12:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/26] block: move the poll flag to queue_limits
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
 <20240617060532.127975-22-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240617060532.127975-22-hch@lst.de>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Queue-Id: AB3C95FEE7
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_034237_953385_DB9D804E 
X-CRM114-Status: GOOD (  13.11  )
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

T24gNi8xNy8yNCAwODowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gTW92ZSB0aGUgcG9s
bCBmbGFnIGludG8gdGhlIHF1ZXVlX2xpbWl0cyBmZWF0dXJlIGZpZWxkIHNvIHRoYXQgaXQgY2Fu
Cj4gYmUgc2V0IGF0b21pY2FsbHkgd2l0aCB0aGUgcXVldWUgZnJvemVuLgo+IAo+IFN0YWNraW5n
IGRyaXZlcnMgYXJlIHNpbXBsaWZpZWQgaW4gdGhhdCB0aGV5IG5vdyBjYW4gc2ltcGx5IHNldCB0
aGUKPiBmbGFnLCBhbmQgYmxrX3N0YWNrX2xpbWl0cyB3aWxsIGNsZWFyIGl0IHdoZW4gdGhlIGZl
YXR1cmVzIGlzIG5vdAo+IHN1cHBvcnRlZCBieSBhbnkgb2YgdGhlIHVuZGVybHlpbmcgZGV2aWNl
cy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBS
ZXZpZXdlZC1ieTogRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2VybmVsLm9yZz4KPiAtLS0KPiAg
IGJsb2NrL2Jsay1jb3JlLmMgICAgICAgICAgICAgIHwgIDUgKystLQo+ICAgYmxvY2svYmxrLW1x
LWRlYnVnZnMuYyAgICAgICAgfCAgMSAtCj4gICBibG9jay9ibGstbXEuYyAgICAgICAgICAgICAg
ICB8IDMxICsrKysrKysrKysrLS0tLS0tLS0tCj4gICBibG9jay9ibGstc2V0dGluZ3MuYyAgICAg
ICAgICB8IDEwICsrKystLS0KPiAgIGJsb2NrL2Jsay1zeXNmcy5jICAgICAgICAgICAgIHwgIDQg
Ky0tCj4gICBkcml2ZXJzL21kL2RtLXRhYmxlLmMgICAgICAgICB8IDU0ICsrKysrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICBkcml2ZXJzL252bWUvaG9zdC9tdWx0aXBhdGguYyB8
IDEyICstLS0tLS0tCj4gICBpbmNsdWRlL2xpbnV4L2Jsa2Rldi5oICAgICAgICB8ICA0ICsrLQo+
ICAgOCBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspLCA3NiBkZWxldGlvbnMoLSkKPiAK
UmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZSA8aGFyZUBzdXNlLmRlPgoKQ2hlZXJzLAoKSGFu
bmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgICAgS2VybmVsIFN0b3Jh
Z2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
KzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgRnJhbmtlbnN0
ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHRjogSS4g
VG90ZXYsIEEuIE1jRG9uYWxkLCBXLiBLbm9ibGljaAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWls
aW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tdGQvCg==
