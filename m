Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE4D606A31C
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Nov 2026 05:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=avGGBLcq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ee9Rd984
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KNnilIeLuQ/Y/IUQU1L7FE89WRF4YkCeVvq9Uv3GCW4=; b=avGGBLcqz5zcekbE5K/tw9fwcN
	0WYC2GJw5cecsGC1omTwRTY+xyuGDPFEGpGTLLilcKVyDOIHVCLwT3gJdAezjpb7SRzyjbCdkEZzp
	ee4yLF+FjToY1oA6eifvqNCg1yUt9X/kC9Zu+R3csVmLyKxbLqgC/boju1mMyVU3u4I8zLgPnJG9R
	FN/hRKYeJuMxgoBjv9mcdyP0V0MNlEbH4Xp0AsRz+FK/SFQYBUHx+79qDwKRsgC9Rn7eYOObC4yoz
	gp8j1K+wikwQzsSw2rtu5XtDN4cENDVHv7qKefTy0/Dxec4qlEoQRlZ9/+eFJGHmuQ2451Qf/udEI
	dUS/AQNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBvQ-00000004cI1-1cYi;
	Tue, 17 Nov 2026 05:40:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTBvP-00000004cHp-1C1w
	for linux-mtd@lists.infradead.org;
	Tue, 17 Nov 2026 05:40:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9EF645CBE;
	Tue, 17 Nov 2026 05:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3370F1F000C5;
	Tue, 17 Nov 2026 05:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794894010;
	bh=0Sw79EmcAmu/4alUzphAfJLPArhlOLS0w68JK4HZF0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ee9Rd984mDic36nmE8Lf5cC00VdW4GtQan9S2uqWPoT7ci6pze0K+GFQZCIJ3M+kS
	 WTsdQVtDslPm84EnROQ0xw5KosVxX3xoU3UyePNRNz2N9U2l9zfWxabg6n3m1fVkQo
	 Uuy0Tw0C0LP1erZJOqBqskzjwAm5/JpbjVhyIx0HysWdmWyU1LscZanV14TeXHA3MJ
	 oDYRvRQQhJE/Cd//0evUaKUDCxi1AnVbQloajIgvfU07zTIpLFRCeCCQbqLO2nLf1G
	 4oCQgLlGmRQOUZjY6sfSO1psCRr37w/4LAsO6T5yIDBn4EC+3kBGyZgwifY9qNX5JD
	 iEm5dKY51fG9w==
Message-ID: <sashiko-outbox-218218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: blktrans: keep reclaim out of the ->release paths
To: "Shuai Liu" <847807867@qq.com>, linux-mtd@lists.infradead.org
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, syzbot+c66e7044aa73c620d862@syzkaller.appspotmail.com
In-Reply-To: <tencent_B9AEB406CBA2FC785312AE8158D20489FB06@qq.com>
References: <6afb28e0.d140b701.164b01.0001.GAE@google.com>
 <tencent_B9AEB406CBA2FC785312AE8158D20489FB06@qq.com>
