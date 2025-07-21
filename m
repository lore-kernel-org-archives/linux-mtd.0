Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F3AC83F1A
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Jul 2025 11:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWyZPlDi/y7qCIqfB/IoEe7zu6IGUzp9n9C+IUfp/3s=; b=SGy9QMJwjjTFXe
	DYR0JKAw0pYFo64g88KrNSMnB66RQTN0cmhkvhOsZH7YGtYR8iqfGevNdEKU/9zzpGZGRwbdecf8z
	0Gw48Ot/SYDx5VEvJ+feJKYLcPN6ND48M11+rvks9cCXWN7MPXewA/KsKlZSws7bBdcuLPVtwT5sv
	WSNCcywRNqYOJ9CRP+MaEAaCJ9MoF2dTPIxcnI0AAx52B2Tts5mUKI3GdGxH0Dwf34yxNXcNNFlJl
	C8H6yHoMpzX+4TfzBdeUxDOJR/iKpsXV21PxxNm2X/r5vtbi5m6hdEyAhZ4VWaAmIirQ2yldHuRJg
	dKzsbd54ecHbpgqhY4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udorv-0000000H7um-0bjL;
	Mon, 21 Jul 2025 11:39:43 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udniY-0000000GxLN-2Nac
	for linux-mtd@lists.infradead.org;
	Mon, 21 Jul 2025 10:25:59 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 51A1E1F397;
	Mon, 21 Jul 2025 10:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1753093555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
	b=GGCpmZZgbAB5XlOhPaT/l0zeSwhiqSn6JbNbcSAdSIrsIWr7T0Mc7Nurq9TLL5MlDIKSzb
	G3mxxnF5X/WFL2F9PDn8NfEprPokB+uugrjkHFG+jVRlyIUBsFn+89vrEh51dQKAspuIIa
	bOQxVSvP+dassyYss7hQFywZfgAWP9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1753093555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
	b=TiuaNzkKooiGvnBZgx/DGGdlv5vk/tkXPxkZgwh1y7czyZp1RZa8jl8Z3vpXSlkZ0+KbS8
	LZDo/WglGtJ31cBg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=GGCpmZZg;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=TiuaNzkK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1753093555; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
	b=GGCpmZZgbAB5XlOhPaT/l0zeSwhiqSn6JbNbcSAdSIrsIWr7T0Mc7Nurq9TLL5MlDIKSzb
	G3mxxnF5X/WFL2F9PDn8NfEprPokB+uugrjkHFG+jVRlyIUBsFn+89vrEh51dQKAspuIIa
	bOQxVSvP+dassyYss7hQFywZfgAWP9Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1753093555;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=baH6ow82NzmU1jGwAd7SMMrxH3jdioo5q/Xo9G5hG+4=;
	b=TiuaNzkKooiGvnBZgx/DGGdlv5vk/tkXPxkZgwh1y7czyZp1RZa8jl8Z3vpXSlkZ0+KbS8
	LZDo/WglGtJ31cBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 3453C13A88;
	Mon, 21 Jul 2025 10:25:55 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Lyt7DLMVfmi/GgAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 21 Jul 2025 10:25:55 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 5D047A0884; Mon, 21 Jul 2025 12:25:54 +0200 (CEST)
Date: Mon, 21 Jul 2025 12:25:54 +0200
From: Jan Kara <jack@suse.cz>
To: Gao Xiang <hsiangkao@linux.alibaba.com>
Cc: Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, linux-btrfs@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, 
	Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>, linux-erofs@lists.ozlabs.org, 
	Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>, 
	linux-fsdevel@vger.kernel.org, David Woodhouse <dwmw2@infradead.org>, 
	Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org, 
	David Howells <dhowells@redhat.com>, netfs@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>, 
	Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, ntfs3@lists.linux.dev, Steve French <sfrench@samba.org>, 
	linux-cifs@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>, 
	Hailong Liu <hailong.liu@oppo.com>, Qu Wenruo <quwenruo.btrfs@gmx.com>
Subject: Re: Compressed files & the page cache
Message-ID: <z2ule3ilnnpoevo5mvt3intvjtuyud7vg3pbfauon47fhr4owa@giaehpbie4a5>
References: <aHa8ylTh0DGEQklt@casper.infradead.org>
 <e5165052-ead3-47f4-88f6-84eb23dc34df@linux.alibaba.com>
 <b61c4b7f-4bb1-4551-91ba-a0e0ffd19e75@linux.alibaba.com>
 <CAGsJ_4xJjwsvMpeBV-QZFoSznqhiNSFtJu9k6da_T-T-a6VwNw@mail.gmail.com>
 <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ea73f49-df4b-4f88-8b23-c917b4a9bd8a@linux.alibaba.com>
