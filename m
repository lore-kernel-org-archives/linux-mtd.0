Return-Path: <SRS0=Fbdm=ZV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71A23C432C0
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Nov 2019 16:36:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 448AD21736
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Nov 2019 16:36:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RmnMxUCN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 448AD21736
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/A4n4Tg80vyNg0joXMt1By5piP/by67503tk5SopX68=; b=RmnMxUCNamni5H
	3PC5iWTwlY9r/gIJJl2509LXQz/rUB6ytwXmw74/ClqjuBhN08qPrrImHaL6rtKp41MA1rObVIXEY
	hO5Fb/qR7KsnFdtrtDbwmhoZngaLCIHVMFs1nWPFkmFGJwvvkyE0+xuFmBxcGlnXV/I07sAMc6b0M
	VwkNek+6y9Z5eN85pMnErkB3eak/h0/694xzUrtjUuZ4Bpu4myq4/cMkpnv8GW6pRIrQU/HgUMKcl
	yqhsveved0jG4lihlNmLiT1OhBZ4r0CavrUgluzCuMn62nYjGVuz9Xaay8Z+lrPtBRKp5Frz5BSJN
	WuBw4xj+mEJ4T7OvBaBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iajFS-0003j1-Uj; Fri, 29 Nov 2019 16:36:02 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iajFP-0003iZ-2J
 for linux-mtd@lists.infradead.org; Fri, 29 Nov 2019 16:36:01 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id A3CB6607BDB2;
 Fri, 29 Nov 2019 17:35:56 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id kOcQPONK-3hk; Fri, 29 Nov 2019 17:35:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D5E1B6083139;
 Fri, 29 Nov 2019 17:35:53 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Au7ORLC9cK4z; Fri, 29 Nov 2019 17:35:53 +0100 (CET)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
 by lithops.sigma-star.at (Postfix) with ESMTP id 8329F607BDB2;
 Fri, 29 Nov 2019 17:35:53 +0100 (CET)
