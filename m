Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED511CA0FE6
	for <linux-mtd@archiver.kernel.org>; Fri,  1 Sep 2023 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UFWVFaB5VTFrEMLepia2GCgjv0GurVFM8obDUxm3Eu0=; b=Zsg+esfcGV88oQ
	EogONvxjrk+bOeAHl7edJ6c0lU82vqDnHu3pFKBz9cDaEU9WbHY9OdaYT3lTJLFtRzOrbop75bGr5
	NQL3a2htuQfNOtZ30kSeKaL6sQUIHB5uBfxLRH7ugCTLg2S75Rf24TJI+8TiWCiGW5kjwASBzhYIx
	LXpy+4lnLFYjquvRkzXOjAvjbCqdMuFKpt6DEBQC/UDY1ljQQcyZe6ZRZjQCRkKrx9CYEn11KQsvO
	mNXIh4Ohtp4rfnMdO28trGI7gSG4lCXNoVysioEzT8iyzIVK72MCvjnDZdYc2/0d9h8UBfvHYTX4n
	Sr2BcFspqzUOMrfwkXSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0AC-00Gj4k-0V;
	Fri, 01 Sep 2023 09:10:00 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qc0A8-00Gj4G-2k
	for linux-mtd@lists.infradead.org;
	Fri, 01 Sep 2023 09:09:58 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 391522186B;
	Fri,  1 Sep 2023 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1693559392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eabU9pxxl6Zq+rau5zfKVQBYWkGA4avvUJcztbvUr6o=;
	b=a+RnBvImeahdbXRtK8Kb4U9/LHAoq7T9NUE77XBGpfG/43y8ld5Gp8LIFl+e2/fOON0Ydt
	SwSUsEENVaHh59VAtew44cgtZM7gY/b4BA8+H1q69I1w27gmbOcSkS6Vo/gIE6AMLZkEfI
	tr8eDUOkMv1YJnasApTiWU9mJvGx2io=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1693559392;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eabU9pxxl6Zq+rau5zfKVQBYWkGA4avvUJcztbvUr6o=;
	b=EuaNFVrKXUXitCxtneoEV7gnMzCnh6PiGdN7uvB9TRiX8npRPHLvRYT7OGF+EPrql42NuF
	V/YtNaQk6qlu6FDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2E41813582;
	Fri,  1 Sep 2023 09:09:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kexEC2Cq8WSSNgAAMHmgww
	(envelope-from <jack@suse.cz>); Fri, 01 Sep 2023 09:09:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id A93F5A0776; Fri,  1 Sep 2023 11:09:51 +0200 (CEST)
Date: Fri, 1 Sep 2023 11:09:51 +0200
From: Jan Kara <jack@suse.cz>
To: Zhihao Cheng <chengzhihao1@huawei.com>
Cc: Jan Kara <jack@suse.cz>, Richard Weinberger <richard@nod.at>,
	linux-mtd@lists.infradead.org, Yu Hao <yhao016@ucr.edu>
Subject: Re: [PATCH] ubi: Reject device with erasesize 0
Message-ID: <20230901090951.uq5l6ag4gdssk3ni@quack3>
References: <20230831111100.26862-1-jack@suse.cz>
 <742eaa4e-3b74-5dc5-cf0a-71940b945133@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <742eaa4e-3b74-5dc5-cf0a-71940b945133@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230901_020957_060322_A88DA4F2 
X-CRM114-Status: GOOD (  19.45  )
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

