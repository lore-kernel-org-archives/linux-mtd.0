Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AB2BC43334
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Jun 2022 00:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RfwwcQ6vmdP81yb1MskoR6ofNx+R2Cexbp57BR3QGAQ=; b=YG2uFUNR4iRxOC
	d4+IB/yLA/yVgfJYhWpCyywBGLihKBjkdaaxzob3HPr9GFRphG+We7Q1EqyPcs/RBnAj45pGt39Ko
	HqxI0fi2BUmxJtFfxwK34hbRVbqmjo2gE4Z91oMgJlPsuTuBsaWMASIQM6TMrTuHfOFmo4iQs7QjI
	AbTAUI7eh3c0tkLaNdZ0CgvZQwB4wwOLkrnw1Lwow381Boxk3nGvRkvPowacbM4sq3jUiETvbG+Wz
	K47ZpW+iIs9y4a7DkBFCLihCIjig5IiaL0xFNd3bWRJr5DVLeinVAjPNJAHERabisvWkIQaGsMA+2
	MrfFoKRRNqMmAY4aob1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5zYx-003Sbh-B5; Tue, 28 Jun 2022 00:58:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5zYl-003SWN-8F; Tue, 28 Jun 2022 00:58:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B6EC2616BE;
	Tue, 28 Jun 2022 00:58:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBEABC341C8;
	Tue, 28 Jun 2022 00:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656377910;
	bh=x4KMhmowxPAczUMJ6x4nBeCjlIDio89Zlndd34Eza5Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rmtqPrxs/EakAnLyUZ+T1Y6Y2PuUVWE1p/lPmqQBXiapPC1WBd92tcHfgEnTJibSz
	 8Cqh6wp+mGRPQenFwVH/ncudi5b7Tg0x4DYK6LYwUDkNgU3v8Yk/6Or0HzPxa5QXgF
	 OYkHqjzJwOTAIzA6m0DkNzWrhG6StDZ8wiRdHVw+Wnp/Deq+bcAy4GlTPygKnkBgqV
	 sUW1DRx9UPn831OT0MRefhs1kf7ZlvXFnW9s3XTKUzsS60aUSNGKPAXfxyQi7QqZvQ
	 a8VxNxF80uRWuCVjsLU3WaCLAUnTapHIuQJvInOf0IrcXvC7dKlHhnQt1FhIxUdbDj
	 Qy7qblTn3AnuA==
Date: Tue, 28 Jun 2022 02:58:25 +0200
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Daniel Borkmann <daniel@iogearbox.net>,
	Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
	x86@kernel.org, dm-devel@redhat.com,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-s390@vger.kernel.org, kvm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-btrfs@vger.kernel.org, linux-can@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux1394-devel@lists.sourceforge.net, io-uring@vger.kernel.org,
	lvs-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	kasan-dev@googlegroups.com, linux-mmc@vger.kernel.org,
	nvdimm@lists.linux.dev, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, linux-perf-users@vger.kernel.org,
	linux-raid@vger.kernel.org, linux-sctp@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org, linux-usb@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	v9fs-developer@lists.sourceforge.net, linux-rdma@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH][next] treewide: uapi: Replace zero-length arrays with
 flexible-array members
Message-ID: <20220628005825.GA161566@embeddedor>
References: <20220627180432.GA136081@embeddedor>
 <6bc1e94c-ce1d-a074-7d0c-8dbe6ce22637@iogearbox.net>
 <20220628004052.GM23621@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220628004052.GM23621@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_175831_413911_157ACB3A 
X-CRM114-Status: GOOD (  29.42  )
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

