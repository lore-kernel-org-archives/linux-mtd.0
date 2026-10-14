Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 574D1CC6B1D
	for <linux-mtd@archiver.kernel.org>; Wed, 14 Oct 2026 13:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lmoghICaKoihoYukB9mqzYcqpM4dUN3KF1Kq++sDt8A=; b=jSPRJmwLd2XTYc
	NnJ5ofwzI8ABj2GKUiXde720Vys1hXnixr7+JVV5SZKuP/shnh/JRdPDYqso1BTHkIEeBo6RR5AlU
	Mgf9D0S/wpnmI97afy7n8nus7wKXkgI6oS8SgfNrumy+c2scsbDCgeOzviU8KCMqIUZBjQzK6GUN2
	3wZ3qg2CfIHOGTz/cUNHqPT8yThWeSl9z7V0f1XBMiaAWX1Eo+XHNJUQaSbamx8ALfZIEuAWQ6vp0
	NTOJEndK+7MHrgYFHKZePchKo/LAAh32cJRv4c7nStK6+fXl1hWgHGSGR0XrDnDkmQmamW5DdJXKY
	GJmneJMQb2iF8OJMVFng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzKZ-0000000FdmQ-1RQT;
	Wed, 14 Oct 2026 13:47:43 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGzKX-0000000Fdle-0Sgb
	for linux-mtd@lists.infradead.org;
	Wed, 14 Oct 2026 13:47:42 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D252822258;
	Wed, 14 Oct 2026 13:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1791985659; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY9RqNIokuQ1DH3X9Yc1BCOmA2bOCbyTbnsYeJcms7U=;
	b=KER6SV+3E5T8faaU3djQpSC8B9QPNgiQOksk9btYa1oyN+g/YdhOBY6t1StzY1g3bSF0IJ
	zd1FvSem8kaP2TbkqojJhhhFOthOVUjirK7sCmgbkHZZx82aJ9Io4OE8IvNRplBb+KGXEf
	1xnlhspPxY1CCNo9bMSSg22YlcPY1WI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1791985659;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY9RqNIokuQ1DH3X9Yc1BCOmA2bOCbyTbnsYeJcms7U=;
	b=5kV45Nl3phoxgImBDhEqInuMMmAek0XiQQPFlXI/cnE3ZS5Quvx+F2axMbnAyEMUB1fkx3
	FIYEJ2frN9CQ5KBA==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=S0AnEx52;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=gG1ABpRO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1791985657; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY9RqNIokuQ1DH3X9Yc1BCOmA2bOCbyTbnsYeJcms7U=;
	b=S0AnEx52KGncKxtGJdhOJnkNKWblqAhU1fDfPojL39mMiKeDrabTNcq7zrzX9j4BiwbLyH
	OakWO7MFjbmum5NnwrDWXKsOJm95K6rjrzLtmGKio9hh9a9ZDKInBQ8G3OJJr2jLduCpIm
	cY4ShwlOEbCtlHljqjRWtydkmyqg6nY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1791985657;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DY9RqNIokuQ1DH3X9Yc1BCOmA2bOCbyTbnsYeJcms7U=;
	b=gG1ABpROq+bYTWDuUnYSBShOJ9fbmudAese1phkK/c9rHSbMI+6wnPeO8BO8ATprL8kHK6
	exH5zVUd6CuBDKDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9348F133F1;
	Wed, 14 Oct 2026 13:47:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ACfUG/mHz2oSUQAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 14 Oct 2026 13:47:37 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 84A41A140F; Wed, 14 Oct 2026 15:47:36 +0200 (CEST)