Date: Fri, 29 Nov 2019 17:35:53 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: Andreas Gruenbacher <agruenba@redhat.com>
Message-ID: <51833696.101442.1575045353332.JavaMail.zimbra@nod.at>
In-Reply-To: <20191129142045.7215-1-agruenba@redhat.com>
References: <20191129142045.7215-1-agruenba@redhat.com>
Subject: Re: [PATCH v2] fs: Fix page_mkwrite off-by-one errors
MIME-Version: 1.0
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF68 (Linux)/8.8.12_GA_3809)
Thread-Topic: Fix page_mkwrite off-by-one errors
Thread-Index: OwUcLuBZ37Awg+4d3rXFBEMLhx0YIg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191129_083559_401036_6DC6A2A6 
X-CRM114-Status: UNSURE (   7.94  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Chris Mason <clm@fb.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, Sage Weil <sage@redhat.com>,
 Darrick <darrick.wong@oracle.com>, Christoph Hellwig <hch@infradead.org>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Chao Yu <chao@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 Al Viro <viro@zeniv.linux.org.uk>, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 tytso <tytso@mit.edu>, Artem Bityutskiy <dedekind1@gmail.com>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 torvalds <torvalds@linux-foundation.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

LS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+IFZvbjogIkFuZHJlYXMgR3J1ZW5iYWNo
ZXIiIDxhZ3J1ZW5iYUByZWRoYXQuY29tPgo+IEFuOiAiQ2hyaXN0b3BoIEhlbGx3aWciIDxoY2hA
aW5mcmFkZWFkLm9yZz4sICJEYXJyaWNrIiA8ZGFycmljay53b25nQG9yYWNsZS5jb20+Cj4gQ0M6
ICJBbmRyZWFzIEdydWVuYmFjaGVyIiA8YWdydWVuYmFAcmVkaGF0LmNvbT4sICJ0b3J2YWxkcyIg
PHRvcnZhbGRzQGxpbnV4LWZvdW5kYXRpb24ub3JnPiwgImxpbnV4LWtlcm5lbCIKPiA8bGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZz4sICJBbCBWaXJvIiA8dmlyb0B6ZW5pdi5saW51eC5vcmcu
dWs+LCAiSmVmZiBMYXl0b24iIDxqbGF5dG9uQGtlcm5lbC5vcmc+LCAiU2FnZSBXZWlsIgo+IDxz
YWdlQHJlZGhhdC5jb20+LCAiSWx5YSBEcnlvbW92IiA8aWRyeW9tb3ZAZ21haWwuY29tPiwgInR5
dHNvIiA8dHl0c29AbWl0LmVkdT4sICJBbmRyZWFzIERpbGdlciIKPiA8YWRpbGdlci5rZXJuZWxA
ZGlsZ2VyLmNhPiwgIkphZWdldWsgS2ltIiA8amFlZ2V1a0BrZXJuZWwub3JnPiwgIkNoYW8gWXUi
IDxjaGFvQGtlcm5lbC5vcmc+LCBsaW51eC14ZnNAdmdlci5rZXJuZWwub3JnLAo+ICJsaW51eC1m
c2RldmVsIiA8bGludXgtZnNkZXZlbEB2Z2VyLmtlcm5lbC5vcmc+LCAicmljaGFyZCIgPHJpY2hh
cmRAbm9kLmF0PiwgIkFydGVtIEJpdHl1dHNraXkiIDxkZWRla2luZDFAZ21haWwuY29tPiwKPiAi
QWRyaWFuIEh1bnRlciIgPGFkcmlhbi5odW50ZXJAaW50ZWwuY29tPiwgY2VwaC1kZXZlbEB2Z2Vy
Lmtlcm5lbC5vcmcsIGxpbnV4LWV4dDRAdmdlci5rZXJuZWwub3JnLAo+IGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0LCAibGludXgtbXRkIiA8bGludXgtbXRkQGxpc3RzLmlu
ZnJhZGVhZC5vcmc+LCAiQ2hyaXMgTWFzb24iIDxjbG1AZmIuY29tPiwgIkpvc2VmCj4gQmFjaWsi
IDxqb3NlZkB0b3hpY3BhbmRhLmNvbT4sICJEYXZpZCBTdGVyYmEiIDxkc3RlcmJhQHN1c2UuY29t
PiwgImxpbnV4LWJ0cmZzIiA8bGludXgtYnRyZnNAdmdlci5rZXJuZWwub3JnPgo+IEdlc2VuZGV0
OiBGcmVpdGFnLCAyOS4gTm92ZW1iZXIgMjAxOSAxNToyMDo0NQo+IEJldHJlZmY6IFtQQVRDSCB2
Ml0gZnM6IEZpeCBwYWdlX21rd3JpdGUgb2ZmLWJ5LW9uZSBlcnJvcnMKCj4gVGhlIGNoZWNrIGlu
IGJsb2NrX3BhZ2VfbWt3cml0ZSBtZWFudCB0byBkZXRlcm1pbmUgd2hldGhlciBhbiBvZmZzZXQg
aXMKPiB3aXRoaW4gdGhlIGlub2RlIHNpemUgaXMgb2ZmIGJ5IG9uZS4gIFRoaXMgYnVnIGhhcyBz
cHJlYWQgdG8KPiBpb21hcF9wYWdlX21rd3JpdGUgYW5kIHRvIHNldmVyYWwgZmlsZXN5c3RlbXMg
KHViaWZzLCBleHQ0LCBmMmZzLCBjZXBoKS4KPiBUbyBmaXggdGhhdCwgaW50cm9kdWNlIGEgbmV3
IHBhZ2VfbWt3cml0ZV9jaGVja190cnVuY2F0ZSBoZWxwZXIgdGhhdAo+IGNoZWNrcyBmb3IgdHJ1
bmNhdGUgYW5kIGNvbXB1dGVzIHRoZSBieXRlcyBpbiB0aGUgcGFnZSB1cCB0byBFT0YsIGFuZAo+
IHVzZSB0aGF0IGhlbHBlciBpbiB0aGUgYWJvdmUgbWVudGlvbmVkIGZpbGVzeXN0ZW1zIGFuZCBp
biBidHJmcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIEdydWVuYmFjaGVyIDxhZ3J1ZW5i
YUByZWRoYXQuY29tPgoKVGhhbmsgeW91IGZvciBmaXhpbmcgVUJJRlMhCgpBY2tlZC1ieTogUmlj
aGFyZCBXZWluYmVyZ2VyIDxyaWNoYXJkQG5vZC5hdD4KClRoYW5rcywKLy9yaWNoYXJkCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
