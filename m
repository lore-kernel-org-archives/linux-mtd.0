Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B9CEC3600C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Apr 2025 06:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4hHXNLZWZGlVJXlXba5zsavfKU83z2A6JsHU2aNaGiQ=; b=dRPR5/Iq3uAWBu
	wPxrUiHwXgeSP70Gb2eqIr5soC2YtMSgIX9fjDZ/PhY+P8+k359Y8fEm3TvmxAoeiBsVuqZ+cczPv
	BpmXcq1F96mAE3IqWi+Jkw/Ig3F0r+1z9ilVXQp7HSul5onkS5ETIFrCuV1zncvBxAkP8LzpvhSrp
	NQOrv50lpwWpX7aRCmTY9dMcKTjgt/pE6P0Aol9LgfdGmetlsTBeSQYxUg1O4sZtub1laZmlzxlF/
	xcQb2l7eO00Y0QE06hzczprAekLsBwBR1LfGyRRogXlHkHznKwqbm1c/skWpPi0MOaFlZSIZ+T7vt
	u097Btd6psh36e85i8CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22C2-00000002rwW-2dBt;
	Tue, 08 Apr 2025 06:12:18 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u22Ai-00000002rbB-2GjG
	for linux-mtd@lists.infradead.org;
	Tue, 08 Apr 2025 06:10:58 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D368121160;
	Tue,  8 Apr 2025 06:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744092654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oj3NtTMaIdmS7f74bC9S8exgrmgilgWjdRpkYIVpsYg=;
	b=hB2R5CC13J5f2F9jzZ4zBglctMigPbWXk4fTWPJXxJp8xD1YU6h85/iTX0aoV7SXnUTnNX
	/JHXqnoBgWuxigtzjDwh7m3n8X7GyadA6WB5kY5lldHP5FgpdF31ivjVoHPyjpwWnrLkpe
	tm53WCV2MBHYGJvAnlXz5h/edye0ZC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744092654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oj3NtTMaIdmS7f74bC9S8exgrmgilgWjdRpkYIVpsYg=;
	b=Qqk9nfeIY2mqJVKCS0dZ4Q9X7yq/BgpIew3KBkTRGV+8dn++IjtsZpbkpOwIiiFCPnkNOa
	I6YJMJubnYg6g6Dg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744092654; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oj3NtTMaIdmS7f74bC9S8exgrmgilgWjdRpkYIVpsYg=;
	b=hB2R5CC13J5f2F9jzZ4zBglctMigPbWXk4fTWPJXxJp8xD1YU6h85/iTX0aoV7SXnUTnNX
	/JHXqnoBgWuxigtzjDwh7m3n8X7GyadA6WB5kY5lldHP5FgpdF31ivjVoHPyjpwWnrLkpe
	tm53WCV2MBHYGJvAnlXz5h/edye0ZC4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744092654;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oj3NtTMaIdmS7f74bC9S8exgrmgilgWjdRpkYIVpsYg=;
	b=Qqk9nfeIY2mqJVKCS0dZ4Q9X7yq/BgpIew3KBkTRGV+8dn++IjtsZpbkpOwIiiFCPnkNOa
	I6YJMJubnYg6g6Dg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8721513A1E;
	Tue,  8 Apr 2025 06:10:54 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id FxfsHu699GeGJQAAD6G6ig
	(envelope-from <hare@suse.de>); Tue, 08 Apr 2025 06:10:54 +0000