T24gTW9uLCBKdW4gMjcsIDIwMjIgYXQgMDk6NDA6NTJQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDI3LCAyMDIyIGF0IDA4OjI3OjM3UE0gKzAyMDAsIERhbmll
bCBCb3JrbWFubiB3cm90ZToKPiA+IE9uIDYvMjcvMjIgODowNCBQTSwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiA+ID4gVGhlcmUgaXMgYSByZWd1bGFyIG5lZWQgaW4gdGhlIGtlcm5lbCB0
byBwcm92aWRlIGEgd2F5IHRvIGRlY2xhcmUKPiA+ID4gaGF2aW5nIGEgZHluYW1pY2FsbHkgc2l6
ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3RydWN0dXJlLgo+ID4gPiBLZXJuZWwg
Y29kZSBzaG91bGQgYWx3YXlzIHVzZSDigJxmbGV4aWJsZSBhcnJheSBtZW1iZXJz4oCdWzFdIGZv
ciB0aGVzZQo+ID4gPiBjYXNlcy4gVGhlIG9sZGVyIHN0eWxlIG9mIG9uZS1lbGVtZW50IG9yIHpl
cm8tbGVuZ3RoIGFycmF5cyBzaG91bGQKPiA+ID4gbm8gbG9uZ2VyIGJlIHVzZWRbMl0uCj4gPiA+
IAo+ID4gPiBUaGlzIGNvZGUgd2FzIHRyYW5zZm9ybWVkIHdpdGggdGhlIGhlbHAgb2YgQ29jY2lu
ZWxsZToKPiA+ID4gKGxpbnV4LTUuMTktcmMyJCBzcGF0Y2ggLS1qb2JzICQoZ2V0Y29uZiBfTlBS
T0NFU1NPUlNfT05MTikgLS1zcC1maWxlIHNjcmlwdC5jb2NjaSAtLWluY2x1ZGUtaGVhZGVycyAt
LWRpciAuID4gb3V0cHV0LnBhdGNoKQo+ID4gPiAKPiA+ID4gQEAKPiA+ID4gaWRlbnRpZmllciBT
LCBtZW1iZXIsIGFycmF5Owo+ID4gPiB0eXBlIFQxLCBUMjsKPiA+ID4gQEAKPiA+ID4gCj4gPiA+
IHN0cnVjdCBTIHsKPiA+ID4gICAgLi4uCj4gPiA+ICAgIFQxIG1lbWJlcjsKPiA+ID4gICAgVDIg
YXJyYXlbCj4gPiA+IC0gMAo+ID4gPiAgICBdOwo+ID4gPiB9Owo+ID4gPiAKPiA+ID4gLWZzdHJp
Y3QtZmxleC1hcnJheXM9MyBpcyBjb21pbmcgYW5kIHdlIG5lZWQgdG8gbGFuZCB0aGVzZSBjaGFu
Z2VzCj4gPiA+IHRvIHByZXZlbnQgaXNzdWVzIGxpa2UgdGhlc2UgaW4gdGhlIHNob3J0IGZ1dHVy
ZToKPiA+ID4gCj4gPiA+IC4uL2ZzL21pbml4L2Rpci5jOjMzNzozOiB3YXJuaW5nOiAnc3RyY3B5
JyB3aWxsIGFsd2F5cyBvdmVyZmxvdzsgZGVzdGluYXRpb24gYnVmZmVyIGhhcyBzaXplIDAsCj4g
PiA+IGJ1dCB0aGUgc291cmNlIHN0cmluZyBoYXMgbGVuZ3RoIDIgKGluY2x1ZGluZyBOVUwgYnl0
ZSkgWy1XZm9ydGlmeS1zb3VyY2VdCj4gPiA+IAkJc3RyY3B5KGRlMy0+bmFtZSwgIi4iKTsKPiA+
ID4gCQleCj4gPiA+IAo+ID4gPiBTaW5jZSB0aGVzZSBhcmUgYWxsIFswXSB0byBbXSBjaGFuZ2Vz
LCB0aGUgcmlzayB0byBVQVBJIGlzIG5lYXJseSB6ZXJvLiBJZgo+ID4gPiB0aGlzIGJyZWFrcyBh
bnl0aGluZywgd2UgY2FuIHVzZSBhIHVuaW9uIHdpdGggYSBuZXcgbWVtYmVyIG5hbWUuCj4gPiA+
IAo+ID4gPiBbMV0gaHR0cHM6Ly9lbi53aWtpcGVkaWEub3JnL3dpa2kvRmxleGlibGVfYXJyYXlf
bWVtYmVyCj4gPiA+IFsyXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjE2L3By
b2Nlc3MvZGVwcmVjYXRlZC5odG1sI3plcm8tbGVuZ3RoLWFuZC1vbmUtZWxlbWVudC1hcnJheXMK
PiA+ID4gCj4gPiA+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy83
OAo+ID4gPiBCdWlsZC10ZXN0ZWQtYnk6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvNjJi
Njc1ZWMud0tYNkFPWjZjYkU3MXZ0RiUyNWxrcEBpbnRlbC5jb20vCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IEd1c3Rhdm8gQS4gUi4gU2lsdmEgPGd1c3Rhdm9hcnNAa2VybmVsLm9yZz4KPiA+ID4gLS0t
Cj4gPiA+IEhpIGFsbCEKPiA+ID4gCj4gPiA+IEpGWUk6IEknbSBhZGRpbmcgdGhpcyB0byBteSAt
bmV4dCB0cmVlLiA6KQo+ID4gCj4gPiBGeWksIHRoaXMgYnJlYWtzIEJQRiBDSToKPiA+IAo+ID4g
aHR0cHM6Ly9naXRodWIuY29tL2tlcm5lbC1wYXRjaGVzL2JwZi9ydW5zLzcwNzg3MTkzNzI/Y2hl
Y2tfc3VpdGVfZm9jdXM9dHJ1ZQo+ID4gCj4gPiAgIFsuLi5dCj4gPiAgIHByb2dzL21hcF9wdHJf
a2Vybi5jOjMxNDoyNjogZXJyb3I6IGZpZWxkICd0cmllX2tleScgd2l0aCB2YXJpYWJsZSBzaXpl
ZCB0eXBlICdzdHJ1Y3QgYnBmX2xwbV90cmllX2tleScgbm90IGF0IHRoZSBlbmQgb2YgYSBzdHJ1
Y3Qgb3IgY2xhc3MgaXMgYSBHTlUgZXh0ZW5zaW9uIFstV2Vycm9yLC1XZ251LXZhcmlhYmxlLXNp
emVkLXR5cGUtbm90LWF0LWVuZF0KPiA+ICAgICAgICAgICBzdHJ1Y3QgYnBmX2xwbV90cmllX2tl
eSB0cmllX2tleTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeCj4gCj4g
VGhpcyB3aWxsIGJyZWFrIHRoZSByZG1hLWNvcmUgdXNlcnNwYWNlIGFzIHdlbGwsIHdpdGggYSBz
aW1pbGFyCj4gZXJyb3I6Cj4gCj4gL3Vzci9iaW4vY2xhbmctMTMgLURWRVJCU19ERUJVRyAtRGli
dmVyYnNfRVhQT1JUUyAtSWluY2x1ZGUgLUkvdXNyL2luY2x1ZGUvbGlibmwzIC1JL3Vzci9pbmNs
dWRlL2RybSAtZyAtTzIgLWZkZWJ1Zy1wcmVmaXgtbWFwPS9fX3cvMS9zPS4gLWZzdGFjay1wcm90
ZWN0b3Itc3Ryb25nIC1XZm9ybWF0IC1XZXJyb3I9Zm9ybWF0LXNlY3VyaXR5IC1XZGF0ZS10aW1l
IC1EX0ZPUlRJRllfU09VUkNFPTIgLVdtaXNzaW5nLXByb3RvdHlwZXMgLVdtaXNzaW5nLWRlY2xh
cmF0aW9ucyAtV3dyaXRlLXN0cmluZ3MgLVdmb3JtYXQ9MiAtV2Nhc3QtZnVuY3Rpb24tdHlwZSAt
V2Zvcm1hdC1ub25saXRlcmFsIC1XZGF0ZS10aW1lIC1XbmVzdGVkLWV4dGVybnMgLVdzaGFkb3cg
LVdzdHJpY3QtcHJvdG90eXBlcyAtV29sZC1zdHlsZS1kZWZpbml0aW9uIC1XZXJyb3IgLVdyZWR1
bmRhbnQtZGVjbHMgLWcgLWZQSUMgICAtc3RkPWdudTExIC1NRCAtTVQgbGliaWJ2ZXJicy9DTWFr
ZUZpbGVzL2lidmVyYnMuZGlyL2NtZF9mbG93LmMubyAtTUYgbGliaWJ2ZXJicy9DTWFrZUZpbGVz
L2lidmVyYnMuZGlyL2NtZF9mbG93LmMuby5kIC1vIGxpYmlidmVyYnMvQ01ha2VGaWxlcy9pYnZl
cmJzLmRpci9jbWRfZmxvdy5jLm8gICAtYyAuLi9saWJpYnZlcmJzL2NtZF9mbG93LmMKPiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gLi4vbGliaWJ2ZXJicy9jbWRfZmxvdy5jOjMzOgo+IEluIGZpbGUg
aW5jbHVkZWQgZnJvbSBpbmNsdWRlL2luZmluaWJhbmQvY21kX3dyaXRlLmg6MzY6Cj4gSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvaW5maW5pYmFuZC9jbWRfaW9jdGwuaDo0MToKPiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9pbmZpbmliYW5kL3ZlcmJzLmg6NDg6Cj4gSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvaW5maW5pYmFuZC92ZXJic19hcGkuaDo2NjoKPiBJbiBm
aWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9pbmZpbmliYW5kL2liX3VzZXJfaW9jdGxfdmVyYnMu
aDozODoKPiBpbmNsdWRlL3JkbWEvaWJfdXNlcl92ZXJicy5oOjQzNjozNDogZXJyb3I6IGZpZWxk
ICdiYXNlJyB3aXRoIHZhcmlhYmxlIHNpemVkIHR5cGUgJ3N0cnVjdCBpYl91dmVyYnNfY3JlYXRl
X2NxX3Jlc3AnIG5vdCBhdCB0aGUgZW5kIG9mIGEgc3RydWN0IG9yIGNsYXNzIGlzIGEgR05VIGV4
dGVuc2lvbiBbLVdlcnJvciwtV2dudS12YXJpYWJsZS1zaXplZC10eXBlLW5vdC1hdC1lbmRdCj4g
ICAgICAgICBzdHJ1Y3QgaWJfdXZlcmJzX2NyZWF0ZV9jcV9yZXNwIGJhc2U7Cj4gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4KPiBpbmNsdWRlL3JkbWEvaWJfdXNlcl92
ZXJicy5oOjY0NDozNDogZXJyb3I6IGZpZWxkICdiYXNlJyB3aXRoIHZhcmlhYmxlIHNpemVkIHR5
cGUgJ3N0cnVjdCBpYl91dmVyYnNfY3JlYXRlX3FwX3Jlc3AnIG5vdCBhdCB0aGUgZW5kIG9mIGEg
c3RydWN0IG9yIGNsYXNzIGlzIGEgR05VIGV4dGVuc2lvbiBbLVdlcnJvciwtV2dudS12YXJpYWJs
ZS1zaXplZC10eXBlLW5vdC1hdC1lbmRdCj4gICAgICAgICBzdHJ1Y3QgaWJfdXZlcmJzX2NyZWF0
ZV9xcF9yZXNwIGJhc2U7Cj4gCj4gV2hpY2ggaXMgd2h5IEkgZ2F2ZSB1cCB0cnlpbmcgdG8gY2hh
bmdlIHRoZXNlLi4KPiAKPiBUaG91Z2ggbWF5YmUgd2UgY291bGQganVzdCBzd2l0Y2ggb2ZmIC1X
Z251LXZhcmlhYmxlLXNpemVkLXR5cGUtbm90LWF0LWVuZCAgZHVyaW5nIGNvbmZpZ3VyYXRpb24g
PwoKTm8uIEkgdGhpbmsgbm93IHdlIGNhbiBlYXNpbHkgd29ya2Fyb3VuZCB0aGVzZSBzb3J0cyBv
ZiBwcm9ibGVtcyB3aXRoCnNvbWV0aGluZyBsaWtlIHRoaXM6CgoJc3RydWN0IGZsZXggewoJCWFu
eV90eXBlIGFueV9tZW1iZXI7CgkJdW5pb24gewoJCQl0eXBlIGFycmF5WzBdOwoJCQlfX0RFQ0xB
UkVfRkxFWF9BUlJBWSh0eXBlLCBhcnJheV9mbGV4KTsKCQl9OwoJfTsKCmFuZCB1c2UgYXJyYXlf
ZmxleCBpbiBrZXJuZWwtc3BhY2UuCgpUaGUgc2FtZSBmb3IgdGhlIG9uZS1lbG1lbnQgYXJyYXlz
IGluIFVBUEk6CgogICAgICAgIHN0cnVjdCBmbGV4IHsKICAgICAgICAgICAgICAgIGFueV90eXBl
IGFueV9tZW1iZXI7CiAgICAgICAgICAgICAgICB1bmlvbiB7CiAgICAgICAgICAgICAgICAgICAg
ICAgIHR5cGUgYXJyYXlbMV07CiAgICAgICAgICAgICAgICAgICAgICAgIF9fREVDTEFSRV9GTEVY
X0FSUkFZKHR5cGUsIGFycmF5X2ZsZXgpOwogICAgICAgICAgICAgICAgfTsKICAgICAgICB9OwoK
SSdsbCB1c2UgdGhlIGlkaW9tIGFib3ZlIHRvIHJlc29sdmUgYWxsIHRoZXNlIHdhcm5pbmdzIGlu
IGEgZm9sbG93LXVwCnBhdGNoLiA6KQoKVGhhbmtzCi0tCkd1c3Rhdm8KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vz
c2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1tdGQvCg==
