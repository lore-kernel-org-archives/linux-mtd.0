Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D77CC3601A
	for <linux-mtd@archiver.kernel.org>; Mon,  7 Apr 2025 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brNxs1PvrsxLGXXbd4JSrGVDljpmQUcWVObt2RdUIPY=; b=UH5yr9yAXjvJiG
	sUoKl+4p4ViaMURF9I152Cb4LmHnJY5UikgMbsyWz/nrv6ANDi30TiGqVxGF7muK5Uqy9nPzG9BnC
	ptYAgQ0JaWyWBoYIIRt4DCMnUSC10aAmWI7qZUDcAOXL8kDCaO5zHIfILRPy85M3AjzO9+90c8xRQ
	sFudzp5aLjfXm5j4VD9WOgT2PCJqdm0qxi55whb1fNH/QX18QpR97ZzRprZx0PCq1bVVa5P4MoBFA
	EXXKWteLDj9CScTRXiEcpeikl0THLLeCyjUAPOwbn1T9IytfZ0XvxRkLNHU8S6IPDV7zT6mEEPzTw
	Q5bU6yU/f9FjuvqvH78Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gkS-0000000GiaR-4BAo;
	Mon, 07 Apr 2025 07:18:24 +0000
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1gch-0000000Ggs3-0dtV
	for linux-mtd@lists.infradead.org;
	Mon, 07 Apr 2025 07:10:24 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 51E1D21165;
	Mon,  7 Apr 2025 07:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744009821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spWS8YK7RWKQFjV07RpNV3MQ5ZczpB5p5XPsvSawtAQ=;
	b=JoZ5pIwx0TywZ6j8Cqz9bWLy+nH4WYQTt20aFxVgWbh5tiZDdIOz45P+KPLBzmqkS6uSMu
	VBud1nPujwCT7GEJ3h0knWaYFtgERn7EL7P96X9mfhR4u1WS9KtEzgOZKNKl1R8MvxMgEG
	5lxsX0I4ji+rweBsIY7yoEqJDuGxXUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744009821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spWS8YK7RWKQFjV07RpNV3MQ5ZczpB5p5XPsvSawtAQ=;
	b=utwHAtPL/nsStzPnmXlCRF1e6lSJJxkqi/G44bQ+W1r2Fp2A4VhohK3KKClgiwHzopsHWw
	G0bU+t5RyIAAAbBw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1744009821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spWS8YK7RWKQFjV07RpNV3MQ5ZczpB5p5XPsvSawtAQ=;
	b=JoZ5pIwx0TywZ6j8Cqz9bWLy+nH4WYQTt20aFxVgWbh5tiZDdIOz45P+KPLBzmqkS6uSMu
	VBud1nPujwCT7GEJ3h0knWaYFtgERn7EL7P96X9mfhR4u1WS9KtEzgOZKNKl1R8MvxMgEG
	5lxsX0I4ji+rweBsIY7yoEqJDuGxXUA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1744009821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=spWS8YK7RWKQFjV07RpNV3MQ5ZczpB5p5XPsvSawtAQ=;
	b=utwHAtPL/nsStzPnmXlCRF1e6lSJJxkqi/G44bQ+W1r2Fp2A4VhohK3KKClgiwHzopsHWw
	G0bU+t5RyIAAAbBw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0A61413A4B;
	Mon,  7 Apr 2025 07:10:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id cSv0Olx682fQEgAAD6G6ig
	(envelope-from <hare@suse.de>); Mon, 07 Apr 2025 07:10:20 +0000
Message-ID: <8a232716-74f8-4bba-a514-d0f766492344@suse.de>
Date: Mon, 7 Apr 2025 09:10:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: bio segment constraints
To: Sean Anderson <seanga2@gmail.com>, Jens Axboe <axboe@kernel.dk>,
 linux-block@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, Zhihao Cheng <chengzhihao1@huawei.com>
References: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
Content-Language: en-US
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <8dfd97ac-59e7-ae69-238a-85b7a2dae4f1@gmail.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,kernel.dk,vger.kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_001023_341524_E1929CB1 
X-CRM114-Status: GOOD (  30.93  )
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