Date: Tue, 17 Nov 2026 05:40:09 +0000
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: sashiko-reviews@lists.linux.dev
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwKaXNzdWUgdG8gY29uc2lkZXI6Ci0gW0xvd10gbXRkOiBibGt0cmFuczogbWlz
c2luZyBGaXhlcyB0cmFpbGVyIGZvciByZWNsYWltIGRlYWRsb2NrIGluCiAgcmVsZWFzZSBwYXRo
cwotLQoKY29tbWl0IDIzMjM5Mzk3NDg4MWQ1ODQ0NzJiYmIzNDljM2Q3NTUyOTgwYTVjYTAKQXV0
aG9yOiBTaHVhaSBMaXUgPDg0NzgwNzg2N0BxcS5jb20+Cgo+IG10ZDogYmxrdHJhbnM6IGtlZXAg
cmVjbGFpbSBvdXQgb2YgdGhlIC0+cmVsZWFzZSBwYXRocwo+Cj4gYmxrdHJhbnNfcmVsZWFzZSgp
IGludm9rZXMgdHItPnJlbGVhc2UoKSB3aGlsZSBob2xkaW5nIGRldi0+bG9jaywgYW5kCj4gdHJh
bnNsYXRvcnMgY2FuIHdhbGsgZG93biBpbnRvIHRoZSBmbGFzaCBkcml2ZXIgZnJvbSB0aGVyZToK
PiBtdGRibG9ja19yZWxlYXNlKCkgZmx1c2hlcyBpdHMgd3JpdGUgY2FjaGUgdmlhIHdyaXRlX2Nh
Y2hlZF9kYXRhKCkgLT4KPiBlcmFzZV93cml0ZSgpIC0+IG10ZF9lcmFzZSgpLCBhbmQgY29uY2F0
X2VyYXNlKCkgYWxsb2NhdGVzIGEgc3RydWN0Cj4gZXJhc2VfaW5mbyB3aXRoIEdGUF9LRVJORUwu
IGRlbF9tdGRfYmxrdHJhbnNfZGV2KCkgY2FsbHMgLT5yZWxlYXNlKCkKPiB1bmRlciB0aGUgc2Ft
ZSBsb2NrIG9uIHRoZSBkZXZpY2UgcmVtb3ZhbCBwYXRoLgo+Cj4gUmVjbGFpbSBmcm9tIHRob3Nl
IGFsbG9jYXRpb25zIGNhbiByZWN1cnNlIGJhY2sgaW50byB0aGUgc2FtZSBibG9jawo+IHF1ZXVl
IGFuZCBkZWFkbG9jay4gbG9ja2RlcCByZXBvcnRzIHRoZSBmdWxsIGN5Y2xlIHdoZW4gYSB3cml0
ZSB0byB0aGUKPiBjb25jYXQgZGV2aWNlIGlzIGZsdXNoZWQgYXQgbGFzdCBjbG9zZToKPgo+ICAg
ICBpbml0LzEgaXMgdHJ5aW5nIHRvIGFjcXVpcmUgbG9jazoKPiAgICAgICBmc19yZWNsYWltLCBh
dDogX19rbWFsbG9jX2NhY2hlX25vcHJvZgo+ICAgICBidXQgdGFzayBpcyBhbHJlYWR5IGhvbGRp
bmcgbG9jazoKPiAgICAgICAmbXRkYmxrLT5jYWNoZV9tdXRleCwgYXQ6IG10ZGJsb2NrX3JlbGVh
c2UKPgo+ICAgICBDaGFpbiBleGlzdHMgb2Y6Cj4gICAgICAgZnNfcmVjbGFpbSAtLT4gJm5ldy0+
bG9jayAtLT4gJm10ZGJsay0+Y2FjaGVfbXV0ZXgKPgo+ICAgICB0aGUgZXhpc3RpbmcgZGVwZW5k
ZW5jeSBjaGFpbiAoaW4gcmV2ZXJzZSBvcmRlcikgaXM6Cj4gICAgICAgZnNfcmVjbGFpbSAtPiBx
X3VzYWdlX2NvdW50ZXIoaW8pIC0+IGVsZXZhdG9yX2xvY2sKPiAgICAgICAgIC0+IHNldC0+c3Jj
dSAtPiBuZXctPmxvY2sgLT4gbXRkYmxrLT5jYWNoZV9tdXRleAo+Cj4gICAgIENhbGwgVHJhY2U6
Cj4gICAgICAgIGNvbmNhdF9lcmFzZQo+ICAgICAgICBtdGRfZXJhc2UKPiAgICAgICAgZXJhc2Vf
d3JpdGUKPiAgICAgICAgd3JpdGVfY2FjaGVkX2RhdGEKPiAgICAgICAgbXRkYmxvY2tfcmVsZWFz
ZQo+ICAgICAgICBibGt0cmFuc19yZWxlYXNlCj4gICAgICAgIGJkZXZfcmVsZWFzZQo+Cj4gVGhl
IGlvIHBhdGggaXMgYWxyZWFkeSBwcm90ZWN0ZWQ6IG10ZF9xdWV1ZV9ycSgpIGRpc2FibGVzIHJl
Y2xhaW0KPiBhY3Jvc3MgZGlzcGF0Y2ggd2l0aCBtZW1hbGxvY19ub2lvX3NhdmUoKSwgYmVjYXVz
ZSB0cmFuc2xhdG9ycyBtYXkKPiBhbGxvY2F0ZSB3aGlsZSBwcm9jZXNzaW5nIHJlcXVlc3RzIHVu
ZGVyIGRldi0+bG9jayBhbmQgdGhlIHNyY3UgcmVhZAo+IHNpZGUuIC0+cmVsZWFzZSgpIHJ1bnMg
dW5kZXIgdGhlIHNhbWUgbG9ja3MsIHNvIGdpdmUgaXQgdGhlIHNhbWUKPiB0cmVhdG1lbnQgaW4g
YmxrdHJhbnNfcmVsZWFzZSgpIGFuZCBkZWxfbXRkX2Jsa3RyYW5zX2RldigpLgo+Cj4gVmVyaWZp
ZWQgd2l0aCBtdGRyYW0gKyBibG9jazJtdGQgKyBjb25jYXQgKyBtdGRibG9jayBvbiBRRU1VCj4g
KENPTkZJR19QUk9WRV9MT0NLSU5HKTogd3JpdGluZyB0aHJvdWdoIC9kZXYvbXRkYmxvY2tOIGFu
ZCBjbG9zaW5nCj4gdGhlIGZkIHByb2R1Y2VzIHRoZSB3YXJuaW5nIGFib3ZlIG9uIHRoZSB1bnBh
dGNoZWQga2VybmVsIGFuZCBzdGF5cwo+IHNpbGVudCB3aXRoIHRoaXMgcGF0Y2gsIHdpdGggdGhl
IHJlYWRiYWNrIHN0aWxsIHN1Y2NlZWRpbmcuCj4KPiBSZXBvcnRlZC1ieTogc3l6Ym90K2M2NmU3
MDQ0YWE3M2M2MjBkODYyQHN5emthbGxlci5hcHBzcG90bWFpbC5jb20KPiBDbG9zZXM6IGh0dHBz
Oi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRpZD1jNjZlNzA0NGFhNzNjNjIwZDg2Mgo+
IFNpZ25lZC1vZmYtYnk6IFNodWFpIExpdSA8ODQ3ODA3ODY3QHFxLmNvbT4KCltTZXZlcml0eTog
TG93XQpUaGlzIGZpeGVzIGEgcmVjbGFpbSByZWN1cnNpb24gZGVhZGxvY2sgd2hlbiAtPnJlbGVh
c2UoKSBpcyBjYWxsZWQgdW5kZXIKdGhlIHBlci1kZXZpY2UgbXV0ZXggaW50cm9kdWNlZCBieSBj
b21taXQgMDQ4ZDg3MTk5NTY2ICgibXRkOiBibGt0cmFuczoKSG90cGx1ZyBmaXhlcyIpLiBTaG91
bGQgdGhlIGNvbW1pdCBtZXNzYWdlIGluY2x1ZGUgYSBGaXhlcyB0YWcgZm9yIHN0YWJsZQpiYWNr
cG9ydGluZzoKCiAgRml4ZXM6IDA0OGQ4NzE5OTU2NiAoIm10ZDogYmxrdHJhbnM6IEhvdHBsdWcg
Zml4ZXMiKQoKLS0gClNhc2hpa28gQUkgcmV2aWV3IMK3IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9w
YXRjaHNldC90ZW5jZW50X0I5QUVCNDA2Q0JBMkZDNzg1MzEyQUU4MTU4RDIwNDg5RkIwNkBxcS5j
b20/cGFydD0xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
