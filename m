Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E0DC2BA1A
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jGv4PnuXSaPn/A7LYs6UjiM2UxFgAkv1h7XpkppJv4E=; b=VQaVMKGWipDSV8
	DQUltqObwA+1gM1y4+qhA570TqJ8YV4/+oXn2hPPX28AYofUE1GCWkKQvzZ7LhTKUK1bmvjA4dJ14
	j0AZpbKyZfxGgwGUEC7eN3V/MAStbD5+LG2mOCySoun95LuPUCR5V9zcGzjNjMd+ue87xtOWDWrVN
	7AHmlLSFCGj/JlDD7XUjtSjmeidoAi3Lets6sdoCs1Pt0Gwo+mO6Vx9zZuGxiIDKFRz3PB2LJiLWb
	BJZjdIQf3b95N13fcruRMogRcY6Ac1nKFNMmdHFZjlmyW+k0dIAW8E0bRI6qGXW2HkQ1MCuySqhJL
	KmSxMTzICGIgtsrtQ+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9D7-0000000ABnJ-163S;
	Mon, 17 Jun 2024 10:03:37 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9D4-0000000ABmX-31TW;
	Mon, 17 Jun 2024 10:03:36 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 71D2B5FE68;
	Mon, 17 Jun 2024 10:03:31 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C1D5F139AB;
	Mon, 17 Jun 2024 10:03:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AoLhLvIJcGaVAQAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 17 Jun 2024 10:03:30 +0000
Message-ID: <9e1764de-0080-4b8f-a705-de4016a55f5a@suse.de>
Date: Mon, 17 Jun 2024 12:03:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/26] xen-blkfront: don't disable cache flushes when they
 fail
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
 <20240617060532.127975-2-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240617060532.127975-2-hch@lst.de>
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Queue-Id: 71D2B5FE68
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Rspamd-Action: no action
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_030335_002991_181329C6 
X-CRM114-Status: GOOD (  12.15  )
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

T24gNi8xNy8yNCAwODowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gYmxrZnJvbnQgYWx3
YXlzIGhhZCBhIHJvYnVzdCBuZWdvdGlhdGlvbiBwcm90b2NvbCBmb3IgZGV0ZWN0aW5nIGEgd3Jp
dGUKPiBjYWNoZS4gIFN0b3Agc2ltcGx5IGRpc2FibGluZyBjYWNoZSBmbHVzaGVzIGluIHRoZSBi
bG9jayBsYXllciBhcyB0aGUKPiBmbGFncyBoYW5kbGluZyBpcyBtb3ZpbmcgdG8gdGhlIGF0b21p
YyBxdWV1ZSBsaW1pdHMgQVBJIHRoYXQgbmVlZHMKPiB1c2VyIGNvbnRleHQgdG8gZnJlZXplIHRo
ZSBxdWV1ZSBmb3IgdGhhdC4gIEluc3RlYWQgaGFuZGxlIHRoZSBjYXNlCj4gb2YgdGhlIGZlYXR1
cmUgZmxhZ3MgY2xlYXJlZCBpbnNpZGUgb2YgYmxrZnJvbnQuICBUaGlzIHJlbW92ZXMgb2xkCj4g
ZGVidWcgY29kZSB0byBjaGVjayBmb3Igc3VjaCBhIG1pc21hdGNoIHdoaWNoIHdhcyBwcmV2aW91
c2x5IGltcG9zc2libGUKPiB0byBoaXQsIGluY2x1ZGluZyB0aGUgY2hlY2sgZm9yIHBhc3N0aHJv
dWdoIHJlcXVlc3RzIHRoYXQgYmxrZnJvbnQKPiBuZXZlciB1c2VkIHRvIHN0YXJ0IHdpdGguCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4g
ICBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtmcm9udC5jIHwgNDQgKysrKysrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5k
ZT4KCkNoZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAg
ICAgIEtlcm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25z
IEdtYkgsIEZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8
cm5iZXJnKSwgR0Y6IEkuIFRvdGV2LCBBLiBNY0RvbmFsZCwgVy4gS25vYmxpY2gKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
