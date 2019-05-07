Return-Path: <SRS0=Kxx5=TH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D841C004C9
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 07:06:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F7DB20989
	for <linux-mtd@archiver.kernel.org>; Tue,  7 May 2019 07:06:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DL9S7txc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F7DB20989
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/ge9wyinrDLQV2bQF26SrAkjW0czZ/ROq+7iW4QJZc=; b=DL9S7txcEexpnb
	mgYMSh7QRyiAcy0SOzJJe0s155aPQYUUltWPmS+UDBQyuClZZJ1XvTWOqPutT5p/9uqYqisfvdErE
	/oZmHmUUBj4gFUfGfTKQTmYhkhYG+KFjYnfodChB8J3uAwFV4X/ikWUpiL1aiBks7iaTNRLorL/fQ
	hRR3f3JIldi3kGfeuzj65nZmB5aybtYmeeIiNNJIrEv2cN7FILqQbivpa1eCo4cQIjkvvyxyzHoC1
	z3eNqCAXWp+/8bDaT99a9d/FWkJajsCd1bpFrn4MAEtfmgsdJamKyIbyUZldCw0iSLHu7iH/+YO6j
	N6OicMMuAle/cDJEd8GQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNuAx-0005xh-3b; Tue, 07 May 2019 07:06:07 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNuAt-0005wp-5n
 for linux-mtd@lists.infradead.org; Tue, 07 May 2019 07:06:05 +0000
