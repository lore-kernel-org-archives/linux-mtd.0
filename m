Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367AEC001DE
	for <linux-mtd@archiver.kernel.org>; Mon, 31 Jul 2023 10:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XjEJgGzCt9MFBV0KOrQ5c/kX5JYmP2e7N2NMK32mJKE=; b=I1O2C8do7ToLwb
	VULppgv91LD4xY3GOKLUvHo6MWA/ZQTgp+tqqkOPHopTyh68zWIKog7gkz5TG+0w6Vcn8HxI7oUcq
	7uhLyPn3hjQHLo4602mfVqaU0mFqHbdrCZXjSoNvL+5SeHZSiE1G89xqzzrNr+BHKHXIbp5GTQ4h+
	DawtFT/OqFlYUCxHZF5v4X+TsKiiFDLQnYx1Wk+oQzdIhxtfTXJy5o8tsthuBEB9t8DWxYIpzIklJ
	3TRv07olGn92ZEkkRVBUwsTK6KqPmQfYPjtH76G5eK16wLZGAUah3jZHdWupwb4asF+aooHt7ar6e
	8YoBggXv/3W/pg/2w14w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQU6-00F9u0-1B;
	Mon, 31 Jul 2023 10:50:42 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQQU3-00F9sB-1u;
	Mon, 31 Jul 2023 10:50:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id ED50E22197;
	Mon, 31 Jul 2023 10:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1690800635; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJDu3H9G0xjlLFp1Wxvq9yQHkB2Q9jBIbPsGkP5jLhY=;
	b=LfsIvVgX25rf01P6sVcmZRL3nPMT3sPJRPMrpOspwMqpMg9mmQx6AkDi/eF6WU32a2Vp6x
	/7YLD1OJK0u+bqfGa4P87gaOpA6/QZlHA1eZkenSQs1V9CjuRPICqxTQ9KdHYFZ84hOqsV
	4L46K3Rf4+bEtg2brIa/aboXrQrqviE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1690800635;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJDu3H9G0xjlLFp1Wxvq9yQHkB2Q9jBIbPsGkP5jLhY=;
	b=X5g/KyOpcE2CiMGegP9N6Ypxz5sWUyAuayNnMILk5q3XabEg0BuGZ7c8jHqKycooaqKD7s
	Ajq9KEorZZBfWcDQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D6932133F7;
	Mon, 31 Jul 2023 10:50:34 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id ovhUNPqRx2R2ZgAAMHmgww
	(envelope-from <jack@suse.cz>); Mon, 31 Jul 2023 10:50:34 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 457F5A0767; Mon, 31 Jul 2023 12:50:34 +0200 (CEST)
Date: Mon, 31 Jul 2023 12:50:34 +0200
From: Jan Kara <jack@suse.cz>
To: Haris Iqbal <haris.iqbal@ionos.com>
Cc: Christoph Hellwig <hch@infradead.org>, Jan Kara <jack@suse.cz>,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>, Alasdair Kergon <agk@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anna Schumaker <anna@kernel.org>, Chao Yu <chao@kernel.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Dave Kleikamp <shaggy@kernel.org>, David Sterba <dsterba@suse.com>,
	dm-devel@redhat.com, drbd-dev@lists.linbit.com,
	Gao Xiang <xiang@kernel.org>, Jack Wang <jinpu.wang@ionos.com>,
	Jaegeuk Kim <jaegeuk@kernel.org>,
	jfs-discussion@lists.sourceforge.net,
	Joern Engel <joern@lazybastard.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	linux-bcache@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-erofs@lists.ozlabs.org, linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
	linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-nvme@lists.infradead.org,
	linux-pm@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
	linux-xfs@vger.kernel.org, Mike Snitzer <snitzer@kernel.org>,
	Minchan Kim <minchan@kernel.org>, ocfs2-devel@oss.oracle.com,
	reiserfs-devel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Song Liu <song@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
	target-devel@vger.kernel.org, Ted Tso <tytso@mit.edu>,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 01/32] block: Provide blkdev_get_handle_* functions
Message-ID: <20230731105034.43skhi5ubze563c3@quack3>
References: <20230629165206.383-1-jack@suse.cz>
 <20230704122224.16257-1-jack@suse.cz>
 <ZKbgAG5OoHVyUKOG@infradead.org>
 <CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJpMwyiUcw+mH0sZa8f8UJsaSZ7NSE65s2gZDEia+pASyP_gJQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_035039_774002_1593871A 
X-CRM114-Status: GOOD (  21.49  )
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