Date: Wed, 14 Oct 2026 15:47:36 +0200
From: Jan Kara <jack@suse.cz>
To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, Al Viro <viro@zeniv.linux.org.uk>, ecryptfs@vger.kernel.org, 
	linux-ext4@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	linux-nilfs@vger.kernel.org, exfat@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	ntfs@lists.linux.dev, ocfs2-devel@lists.linux.dev, linux-btrfs@vger.kernel.org, 
	gfs2@lists.linux.dev, linux-efi@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-xfs@vger.kernel.org, stable@vger.kernel.org, 
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: Re: [PATCH RFC 00/28] fs: don't set SB_RDONLY after filesystem errors
Message-ID: <k7zduo2ewgvrmic2gc4wssakq4ystwqpuwo6a5llx2gzc64xzl@k2pjjijh5kye>
References: <20261012-work-fs-sb_rdonly-v1-0-60743a3dc326@kernel.org>
 <my2k7257m265fp5ad77n5hfndl23i56gsog3jwnsyocp3yxbnj@aphfqdiej2hs>
 <20261013-forsten-ammoniak-geknackt-fefec366cc97@brauner>
 <CAHc6FU5JuYU8R4=agxgWBoEKrUGyWiitzRn5MwXiV7NZYt=_ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHc6FU5JuYU8R4=agxgWBoEKrUGyWiitzRn5MwXiV7NZYt=_ag@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_COUNT_THREE(0.00)[3];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.cz,suse.com,zeniv.linux.org.uk,vger.kernel.org,lists.sourceforge.net,lists.linux.dev,lists.infradead.org,gmail.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:dkim,suse.com:email,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns]
X-Rspamd-Queue-Id: D252822258
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_064741_454903_F018A4AA 
X-CRM114-Status: GOOD (  35.88  )
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