Message-ID: <7b8c4805-a91f-4455-a021-e5d8b6078d8b@suse.de>
Date: Tue, 8 Apr 2025 08:10:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bio segment constraints
To: Sean Anderson <seanga2@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
 <8a232716-74f8-4bba-a514-d0f766492344@suse.de>
 <a0ffa9b9-8649-1b63-3d56-3fc45fdfda83@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <a0ffa9b9-8649-1b63-3d56-3fc45fdfda83@gmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,kernel.dk,vger.kernel.org];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	ARC_NA(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_231056_723407_016F578E 
X-CRM114-Status: GOOD (  16.20  )
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

T24gNC83LzI1IDE2OjE0LCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+IE9uIDQvNy8yNSAwMzoxMCwg
SGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBPbiA0LzYvMjUgMjE6NDAsIFNlYW4gQW5kZXJzb24g
d3JvdGU6Cj4+PiBIaSBhbGwsCj4+Pgo+Pj4gSSdtIG5vdCByZWFsbHkgc3VyZSB3aGF0IGd1YXJh
bnRlZXMgdGhlIGJsb2NrIGxheWVyIG1ha2VzIHJlZ2FyZGluZyB0aGUKPj4+IHNlZ21lbnRzIGlu
IGEgYmlvIGFzIHBhcnQgb2YgYSByZXF1ZXN0IHN1Ym1pdHRlZCB0byBhIGJsb2NrIGRyaXZlci4g
QXMKPj4+IGZhciBhcyBJIGNhbiB0ZWxsIHRoaXMgaXMgbm90IGRvY3VtZW50ZWQgYW55d2hlcmUu
IEluIHBhcnRpY3VsYXIsCj4+Pgo+Pj4gLSBJcyBidl9sZW4gYWxpZ25lZCB0byBTRUNUT1JfU0la
RT8KPj4KPj4gVGhlIGJsb2NrIGxheWVyIGFsd2F5cyB1c2VzIGEgNTEyIGJ5dGUgc2VjdG9yIHNp
emUsIHNvIHllcy4KPj4KPj4+IC0gVG8gbG9naWNhbF9zZWN0b3Jfc2l6ZT8KPj4KPj4gTm90IG5l
Y2Vzc2FyaWx5LiBCdmVjcyBhcmUgYSBjb25zZWN1dGl2ZSBsaXN0IG9mIGJ5dGUgcmFuZ2VzIHdo
aWNoCj4+IG1ha2UgdXAgdGhlIGRhdGEgcG9ydGlvbiBvZiBhIGJpby4KPj4gVGhlIGxvZ2ljYWwg
c2VjdG9yIHNpemUgaXMgYSBwcm9wZXJ0eSBvZiB0aGUgcmVxdWVzdCBxdWV1ZSwgd2hpY2ggaXMK
Pj4gYXBwbGllZCB3aGVuIGEgcmVxdWVzdCBpcyBmb3JtZWQgZnJvbSBvbmUgb3Igc2V2ZXJhbCBi
aW9zLgo+PiBGb3IgdGhlIHJlcXVlc3QgdGhlIG92ZXJhbGwgbGVuZ3RoIG5lZWQgdG8gYmUgYSBt
dWx0aXBsZSBvZiB0aGUgbG9naWNhbAo+PiBzZWN0b3Igc2l6ZSwgYnV0IG5vdCBuZWNlc3Nhcmls
eSB0aGUgaW5kaXZpZHVhbCBiaW9zLgo+IAo+IE9oLCBzbyB0aGlzIGlzIHdvcnNlIHRoYW4gSSB0
aG91Z2h0LiBTbyBpZiB5b3UgY2FyZSBhYm91dCBlLmcuIG9ubHkgCj4gc3VibWl0dGluZyBJL08g
aW4gdW5pdHMgb2YgbG9naWNhbF9ibG9ja19zaXplLCB5b3UgaGF2ZSB0byBjb21iaW5lCiA+IHNl
Z21lbnRzIGFjcm9zcyB0aGUgZW50aXJlIHJlcXVlc3QuPgpXZWxsLCB5ZXMsIGFuZCBuby4KWW91
IG1pZ2h0IGJlIHNlZWluZyBhIHJlcXVlc3Qgd2l0aCBzZXZlcmFsIGJpb3MsIGVhY2ggaGF2aW5n
IHNtYWxsCmJ2ZWNzLiBCdXQgaW4gdGhlIGRyaXZlciB5b3Ugd2lsbCB3YW50IHRvIHVzZSBhbiBp
b3YgaXRlcmF0b3Igb3IgbWFwCml0IGludG8gYSBzZyBsaXN0IHZpYSBibGtfcnFfbWFwX3NnKCks
IGFuZCB0aGVuIGl0ZXJhdGUgb3ZlciB0aGF0CmZvciBzdWJtaXNzaW9uLgoKWyAuLiBdCj4+PiAt
IENhbiBJIHNvbWVob3cgcmVxdWVzdCB0byBvbmx5IGdldCBzZWdtZW50cyB3aXRoIGJ2X2xlbiBh
bGlnbmVkIHRvCj4+PiDCoMKgIGxvZ2ljYWxfc2VjdG9yX3NpemU/IE9yIGRvIEkgbmVlZCB0byBk
byBteSBvd24gY29hbGVzY2luZyBhbmQgYm91bmNlCj4+PiDCoMKgIGJ1ZmZlcmluZyBmb3IgdGhh
dD8KPj4+Cj4+Cj4+IFRoZSBkcml2ZXIgc3VyZWx5IGNhbi4gWW91IHNob3VsZCBiZSBhYmxlIHRv
IHNldCAnbWF4X3NlZ21lbnRfc2l6ZScgdG8KPj4gdGhlIGxvZ2ljYWwgYmxvY2sgc2l6ZSwgYW5k
IHRoYXQgc2hvdWxkIGdpdmUgeW91IHdoYXQgeW91IHdhbnQuCj4gCj4gQnV0IGNvdWxkbid0IEkg
Z2V0IHNlZ21lbnRzIHNtYWxsZXIgdGhhbiB0aGF0PyBtYXhfc2VnbWVudF9zaXplIHNlZW1zIGxp
a2UKPiBpdCB3b3VsZCBvbmx5IHJlc3RyaWN0IHRoZSBtYXhpbXVtIHNpemUsIGxlYXZpbmcgdGhl
IHBvc3NpYmlsaXR5IG9wZW4gZm9yCj4gc21hbGxlciBzZWdtZW50cy4KPiAKQXMgbWVudGlvbmVk
OiBpbmRpdmlkdWFsIHNlZ21lbnRzIG1pZ2h0LiBUaGUgb3ZlcmFsbCByZXF1ZXN0IHN0aWxsIHdp
bGwgCmFkaGVyZSB0byB0aGUgbG9naWNhbCBibG9jayBzaXplIHNldHRpbmcgKGllIGl0IHdpbGwg
bmV2ZXIgYmUgc21hbGxlciAKdGhhbiB0aGUgbG9naWNhbCBibG9jayBzaXplKS4KCk1heWJlIGhh
dmUgYSBsb29rIGF0IGRyaXZlcnMvbXRkL3ViaS9ibG9jay5jLiBUaGVyZSB0aGUgZHJpdmVyIHdp
bGwKbWFwIHRoZSByZXF1ZXN0IG9udG8gYSBzY2F0dGVybGlzdCwgYW5kIHRoZW4gaXRlcmF0ZSBv
dmVyIHRoZSBzZyBlbnRyaWVzCnRvIHJlYWQgaW4gdGhlIGRhdGEuCgpOb3RlOiBtYXBwaW5nIG9u
dG8gYSBzY2F0dGVybGlzdCB3aWxsIGNvYWxlc2NlIGFkamFjZW50IGJ2ZWNzLCBzbyBvbiB0aGUK
c2NhdHRlcmxpc3QgeW91IHdpbGwgZmluZCBvbmx5IGNvbnRpZ3VvdXMgc2VnbWVudHMgd2hpY2gg
YWRoZXJlIHRvIHRoZQpsb2dpY2FsIGJsb2NrIHNpemUgbGlubWl0YXRpb25zLgoKQ2hlZXJzLAoK
SGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgICAgS2VybmVsIFN0
b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR21iSCwgRnJhbmtl
bnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHRjog
SS4gVG90ZXYsIEEuIE1jRG9uYWxkLCBXLiBLbm9ibGljaAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1h
aWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW10ZC8K
