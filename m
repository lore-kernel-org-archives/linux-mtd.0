Return-Path: <SRS0=SnlB=FI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DAF0C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 08:30:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8050422581
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Dec 2020 08:30:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8050422581
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HjjQTxnYQbWdAvfMVKqhCnRCtq3ZnAAq8tNcLo3eaUU=; b=Cibz8Mu0FqfMJaY2DBv1fcL5Jo
	9KJ9uAW0JddEt6ZXGLaRDUAsUWMOTPvldRlkCtP7oJl7XbAqndYLWipHEVSmWrktxANJSmeJsMumc
	23JzibRq6UoJM61Qk76xmq54zQGvzq64HJdBC8rbdRDruSbmaNbS31dKY/JL3VY/ME3TqYrsRJIGR
	goYTQxXwrpY09uFkIt4hJxYAarlw8M/Egec0iKOf0Wf4bY1H+D2+RcxahvuuvTGBrMJCDnQLbX/xH
	p+UD0+ZXodbhp0Nttd/Rx0w/N2D3LoRQmZ9eO4qqLEsVoXS7G/f79Xs89LH0JB6SbWN6S3+iiGsPc
	7Vz/LzpA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6Sk-0006xW-4d; Fri, 04 Dec 2020 08:29:10 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6Se-0006wB-Vf; Fri, 04 Dec 2020 08:29:06 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 5BF242A65;
 Fri,  4 Dec 2020 09:29:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oTvfbgsimTxY; Fri,  4 Dec 2020 09:28:57 +0100 (CET)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id D05D9324B; Fri,  4 Dec 2020 09:28:57 +0100 (CET)
From: Alexander Dahl <ada@thorsis.com>
To: netdev@vger.kernel.org
Subject: Re: net: macb: fail when there's no PHY
Date: Fri, 04 Dec 2020 09:28:53 +0100
Message-ID: <3542036.FvJvBFsO4O@ada>
In-Reply-To: <rqbobm$5qk$1@ciao.gmane.io>
References: <20201202183531.GJ2324545@lunn.ch>
 <20201203214941.GA2409950@lunn.ch> <rqbobm$5qk$1@ciao.gmane.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_032905_259781_BB8EA759 
