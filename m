Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B47C27C79
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jun 2024 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBrw6+dK9xTId0UPmIGJlWS4S/HrBKN76T9+PdQWy94=; b=S/DLsiZzdbyh+w
	WnxCvfIUUjwJGFsdAZKYmew752QNb3zTlhZh/fwhrbUdJgtJg/BQ4FcXSJBKXuPO+QYUIA8UESjvo
	iUIS0+QI71+z1lU5ewNY1d9WQl9/gV6WkWGHEOuJKPJD2jzzoqHLVtq3O1bkrNAyz1WslHkC+8csd
	ZK+pPko9iLJJTTur8L7ETJbQnbrM1uiliEJE8rmgbIlUJ98trJUml0Q1I3Ni0x0SONWeWCig2rDGQ
	hPJwYN3xHWu1XtA76ZVhMYekWoc3HnHsOuzcp8jY1Jl3u66oPBv8xFiKgC2oni3GD6Im67b4Ec9WW
	juX11czbFR9TkX0t7cVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9q0-0000000AJzx-1lAM;
	Mon, 17 Jun 2024 10:43:48 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ9pt-0000000AJwg-3vtB;
	Mon, 17 Jun 2024 10:43:46 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 443995FEED;
	Mon, 17 Jun 2024 10:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718621020; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgK6RwhDUFxF8Iz2VUACB/sUS3MvYSpSBSy5xHHsOn8=;
	b=OYjxGhYyyQb45Cjpg2jj8Zng/KAeprTWq6By5kQsloM/+bjnB7MwfD1io5KsfcQWClfe8Q
	ux4gGhoADB3s5tZgNTTntmvUH+f2q37co3qYOXxa6m6ujU43jiPcjZo/iEjZBFTlDBcQVo
	3DDBlyYbqz5tCIxw6ctlNGuPk/57+1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718621020;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgK6RwhDUFxF8Iz2VUACB/sUS3MvYSpSBSy5xHHsOn8=;
	b=vdHwFKFiaDsyrYLtzzb8VwXA1CKpHrjMPYXmpV6QfQj4yBBHTn74T2tcS3xdvNFziKYD/u
	5J7jvec2TpKhULAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b="mSpeQay/";
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=fz3pdYP1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1718621019; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgK6RwhDUFxF8Iz2VUACB/sUS3MvYSpSBSy5xHHsOn8=;
	b=mSpeQay/kNxbILiyXm2KQHqRDB0WEjJiP5+B0drP2AZJWzFOVLnMiWZSsPqTzNBteAAmcW
	oTHliSiV/s9mkHVBlKNRNcRAHWRM0376bOT0hhQfyd+gG5a95e7fhNg/oNNK2IJIt+sq23
	/bLdmEKEkrqqeWS3ZSGAJi8G3s95o/k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1718621019;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IgK6RwhDUFxF8Iz2VUACB/sUS3MvYSpSBSy5xHHsOn8=;
	b=fz3pdYP1xeuHSh+k87nz0CaWb9INbdnXjbTEwidcznuyNlrZEoTrB7Betlso9m6oK80ky4
	xDmnArveZJIbKADw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 887F713AAA;
	Mon, 17 Jun 2024 10:43:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tnC5IFoTcGZeDgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 17 Jun 2024 10:43:38 +0000
Message-ID: <7b159e24-2926-4b3a-b204-5601b4098d32@suse.de>
Date: Mon, 17 Jun 2024 12:43:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/26] block: move the zone_resetall flag to queue_limits
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
 <20240617060532.127975-24-hch@lst.de>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20240617060532.127975-24-hch@lst.de>
X-Spamd-Result: default: False [-4.50 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[38];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	R_RATELIMIT(0.00)[to_ip_from(RL7i91f5w8duz44ptrxmeazktf)];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,lst.de:email]
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Queue-Id: 443995FEED
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_034342_155432_BBDC88BE 
X-CRM114-Status: GOOD (  10.37  )
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
ZV9yZXNldGFsbCBmbGFnIGludG8gdGhlIHF1ZXVlX2xpbWl0cyBmZWF0dXJlIGZpZWxkIHNvIHRo
YXQKPiBpdCBjYW4gYmUgc2V0IGF0b21pY2FsbHkgd2l0aCB0aGUgcXVldWUgZnJvemVuLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IFJldmlld2Vk
LWJ5OiBEYW1pZW4gTGUgTW9hbCA8ZGxlbW9hbEBrZXJuZWwub3JnPgo+IC0tLQo+ICAgYmxvY2sv
YmxrLW1xLWRlYnVnZnMuYyAgICAgICAgIHwgMSAtCj4gICBkcml2ZXJzL2Jsb2NrL251bGxfYmxr
L3pvbmVkLmMgfCAzICstLQo+ICAgZHJpdmVycy9ibG9jay91YmxrX2Rydi5jICAgICAgIHwgNCAr
LS0tCj4gICBkcml2ZXJzL2Jsb2NrL3ZpcnRpb19ibGsuYyAgICAgfCAzICstLQo+ICAgZHJpdmVy
cy9udm1lL2hvc3Qvem5zLmMgICAgICAgIHwgMyArLS0KPiAgIGRyaXZlcnMvc2NzaS9zZF96YmMu
YyAgICAgICAgICB8IDUgKy0tLS0KPiAgIGluY2x1ZGUvbGludXgvYmxrZGV2LmggICAgICAgICB8
IDYgKysrKy0tCj4gICA3IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRp
b25zKC0pCj4gClJldmlld2VkLWJ5OiBIYW5uZXMgUmVpbmVja2UgPGhhcmVAc3VzZS5kZT4KCkNo
ZWVycywKCkhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgICAgICAgIEtl
cm5lbCBTdG9yYWdlIEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgs
IEZyYW5rZW5zdHIuIDE0NiwgOTA0NjEgTsO8cm5iZXJnCkhSQiAzNjgwOSAoQUcgTsO8cm5iZXJn
KSwgR0Y6IEkuIFRvdGV2LCBBLiBNY0RvbmFsZCwgVy4gS25vYmxpY2gKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
