Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF4D0C47074
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Jan 2024 15:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5Iyh1VObbxYrfRs5Qx9afbixrwHzb6m2hTSt2D5LbE=; b=pl9CwxzXBt8en9
	zHgWVyGLj1nBHMQMU8ctIquQVK6iJ9BA+kAWNdhi/QSGPfXDUnQTtQnXXB2NGMOIShBM2/ofWP0t6
	vk5/MB2vgniX5z41P2Yy+RDDWTuL/B9tjJ/I52t0z/wKmjkLsAJYrE4X536w6yMhY6suNEeJj3aiu
	UzZiHnaFWXwP/wHMPwxJQjkFRbyIPT1xp2PNKVI8FC+iR6ceNSvmKY6ECauZOB8KTiV9DVz8gnHOf
	3sSVN28iJZcnqQmJB7M2bKhUCZk77EJ5eKZEk1vgm6tNU/p/uPwZOEjFkBzscWqWD9Uf6gJee5AqG
	YY0z5TD4ltlAGYCFFbKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPSw-00ETLm-0F;
	Thu, 04 Jan 2024 15:17:02 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPSt-00ETKr-0A
	for linux-mtd@lists.infradead.org;
	Thu, 04 Jan 2024 15:17:00 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B3CFB21D82;
	Thu,  4 Jan 2024 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704381415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=mHk6v/mPh0nrF36XeRd9n1G+3dVH07YiQx9gWm/SG7NmXFbckEmPHT+psVuS+Q55O5Ewmm
	fzZp736IzVr5FNkauue7PYolsCdGhN9oZfdxiUjjwUo5SvRhYKG4JdOSw0VhUWvKC+wi2H
	9fs2A0RPq42k8lt/8HUXEBH2gHBffpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704381415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=6J4uw5uqBb70vbWXOXdU9583F4KrmBOAGYenVBa6jTwgLx70IbxaS5CKgObceVLtg+Uuvf
	BlSynn3hFCWD0KCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1704381415; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=mHk6v/mPh0nrF36XeRd9n1G+3dVH07YiQx9gWm/SG7NmXFbckEmPHT+psVuS+Q55O5Ewmm
	fzZp736IzVr5FNkauue7PYolsCdGhN9oZfdxiUjjwUo5SvRhYKG4JdOSw0VhUWvKC+wi2H
	9fs2A0RPq42k8lt/8HUXEBH2gHBffpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1704381415;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FMPvsZKYHk+D5kb1N2CM5rR4TjKGNh05qKhD/IuVB8c=;
	b=6J4uw5uqBb70vbWXOXdU9583F4KrmBOAGYenVBa6jTwgLx70IbxaS5CKgObceVLtg+Uuvf
	BlSynn3hFCWD0KCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 88C6E13722;
	Thu,  4 Jan 2024 15:16:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id CnlcIefLlmUgTAAAD6G6ig
	(envelope-from <jack@suse.cz>); Thu, 04 Jan 2024 15:16:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 21D02A07EF; Thu,  4 Jan 2024 16:16:55 +0100 (CET)
Date: Thu, 4 Jan 2024 16:16:55 +0100
From: Jan Kara <jack@suse.cz>
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: Jan Kara <jack@suse.cz>, axboe@kernel.dk, roger.pau@citrix.com,
	colyli@suse.de, kent.overstreet@gmail.com, joern@lazybastard.org,
	miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	sth@linux.ibm.com, hoeppner@linux.ibm.com, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com, jejb@linux.ibm.com,
	martin.petersen@oracle.com, clm@fb.com, josef@toxicpanda.com,
	dsterba@suse.com, viro@zeniv.linux.org.uk, brauner@kernel.org,
	nico@fluxnic.net, xiang@kernel.org, chao@kernel.org, tytso@mit.edu,
	adilger.kernel@dilger.ca, jack@suse.com, konishi.ryusuke@gmail.com,
	willy@infradead.org, akpm@linux-foundation.org, hare@suse.de,
	p.raghav@samsung.com, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-bcachefs@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-ext4@vger.kernel.org, linux-nilfs@vger.kernel.org,
	yi.zhang@huawei.com, yangerkun@huawei.com,
	"yukuai (C)" <yukuai3@huawei.com>
Subject: Re: [PATCH RFC v3 for-6.8/block 02/17] xen/blkback: use bdev api in
 xen_update_blkif_status()
