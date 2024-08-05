Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99743C3DA4A
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Aug 2024 15:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R0GpR+/kGd2wP6CImGzSfBcbPQmWQ7fpdF+IjrT4NZc=; b=0q/rcjmJik33KZ
	6fWDIoyoMUsU31RHPENJTBHV0bnIwmZGmiNm4mSCEAgVJAiypIYfTfD//B0TdQXMa0fj7c6lt9j+h
	8Jh/+Ab3dVDP0t2kjHuzT4bZtz7KvAChvIUEGbVkaFxZ7otPv7bAXK1it2r/pmgcjxvPFZqTdKAWm
	UOYr4NGD+O6x9j+w0Y3RjkhioLnWqWDJlqBAz2DTGEj2osEswlxH5E1Oq+4ujDrMNhtrTLYSOOF47
	nI7fKJmcMZqDlOk4RKjj2K1kIcHPVZRhdnr1XaJPRNWraIMtyLsVBljg3ygPuFCHUzXaQtqmWQGtO
	RB1z0MttUhMfuRqhPIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sazfK-0000000GKP1-1AA8;
	Mon, 05 Aug 2024 15:30:30 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sazfE-0000000GKNV-0bFQ
	for linux-mtd@lists.infradead.org;
	Mon, 05 Aug 2024 15:30:27 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9001E1F7E8;
	Mon,  5 Aug 2024 15:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722871821; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D63tHi1ufrCqU6aXrDGsdg5HEdJeV4Q3bSuuCaUhptM=;
	b=SaA6MSXkxaypD9iSpEteM6aCNQEMBiFRM0X7q0LF9cMscQY4uKpaljLTAnWQ+Du4m8n818
	iw6NrDhQxumz905Yob69dd/Z96u0jx1R/NAj8Xz/PmiWIBZWxTbQbQIRvp3xpmjOu7t7bl
	oPw07hUecOoMg+iFFr/funBrgcBHgHY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722871821;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D63tHi1ufrCqU6aXrDGsdg5HEdJeV4Q3bSuuCaUhptM=;
	b=S1sk61Lgj5/WxaLe9T8U5AD9XZGdnbR8UgpsmyrWTBjVdap6t5x1HWSuTsUYv7/pcFzkB5
	JhY8q+n4QlYUk1Bw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1722871819; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D63tHi1ufrCqU6aXrDGsdg5HEdJeV4Q3bSuuCaUhptM=;
	b=xUdLg+JpggbGIlIrTfoeMMSJc70x8RmGtNvxW5Bd4y0G9Jnz3qdKXdTIOQ5rW5wlgY4B7y
	uwtWxXTNp+ni9Fn5Km79EV7rXpJ2lPFJeLjZDwtKjyAkKxsHrieYUrhKl23eYo32q4aWy2
	nacoscMNhLPPE5uOjG3j10VlP5dbtkY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1722871819;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D63tHi1ufrCqU6aXrDGsdg5HEdJeV4Q3bSuuCaUhptM=;
	b=hT8TBwNlkAXgd9sPNM9I/YQq/pAa1VuCwACGONEK8P4qdqcw5vTDcDQkNj0/diFMHKvaEo
	d+xwevl1t4gODVDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7EC9313ACF;
	Mon,  5 Aug 2024 15:30:19 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id LwnwHgvwsGZTYAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 05 Aug 2024 15:30:19 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id D395BA0897; Mon,  5 Aug 2024 17:30:18 +0200 (CEST)
Date: Mon, 5 Aug 2024 17:30:18 +0200
From: Jan Kara <jack@suse.cz>
To: Zhihao Cheng <chengzhihao@huaweicloud.com>
Cc: viro@zeniv.linux.org.uk, brauner@kernel.org, tahsin@google.com,
	mjguzik@gmail.com, error27@gmail.com, tytso@mit.edu,
	rydercoding@hotmail.com, jack@suse.cz, hch@infradead.org,
	andreas.dilger@intel.com, richard@nod.at,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	chengzhihao1@huawei.com, yi.zhang@huawei.com, yangerkun@huawei.com,
	wangzhaolong1@huawei.com
Subject: Re: [PATCH] vfs: Don't evict inode under the inode lru traversing
 context