X-Originating-IP: 90.88.149.145
Received: from xps13 (aaubervilliers-681-1-29-145.w90-88.abo.wanadoo.fr
 [90.88.149.145]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id B2343FF80A;
 Tue,  7 May 2019 07:05:51 +0000 (UTC)
Date: Tue, 7 May 2019 09:05:50 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Vesta <laguna-mc@mail.com>
Subject: Re: Mounting the squashfs/read-only Linux file system on MTD partition
Message-ID: <20190507090550.1be251a6@xps13>
In-Reply-To: <trinity-6f5a6dee-773f-4141-9b34-daaa48446eec-1556719828713@3c-app-mailcom-lxa08>
References: <trinity-6f5a6dee-773f-4141-9b34-daaa48446eec-1556719828713@3c-app-mailcom-lxa08>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.1 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190507_000603_514006_155E8E92 
X-CRM114-Status: GOOD (  11.95  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgVmVzdGEsCgpWZXN0YSA8bGFndW5hLW1jQG1haWwuY29tPiB3cm90ZSBvbiBXZWQsIDEgTWF5
IDIwMTkgMTY6MTA6MjggKzAyMDA6Cgo+IEhpLAo+IAo+IERldmljZSBoYXZlIGVtYmVkZGVkIExp
bnV4IHZlcnNpb24gMi42LjI2LjUsIGF0IGJvb3QgdGltZSB0aGUgc3lzdGVtIGNyZWF0ZXMgMTEg
TVREIHBhcnRpdGlvbnMgb24gTkFORCBmbGFzaC4KCkZpcnN0LCAyLjYuMjYgaXMgaG9ycmlibHkg
b2xkIGFuZCBub3QgbWFpbnRhaW5lZCBhdCBhbGwuIEZpcnN0IHN0ZXAgZm9yCnlvdSB3b3VsZCBi
ZSB0byB1c2UgYSByZWNlbnQga2VybmVsLCB0aGUgTVREIHN1YnN5c3RlbSBoYXMgY2hhbmdlZCBx
dWl0ZQphIGxvdCBzaW5jZSB0aGVuLgoKPiBJJ20gaW4gbGltaXRlZCBCdXN5Ym94IHNoZWxsLgo+
IEJ1c3lCb3ggdjEuMTAuMiAoMjAxNy0wOC0wMiAxNDowNzoyNSBDU1QpIGJ1aWx0LWluIHNoZWxs
IChhc2gpCj4gRW50ZXIgJ2hlbHAnIGZvciBhIGxpc3Qgb2YgYnVpbHQtaW4gY29tbWFuZHMuCj4g
Cj4gL2Jpbi9zaDogY2FuJ3QgYWNjZXNzIHR0eTsgam9iIGNvbnRyb2wgdHVybmVkIG9mZgo+ICMg
bW91bnQgLXQgcHJvYyBwcm9jIC9wcm9jCj4gIyBtb3VudCAtdCBzeXNmcyBzeXNmcyAvc3lzCj4g
IyBtb3VudCAtdCB0bXBmcyB0bXBmcyAvdG1wCj4gIyBtb3VudCAtdCB0bXBmcyBub25lIC9kZXYK
PiAjIG1rZGlyIC9kZXYvcHRzCj4gIyBtb3VudCAtdCBkZXZwdHMgZGV2cHRzIC9kZXYvcHRzCj4g
IyBtZGV2IC1zCj4gIyBjYXQgL3Byb2MvbXRkCj4gZGV2OiAgICBzaXplICAgZXJhc2VzaXplICBu
YW1lCj4gbXRkMDogMDAwNjAwMDAgMDAwMDQwMDAgInUtYm9vdCIKPiBtdGQxOiAwMDAyMDAwMCAw
MDAwNDAwMCAidS1ib290ZW52Igo+IG10ZDI6IDAxM2UwMDAwIDAwMDA0MDAwICJST01JTUFHRSIK
PiBtdGQzOiAwMDcwMDAwMCAwMDAwNDAwMCAiSEFMRklNQUdFIgo+IG10ZDQ6IDAxMjYwMDAwIDAw
MDA0MDAwICJMSU5VWF9ST09URlMiCj4gbXRkNTogMDAyMDAwMDAgMDAwMDQwMDAgIkhTX0ZXIgo+
IG10ZDY6IDAwMTAwMDAwIDAwMDA0MDAwICJGUEFSIgo+IG10ZDc6IDAwMDgwMDAwIDAwMDA0MDAw
ICJDSVNDTyIKPiBtdGQ4OiAwMDAyMDAwMCAwMDAwNDAwMCAiRUVQUk9NIgo+IG10ZDk6IDAwMDgw
MDAwIDAwMDA0MDAwICJOVlJBTSIKPiBtdGQxMDogMDAwODAwMDAgMDAwMDQwMDAgIkNBX0RBVEEi
Cj4gIyBtb3VudAo+IHJvb3RmcyBvbiAvIHR5cGUgcm9vdGZzIChydykKPiAvZGV2L3Jvb3Qgb24g
LyB0eXBlIHNxdWFzaGZzIChybykKPiBwcm9jIG9uIC9wcm9jIHR5cGUgcHJvYyAocncpCj4gc3lz
ZnMgb24gL3N5cyB0eXBlIHN5c2ZzIChydykKPiB0bXBmcyBvbiAvdG1wIHR5cGUgdG1wZnMgKHJ3
KQo+IG5vbmUgb24gL2RldiB0eXBlIHRtcGZzIChydykKPiBkZXZwdHMgb24gL2Rldi9wdHMgdHlw
ZSBkZXZwdHMgKHJ3LG1vZGU9NjAwKQo+IAo+ICMgZGYgLWgKPiBGaWxlc3lzdGVtICAgICAgICAg
ICAgICAgIFNpemUgICAgICBVc2VkIEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24KPiByb290ZnMg
ICAgICAgICAgICAgICAgICAgIDguME0gICAgICA4LjBNICAgICAgICAgMCAxMDAlIC8KPiAvZGV2
L3Jvb3QgICAgICAgICAgICAgICAgIDguME0gICAgICA4LjBNICAgICAgICAgMCAxMDAlIC8KPiB0
bXBmcyAgICAgICAgICAgICAgICAgICAgMTMuOU0gICAgICAgICAwICAgICAxMy45TSAgIDAlIC90
bXAKPiBub25lICAgICAgICAgICAgICAgICAgICAgMTMuOU0gICAgICAgICAwICAgICAxMy45TSAg
IDAlIC9kZXYKPiAKPiAjIGxzIC1hbAo+IGRyd3hyLXhyLXggICAxOSAxMDA1ICAgICAxMDA1ICAg
ICAgICAgIDIxOSBBdWcgIDIgIDIwMTcgLgo+IGRyd3hyLXhyLXggICAxOSAxMDA1ICAgICAxMDA1
ICAgICAgICAgIDIxOSBBdWcgIDIgIDIwMTcgLi4KPiBkcnd4cnd4ci14ICAgIDYgMTAwNSAgICAg
MTAwNSAgICAgICAgICAgODYgQXVnICAyICAyMDE3IC5zdm4KPiBkcnd4cnd4ci14ICAgIDIgMTAw
NSAgICAgMTAwNSAgICAgICAgICA0MzIgQXVnICAyICAyMDE3IGJpbgo+IC1yd3hyLXhyLXggICAg
MSAxMDA1ICAgICAxMDA1ICAgICAgIDcxNTg0NCBBdWcgIDIgIDIwMTcgY29yZGxlc3Nfbm9kZWN0
LmNvbWEKPiBkcnd4cnd4cnd0ICAgIDUgMCAgICAgICAgMCAgICAgICAgICAgIDI3MjAgSmFuICAx
IDAwOjA0IGRldgo+IGRyd3hyLXhyLXggICAgMiAxMDA1ICAgICAxMDA1ICAgICAgICAgICAgMyBB
dWcgIDIgIDIwMTcgZWVwcm9tCj4gZHJ3eHIteHIteCAgICA0IDEwMDUgICAgIDEwMDUgICAgICAg
ICAgMzg2IEF1ZyAgMiAgMjAxNyBldGMKPiBkcnd4ci14ci14ICAgIDIgMTAwNSAgICAgMTAwNSAg
ICAgICAgICAgIDMgQXVnICAyICAyMDE3IGZwYXIKPiBkcnd4ci14ci14ICAgIDQgMCAgICAgICAg
MCAgICAgICAgICAgICAgNDggQXVnICAyICAyMDE3IGhvbWUKPiBkcnd4ci14ci14ICAgIDIgMTAw
NSAgICAgMTAwNSAgICAgICAgICAgIDMgQXVnICAyICAyMDE3IGhzZncKPiBkcnd4ci14ci14ICAg
IDMgMTAwNSAgICAgMTAwNSAgICAgICAgICAyODcgQXVnICAyICAyMDE3IGxpYgo+IGRyd3hyd3hy
LXggICAgMiAxMDA1ICAgICAxMDA1ICAgICAgICAgICAgMyBBdWcgIDIgIDIwMTcgbW50Cj4gZHJ3
eHIteHIteCAgICAyIDEwMDUgICAgIDEwMDUgICAgICAgICAgICAzIEF1ZyAgMiAgMjAxNyBudnJh
bQo+IGRyLXhyLXhyLXggICAyNyAwICAgICAgICAwICAgICAgICAgICAgICAgMCBKYW4gIDEgMDA6
MDAgcHJvYwo+IGxyd3hyd3hyd3ggICAgMSAxMDA1ICAgICAxMDA1ICAgICAgICAgICAgOCBBdWcg
IDIgIDIwMTcgcm9vdCAtPiB0bXAvcm9vdAo+IGRyd3hyLXhyLXggICAgMiAxMDA1ICAgICAxMDA1
ICAgICAgICAgIDY0MiBBdWcgIDIgIDIwMTcgc2Jpbgo+IGRyd3hyLXhyLXggICAxMCAwICAgICAg
ICAwICAgICAgICAgICAgICAgMCBKYW4gIDEgMDA6MDAgc3lzCj4gZHJ3eHJ3eHJ3dCAgICAyIDAg
ICAgICAgIDAgICAgICAgICAgICAgIDQwIEphbiAgMSAwMDowMCB0bXAKPiBkcnd4ci14ci14ICAg
IDcgMTAwNSAgICAgMTAwNSAgICAgICAgICAgNzMgQXVnICAyICAyMDE3IHVzcgo+IGxyd3hyd3hy
d3ggICAgMSAxMDA1ICAgICAxMDA1ICAgICAgICAgICAgNyBBdWcgIDIgIDIwMTcgdmFyIC0+IHRt
cC92YXIKPiBkcnd4ci14ci14ICAgIDYgMTAwNSAgICAgMTAwNSAgICAgICAgIDQwNTEgQXVnICAy
ICAyMDE3IHd3dwo+IAo+IEhvdyB0byBtb3VudCB0aGUgTGludXggcm9vdCBmaWxlIHN5c3RlbSBv
biBtdGQ0IChMSU5VWF9ST09URlMpPyBJdCdzIHNxdWFzaGZzL3JlYWQtb25seSBmaWxlc3lzdGVt
LiBXaGF0IGlzIGNvcnJlY3Qgc3RlcHM/CgpUaGUgSW50ZXJuZXQgaXMgZnVsbCBvZiByZXNvdXJj
ZXMuIElmIHlvdSBoYXZlIGEgc3BlY2lmaWMgcHJvYmxlbSB5b3UKZG9uJ3Qga25vdyBob3cgdG8g
c29sdmUsIHRoaXMgaXMgdGhlIHJpZ2h0IHBsYWNlIHRvIGFzayB0aG91Z2guCgo+IERvZXMgYWxs
IHRoZSByZXN0IE1URCBwYXJ0aXRpb25zIGhhdmUgSkZGUzIgZmlsZSBzeXN0ZW0/CgpOb3QgbmVj
ZXNzYXJpbHkuIFRvZGF5IHdlIGRpc2NvdXJhZ2UgdGhlIHVzZSBvZiBKRkZTMjsgdXNlIFVCSS9V
QklGUwppbnN0ZWFkIGZvciBSVyBwYXJ0aXRpb25zLgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