T24gV2VkIDE0LTEwLTI2IDEyOjA0OjA4LCBBbmRyZWFzIEdydWVuYmFjaGVyIHdyb3RlOgo+IE9u
IFdlZCwgT2N0IDE0LCAyMDI2IGF0IDEyOjIw4oCvQU0gQ2hyaXN0aWFuIEJyYXVuZXIgPGJyYXVu
ZXJAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+IEknbSBpbiBmYXZvciBvZiB0aGlzLiBKdXN0IGFm
dGVyIGNoZWNraW5nIGNvdXBsZSBvZiBmaWxlc3lzdGVtIGNoYW5nZXMgLQo+ID4gPiB3b24ndCB3
ZSBiZSBiZXR0ZXIgb2ZmIGJ5IHVzaW5nIGEgZ2VuZXJpYyBmbGFnIGluIHN1cGVyX2Jsb2NrIGZv
ciB0aGlzIHNvCj4gPiA+IHRoYXQgVkZTIGNhbiBjaGVjayBmb3IgaXQ/IFRoZW4gZWFjaCBmaWxl
c3lzdGVtIHdvbid0IGhhdmUgdG8gaW1wbGVtZW50Cj4gPiA+IGl0cyBvd24gd3JhcHBlciBmb3Ig
c2ltcGxlX2ZzeW5jKCksIHF1b3RhIG9wZXJhdGlvbnMsIGFuZCB3aGF0ZXZlciBvdGhlcgo+ID4g
PiBnZW5lcmljIG9wZXJhdGlvbnMgdGhhdCBuZWVkIHRvIGJhaWwgb24gc2h1dGRvd24gZmlsZXN5
c3RlbS4uLgo+ID4KPiA+IERvIHlvdSBtZWFuIHNvbWV0aGluZyBsaWtlPzoKPiA+Cj4gPiBGcm9t
IDI4Yzk3ZjIxNDJlMjU1ZWI4MzVkMjZkZWI5N2IwMGFmY2NmYjdjNGEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCj4gPiBGcm9tOiBDaHJpc3RpYW4gQnJhdW5lciA8YnJhdW5lckBrZXJuZWwub3Jn
Pgo+ID4gRGF0ZTogVHVlLCAxMyBPY3QgMjAyNiAyMToxNTozNiArMDIwMAo+ID4gU3ViamVjdDog
W1BBVENIXSBmczogYWRkIGEgZ2VuZXJpYyBlbWVyZ2VuY3kgcmVhZC1vbmx5IHN0YXRlCj4gPgo+
ID4gVGhlIGZpbGVzeXN0ZW1zIHRoYXQgc3RvcHBlZCBzZXR0aW5nIFNCX1JET05MWSBhZnRlciBh
biBlcnJvciByZWZ1c2UKPiA+IG1vZGlmaWNhdGlvbnMgdGhlbXNlbHZlcyBub3cuIEVhY2ggb2Yg
dGhlbSBncmV3IHRoZSBzYW1lIGNoZWNrcyBpbgo+ID4gLT5vcGVuLCAtPnNldGF0dHIsIC0+ZnN5
bmMsIC0+d3JpdGVfaW5vZGUsIHRoZSBkaXJlY3Rvcnkgb3BlcmF0aW9ucywgdGhlCj4gPiBxdW90
YSBvcGVyYXRpb25zIGFuZCAtPnJlY29uZmlndXJlLiBKYW4gc3VnZ2VzdGVkIGEgZ2VuZXJpYyBm
bGFnIHNvIHRoZQo+ID4gVkZTIGNhbiBkbyB0aGF0IG9uY2UgKGNmLiBbMV0pLgo+ID4KPiA+IFNv
IGFkZCBTQl9TVEFURV9FTUVSR0VOQ1lfUk8gaW4gYSBuZXcgc2ItPnNfc3RhdGUgd29yZC4gSXQg
aXMgb25seSBldmVyCj4gPiBzZXQgd2l0aCBzZXRfYml0KCkgYW5kIG5ldmVyIGNsZWFyZWQgc28g
aXQgY2FuIGJlIHRlc3RlZCBhbnl3aGVyZQo+ID4gd2l0aG91dCBhbnkgb3JkZXJpbmcgYWdhaW5z
dCB0aGUgc2V0dGVyLiBBIGZpbGVzeXN0ZW0gY2FsbHMKPiA+IHNiX3NldF9lbWVyZ2VuY3lfcm8o
KSB3aGVyZSBpdCB1c2VkIHRvIHNldCBTQl9SRE9OTFkuIFNCX1JET05MWSBpdHNlbGYKPiA+IHN0
YXlzIHVudG91Y2hlZCBzbyBmcmVlemVfc3VwZXIoKSBhbmQgdGhhd19zdXBlcigpIGtlZXAgc2Vl
aW5nIGEKPiA+IGNvbnNpc3RlbnQgc3VwZXJibG9jay4KPiA+Cj4gPiBUaGUgVkZTIHRoZW4gY2hl
Y2tzIGl0IHdoZXJldmVyIHNiX3Jkb25seSgpIGdhdGVzIGEgd3JpdGU6Cj4gPgo+ID4gLSBfX21u
dF9pc19yZWFkb25seSgpIHNvIG1udF93YW50X3dyaXRlKCksIG9wZW5pbmcgZmlsZXMgZm9yIHdy
aXRpbmcsCj4gPiAgIGFjY2VzcyhXX09LKSwgbmZzZCBhbmQgb3ZlcmxheWZzIHNlZSBhIHJlYWQt
b25seSBzdXBlcmJsb2NrCj4gPiAtIHNiX3Blcm1pc3Npb24oKSBmb3IgdmZzX2NyZWF0ZSgpLCB2
ZnNfdW5saW5rKCkgYW5kIGZyaWVuZHMKPiA+IC0gbm90aWZ5X2NoYW5nZSgpLCByd192ZXJpZnlf
YXJlYSgpLCB2ZnNfZmFsbG9jYXRlKCksIHZmc19mc3luY19yYW5nZSgpCj4gPiAgIGFuZCBkb19w
YWdlX21rd3JpdGUoKSBmb3IgZmlsZXMgdGhhdCB3ZXJlIG9wZW5lZCBiZWZvcmUgdGhlIGVycm9y
Cj4gPiAtIHJlY29uZmlndXJlX3N1cGVyKCkgcmVmdXNlcyBnb2luZyByZWFkLXdyaXRlCj4gPiAt
IHN5bmNfZmlsZXN5c3RlbSgpLCBzeW5jKDIpIGFuZCB3cml0ZV9pbm9kZSgpIGRvbid0IHdyaXRl
IGFueW1vcmUKPiA+IC0gdGhlIGRxdW90IGNvZGUgZG9lc24ndCB3cml0ZSB0aGUgcXVvdGEgZmls
ZXMgYW55bW9yZSBhbmQgcXVvdGFjdGwoMikKPiA+ICAgcmVmdXNlcyB0byBjaGFuZ2UgYW55dGhp
bmcKPiA+IC0gImVtZXJnZW5jeV9ybyIgaXMgc2hvd24gaW4gdGhlIG1vdW50IG9wdGlvbnMsIC9w
cm9jL21vdW50cyBzaG93cyB0aGUKPiA+ICAgc3VwZXJibG9jayBhcyAicm8iIGFuZCBzdGF0ZnMo
KSByZXBvcnRzIFNUX1JET05MWSBsaWtlIHRoZXkgZGlkIHdoZW4KPiA+ICAgU0JfUkRPTkxZIHdh
cyBzZXQKPiA+Cj4gPiBXaGF0IHJlYWNoZXMgdGhlIGZpbGVzeXN0ZW0gd2l0aG91dCBwYXNzaW5n
IHRocm91Z2ggdGhlIFZGUyBpdCBzdGlsbCBoYXMKPiA+IHRvIHJlZnVzZSBpdHNlbGYuIFRoYXQn
cyBpdHMgYWxsb2NhdG9ycywgaXRzIGpvdXJuYWwsIGl0cyBvd24gd3JpdGViYWNrCj4gPiBhbmQg
dGhlIGRlbGV0aW9uIG9mIHVubGlua2VkIGlub2Rlcy4KPiAKPiBGb3Igc2hhcmVkIGZpbGVzeXN0
ZW1zIGxpa2UgZ2ZzMiwgdGhlIGNvbmNlcHQgb2YgYW4gZW1lcmdlbmN5Cj4gcmVhZC1vbmx5IHN0
YXRlIGRvZXNuJ3QgbWFrZSBzZW5zZSBiZWNhdXNlIGluIHRoYXQgc3RhdGUgKGluIGdmczIKPiB0
ZXJtcywgYSB3aXRoZHJhd24gZmlsZXN5c3RlbSksIHdlIGNhbm5vdCBkbyBhbnkgbW9yZSBjbHVz
dGVyLXdpZGUKPiBsb2NraW5nIGFuZCBzbyB3ZSBjYW5ub3QgYWxsb3cgYW55IG1vcmUgcmVhZHMs
IGVpdGhlci4gQ291bGQgd2UgZGVmaW5lCj4gdGhlIG5ldyBmbGFnIGluIGEgd2F5IHRoYXQgd291
bGQgYWxsb3cgZmlsZXN5c3RlbXMgdG8gZW5mb3JjZSBzdHJvbmdlcgo+IGd1YXJhbnRlZXM/IFRo
aXMgd291bGQgc3VnZ2VzdCBhIGZsYWcgbmFtZSBvdGhlciB0aGFuCj4gU0JfU1RBVEVfRU1FUkdF
TkNZX1JPLCB0aG91Z2guCgpUaGUgcHJvYmxlbSBpcyB0aGF0IGEgbG90IG9mIGxvY2FsIGZpbGVz
eXN0ZW1zIHJlYWxseSB3YW50IHRoZSBlbWVyZ2VuY3kKcmVhZC1vbmx5IHN0YXRlIChhbmQgbm90
IGZ1bGwgZnMgc2h1dGRvd24pLiBTbyBpZiB5b3Ugd2FudCB0byBmdWxseQpzaHV0ZG93biB0aGUg
ZnMgb24gZXJyb3IsIGVpdGhlciBnZnMyIGhhcyB0byBkbyBpdCBvbiBpdCdzIG93biBvciB3ZSBj
b3VsZAppbnRyb2R1Y2UgYW5vdGhlciBzYiBzdGF0ZSBmb3IgdGhhdC4gQnV0IEkgdGhpbmsgZW1l
cmdlbmN5LXJvIHN0YXRlIG5lZWRzCnRvIHN0YXkuLi4KCgkJCQkJCQkJSG9uemEKLS0gCkphbiBL
YXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFp
bGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbXRkLwo=