X-CRM114-Status: GOOD (  25.95  )
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
Cc: Grant Edwards <grant.b.edwards@gmail.com>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gR3JhbnQsCgpzb3JyeSBpZiBJIGp1c3QgaGlqYWNrIHlvdXIgY29udmVyc2F0aW9uLCBi
dXQgSSdtIGN1cmlvdXMsIGJlY2F1c2Ugd2UgYXJlIAp1c2luZyB0aGUgc2FtZSBTb0MuICBBZGRp
bmcgbGludXgtYXJtLWtlcm5lbCB0byBDYyBmb3IgdGhlIGdlbmVyYWwgcGVyZm9ybWFuY2UgCmlz
c3VlcyBhbmQgbGludXgtbXRkIGZvciB0aGUgRUNDIHF1ZXN0aW9ucy4gTzotKQoKQW0gRG9ubmVy
c3RhZywgMy4gRGV6ZW1iZXIgMjAyMCwgMjM6MjA6MzggQ0VUIHNjaHJpZWIgR3JhbnQgRWR3YXJk
czoKPiBPbiAyMDIwLTEyLTAzLCBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+IHdyb3RlOgo+
ID4+IEkgZG9uJ3QgdGhpbmsgdGhlcmUncyBhbnkgd2F5IEkgY291bGQganVzdGlmeSB1c2luZyBh
IGtlcm5lbCB0aGF0Cj4gPj4gZG9lc24ndCBoYXZlIGxvbmctdGVybSBzdXBwb3J0Lgo+ID4gCj4g
PiA1LjEwIGlzIExUUy4gV2VsbCwgaXQgd2lsbCBiZSwgb25jZSBpdCBpcyBhY3R1YWxseSByZWxl
YXNlZCEKPiAKPiBDb252aW5jaW5nIHBlb3BsZSB0byBzaGlwIGFuIHVucmVsZWFzZWQga2VybmVs
IHdvdWxkIGJlIGEgd2hvbGUKPiAnbm90aGVyIGJ1Y2tldCBvZiB3b3Jtcy4KCisxCgpKdWRnaW5n
IGp1c3QgZnJvbSB0aGUgcmVsZWFzZSBkYXRlcyBvZiB0aGUgbGFzdCBMVFMga2VybmVscywgSSB3
b3VsZCBoYXZlIApndWVzc2VkIHY1LjExIHdpbGwgZ2V0IExUUy4gIEJ1dCB0aGVyZSBoYXMgYmVl
biBubyBhbm5vdW5jZW1lbnQgeWV0IGFuZCBJIApzdXBwb3NlIHRoZXJlIHdpbGwgYmUgbm9uZSBi
ZWZvcmUgcmVsZWFzZT8gIEZvciBvcmRpbmFyeSB1c2VycyBpdCdzIGp1c3QgbGlrZSAKc3Rhcmlu
ZyBpbiBhIGNyeXN0YWwgYmFsbCwgc28gd2UgYWltIGF0IHY1LjQgZm9yIG91ciBtb3JlIHJlY2Vu
dCBoYXJkd2FyZSAKcGxhdGZvcm1zLiDCr1xfKOODhClfL8KvCgo+IAo+IEl0J3MgYWxsIG1vb3Qg
bm93LiBUaGUgZGVjaXNpb24gd2FzIGp1c3QgbWFkZSB0byBzaGVsdmUgdGhlIDUuNCBrZXJuZWwK
PiAidXBncmFkZSIgYW5kIHN0aWNrIHdpdGggMi42LjMzIGZvciBub3cuCj4gCj4gPj4gW0l0IGxv
b2tzIGxpa2Ugd2UncmUgZ29pbmcgdG8gaGF2ZSB0byBhYmFuZG9uIHRoZSBlZmZvcnQgdG8gdXNl
Cj4gPj4gNS40LiBUaGUgcGVyZm9ybWFuY2UgaXMgc28gYmFkIGNvbXBhcmVkIHRvIDIuNi4zMy43
IHRoYXQgb3VyIHByb2R1Y3QKPiA+PiBqdXN0IHBsYWluIHdvbid0IHdvcmsuIFdlJ3ZlIGFscmVh
ZHkgaGFkIHJlbW92ZSBmZWF0dXJlcyB0byB0aGUgZ2V0Cj4gPj4gNS40IGtlcm5lbCBkb3duIHRv
IGEgdXNhYmxlIHNpemUsIGJ1dCB3ZSB3ZXJlIHByZXBhcmVkIHRvIGxpdmUgd2l0aAo+ID4+IHRo
YXQuXQo+ID4gCj4gPiBBaC4gU21hbGwgY2FjaGVzPwo+IAo+IFllcC4gSXQncyBBbiBvbGQgQXRt
ZWwgQVJNOTI2VCBwYXJ0IChhdDkxc2FtOWcyMCkgd2l0aCAzMktCIEktY2FjaGUKPiBhbmQgMzJL
QiBELWNhY2hlLgo+IAo+IEEgc2ltcGxlIHVzZXItc3BhY2UgbXVsdGktdGhyZWFkZWQgVENQIGVj
aG8gc2VydmVyIGJlbmNobWFyayBzaG93ZWQgYQo+IDMwLTUwJSAoZGVwZW5kaW5nIG9uIG51bWJl
ciBvZiBwYXJhbGxlbCBjb25uZWN0aW9ucykgZHJvcCBpbiBtYXgKPiB0aHJvdWdocHV0LiBPdXIg
dHlwaWNhbCBhcHBsaWNhdGlvbnMgYWxzbyBzaG93IGEgMTUtMjUlIGluY3JlYXNlIGluCj4gQ1BV
IHVzYWdlIGZvciBhbiBlcXVpdmFsZW50IHdvcmtsb2FkLiAgQW5vdGhlciBwcm9ibGVtIGlzIGhp
Z2gKPiBsYXRlbmNpZXMgd2l0aCA1LjQuIEEgdGhyZWFkIHRoYXQgaXMgc3VwcG9zZWQgdG8gd2Fr
ZSB1cCBldmVyeSAxbXMKPiB3b3JrcyByZWxpYWJseSBvbiAyLjYuMzMsIGJ1dCBpcyBhIGxvbmcg
d2F5cyBmcm9tIHdvcmtpbmcgb24gNS40LgoKV2UgdXNlIHRoZSBleGFjdCBzYW1lIFNvQyB3aXRo
IGtlcm5lbCA0LjkuMjIwLXJ0MTQzIChQUkVFTVBUIFJUKSBjdXJyZW50bHksIAphZnRlciBiZWlu
ZyBzdHVjayBvbiAyLjYuMzYuNCBmb3IgcXVpdGUgYSB3aGlsZS4gIEkgZGlkIG5vdCBub3RpY2Ug
c2lnbmlmaWNhbnQgCnBlcmZvcm1hbmNlIGlzc3VlcywgYnV0IEkgaGF2ZSB0byBhZG1pdCwgd2Ug
bmV2ZXIgZGlkIGV4dGVuc2l2ZSBiZW5jaG1hcmtzIG9uIApuZXR3b3JrIG9yIENQVSBwZXJmb3Jt
YW5jZSwgYmVjYXVzZSB0aGUgd29ya2xvYWQgYWxzbyBjaGFuZ2VkIGZvciB0aGF0IHRhcmdldC4K
Ckhvd2V2ZXIgd2hhdCBnYXZlIHVzIGEgbG90IGxlc3MgZHJvcHBlZCBwYWNrYWdlcyB3YXMgdXNp
bmcgdGhlIGludGVybmFsIFNSQU0gCmFzIERNQSBidWZmZXIgZm9yIFJYIHBhY2thZ2VzIHJlY2Vp
dmVkIGJ5IG1hY2IuICBUaGF0IGRpZCBub3QgbWFrZSBpdCBpbiAKbWFpbmxpbmUgaG93ZXZlciwg
SSBkaWQgbm90IHB1dCBlbm91Z2ggZWZmb3J0IGluIHBvbGlzaGluZyB0aGF0IHBhdGNoIGJhY2sg
CndoZW4gd2UgbWlncmF0ZWQgZnJvbSAyLjYgdG8gNC54LiAgSWYgeW91J3JlIGN1cmlvdXMsIGl0
J3Mgb24gR2l0SHViOiAKaHR0cHM6Ly9naXRodWIuY29tL0xlU3BvY2t5L2xpbnV4L3RyZWUvbmV0
LW1hY2Itc3JhbS1yeAoKPiBJIGFza2VkIG9uIHRoZSBhcm0ga2VybmVsIG1haWxpbmcgbGlzdCBp
ZiB0aGlzIHdhcyB0eXBpY2FsL2V4cGVjdGVkLAo+IGJ1dCB0aGUgcG9zdCBuZXZlciBtYWRlIGl0
IHBhc3QgdGhlIG1vZGVyYXRvci4KPiAKPiA+IFRoZSBPcGVuV1JUIGd1eXMgbWFrZSB2YWxpZCBj
b21wbGFpbnRzIHRoYXQgdGhlIGNvZGUKPiA+IGhvdCBwYXRoIG9mIHRoZSBuZXR3b3JrIHN0YWNr
IGlzIGdldHRpbmcgdG9vIGJpZyB0byBmaXQgaW4gdGhlIGNhY2hlCj4gPiBvZiBzbWFsbCBzeXN0
ZW1zLiBTbyB0aGVyZSBpcyBhIGxvdCBvZiBjYWNoZSBtaXNzZXMgYW5kIHBlcmZvcm1hbmNlIGlz
Cj4gPiBub3QgZ29vZC4gSWYgaSByZW1lbWJlciBjb3JyZWN0bHksIGp1c3QgaGF2aW5nIG5ldGZp
bHRlciBpbiB0aGUgYnVpbGQKPiA+IGlzIGJhZCwgZXZlbiBpZiBpdCBpcyBub3QgdXNlZC4KPiAK
PiBXZSd2ZSBhbHJlYWR5IGRpc2FibGVkIGFic29sdGVseSBldmVyeXRoaW5nIHdlIGNhbiBhbmQg
c3RpbGwgaGF2ZSBhCj4gd29ya2luZyBzeXN0ZW0uIFdpdGggdGhlIHNhbWUgZmVhdHVyZXMgZW5h
YmxlZCwgdGhlIDUuNCBrZXJuZWwgd2FzCj4gYWJvdXQgNzUlIGxhcmdlciB0aGFuIGEgMi42LjMz
IGtlcm5lbCwgc28gd2UgaGFkIHRvIHRyaW0gcXVpdGUgYSBiaXQKPiBvZiBtZWF0IHRvIGdldCBp
dCB0byBib290IG9uIGV4aXN0aW5nIHVuaXRzLgoKU2FtZSBoZXJlLiAgdjQuOSBrZXJuZWwgaW1h
Z2Ugc3RpbGwgZml0cywgdjQuMTQgaXMgYWxyZWFkeSB0b28gYmlnIGZvciBzb21lIApkZXZpY2Vz
IHdlIGRlbGl2ZXJlZCBpbiB0aGUgZWFybHkgZGF5cy4KCj4gV2UgYWxzbyBjYW4ndCBnZXQgb24t
ZGllIEVDQyBzdXBwb3J0IGZvciBNaWNyb24gTkFORCBmbGFzaCB3b3JraW5nCj4gd2l0aCA1LjQu
IEV2ZW4gaXQgZGlkIHdvcmssIHdlJ2Qgc3RpbGwgaGF2ZSB0byBhZGQgdGhlIGFiaWxpdHkgdG8K
PiBmYWxsLWJhY2sgdG8gU1cgRUNDIG9uIHJlYWQgb3BlcmF0aW9ucyBmb3IgdGhlIHNha2Ugb2Yg
YmFja3dhcmRzCj4gY29tcGF0aWJpbGl0eSBvbiB1bml0cyB0aGF0IHdlcmUgaW5pdGlhbGx5IHNo
aXBwZWQgd2l0aG91dCBvbi1kaWUgRUNDCj4gc3VwcG9ydCBlbmFibGVkLgoKSUlSQyB0aGUgU29D
IGl0c2VsZiBoYXMgaXNzdWVzIHdpdGggaXRzIEVDQyBlbmdpbmU/IFNlZSBtYWlubGluZSAKYXQ5
MXNhbTlnMjBla19jb21tb24uZHRzaSBmb3IgZXhhbXBsZSB3aGljaCBzZXRzIG5hbmQtZWNjLW1v
ZGUgdG8gInNvZnQiLgoKVGhlIFNBTTlHMjAgRXJyYXRhIGNoYXB0ZXIgaW4gdGhlIGNvbXBsZXRl
IGRhdGFzaGVldCBmcm9tIDIwMTUgKEF0bWVsLTYzODRGKSAKc2F5cyB0d28gdGltZXMgaW4gU2Vj
dGlvbiA0NC4xLjM6ICJQZXJmb3JtIHRoZSBFQ0MgY29tcHV0YXRpb24gYnkgc29mdHdhcmUuIgoK
R3JlZXRzCkFsZXgKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