T24gV2VkIDEyLTA3LTIzIDE4OjA2OjM1LCBIYXJpcyBJcWJhbCB3cm90ZToKPiBPbiBUaHUsIEp1
bCA2LCAyMDIzIGF0IDU6MzjigK9QTSBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGluZnJhZGVhZC5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSnVsIDA0LCAyMDIzIGF0IDAyOjIxOjI4UE0gKzAy
MDAsIEphbiBLYXJhIHdyb3RlOgo+ID4gPiBDcmVhdGUgc3RydWN0IGJkZXZfaGFuZGxlIHRoYXQg
Y29udGFpbnMgYWxsIHBhcmFtZXRlcnMgdGhhdCBuZWVkIHRvIGJlCj4gPiA+IHBhc3NlZCB0byBi
bGtkZXZfcHV0KCkgYW5kIHByb3ZpZGUgYmxrZGV2X2dldF9oYW5kbGVfKiBmdW5jdGlvbnMgdGhh
dAo+ID4gPiByZXR1cm4gdGhpcyBzdHJ1Y3R1cmUgaW5zdGVhZCBvZiBwbGFpbiBiZGV2IHBvaW50
ZXIuIFRoaXMgd2lsbAo+ID4gPiBldmVudHVhbGx5IGFsbG93IHVzIHRvIHBhc3Mgb25lIG1vcmUg
YXJndW1lbnQgdG8gYmxrZGV2X3B1dCgpIHdpdGhvdXQKPiA+ID4gdG9vIG11Y2ggaGFzc2xlLgo+
ID4KPiA+IENhbiB3ZSB1c2UgdGhlIG9wcG9ydHVuaXR5IHRvIGNvbWUgdXAgd2l0aCBiZXR0ZXIg
bmFtZXM/ICBibGtkZXZfZ2V0XyoKPiA+IHdhcyBhbHdheXMgYSByYXRoZXIgaG9ycmlibGUgbmFt
aW5nIGNvbnZlbnRpb24gZm9yIHNvbWV0aGluZyB0aGF0Cj4gPiBlbmRzIHVwIGNhbGxpbmcgaW50
byAtPm9wZW4uCj4gPgo+ID4gV2hhdCBhYm91dDoKPiA+Cj4gPiBzdHJ1Y3QgYmRldl9oYW5kbGUg
KmJkZXZfb3Blbl9ieV9kZXYoZGV2X3QgZGV2LCBibGtfbW9kZV90IG1vZGUsIHZvaWQgKmhvbGRl
ciwKPiA+ICAgICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgYmxrX2hvbGRlcl9vcHMgKmhvcHMp
Owo+ID4gc3RydWN0IGJkZXZfaGFuZGxlICpiZGV2X29wZW5fYnlfcGF0aChkZXZfdCBkZXYsIGJs
a19tb2RlX3QgbW9kZSwKPiA+ICAgICAgICAgICAgICAgICB2b2lkICpob2xkZXIsIGNvbnN0IHN0
cnVjdCBibGtfaG9sZGVyX29wcyAqaG9wcyk7Cj4gPiB2b2lkIGJkZXZfcmVsZWFzZShzdHJ1Y3Qg
YmRldl9oYW5kbGUgKmhhbmRsZSk7Cj4gCj4gKzEgdG8gdGhpcy4KPiBBbHNvLCBpZiB3ZSBhcmUg
cmVtb3ZpbmcgImhhbmRsZSIgZnJvbSB0aGUgZnVuY3Rpb24sIHNob3VsZCB0aGUgbmFtZQo+IG9m
IHRoZSBzdHJ1Y3R1cmUgaXQgcmV0dXJucyBhbHNvIGNoYW5nZT8gV291bGQgc29tZXRoaW5nIGxp
a2UgYmRldl9jdHgKPiBiZSBiZXR0ZXI/CgpJIHRoaW5rIHRoZSBiZGV2X2hhbmRsZSBuYW1lIGlz
IGZpbmUgZm9yIHRoZSBzdHJ1Y3QuIEFmdGVyIGFsbCBpdCBpcwplcXVpdmFsZW50IG9mIGFuIG9w
ZW4gaGFuZGxlIGZvciB0aGUgYmxvY2sgZGV2aWNlIHNvIElNSE8gYmRldl9oYW5kbGUKY2FwdHVy
ZXMgdGhhdCBiZXR0ZXIgdGhhbiBiZGV2X2N0eC4KCgkJCQkJCQkJSG9uemEKLS0gCkphbiBLYXJh
IDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