Message-ID: <20240104151655.oiqtn6onge2etlcn@quack3>
References: <20231221085712.1766333-1-yukuai1@huaweicloud.com>
 <20231221085712.1766333-3-yukuai1@huaweicloud.com>
 <20240104110631.3vspsvxbbvcpdqdu@quack3>
 <29bfcfc7-62b0-3876-78ce-f7ebe3506eb6@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29bfcfc7-62b0-3876-78ce-f7ebe3506eb6@huaweicloud.com>
Authentication-Results: smtp-out1.suse.de;
	none
X-Spamd-Result: default: False [1.90 / 50.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 URIBL_BLOCKED(0.00)[suse.com:email,huawei.com:email];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 R_RATELIMIT(0.00)[to_ip_from(RLdan9jouj5dxnqx1npfmn4ucx)];
	 RCVD_COUNT_THREE(0.00)[3];
	 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	 RCPT_COUNT_TWELVE(0.00)[49];
	 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,huawei.com:email];
	 FUZZY_BLOCKED(0.00)[rspamd.com];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 MID_RHS_NOT_FQDN(0.50)[];
	 FREEMAIL_CC(0.00)[suse.cz,kernel.dk,citrix.com,suse.de,gmail.com,lazybastard.org,bootlin.com,nod.at,ti.com,linux.ibm.com,oracle.com,fb.com,toxicpanda.com,suse.com,zeniv.linux.org.uk,kernel.org,fluxnic.net,mit.edu,dilger.ca,infradead.org,linux-foundation.org,samsung.com,vger.kernel.org,lists.xenproject.org,lists.infradead.org,lists.ozlabs.org,huawei.com];
	 RCVD_TLS_ALL(0.00)[];
	 SUSPICIOUS_RECIPS(1.50)[]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_071659_244492_50ED94C1 
X-CRM114-Status: GOOD (  25.69  )
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