X-Rspamd-Queue-Id: 51A1E1F397
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.com];
	TO_DN_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:104:10:150:64:97:from,2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RL76kpr34nasjgd69zbi7paxtw)];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,infradead.org,fb.com,toxicpanda.com,suse.com,vger.kernel.org,fluxnic.net,kernel.org,lists.ozlabs.org,lists.sourceforge.net,suse.cz,nod.at,lists.infradead.org,redhat.com,lists.linux.dev,manguebit.org,paragon-software.com,samba.org,squashfs.org.uk,oppo.com,gmx.com];
	DKIM_TRACE(0.00)[suse.cz:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_032558_905632_AAA1D3D3 
X-CRM114-Status: GOOD (  24.19  )
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

T24gTW9uIDIxLTA3LTI1IDExOjE0OjAyLCBHYW8gWGlhbmcgd3JvdGU6Cj4gSGkgQmFycnksCj4g
Cj4gT24gMjAyNS83LzIxIDA5OjAyLCBCYXJyeSBTb25nIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwg
MTYsIDIwMjUgYXQgODoyOOKAr0FNIEdhbyBYaWFuZyA8aHNpYW5na2FvQGxpbnV4LmFsaWJhYmEu
Y29tPiB3cm90ZToKPiA+ID4gCj4gCj4gLi4uCj4gCj4gPiA+IAo+ID4gPiAuLi4gaGlnaC1vcmRl
ciBmb2xpb3MgY2FuIGNhdXNlIHNpZGUgZWZmZWN0cyBvbiBlbWJlZGRlZCBkZXZpY2VzCj4gPiA+
IGxpa2Ugcm91dGVycyBhbmQgSW9UIGRldmljZXMsIHdoaWNoIHN0aWxsIGhhdmUgTWlCcyBvZiBt
ZW1vcnkgKGFuZCBJCj4gPiA+IGJlbGlldmUgdGhpcyB3b24ndCBjaGFuZ2UgZHVlIHRvIHRoZWly
IHVzZSBjYXNlcykgYnV0IHRoZXkgYWxzbyB1c2UKPiA+ID4gTGludXgga2VybmVsIGZvciBxdWl0
ZSBsb25nIHRpbWUuICBJbiBzaG9ydCwgSSBkb24ndCB0aGluayBlbmFibGluZwo+ID4gPiBsYXJn
ZSBmb2xpb3MgZm9yIHRob3NlIGRldmljZXMgaXMgdmVyeSB1c2VmdWwsIGxldCBhbG9uZSBsaW1p
dGluZwo+ID4gPiB0aGUgbWluaW11bSBmb2xpbyBvcmRlciBmb3IgdGhlbSAoSXQgd291bGQgbWFr
ZSB0aGUgZmlsZXN5c3RlbSBub3QKPiA+ID4gc3VpdGFibGUgYW55IG1vcmUgZm9yIHRob3NlIHVz
ZXJzLiAgQXQgbGVhc3QgdGhhdCBpcyB3aGF0IEkgbmV2ZXIKPiA+ID4gd2FudCB0byBkbykuICBB
bmQgSSBiZWxpZXZlIHRoaXMgaXMgZGlmZmVyZW50IGZyb20gdGhlIGN1cnJlbnQgTEJTCj4gPiA+
IHN1cHBvcnQgdG8gbWF0Y2ggaGFyZHdhcmUgY2hhcmFjdGVyaXN0aWNzIG9yIExCUyBhdG9taWMg
d3JpdGUKPiA+ID4gcmVxdWlyZW1lbnQuCj4gPiAKPiA+IEdpdmVuIHRoZSBkaWZmaWN1bHR5IG9m
IGFsbG9jYXRpbmcgbGFyZ2UgZm9saW9zLCBpdCdzIGFsd2F5cyBhIGdvb2QKPiA+IGlkZWEgdG8g
aGF2ZSBvcmRlci0wIGFzIGEgZmFsbGJhY2suIFdoaWxlIEkgYWdyZWUgd2l0aCB5b3VyIHBvaW50
LAo+ID4gSSBoYXZlIGEgc2xpZ2h0bHkgZGlmZmVyZW50IHBlcnNwZWN0aXZlIOKAlCBlbmFibGlu
ZyBsYXJnZSBmb2xpb3MgZm9yCj4gPiB0aG9zZSBkZXZpY2VzIG1pZ2h0IGJlIGJlbmVmaWNpYWws
IGJ1dCB0aGUgbWF4aW11bSBvcmRlciBzaG91bGQKPiA+IHJlbWFpbiBzbWFsbC4gSSdtIHJlZmVy
cmluZyB0byAic21hbGwiIGxhcmdlIGZvbGlvcy4KPiAKPiBZZWFoLCBhZ3JlZWQuIEhhdmluZyBh
IHdheSB0byBsaW1pdCB0aGUgbWF4aW11bSBvcmRlciBmb3IgdGhvc2Ugc21hbGwKPiBkZXZpY2Vz
IChyYXRoZXIgdGhhbiBkaXNhYmxpbmcgaXQgY29tcGxldGVseSkgd291bGQgYmUgaGVscGZ1bC4g
IEF0Cj4gbGVhc3QgInNtYWxsIiBsYXJnZSBmb2xpb3MgY291bGQgc3RpbGwgcHJvdmlkZSBiZW5l
Zml0cyB3aGVuIG1lbW9yeQo+IHByZXNzdXJlIGlzIGxpZ2h0LgoKV2VsbCwgaW4gdGhlIHBhZ2Ug
Y2FjaGUgeW91IGNhbiB0dW5lIG5vdCBvbmx5IHRoZSBtaW5pbXVtIGJ1dCBhbHNvIHRoZQptYXhp
bXVtIG9yZGVyIG9mIGEgZm9saW8gYmVpbmcgYWxsb2NhdGVkIGZvciBlYWNoIGlub2RlLiBCdHJm
cyBhbmQgZXh0NAphbHJlYWR5IHVzZSB0aGlzIGZ1bmN0aW9uYWxpdHkuIFNvIGluIHByaW5jaXBs
ZSB0aGUgZnVuY3Rpb25hbGl0eSBpcyB0aGVyZSwKaXQgaXMgImp1c3QiIGEgcXVlc3Rpb24gb2Yg
cHJvcGVyIHVzZXIgaW50ZXJmYWNlcyBvciBhdXRvbWF0aWMgbG9naWMgdG8KdHVuZSB0aGlzIGxp
bWl0LgoKCQkJCQkJCQlIb256YQotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFi
cywgQ1IKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
