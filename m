Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09A7CA9EC1
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Oct 2026 17:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:References:
	In-Reply-To:Cc:To:Subject:From:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9OHTBOh7vPXeuWr+6/6+OBMWJ4Y3s1cIvnVouqygmc=; b=0+Dagf3X9D32eS
	RDyR0h8LK4u9Kc6kLKn5hqalSxIp457HBWExZhshoTQ8fVRSYnzq/lwa9b14y8nRiBn2+NhBhSW2Q
	OmdqcvkPMn1QTPf24+Vqe3otVhkuTKDGKpz5GdNY42M9S6EJzmqmwb0AChK5aLXcrMAxuhc5yKS6U
	/ZZAzyvzsc+4eJpWqooRNNCqSqrboBDneqfYaRU8zuiX+yLC3fyU6inyvqF49vi6Q8EnfY2a+72Wg
	gRjunF3RGW4ywFHgHT/1SnjtHgWnuFy8YCNCpHHh0xab1oEIyAge8z6ZZovmptZdw/y3yUESZ1eiC
	SBXBZf1jXCD8QmDx7XgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFaux-00000008KjU-0h4h;
	Sat, 10 Oct 2026 17:31:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFauv-00000008KjN-466z
	for linux-mtd@lists.infradead.org;
	Sat, 10 Oct 2026 17:31:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 69A2F43752;
	Sat, 10 Oct 2026 17:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BD61F000FF;
	Sat, 10 Oct 2026 17:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791653489;
	bh=h9jtH9reVT3fZzQKDLHU9yAmjKZCqBwACroPOlpRMHs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IKx3XTd6My+kUNSfwPz94dRUrgVt7tqZrpqPuo5AMiEeEew4nWoIqHGLlCvgEmjym
	 +yXZg02ZT22507rcGB8H/f88aK8MHvlZ5nWgzUWVONilFqkYMXiQ+y3G3myuwHivpl
	 KfCkjUdHv/rRZACsnKSz7jYIHZngU67VTG5hUpYbwGX6PHloqJhqzSKm/5x/tZIJM/
	 WcGEjN1iyjp8vRKQODFM1mdHQo/7XF9Ou+ZIBgksj4mzTjtWQoQkRsV3ikLPY4U0J8
	 ZPsPwn+/Wu/z24vV2NXdWpOEy1s/AnT4ytWlM3+gwFID0O+hfLMkd/wkznG9xV7aED
	 Wa6vOhB/+WhwQ==
Message-ID: <sashiko-outbox-166777@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] mtd: cfi_cmdset_0002: implement point() for simple
 linear maps
To: vigneshr@ti.com, "Orgad Shaneh" <orgads@gmail.com>, miquel.raynal@bootlin.com, tsbogend@alpha.franken.de, richard@nod.at
Cc: linusw@kernel.org, corbet@lwn.net, linux-mips@vger.kernel.org, linux-mtd@lists.infradead.org, john@phrozen.org, kaloz@openwrt.org, ulli.kroll@googlemail.com, nico@fluxnic.net, dwmw2@infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261010172142.2138956-3-orgads@gmail.com>
References: <20261010172142.2138956-1-orgads@gmail.com>
 <20261010172142.2138956-3-orgads@gmail.com>
Date: Sat, 10 Oct 2026 17:31:27 +0000
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
Reply-To: sashiko-reviews@lists.linux.dev
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

VGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlrbyBBSSByZXZpZXcgZm91bmQg
MSBwb3RlbnRpYWwgaXNzdWUocykgdG8gY29uc2lkZXI6Ci0gW0hpZ2hdIG10ZDogY2ZpX2NtZHNl
dF8wMDAyOiB1bmJvdW5kZWQgVEFTS19VTklOVEVSUlVQVElCTEUgc2xlZXAgY2F1c2VzIEh1bmcg
VGFzayBQYW5pYwotLQoKY29tbWl0IDk3YzJlNzQ2YjFmNTJjNzc0NGM1NmI0MGJmMDBmZTQxMGRj
YTE5NmYKQXV0aG9yOiBPcmdhZCBTaGFuZWggPG9yZ2Fkc0BnbWFpbC5jb20+CgptdGQ6IGNmaV9j
bWRzZXRfMDAwMjogaW1wbGVtZW50IHBvaW50KCkgZm9yIHNpbXBsZSBsaW5lYXIgbWFwcwoKVGhp
cyBjb21taXQgYWRkcyBwb2ludCgpIGFuZCB1bnBvaW50KCkgc3VwcG9ydCBmb3Igc2ltcGxlIGxp
bmVhciBtYXBzIHRvCnRoZSBjZmlfY21kc2V0XzAwMDIgZHJpdmVyLiBUaGlzIGFsbG93cyBmaWxl
c3lzdGVtcyBsaWtlIGpmZnMyIG9yIGNyYW1mcwp0byBzY2FuIG1lbW9yeSBpbiBwbGFjZSB3aXRo
b3V0IGNvcHlpbmcgZXZlcnkgdXNlZCBlcmFzZWJsb2NrLiBXaGVuIGEgY2hpcAppcyBwb2ludGVk
IHRvLCB3cml0ZXMsIGVyYXNlcywgYW5kIHN5bmMgb3BlcmF0aW9ucyB3YWl0IGZvciB0aGUgdW5w
b2ludC4KCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9jbWRzZXRfMDAwMi5j
IGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMKPiBpbmRleCA1MTdkYjJmMjcw
N2Y0Li42NzU3OGZlZjAyYmZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbXRkL2NoaXBzL2NmaV9j
bWRzZXRfMDAwMi5jCj4gKysrIGIvZHJpdmVycy9tdGQvY2hpcHMvY2ZpX2NtZHNldF8wMDAyLmMK
ClsgLi4uIF0KCj4gQEAgLTk2MCw4ICs5ODAsMTMgQEAgc3RhdGljIGludCBnZXRfY2hpcChzdHJ1
Y3QgbWFwX2luZm8gKm1hcCwgc3RydWN0IGZsY2hpcCAqY2hpcCwgdW5zaWduZWQgbG9uZyBhZHIK
PiAgCQlyZXR1cm4gLUVJTzsKPiAgCj4gIAljYXNlIEZMX1BPSU5UOgo+IC0JCS8qIE9ubHkgaWYg
dGhlcmUncyBubyBvcGVyYXRpb24gc3VzcGVuZGVkLi4uICovCj4gLQkJaWYgKG1vZGUgPT0gRkxf
UkVBRFkgJiYgY2hpcC0+b2xkc3RhdGUgPT0gRkxfUkVBRFkpCj4gKwkJLyoKPiArCQkgKiBPbmx5
IGlmIHRoZXJlJ3Mgbm8gb3BlcmF0aW9uIHN1c3BlbmRlZDogdGhlIGNoaXAgaXMgaW4KPiArCQkg
KiBhcnJheSBtb2RlLCBzbyByZWFkcywgZnVydGhlciBwb2ludHMgYW5kIHRoZSByZWJvb3QKPiAr
CQkgKiByZXNldCAod2hpY2ggb25seSByZS1lbnRlcnMgYXJyYXkgbW9kZSkgY2FuIGdvIGFoZWFk
Lgo+ICsJCSAqLwo+ICsJCWlmICgobW9kZSA9PSBGTF9SRUFEWSB8fCBtb2RlID09IEZMX1BPSU5U
IHx8Cj4gKwkJICAgICBtb2RlID09IEZMX1NIVVRET1dOKSAmJiBjaGlwLT5vbGRzdGF0ZSA9PSBG
TF9SRUFEWSkKPiAgCQkJcmV0dXJuIDA7Cj4gIAkJZmFsbHRocm91Z2g7CgpbU2V2ZXJpdHk6IEhp
Z2hdCkRvZXMgdGhpcyBsb2dpYyBpbiBnZXRfY2hpcCgpIGNhdXNlIHVuaW50ZW5kZWQgYmxvY2tp
bmcgd2hlbiB0aGUgY2hpcCBoYXMgYQpzdXNwZW5kZWQgb3BlcmF0aW9uPwoKSWYgYSBmaWxlc3lz
dGVtIGxpa2UgQ3JhbUZTIG1vdW50cyBhbiBNVEQgcGFydGl0aW9uIGFuZCBjYWxscyBtdGRfcG9p
bnQoKSwKY2hpcC0+c3RhdGUgYmVjb21lcyBGTF9QT0lOVCBpbmRlZmluaXRlbHkgdW50aWwgdW5t
b3VudC4gSWYgdGhpcyBwb2ludApoYXBwZW5zIHdoaWxlIGFuIGVyYXNlIGlzIHN1c3BlbmRlZCAo
Y2hpcC0+b2xkc3RhdGUgPT0gRkxfRVJBU0lORyksCnJlcXVlc3RzIGZvciBGTF9SRUFEWSBvciBG
TF9TSFVURE9XTiB3aWxsIGZhaWwgdGhlIGNoZWNrIGZvcgpjaGlwLT5vbGRzdGF0ZSA9PSBGTF9S
RUFEWS4KClRoZXkgd2lsbCB0aGVuIGZhbGwgdGhyb3VnaCB0byB0aGUgZGVmYXVsdCBzbGVlcCBw
YXRoLiBCZWNhdXNlIHRoZSBwb2ludCBpcwpoZWxkIGluZGVmaW5pdGVseSBieSB0aGUgZmlsZXN5
c3RlbSwgY291bGQgdGhpcyBjYXVzZSB0aGUgcmVib290IG5vdGlmaWVyCihGTF9TSFVURE9XTikg
dG8gZGVhZGxvY2sgcGVybWFuZW50bHk/Cgo+ICAJZGVmYXVsdDoKPiAgCXNsZWVwOgo+ICAJCXNl
dF9jdXJyZW50X3N0YXRlKFRBU0tfVU5JTlRFUlJVUFRJQkxFKTsKPiAgCQlhZGRfd2FpdF9xdWV1
ZSgmY2hpcC0+d3EsICZ3YWl0KTsKPiAgCQltdXRleF91bmxvY2soJmNoaXAtPm11dGV4KTsKPiAg
CQlzY2hlZHVsZSgpOwo+ICAJCXJlbW92ZV93YWl0X3F1ZXVlKCZjaGlwLT53cSwgJndhaXQpOwo+
ICAJCW11dGV4X2xvY2soJmNoaXAtPm11dGV4KTsKPiAgCQlnb3RvIHJlc2V0dGltZTsKCltTZXZl
cml0eTogSGlnaF0KSXMgaXQgc2FmZSB0byB1c2UgVEFTS19VTklOVEVSUlVQVElCTEUgZm9yIHVu
Ym91bmRlZCBzeW5jaHJvbml6YXRpb24gaGVyZT8KCldoZW4gY2hpcC0+c3RhdGUgaXMgRkxfUE9J
TlQgKGhlbGQgbG9uZy10ZXJtIGJ5IGEgbW91bnRlZCBmaWxlc3lzdGVtKSwgYW5kCmFub3RoZXIg
dGFzayBpbml0aWF0ZXMgYSBmbGFzaCB3cml0ZSwgZXJhc2UsIG9yIHN5bmMsIGdldF9jaGlwKCkg
aXMgY2FsbGVkCndpdGggRkxfV1JJVElORywgRkxfRVJBU0lORywgb3IgRkxfU1lOQ0lORy4gVGhl
c2UgbW9kZXMgZG8gbm90IG1hdGNoIHRoZQpGTF9QT0lOVCBleGNlcHRpb25zIGFuZCBmYWxsIHRo
cm91Z2ggZGlyZWN0bHkgdG8gdGhpcyBzbGVlcCBibG9jay4KClNpbmNlIEZMX1BPSU5UIHdvbid0
IGJlIHJlbGVhc2VkIHVudGlsIHRoZSBmaWxlc3lzdGVtIGlzIHVubW91bnRlZCwgdGFza3MKc2xl
ZXBpbmcgaGVyZSB3aWxsIHJlbWFpbiBpbiBUQVNLX1VOSU5URVJSVVBUSUJMRSBpbmRlZmluaXRl
bHkuIENvdWxkIHRoaXMKY2F1c2UgYSBodW5nIHRhc2sgcGFuaWMgYWZ0ZXIgdGhlIHN0YW5kYXJk
IDEyMC1zZWNvbmQgdGltZW91dCwgYWxsb3dpbmcgYQpsb2NhbCB1c2VyIHRvIGNyYXNoIHRoZSBz
eXN0ZW0gc2ltcGx5IGJ5IHJ1bm5pbmcgc3luYygyKSB3aGlsZSBDcmFtRlMgaXMKbW91bnRlZD8K
ClsgLi4uIF0KCi0tIApTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMv
cGF0Y2hzZXQvMjAyNjEwMTAxNzIxNDIuMjEzODk1Ni0xLW9yZ2Fkc0BnbWFpbC5jb20/cGFydD0y
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