Message-ID: <20240805153018.3sju3nowiqggykvf@quack3>
References: <20240805013446.814357-1-chengzhihao@huaweicloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240805013446.814357-1-chengzhihao@huaweicloud.com>
X-Spamd-Result: default: False [-0.80 / 50.00];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,hotmail.com];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[zeniv.linux.org.uk,kernel.org,google.com,gmail.com,mit.edu,hotmail.com,suse.cz,infradead.org,intel.com,nod.at,vger.kernel.org,lists.infradead.org,huawei.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo,huawei.com:email,suse.cz:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240805_083024_622157_A7E7AB50 
X-CRM114-Status: GOOD (  21.06  )
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

T24gTW9uIDA1LTA4LTI0IDA5OjM0OjQ2LCBaaGloYW8gQ2hlbmcgd3JvdGU6Cj4gRnJvbTogWmhp
aGFvIENoZW5nIDxjaGVuZ3poaWhhbzFAaHVhd2VpLmNvbT4KPiAKPiBUaGUgaW5vZGUgcmVjbGFp
bWluZyBwcm9jZXNzKFNlZSBmdW5jdGlvbiBwcnVuZV9pY2FjaGVfc2IpIGNvbGxlY3RzIGFsbAo+
IHJlY2xhaW1hYmxlIGlub2RlcyBhbmQgbWFyayB0aGVtIHdpdGggSV9GUkVFSU5HIGZsYWcgYXQg
Zmlyc3QsIGF0IHRoYXQKPiB0aW1lLCBvdGhlciBwcm9jZXNzZXMgd2lsbCBiZSBzdHVjayBpZiB0
aGV5IHRyeSBnZXR0aW5nIHRoZXNlIGlub2Rlcwo+IChTZWUgZnVuY3Rpb24gZmluZF9pbm9kZV9m
YXN0KSwgdGhlbiB0aGUgcmVjbGFpbWluZyBwcm9jZXNzIGRlc3Ryb3kgdGhlCj4gaW5vZGVzIGJ5
IGZ1bmN0aW9uIGRpc3Bvc2VfbGlzdCgpLiBTb21lIGZpbGVzeXN0ZW1zKGVnLiBleHQ0IHdpdGgK
PiBlYV9pbm9kZSBmZWF0dXJlLCB1YmlmcyB3aXRoIHhhdHRyKSBtYXkgZG8gaW5vZGUgbG9va3Vw
IGluIHRoZSBpbm9kZQo+IGV2aWN0aW5nIGNhbGxiYWNrIGZ1bmN0aW9uLCBpZiB0aGUgaW5vZGUg
bG9va3VwIGlzIG9wZXJhdGVkIHVuZGVyIHRoZQo+IGlub2RlIGxydSB0cmF2ZXJzaW5nIGNvbnRl
eHQsIGRlYWRsb2NrIHByb2JsZW1zIG1heSBoYXBwZW4uCj4gCj4gQ2FzZSAxOiBJbiBmdW5jdGlv
biBleHQ0X2V2aWN0X2lub2RlKCksIHRoZSBlYSBpbm9kZSBsb29rdXAgY291bGQgaGFwcGVuCj4g
ICAgICAgICBpZiBlYV9pbm9kZSBmZWF0dXJlIGlzIGVuYWJsZWQsIHRoZSBsb29rdXAgcHJvY2Vz
cyB3aWxsIGJlIHN0dWNrCj4gCXVuZGVyIHRoZSBldmljdGluZyBjb250ZXh0IGxpa2UgdGhpczoK
PiAKPiAgMS4gRmlsZSBBIGhhcyBpbm9kZSBpX3JlZyBhbmQgYW4gZWEgaW5vZGUgaV9lYQo+ICAy
LiBnZXRmYXR0cihBLCB4YXR0cl9idWYpIC8vIGlfZWEgaXMgYWRkZWQgaW50byBscnUgLy8gbHJ1
LT5pX2VhCj4gIDMuIFRoZW4sIGZvbGxvd2luZyB0aHJlZSBwcm9jZXNzZXMgcnVubmluZyBsaWtl
IHRoaXM6Cj4gCj4gICAgIFBBICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgUEIKPiAgZWNo
byAyID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4gICBzaHJpbmtfc2xhYgo+ICAgIHBydW5l
X2RjYWNoZV9zYgo+ICAgIC8vIGlfcmVnIGlzIGFkZGVkIGludG8gbHJ1LCBscnUtPmlfZWEtPmlf
cmVnCj4gICAgcHJ1bmVfaWNhY2hlX3NiCj4gICAgIGxpc3RfbHJ1X3dhbGtfb25lCj4gICAgICBp
bm9kZV9scnVfaXNvbGF0ZQo+ICAgICAgIGlfZWEtPmlfc3RhdGUgfD0gSV9GUkVFSU5HIC8vIHNl
dCBpbm9kZSBzdGF0ZQo+ICAgICAgaW5vZGVfbHJ1X2lzb2xhdGUKPiAgICAgICBfX2lnZXQoaV9y
ZWcpCj4gICAgICAgc3Bpbl91bmxvY2soJmlfcmVnLT5pX2xvY2spCj4gICAgICAgc3Bpbl91bmxv
Y2sobHJ1X2xvY2spCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJtIGZp
bGUgQQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaV9yZWctPm5saW5r
ID0gMAo+ICAgICAgIGlwdXQoaV9yZWcpIC8vIGlfcmVnLT5ubGluayBpcyAwLCBkbyBldmljdAo+
ICAgICAgICBleHQ0X2V2aWN0X2lub2RlCj4gICAgICAgICBleHQ0X3hhdHRyX2RlbGV0ZV9pbm9k
ZQo+ICAgICAgICAgIGV4dDRfeGF0dHJfaW5vZGVfZGVjX3JlZl9hbGwKPiAgICAgICAgICAgZXh0
NF94YXR0cl9pbm9kZV9pZ2V0Cj4gICAgICAgICAgICBleHQ0X2lnZXQoaV9lYS0+aV9pbm8pCj4g
ICAgICAgICAgICAgaWdldF9sb2NrZWQKPiAgICAgICAgICAgICAgZmluZF9pbm9kZV9mYXN0Cj4g
ICAgICAgICAgICAgICBfX3dhaXRfb25fZnJlZWluZ19pbm9kZShpX2VhKSAtLS0t4oaSIEFBIGRl
YWRsb2NrCj4gICAgIGRpc3Bvc2VfbGlzdCAvLyBjYW5ub3QgYmUgZXhlY3V0ZWQgYnkgcHJ1bmVf
aWNhY2hlX3NiCj4gICAgICB3YWtlX3VwX2JpdCgmaV9lYS0+aV9zdGF0ZSkKPiAKPiBDYXNlIDI6
IEluIGRlbGV0ZWQgaW5vZGUgd3JpdGluZyBmdW5jdGlvbiB1Ymlmc19qbmxfd3JpdGVfaW5vZGUo
KSwgZmlsZQo+ICAgICAgICAgZGVsZXRpbmcgcHJvY2VzcyBob2xkcyBCQVNFSEQncyB3YnVmLT5p
b19tdXRleCB3aGlsZSBnZXR0aW5nIHRoZQo+IAl4YXR0ciBpbm9kZSwgd2hpY2ggY291bGQgcmFj
ZSB3aXRoIGlub2RlIHJlY2xhaW1pbmcgcHJvY2VzcyhUaGUKPiAgICAgICAgIHJlY2xhaW1pbmcg
cHJvY2VzcyBjb3VsZCB0cnkgbG9ja2luZyBCQVNFSEQncyB3YnVmLT5pb19tdXRleCBpbgo+IAlp
bm9kZSBldmljdGluZyBmdW5jdGlvbiksIHRoZW4gYW4gQUJCQSBkZWFkbG9jayBwcm9ibGVtIHdv
dWxkCj4gCWhhcHBlbiBhcyBmb2xsb3dpbmc6Cj4gCj4gIDEuIEZpbGUgQSBoYXMgaW5vZGUgaWEg
YW5kIGEgeGF0dHIod2l0aCBpbm9kZSBpeGEpLCByZWd1bGFyIGZpbGUgQiBoYXMKPiAgICAgaW5v
ZGUgaWIgYW5kIGEgeGF0dHIuCj4gIDIuIGdldGZhdHRyKEEsIHhhdHRyX2J1ZikgLy8gaXhhIGlz
IGFkZGVkIGludG8gbHJ1IC8vIGxydS0+aXhhCj4gIDMuIFRoZW4sIGZvbGxvd2luZyB0aHJlZSBw
cm9jZXNzZXMgcnVubmluZyBsaWtlIHRoaXM6Cj4gCj4gICAgICAgICBQQSAgICAgICAgICAgICAg
ICBQQiAgICAgICAgICAgICAgICAgICAgICAgIFBDCj4gICAgICAgICAgICAgICAgIGVjaG8gMiA+
IC9wcm9jL3N5cy92bS9kcm9wX2NhY2hlcwo+ICAgICAgICAgICAgICAgICAgc2hyaW5rX3NsYWIK
PiAgICAgICAgICAgICAgICAgICBwcnVuZV9kY2FjaGVfc2IKPiAgICAgICAgICAgICAgICAgICAv
LyBpYiBhbmQgaWEgYXJlIGFkZGVkIGludG8gbHJ1LCBscnUtPml4YS0+aWItPmlhCj4gICAgICAg
ICAgICAgICAgICAgcHJ1bmVfaWNhY2hlX3NiCj4gICAgICAgICAgICAgICAgICAgIGxpc3RfbHJ1
X3dhbGtfb25lCj4gICAgICAgICAgICAgICAgICAgICBpbm9kZV9scnVfaXNvbGF0ZQo+ICAgICAg
ICAgICAgICAgICAgICAgIGl4YS0+aV9zdGF0ZSB8PSBJX0ZSRUVJTkcgLy8gc2V0IGlub2RlIHN0
YXRlCj4gICAgICAgICAgICAgICAgICAgICBpbm9kZV9scnVfaXNvbGF0ZQo+ICAgICAgICAgICAg
ICAgICAgICAgIF9faWdldChpYikKPiAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jaygm
aWItPmlfbG9jaykKPiAgICAgICAgICAgICAgICAgICAgICBzcGluX3VubG9jayhscnVfbG9jaykK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBybSBm
aWxlIEIKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaWItPm5saW5rID0gMAo+ICBybSBmaWxlIEEKPiAgIGlwdXQoaWEpCj4gICAgdWJpZnNfZXZp
Y3RfaW5vZGUoaWEpCj4gICAgIHViaWZzX2pubF9kZWxldGVfaW5vZGUoaWEpCj4gICAgICB1Ymlm
c19qbmxfd3JpdGVfaW5vZGUoaWEpCj4gICAgICAgbWFrZV9yZXNlcnZhdGlvbihCQVNFSEQpIC8v
IExvY2sgd2J1Zi0+aW9fbXV0ZXgKPiAgICAgICB1Ymlmc19pZ2V0KGl4YS0+aV9pbm8pCj4gICAg
ICAgIGlnZXRfbG9ja2VkCj4gICAgICAgICBmaW5kX2lub2RlX2Zhc3QKPiAgICAgICAgICBfX3dh
aXRfb25fZnJlZWluZ19pbm9kZShpeGEpCj4gICAgICAgICAgIHwgICAgICAgICAgaXB1dChpYikg
Ly8gaWItPm5saW5rIGlzIDAsIGRvIGV2aWN0Cj4gICAgICAgICAgIHwgICAgICAgICAgIHViaWZz
X2V2aWN0X2lub2RlCj4gICAgICAgICAgIHwgICAgICAgICAgICB1Ymlmc19qbmxfZGVsZXRlX2lu
b2RlKGliKQo+ICAgICAgICAgICDihpMgICAgICAgICAgICAgdWJpZnNfam5sX3dyaXRlX2lub2Rl
Cj4gICAgICBBQkJBIGRlYWRsb2NrIOKGkC0tLS0tbWFrZV9yZXNlcnZhdGlvbihCQVNFSEQpCj4g
ICAgICAgICAgICAgICAgICAgIGRpc3Bvc2VfbGlzdCAvLyBjYW5ub3QgYmUgZXhlY3V0ZWQgYnkg
cHJ1bmVfaWNhY2hlX3NiCj4gICAgICAgICAgICAgICAgICAgICB3YWtlX3VwX2JpdCgmaXhhLT5p
X3N0YXRlKQo+IAo+IEZpeCBpdCBieSBmb3JiaWRkaW5nIGlub2RlIGV2aWN0aW5nIHVuZGVyIHRo
ZSBpbm9kZSBscnUgdHJhdmVyc2luZwo+IGNvbnRleHQuIEluIGRldGFpbHMsIHdlIGltcG9ydCBh
IG5ldyBpbm9kZSBzdGF0ZSBmbGFnICdJX0xSVV9JU09MQVRJTkcnCj4gdG8gcGluIGlub2RlIHdp
dGhvdXQgaG9sZGluZyBpX2NvdW50IHVuZGVyIHRoZSBpbm9kZSBscnUgdHJhdmVyc2luZwo+IGNv
bnRleHQsIHRoZSBpbm9kZSBldmljdGluZyBwcm9jZXNzIHdpbGwgd2FpdCB1bnRpbCB0aGlzIGZs
YWcgaXMKPiBjbGVhcmVkIGZyb20gaV9zdGF0ZS4KClRoYW5rcyBmb3IgdGhlIHBhdGNoIGFuZCBz
b3JyeSBmb3Igbm90IGdldHRpbmcgdG8gdGhpcyBteXNlbGYhICBMZXQgbWUKcmVwaHJhc2UgdGhl
IGFib3ZlIHBhcmFncmFwaCBhIGJpdCBmb3IgYmV0dGVyIHJlYWRhYmlsaXR5OgoKRml4IHRoZSBw
b3NzaWJsZSBkZWFkbG9jayBieSB1c2luZyBuZXcgaW5vZGUgc3RhdGUgZmxhZyBJX0xSVV9JU09M
QVRJTkcgdG8KcGluIHRoZSBpbm9kZSBpbiBtZW1vcnkgd2hpbGUgaW5vZGVfbHJ1X2lzb2xhdGUo
KSByZWNsYWltcyBpdHMgcGFnZXMKaW5zdGVhZCBvZiB1c2luZyBvcmRpbmFyeSBpbm9kZSByZWZl
cmVuY2UuIFRoaXMgd2F5IGlub2RlIGRlbGV0aW9uIGNhbm5vdApiZSB0cmlnZ2VyZWQgZnJvbSBp
bm9kZV9scnVfaXNvbGF0ZSgpIHRodXMgYXZvaWRpbmcgdGhlIGRlYWRsb2NrLiBldmljdCgpCmlz
IG1hZGUgdG8gd2FpdCBmb3IgSV9MUlVfSVNPTEFUSU5HIHRvIGJlIGNsZWFyZWQgYmVmb3JlIHBy
b2NlZWRpbmcgd2l0aAppbm9kZSBjbGVhbnVwLgoKPiBAQCAtNDg4LDYgKzQ4OCwzNiBAQCBzdGF0
aWMgdm9pZCBpbm9kZV9scnVfbGlzdF9kZWwoc3RydWN0IGlub2RlICppbm9kZSkKPiAgCQl0aGlz
X2NwdV9kZWMobnJfdW51c2VkKTsKPiAgfQo+ICAKPiArc3RhdGljIHZvaWQgaW5vZGVfbHJ1X2lz
b2xhdGluZyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQoKUGVyaGFwcyBjYWxsIHRoaXMgaW5vZGVfcGlu
X2xydV9pc29sYXRpbmcoKQoKPiArewo+ICsJQlVHX09OKGlub2RlLT5pX3N0YXRlICYgKElfTFJV
X0lTT0xBVElORyB8IElfRlJFRUlORyB8IElfV0lMTF9GUkVFKSk7Cj4gKwlpbm9kZS0+aV9zdGF0
ZSB8PSBJX0xSVV9JU09MQVRJTkc7Cj4gK30KPiArCj4gK3N0YXRpYyB2b2lkIGlub2RlX2xydV9m
aW5pc2hfaXNvbGF0aW5nKHN0cnVjdCBpbm9kZSAqaW5vZGUpCgpBbmQgY2FsbCB0aGlzIGlub2Rl
X3VucGluX2xydV9pc29sYXRpbmcoKT8KCk90aGVyd2lzZSB0aGUgcGF0Y2ggbG9va3MgZ29vZCBz
byBmZWVsIGZyZWUgdG8gYWRkOgoKUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+
CgoJCQkJCQkJCUhvbnphCi0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBD
UgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