T24gNC82LzI1IDIxOjQwLCBTZWFuIEFuZGVyc29uIHdyb3RlOgo+IEhpIGFsbCwKPiAKPiBJJ20g
bm90IHJlYWxseSBzdXJlIHdoYXQgZ3VhcmFudGVlcyB0aGUgYmxvY2sgbGF5ZXIgbWFrZXMgcmVn
YXJkaW5nIHRoZQo+IHNlZ21lbnRzIGluIGEgYmlvIGFzIHBhcnQgb2YgYSByZXF1ZXN0IHN1Ym1p
dHRlZCB0byBhIGJsb2NrIGRyaXZlci4gQXMKPiBmYXIgYXMgSSBjYW4gdGVsbCB0aGlzIGlzIG5v
dCBkb2N1bWVudGVkIGFueXdoZXJlLiBJbiBwYXJ0aWN1bGFyLAo+IAo+IC0gSXMgYnZfbGVuIGFs
aWduZWQgdG8gU0VDVE9SX1NJWkU/CgpUaGUgYmxvY2sgbGF5ZXIgYWx3YXlzIHVzZXMgYSA1MTIg
Ynl0ZSBzZWN0b3Igc2l6ZSwgc28geWVzLgoKPiAtIFRvIGxvZ2ljYWxfc2VjdG9yX3NpemU/CgpO
b3QgbmVjZXNzYXJpbHkuIEJ2ZWNzIGFyZSBhIGNvbnNlY3V0aXZlIGxpc3Qgb2YgYnl0ZSByYW5n
ZXMgd2hpY2gKbWFrZSB1cCB0aGUgZGF0YSBwb3J0aW9uIG9mIGEgYmlvLgpUaGUgbG9naWNhbCBz
ZWN0b3Igc2l6ZSBpcyBhIHByb3BlcnR5IG9mIHRoZSByZXF1ZXN0IHF1ZXVlLCB3aGljaCBpcwph
cHBsaWVkIHdoZW4gYSByZXF1ZXN0IGlzIGZvcm1lZCBmcm9tIG9uZSBvciBzZXZlcmFsIGJpb3Mu
CkZvciB0aGUgcmVxdWVzdCB0aGUgb3ZlcmFsbCBsZW5ndGggbmVlZCB0byBiZSBhIG11bHRpcGxl
IG9mIHRoZSBsb2dpY2FsCnNlY3RvciBzaXplLCBidXQgbm90IG5lY2Vzc2FyaWx5IHRoZSBpbmRp
dmlkdWFsIGJpb3MuCgo+IC0gV2hhdCBpZiBsb2dpY2FsX3NlY3Rvcl9zaXplID4gUEFHRV9TSVpF
PwoKU2VlIGFib3ZlLgoKPiAtIFdoYXQgYWJvdXQgYnZfb2Zmc2V0PwoKU2FtZSBzdG9yeS4gVGhl
IGV2ZW50dWFsIHJlcXVlc3QgbmVlZHMgdG8gb2JzZXJ2ZSB0aGF0IHRoZSBvZmZzZXQKYW5kIHRo
ZSBsZW5ndGggaXMgYWxpZ25lZCB0byB0aGUgbG9naWNhbCBibG9jayBzaXplLCBidXQgdGhlIGlu
ZGl2aWR1YWwKYmlvcyBtaWdodCBub3QuCgo+IC0gSXMgaXQgcG9zc2libGUgdG8gaGF2ZSBhIGJp
byB3aGVyZSB0aGUgdG90YWwgbGVuZ3RoIGlzIGEgbXVsdGlwbGUgb2YKPiAgwqAgbG9naWNhbF9z
ZWN0b3Jfc2l6ZSwgYnV0IHRoZSBkYXRhIGlzIHNwbGl0IGFjcm9zcyBzZXZlcmFsIHNlZ21lbnRz
Cj4gIMKgIHdoZXJlIGVhY2ggc2VnbWVudCBpcyBhIG11bHRpcGxlIG9mIFNFQ1RPUl9TSVpFPwoK
U3VyZS4KCj4gLSBJcyBpcyBwb3NzaWJsZSB0byBoYXZlIHNlZ21lbnRzIG5vdCBldmVuIGFsaWdu
ZWQgdG8gU0VDVE9SX1NJWkU/CgpOb3BlLgoKPiAtIENhbiBJIHNvbWVob3cgcmVxdWVzdCB0byBv
bmx5IGdldCBzZWdtZW50cyB3aXRoIGJ2X2xlbiBhbGlnbmVkIHRvCj4gIMKgIGxvZ2ljYWxfc2Vj
dG9yX3NpemU/IE9yIGRvIEkgbmVlZCB0byBkbyBteSBvd24gY29hbGVzY2luZyBhbmQgYm91bmNl
Cj4gIMKgIGJ1ZmZlcmluZyBmb3IgdGhhdD8KPiAKClRoZSBkcml2ZXIgc3VyZWx5IGNhbi4gWW91
IHNob3VsZCBiZSBhYmxlIHRvIHNldCAnbWF4X3NlZ21lbnRfc2l6ZScgdG8KdGhlIGxvZ2ljYWwg
YmxvY2sgc2l6ZSwgYW5kIHRoYXQgc2hvdWxkIGdpdmUgeW91IHdoYXQgeW91IHdhbnQuCgo+IEkn
dmUgYmVlbiByZWFkaW5nIHNvbWUgZHJpdmVycyAoYXMgd2VsbCBhcyBzdHVmZiBpbiBibG9jay8p
IHRvIHRyeSBhbmQKPiBmaWd1cmUgdGhpbmdzIG91dCwgYnV0IGl0J3MgaGFyZCB0byBmaWd1cmUg
b3V0IGFsbCB0aGUgcGxhY2VzIHdoZXJlCj4gY29uc3RyYWludHMgYXJlIGVuZm9yY2VkLiBJbiBw
YXJ0aWN1bGFyLCBJJ3ZlIHJlYWQgc2V2ZXJhbCBkcml2ZXJzIHRoYXQKPiBtYWtlIHNvbWUgYmln
IGFzc3VtcHRpb25zICh3aGljaCBtaWdodCBiZSBidWdzPykgRm9yIGV4YW1wbGUsIGluCj4gZHJp
dmVycy9tdGQvbXRkX2Jsa2RldnMuYywgZG9fYmxrdHJhbnNfcmVxdWVzdCBsb29rcyBsaWtlOgo+
IApJbiBnZW5lcmFsLCB0aGUgYmxvY2sgbGF5ZXIgaGFzIHR3byBtYWpvciBkYXRhIGl0ZW1zLCBi
aW9zIGFuZCByZXF1ZXN0cy4KJ3N0cnVjdCBiaW8nIGlzIHRoZSBjZW50cmFsIHN0cnVjdHVyZSBm
b3IgYW55ICd1cHBlcicgbGF5ZXJzIHRvIHN1Ym1pdApkYXRhICh2aWEgdGhlICdzdWJtaXRfYmlv
KCknIGZ1bmN0aW9uKSwgYW5kICdzdHJ1Y3QgcmVxdWVzdCcgaXMgdGhlCmNlbnRyYWwgc3RydWN0
dXJlIGZvciBkcml2ZXJzIHRvIGZldGNoIGRhdGEgZm9yIHN1Ym1pc3Npb24gdG8gdGhlCmhhcmR3
YXJlICh2aWEgdGhlICdxdWV1ZV9ycSgpJyByZXF1ZXN0X3F1ZXVlIGNhbGxiYWNrKS4KQW5kIHRo
ZSB0YXNrIG9mIHRoZSBibG9jayBsYXllciBpcyB0byBjb252ZXJ0ICdzdHJ1Y3QgYmlvJyBpbnRv
CidzdHJ1Y3QgcmVxdWVzdCcuCgpbIC4uIF0KCj4gRm9yIGNvbnRleHQsIHRyLT5ibGtzaGlmdCBp
cyBlaXRoZXIgNTEyIG9yIDQwOTYsIGRlcGVuZGluZyBvbiB0aGUKPiBiYWNrZW5kLiBGcm9tIHdo
YXQgSSBjYW4gdGVsbCwgdGhpcyBjb2RlIGFzc3VtZXMgdGhlIGZvbGxvd2luZzoKPiAKbXRkIGlz
IHByb2JhYmx5IG5vdCBhIGdvb2QgZXhhbXBsZXMsIGFzIE1URCBoYXMgaXQncyBvd24gc2V0IG9m
IApsaW1pdGF0aW9ucyB3aGljaCBtaWdodCByZXN1bHQgaW4gY2VydGFpbiBzaG9ydGN1dHMgdG8g
YmUgdGFrZW4uCgo+IC0gVGhlcmUgaXMgb25seSBvbmUgYmlvIGluIGEgcmVxdWVzdC4gVGhpcyBv
bmUgaXMgYSBiaXQgb2YgYSBzb2Z0Cj4gIMKgIGFzc3VtcHRpb24gc2luY2Ugd2Ugc2hvdWxkIG9u
bHkgZmx1c2ggdGhlIHBhZ2VzIGluIHRoZSBiaW8gYW5kIG5vdCB0aGUKPiAgwqAgd2hvbGUgcmVx
dWVzdCBvdGhlcndpc2UuCj4gLSBUaGVyZSBpcyBvbmx5IG9uZSBzZWdtZW50IGluIGEgYmlvLiBU
aGlzIG9uZSBjb3VsZCBiZSByZWFzb25hYmxlIGlmCj4gIMKgIG1heF9zZWdtZW50cyB3YXMgc2V0
IHRvIDEsIGJ1dCBpdCdzIG5vdCBhcyBmYXIgYXMgSSBjYW4gdGVsbC4gU28gSQo+ICDCoCBndWVz
cyB3ZSBqdXN0IGdvIG9mZiB0aGUgZW5kIG9mIHRoZSBiaW8gaWYgdGhlcmUncyBhIHNlY29uZCBz
ZWdtZW50Pwo+IC0gVGhlIGRhdGEgaXMgaW4gbG93bWVtIE9SIGJ2X29mZnNldCArIGJ2X2xlbiA8
PSBQQUdFX1NJWkUuIGttYXAoKSBvbmx5Cj4gIMKgIG1hcHMgYSBzaW5nbGUgcGFnZSwgc28gaWYg
d2UgZ28gcGFzdCBvbmUgcGFnZSB3ZSBlbmQgdXAgaW4gYWRqYWNlbnQKPiAgwqAga21hcHBlZCBw
YWdlcy4KPiAKV2VsbCwgdGhhdCBjb2RlIF9kb2VzXyBsb29rIHN1c3BpY2lvdXMuIEl0IHJlYWxs
eSBzaG91bGQgYmUgY29udmVydGVkCnRvIHVzaW5nIHRoZSBpb3YgaXRlcmF0b3JzLgpCdXQgdGhl
biBhZ2FpbiwgaXQgX21pZ2h0XyBiZSBva2F5IGlmIHRoZXJlIGFyZSB1bmRlcmx5aW5nIE1URApy
ZXN0cmljdGlvbnMgd2hpY2ggd291bGQgZGV2b2x2ZSBpbnRvIE1URCBvbmx5IGhhdmluZyBhIHNp
bmdsZSBidmVjLgoKQ2hlZXJzLAoKSGFubmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAg
ICAgICAgICAgICAgS2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgKzQ5IDkxMSA3NDA1MyA2ODgKU1VTRSBTb2Z0d2FyZSBT
b2x1dGlvbnMgR21iSCwgRnJhbmtlbnN0ci4gMTQ2LCA5MDQ2MSBOw7xybmJlcmcKSFJCIDM2ODA5
IChBRyBOw7xybmJlcmcpLCBHRjogSS4gVG90ZXYsIEEuIE1jRG9uYWxkLCBXLiBLbm9ibGljaAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