SGkgS3VhaSEKCk9uIFRodSAwNC0wMS0yNCAyMDoxOTowNSwgWXUgS3VhaSB3cm90ZToKPiDlnKgg
MjAyNC8wMS8wNCAxOTowNiwgSmFuIEthcmEg5YaZ6YGTOgo+ID4gT24gVGh1IDIxLTEyLTIzIDE2
OjU2OjU3LCBZdSBLdWFpIHdyb3RlOgo+ID4gPiBGcm9tOiBZdSBLdWFpIDx5dWt1YWkzQGh1YXdl
aS5jb20+Cj4gPiA+IAo+ID4gPiBBdm9pZCB0byBhY2Nlc3MgYmRfaW5vZGUgZGlyZWN0bHksIHBy
ZXBhcmUgdG8gcmVtb3ZlIGJkX2lub2RlIGZyb20KPiA+ID4gYmxvY2tfZGV2Y2llLgo+ID4gPiAK
PiA+ID4gU2lnbmVkLW9mZi1ieTogWXUgS3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgo+ID4gPiAt
LS0KPiA+ID4gICBkcml2ZXJzL2Jsb2NrL3hlbi1ibGtiYWNrL3hlbmJ1cy5jIHwgMyArLS0KPiA+
ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPiA+
IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5idXMuYyBi
L2RyaXZlcnMvYmxvY2sveGVuLWJsa2JhY2sveGVuYnVzLmMKPiA+ID4gaW5kZXggZTM0MjE5ZWEy
YjA1Li5lNjQ1YWZhNGFmNTcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvYmxvY2sveGVuLWJs
a2JhY2sveGVuYnVzLmMKPiA+ID4gKysrIGIvZHJpdmVycy9ibG9jay94ZW4tYmxrYmFjay94ZW5i
dXMuYwo+ID4gPiBAQCAtMTA0LDggKzEwNCw3IEBAIHN0YXRpYyB2b2lkIHhlbl91cGRhdGVfYmxr
aWZfc3RhdHVzKHN0cnVjdCB4ZW5fYmxraWYgKmJsa2lmKQo+ID4gPiAgIAkJeGVuYnVzX2Rldl9l
cnJvcihibGtpZi0+YmUtPmRldiwgZXJyLCAiYmxvY2sgZmx1c2giKTsKPiA+ID4gICAJCXJldHVy
bjsKPiA+ID4gICAJfQo+ID4gPiAtCWludmFsaWRhdGVfaW5vZGVfcGFnZXMyKAo+ID4gPiAtCQkJ
YmxraWYtPnZiZC5iZGV2X2hhbmRsZS0+YmRldi0+YmRfaW5vZGUtPmlfbWFwcGluZyk7Cj4gPiA+
ICsJaW52YWxpZGF0ZV9iZGV2KGJsa2lmLT52YmQuYmRldl9oYW5kbGUtPmJkZXYpOwo+ID4gCj4g
PiBUaGlzIGZ1bmN0aW9uIHVzZXMgaW52YWxpZGF0ZV9pbm9kZV9wYWdlczIoKSB3aGlsZSBpbnZh
bGlkYXRlX2JkZXYoKSBlbmRzCj4gPiB1cCB1c2luZyBtYXBwaW5nX3RyeV9pbnZhbGlkYXRlKCkg
YW5kIHRoZXJlIGFyZSBzdWJ0bGUgYmVoYXZpb3JhbAo+ID4gZGlmZmVyZW5jZXMgYmV0d2VlbiB0
aGVzZSB0d28gKGZvciBleGFtcGxlIGludmFsaWRhdGVfaW5vZGVfcGFnZXMyKCkgdHJpZXMKPiA+
IHRvIGNsZWFuIGRpcnR5IHBhZ2VzIHVzaW5nIHRoZSAtPmxhdW5kZXJfZm9saW8gbWV0aG9kKS4g
U28gSSB0aGluayB5b3UnbGwKPiA+IG5lZWQgaGVscGVyIGxpa2UgaW52YWxpZGF0ZV9iZGV2Migp
IGZvciB0aGlzLgo+IAo+IFRoYW5rcyBmb3IgcmV2aWV3aW5nIHRoaXMgcGF0Y2gsIEkga25vdyB0
aGUgZGlmZmVyZW5jdCBiZXR3ZWVuIHRoZW4sCj4gd2hhdCBJIGRvbid0IHVuZGVyc3RhbmQgaXMg
dGhhdCB3aHkgdXNpbmcgaW52YWxpZGF0ZV9pbm9kZV9wYWdlczIoKQo+IGhlcmUuCgpXZWxsLCB0
aGVuIHRoZSBjaGFuZ2UgaW4gYmVoYXZpb3Igc2hvdWxkIGJlIGF0IGxlYXN0IG5vdGVkIGluIHRo
ZQpjaGFuZ2Vsb2cuCgo+IHN5bmNfYmxvY2tkZXYoKSBpcyBqdXN0IGNhbGxlZCBhbmQgMCBpcyBy
ZXR1cm5lZCwgSSB0aGluayBpbiB0aGlzCj4gY2FzZSBpdCdzIHNhZmUgdG8gY2FsbCBpbnZhbGlk
YXRlX2JkZXYoKSBkaXJlY3RseSwgb3IgYW0gSSBtaXNzaW5nCj4gb3RoZXIgdGhpbmdzPwoKSSBz
dGlsbCB0aGluayB0aGVyZSdzIGEgZGlmZmVyZW5jZS4gaW52YWxpZGF0ZV9pbm9kZV9wYWdlczIo
KSBhbHNvIHVubWFwcwptZW1vcnkgbWFwcGluZ3Mgd2hpY2ggbWFwcGluZ190cnlfaW52YWxpZGF0
ZSgpIGRvZXMgbm90IGRvLiBUaGF0IGJlaW5nIHNhaWQKaW4geGVuX3VwZGF0ZV9ibGtpZl9zdGF0
dXMoKSB3ZSBzZWVtIHRvIGJlIGJyaW5naW5nIHVwIGEgdmlydHVhbCBibG9jawpkZXZpY2Ugc28g
YmVmb3JlIHRoaXMgZnVuY3Rpb24gaXMgY2FsbGVkLCBhbnlib2R5IHdvdWxkIGhhdmUgaGFyZCB0
aW1lCnVzaW5nIGFueXRoaW5nIGluIGl0LiBCdXQgdGhpcyBkZWZpbml0ZWx5IG5lZWRzIGEgY29u
ZmlybWF0aW9uIGZyb20gWGVuCm1haW50YWluZXJzIGFuZCBhIGdvb2QgZG9jdW1lbnRhdGlvbiBv
ZiB0aGUgYmVoYXZpb3JhbCBjaGFuZ2UgaW4gdGhlCmNoYW5nZWxvZy4KCgkJCQkJCQkJSG9uemEK
LS0gCkphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1
c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtbXRkLwo=