T24gRnJpIDAxLTA5LTIzIDA5OjExOjI2LCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4g5ZyoIDIwMjMv
OC8zMSAxOToxMSwgSmFuIEthcmEg5YaZ6YGTOgo+IEhpIEphbiwKPiA+IEluIHByaW5jaXBsZSBN
VEQgZGV2aWNlIHdpdGggZXJhc2VzaXplIDAgY2FuIGV4aXN0IGFuZCBpdCBpcyBwb3NzaWJsZSB0
bwo+ID4gY3JlYXRlIHRoZW0gZS5nLiB2aWEgS1ZNLiBJZiB0aGF0IGhhcHBlbnMgVUJJIGxheWVy
IGN1cnJlbnRseSBjcmFzaGVzCj4gPiB3aXRoOgo+ID4gCj4gPiB1Ymk3OiBhdHRhY2hpbmcgbXRk
MTQ3Cj4gPiBkaXZpZGUgZXJyb3I6IDAwMDAgWyMxXSBQUkVFTVBUIFNNUCBLQVNBTgo+ID4gQ1BV
OiAwIFBJRDogMjAwMjMgQ29tbTogc3l6LWV4ZWN1dG9yLjAgTm90IHRhaW50ZWQgNi4yLjAgIzYK
PiA+IEhhcmR3YXJlIG5hbWU6IFFFTVUgU3RhbmRhcmQgUEMgKGk0NDBGWCArIFBJSVgsIDE5OTYp
LCBCSU9TCj4gPiAxLjEzLjAtMXVidW50dTEuMSAwNC8wMS8yMDE0Cj4gPiBSSVA6IDAwMTA6bXRk
X2Rpdl9ieV9lYiBpbmNsdWRlL2xpbnV4L210ZC9tdGQuaDo1ODAgW2lubGluZV0KPiA+IFJJUDog
MDAxMDppb19pbml0IGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jOjYyMCBbaW5saW5lXQo+ID4gUklQ
OiAwMDEwOnViaV9hdHRhY2hfbXRkX2RldisweDc3Zi8weDJmZTAgZHJpdmVycy9tdGQvdWJpL2J1
aWxkLmM6OTU1Cj4gPiBDb2RlOiBmYyBmZiBkZiA0OCBjMSBlYSAwMyAwZiBiNiAxNCAwMiA0YyA4
OSBmMCA4MyBlMCAwNyA4MyBjMCAwMyAzOAo+ID4gZDAgN2MgMDggODQgZDIgMGYgODUgMWYgMjUg
MDAgMDAgNDEgOGIgNGMgMjQgMTAgNDggODkgZDggMzEgZDIgPDQ4PiBmNwo+ID4gZjEgNDggODkg
YzMgZTggYjYgZjMgMWIgZmMgNDggOGQgODUgNDAgMTcgMDAgMDAgNDggODkgYzIgNDgKPiA+IFJT
UDogMDAxODpmZmZmYzkwMDBiZTBmZDMwIEVGTEFHUzogMDAwMTAyNDYKPiA+IFJBWDogMDAwMDAw
MDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAwMDAgUkNYOiAwMDAwMDAwMDAwMDAwMDAwCj4g
PiBSRFg6IDAwMDAwMDAwMDAwMDAwMDAgUlNJOiBmZmZmODg4MDQ3YTQ5ZDQwIFJESTogMDAwMDAw
MDAwMDAwMDAwMgo+ID4gUkJQOiBmZmZmODg4MDI0ZTFjMDAwIFIwODogMDAwMDAwMDAwMDAwMDAx
NiBSMDk6IGZmZmZmNTIwMDE3YzFmNDcKPiA+IFIxMDogZmZmZmM5MDAwYmUwZmEzNyBSMTE6IGZm
ZmZmNTIwMDE3YzFmNDYgUjEyOiBmZmZmODg4MDY1NDVhMDAwCj4gPiBSMTM6IDAwMDAwMDAwMDAw
MDAwMDAgUjE0OiBmZmZmODg4MDY1NDVhMDEwIFIxNTogMDAwMDAwMDAwMDAwMDAwNwo+ID4gRlM6
ICAwMDAwN2ZkNDVlODVjNzAwKDAwMDApIEdTOmZmZmY4ODgwMmNhMDAwMDAoMDAwMCkga25sR1M6
MDAwMDAwMDAwMDAwMDAwMAo+ID4gQ1M6ICAwMDEwIERTOiAwMDAwIEVTOiAwMDAwIENSMDogMDAw
MDAwMDA4MDA1MDAzMwo+ID4gQ1IyOiAwMDAwN2Y2NGFlZWY1M2E0IENSMzogMDAwMDAwMDA0ZjM5
YTAwMCBDUjQ6IDAwMDAwMDAwMDAzNTBlZjAKPiA+IENhbGwgVHJhY2U6Cj4gPiAgIDxUQVNLPgo+
ID4gICBjdHJsX2NkZXZfaW9jdGwrMHgzMDMvMHgzYTAgZHJpdmVycy9tdGQvdWJpL2NkZXYuYzox
MDQzCj4gPiAgIHZmc19pb2N0bCBmcy9pb2N0bC5jOjUxIFtpbmxpbmVdCj4gPiAgIF9fZG9fc3lz
X2lvY3RsIGZzL2lvY3RsLmM6ODcwIFtpbmxpbmVdCj4gPiAgIF9fc2Vfc3lzX2lvY3RsIGZzL2lv
Y3RsLmM6ODU2IFtpbmxpbmVdCj4gPiAgIF9feDY0X3N5c19pb2N0bCsweDE5OC8weDIxMCBmcy9p
b2N0bC5jOjg1Ngo+ID4gICBkb19zeXNjYWxsX3g2NCBhcmNoL3g4Ni9lbnRyeS9jb21tb24uYzo1
MCBbaW5saW5lXQo+ID4gICBkb19zeXNjYWxsXzY0KzB4MzUvMHhiMCBhcmNoL3g4Ni9lbnRyeS9j
b21tb24uYzo4MAo+ID4gICBlbnRyeV9TWVNDQUxMXzY0X2FmdGVyX2h3ZnJhbWUrMHg2My8weGNk
Cj4gPiAKPiA+IEhhbmRsZSBzdWNoIGRldmljZXMgZ3JhY2VmdWxseSBhbmQganVzdCByZWplY3Qg
YXR0YWNoaW5nIFVCSSB0byB0aGVtCj4gPiBpbnN0ZWFkIG9mIGNyYXNoaW5nLgo+ID4gCj4gPiBS
ZXBvcnRlZC1ieTogWXUgSGFvIDx5aGFvMDE2QHVjci5lZHU+Cj4gPiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9hbGwvQ0ErVUJjdERzSFJwa0xHNXBwZGl1VjhNc240RHgtWkoyeERyeGZh
NDhWTWI3WkUreEJBQG1haWwuZ21haWwuY29tCj4gPiBTaWduZWQtb2ZmLWJ5OiBKYW4gS2FyYSA8
amFja0BzdXNlLmN6Pgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvbXRkL3ViaS9idWlsZC5jIHwgMyAr
KysKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBJdCBkb2Vz
bid0IHNlZW0gdGhlIGRpc2N1c3Npb24gbGlua2VkIGFib3ZlIGNvbmNsdWRlZCBpbiBhIHBhdGNo
LiBTbyBpcwo+ID4gYW55dGhpbmcgd3Jvbmcgd2l0aCB0aGUgdHJpdmlhbCBhcHByb2FjaCBoZXJl
IHNvIHRoYXQgd2UgY2FuIGNsb3NlIHRoZSBpc3N1ZT8KPiAKPiBUaGVyZSB3YXMgYSBwYXRjaCwg
c2VlCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2xpbnV4LW10ZC9wYXRj
aC8yMDIzMDQyMzExMTA0MS42ODQyOTctMS1jaGVuZ3poaWhhbzFAaHVhd2VpLmNvbS8KCkFoLCBP
SywgSSB3YXNuJ3QgYWJsZSB0byBmaW5kIGl0IHRocm91Z2ggbG9yZSBzZWFyY2guIFRoYW5rcyBm
b3IgdGhlCnBvaW50ZXIhIEhvcGVmdWxseSBSaWNoYXJkIHdpbGwgbWVyZ2UgaXQgbm93LgoKCQkJ
CQkJCQlIb256YQotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFicywgQ1IKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
