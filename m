Return-Path: <SRS0=Kp4F=33=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC68BC352A2
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 08:41:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF4EA20838
	for <linux-mtd@archiver.kernel.org>; Fri,  7 Feb 2020 08:41:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="MNljPiVG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5Da9eCW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF4EA20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M4sBXSXZ+MCEVH6xNHoC4aAnmmx7CNHDhdwL49DPaZY=; b=MNljPiVGiQn3Rq
	h+UK+5vY1dR9dqtZFB77ZsZDQLNqgHZ2rsPMtPlvubfc5Uelbc3ekBhBTFWzUJI+BJGbow7nbmndU
	BbpicauTFvjQ9RIrf6uuowaWz/jRE5q497PdpArws63TVdwwpvJOwN44Jzv8Pne7KKzjrsFF4tAZN
	DNpAMz4WW70FYWhj1cJL6umHT9IRwInpn8ctXQo9dwN0TxFTe9wXuyplTxvTvHj5gVA8dh+oxTKcH
	d/SLGdi7iRCQDY53U69uKU0RazhtgALeB+I0tPGOmb1TTFKfHThKxvnt91yAY4G0yqpwdgSf/jy0/
	Yn1z06GlV/nErqK7QaXw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izzCd-0007GJ-Db; Fri, 07 Feb 2020 08:41:31 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izzCa-0007Fv-49
 for linux-mtd@lists.infradead.org; Fri, 07 Feb 2020 08:41:29 +0000
Received: from xps13 (lfbn-tou-1-1151-102.w90-76.abo.wanadoo.fr
 [90.76.211.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9B37920838;
 Fri,  7 Feb 2020 08:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581064887;
 bh=ftSpoXeZxHN0HXl4ROg2gmPEVkCItqI4gGRo0hvYFis=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=T5Da9eCW6Uh3RS+hAHZPH1sE36gTfb/vddq2mw97GhUyAcqOD/rO8JcRD0vNWzce8
 zfn/iLGp7W9t+tf3mX8m9MdCJkIjT3MujojSh2uByo3y9ysAhTF4VeqbsUu7Q2EoDD
 TeJixPGGgVpfWjedjp8t+gN/LfhTZi6tXcWFvVDg=
Date: Fri, 7 Feb 2020 09:41:21 +0100
From: Miquel Raynal <mraynal@kernel.org>
To: liaoweixiong <liaoweixiong@allwinnertech.com>
Subject: Re: [PATCH v1 11/11] mtd: new support oops logger based on pstore/blk
Message-ID: <20200207094121.0ad702d0@xps13>
In-Reply-To: <6a1b50f4-320f-43d1-50e3-b0a2c3c7fb96@allwinnertech.com>
References: <1579482233-2672-1-git-send-email-liaoweixiong@allwinnertech.com>
 <1579482233-2672-12-git-send-email-liaoweixiong@allwinnertech.com>
 <20200120110306.32e53fd8@xps13>
 <27226590-379c-8784-f461-f5d701015611@allwinnertech.com>
 <20200121094802.61f8cb4d@xps13>
 <2c6000b1-ae25-564b-911a-2879e9c244b2@allwinnertech.com>
 <20200122184114.125b42c8@xps13>
 <e135f947-226f-8dd0-b328-fb87c5064914@allwinnertech.com>
 <20200206164559.59c5eb6a@xps13>
 <6a1b50f4-320f-43d1-50e3-b0a2c3c7fb96@allwinnertech.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200207_004128_212647_6F421B35 
X-CRM114-Status: GOOD (  25.46  )
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
Cc: Rob Herring <robh@kernel.org>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Richard Weinberger <richard@nod.at>, Anton Vorontsov <anton@enomsg.org>,
 linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Colin Cross <ccross@android.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGlhbywKCmxpYW93ZWl4aW9uZyA8bGlhb3dlaXhpb25nQGFsbHdpbm5lcnRlY2guY29tPiB3
cm90ZSBvbiBGcmksIDcgRmViIDIwMjAKMTI6MTM6MDggKzA4MDA6Cgo+IGhpIE1pcXVlbCBSYXlu
YWwsCj4gCj4gT24gMjAyMC8yLzYgUE0gMTE6NDUsIE1pcXVlbCBSYXluYWwgd3JvdGU6Cj4gPiBI
aSBsaWFvLAo+ID4gCj4gPiBsaWFvd2VpeGlvbmcgPGxpYW93ZWl4aW9uZ0BhbGx3aW5uZXJ0ZWNo
LmNvbT4gd3JvdGUgb24gVGh1LCA2IEZlYiAyMDIwCj4gPiAyMToxMDo0NyArMDgwMDoKPiA+ICAg
Cj4gPj4gaGkgTWlxdWVsIFJheW5hbCwKPiA+Pgo+ID4+IE9uIDIwMjAvMS8yMyBBTSAxOjQxLCBN
aXF1ZWwgUmF5bmFsIHdyb3RlOiAgCj4gPj4+IEhlbGxvLAo+ID4+PiAgCj4gPj4+ICAgID4+Pj4+
Pj4+ICsvKiAgCj4gPj4+Pj4+Pj4gKyAqIEFsbCB6b25lcyB3aWxsIGJlIHJlYWQgYXMgcHN0b3Jl
L2JsayB3aWxsIHJlYWQgem9uZSBvbmUgYnkgb25lIHdoZW4gZG8KPiA+Pj4+Pj4+PiArICogcmVj
b3Zlci4KPiA+Pj4+Pj4+PiArICovCj4gPj4+Pj4+Pj4gK3N0YXRpYyBzc2l6ZV90IG10ZHBzdG9y
ZV9yZWFkKGNoYXIgKmJ1Ziwgc2l6ZV90IHNpemUsIGxvZmZfdCBvZmYpCj4gPj4+Pj4+Pj4gK3sK
PiA+Pj4+Pj4+PiArCXN0cnVjdCBtdGRwc3RvcmVfY29udGV4dCAqY3h0ID0gJm9vcHNfY3h0Owo+
ID4+Pj4+Pj4+ICsJc2l6ZV90IHJldGxlbjsKPiA+Pj4+Pj4+PiArCWludCByZXQ7Cj4gPj4+Pj4+
Pj4gKwo+ID4+Pj4+Pj4+ICsJaWYgKG10ZHBzdG9yZV9ibG9ja19pc2JhZChjeHQsIG9mZikpCj4g
Pj4+Pj4+Pj4gKwkJcmV0dXJuIC1FTkVYVDsKPiA+Pj4+Pj4+PiArCj4gPj4+Pj4+Pj4gKwlwcl9k
ZWJ1ZygidHJ5IHRvIHJlYWQgb2ZmIDB4JWxseCBzaXplICV6dVxuIiwgb2ZmLCBzaXplKTsKPiA+
Pj4+Pj4+PiArCXJldCA9IG10ZF9yZWFkKGN4dC0+bXRkLCBvZmYsIHNpemUsICZyZXRsZW4sICh1
X2NoYXIgKilidWYpOwo+ID4+Pj4+Pj4+ICsJaWYgKChyZXQgPCAwICYmICFtdGRfaXNfYml0Zmxp
cChyZXQpKSB8fCBzaXplICE9IHJldGxlbikgIHsgIAo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IElJUkMg
c2l6ZSAhPSByZXRsZW4gZG9lcyBub3QgbWVhbiBpdCBmYWlsZWQsIGJ1dCB0aGF0IHlvdSBzaG91
bGQKPiA+Pj4+Pj4+IGNvbnRpbnVlIHJlYWRpbmcgYWZ0ZXIgcmV0bGVuIGJ5dGVzLCBubz8gIAo+
ID4+Pj4+Pj4gICAgICA+PiAgCj4gPj4+Pj4+IFllcywgeW91IGFyZSByaWdodC4gSSB3aWxsIGZp
eCBpdC4gVGhhbmtzLiAgCj4gPj4+Pj4+ICAgID4+Pj4+IEFsc28sIG10ZF9pc19iaXRmbGlwKCkg
ZG9lcyBub3QgbWVhbiB0aGF0IHlvdSBhcmUgcmVhZGluZyBhIGZhbHNlICAKPiA+Pj4+Pj4+IGJ1
ZmZlciwgYnV0IHRoYXQgdGhlIGRhdGEgaGFzIGJlZW4gY29ycmVjdGVkIGFzIGl0IGNvbnRhaW5l
ZCBiaXRmbGlwcy4KPiA+Pj4+Pj4+IG10ZF9pc19lY2NlcnIoKSBob3dldmVyLCB3b3VsZCBiZSBt
ZWFuaW5nZnVsLiAgCj4gPj4+Pj4+PiAgICAgID4+ICAKPiA+Pj4+Pj4gU3VyZSBJIGtub3cgbXRk
X2lzX2JpdGZsaXAoKSBkb2VzIG5vdCBtZWFuIGZhaWx1cmUsIGJ1dCBJIGRvIG5vdCB0aGluawo+
ID4+Pj4+PiBtdGRfaXNfZWNjZXJyKCkgc2hvdWxkIGJlIGhlcmUgc2luY2UgdGhlIGNvZGVzIGFy
ZSByZXQgPCAwIGFuZCBOT1QKPiA+Pj4+Pj4gbXRkX2lzX2JpdGZsaXAoKS4gIAo+ID4+Pj4+Cj4g
Pj4+Pj4gWWVzLCBqdXN0IGRyb3AgdGhpcyBjaGVjaywgb25seSBrZWVwIHJldCA8IDAuICAKPiA+
Pj4+PiAgICAgPj4gIAo+ID4+Pj4gSWYgSSBkb24ndCBnZXQgaXQgd3JvbmcsIGl0IHNob3VsZCBu
b3QJIGJlIGRyb3BwZWQgaGVyZS4gTGlrZSB5b3VyIHdvcmRzLAo+ID4+Pj4gIm10ZF9pc19iaXRm
bGlwKCkgZG9lcyBub3QgbWVhbiB0aGF0IHlvdSBhcmUgcmVhZGluZyBhIGZhbHNlIGJ1ZmZlciwK
PiA+Pj4+IGJ1dCB0aGF0IHRoZSBkYXRhIGhhcyBiZWVuIGNvcnJlY3RlZCBhcyBpdCBjb250YWlu
ZWQgYml0ZmxpcHMuIiwgdGhlCj4gPj4+PiBkYXRhIEkgZ2V0IGFyZSB2YWxpZCBldmVuIGlmIG10
ZF9pc19iaXRmbGlwKCkgcmV0dXJuIHRydWUuIEl0J3MgY29ycmVjdAo+ID4+Pj4gZGF0YSBhbmQg
aXQncyBubyBuZWVkIHRvIGdvIHRvIGhhbmRsZSBlcnJvci4gVG8gbWUsIHRoZSBjb2Rlcwo+ID4+
Pj4gc2hvdWxkIGJlOgo+ID4+Pj4gCWlmIChyZXQgPCAwICYmICFtaXRfaXNfYml0ZmxpcCgpKQo+
ID4+Pj4gCQlbZXJyb3IgaGFuZGxpbmddICAKPiA+Pj4KPiA+Pj4gUGxlYXNlIGNoZWNrIHRoZSBp
bXBsZW1lbnRhdGlvbiBvZiBtdGRfaXNfYml0ZmxpcCgpLiBZb3UnbGwgcHJvYmFibHkKPiA+Pj4g
ZmlndXJlIG91dCB3aGF0IEkgYW0gc2F5aW5nLgo+ID4+Pgo+ID4+PiBodHRwczovL2VsaXhpci5i
b290bGluLmNvbS9saW51eC9sYXRlc3Qvc291cmNlL2luY2x1ZGUvbGludXgvbXRkL210ZC5oI0w1
ODUgIAo+ID4+PiAgICA+PiAgCj4gPj4gSG93IGFib3V0IHRoZSBjb2RlcyBhcyBmb2xsb3dzOgo+
ID4+Cj4gPj4gZm9yIChkb25lID0gMCwgcmV0bGVuID0gMDsgZG9uZSA8IHNpemU7IGRvbmUgKz0g
cmV0bGVuKSB7Cj4gPj4gCXJldCA9IG10ZF9yZWFkKC4uLiwgJnJldGxlbiwgLi4uKTsKPiA+PiAJ
aWYgKCFyZXQpCj4gPj4gCQljb250aW51ZTsKPiA+PiAJLyoKPiA+PiAJICogZG8gbm90aGluZyBp
ZiBiaXRmbGlwIGFuZCBlY2MgZXJyb3Igb2NjdXJzIGJlY2F1c2Ugd2hldGhlcgo+ID4+IAkgKiBp
dCdzIGJpdGZsaXAgb3IgRUNDIGVycm9yLCBqdXN0IGEgc21hbGwgbnVtYmVyIG9mIGJpdHMgZmxp
cAo+ID4+IAkgKiBhbmQgdGhlIGltcGFjdCBvbiBsb2cgZGF0YSBpcyBzbyBzbWFsbC4gVGhlIG10
ZHBzdG9yZSBqdXN0Cj4gPj4gCSAqIGhhbmRzIG92ZXIgd2hhdCBpdCBnZXRzIGFuZCB1c2VyIGNh
biBqdWRnZSB3aGV0aGVyIHRoZSBkYXRhCj4gPj4gCSAqIGlzIHZhbGlkIG9yIG5vdC4KPiA+PiAJ
ICovCj4gPj4gCWlmIChtdGRfaXNfYml0ZmxpcChyZXQpKSB7Cj4gPj4gCQlkZXZfd2FybigiYml0
ZmxpcCBhdC4uLi4iKTsKPiA+PiAJCWNvbnRpbnVlOyAgCj4gCj4gPiBJIGRvbid0IHVuZGVyc3Rh
bmQgd2h5IGRvIHlvdSBjaGVjayBmb3IgYml0ZmxpcHMuIEJpdGZsaXBzIGhhdmUgYmVlbgo+ID4g
Y29ycmVjdGVkIGF0IHRoaXMgc3RhZ2UsIHlvdSBqdXN0IGdldCB0aGUgaW5mb3JtYXRpb24gdGhh
dCB0aGVyZQo+ID4gaGFzIGJlZW4gYml0ZmxpcHMsIGJ1dCB0aGUgZGF0YSBpbnRlZ3JpdHkgaXMg
ZmluZS4KPiA+ICAgCj4gCj4gQm90aCBvZiBiaXRmbGlwIGFuZCBlY2NlcnJvciBhcmUgbm90IHJl
YWwgd3JvbmcgaW4gdGhpcwo+IGNhc2UuIFNvIHdlIG11c3QgY2hlY2sgdGhlbS4KPiAKPiA+IEkg
YW0gbm90IGFnYWluc3QgaWdub3JpbmcgRUNDIGVycm9ycyBpbiB0aGlzIGNhc2UgdGhvdWdoLiBJ
IHdvdWxkCj4gPiBwcm9wb3NlOgo+ID4gCj4gPiAJZm9yICguLi4pIHsKPiA+IAkJaWYgKHJldCA8
IDApIHsKPiA+IAkJCWNvbXBsYWluOwo+ID4gCQkJcmV0dXJuOwo+ID4gCQl9Cj4gPiAgIAo+IAo+
IC0xMTcgKC1FVUNMRUFOKSBtZWFucyBiaXRmbGlwIGJ1dCBiZSBjb3JyZWN0ZWQuCj4gLTc0ICgt
RUJBRE1TRykgbWVhbnMgZWNjIGVycm9yIHRoYXQgdW5jb3JyZWN0YWJsZQo+IEFsbCBvZiB0aGVt
IGFyZSBuZWdhdGl2ZSBudW1iZXIgdGhhdCBzbWFsbGVyIHRoYW4gMC4gSWYgaXQganVzdCBrZWVw
cwo+ICJyZXQgPCAwIiwgaXQgY2FuIG5ldmVyIG1ha2UgYSBkaWZmZXJlbmNlIGJldHdlZW4gYml0
ZmxpcC9lY2NlcnJvcgo+IGFuZCBvdGhlcnMuCgpJIGZvcmdvdCBhYm91dCB0aGVzZSwgeW91cidy
ZSByaWdodCwgc28gd2hhdCBhYm91dDoKCglzdGF0aWMgYm9vbCBtdGRwc3RvcmVfaXNfaW9fZXJy
b3IoaW50IHJldCkKCXsKCQlyZXR1cm4gcmV0IDwgMCAmJiAhbXRkX2lzX2VjY2VycihyZXQpPiAm
JiAhbXRkX2lzX2JpdGZsaXAocmV0KTsKCX0KCglmb3IgKC4uLikgewoJCWlmIChtdGRwc3RvcmVf
aXNfaW9fZXJyb3IocmV0KSkKCQkJcmV0dXJuIHJldDsKCgkJLyoKCQkgKiBDb21tZW50IGV4cGxh
aW5pbmcgd2h5IHdlIHN0aWxsIHJldHVybiB2YWxpZCBkYXRhCgkJICogZGVzcGl0ZSBFQ0MgZXJy
b3JzLgoJCSAqLwoJCWlmIChtdGRfaXNfZWNjZXJyKHJldCkpCgkJCWp1c3QtY29tcGxhaW4oKTsK
CX0KClRoaXMgc25pcHBldCBtYWtlcyBhIGRpZmZlcmVuY2UgYmV0d2VlbiBhbnkgImNvbnRyb2xs
ZXIvYnVzCnRpbWVvdXQvZXJyb3IgOiBkYXRhIGNvdWxkIG5vdCBiZSByZXRyaWV2ZWQiIGFuZCAi
RUNDIGVycm9yLCBtYXliZSB3ZQpjYW4gc3RpbGwgcmVhZCBpdCBhbmQgdHJ5IHRvIHVuZGVyc3Rh
bmQgKHJpc2t5LCBtdXN0IGJlIHdhcm5lZCkiLgoKPiAKPiA+IAkJaWYgKG10ZF9pc19lY2NlcnIo
KSkKPiA+IAkJCWNvbXBsYWluOwo+ID4gCX0KPiA+IAkJICAKPiA+PiAJfSBlbHNlIGlmIChtdGRf
aXNfZWNjZXJyKHJldCkpIHsKPiA+PiAJCWRldl93YXJuKCJlY2NlcnIgYXQuLi4uIik7Cj4gPj4g
CQlyZXRsZW4gPSByZXRsZW4gPT0gMCA/IHNpemUgOiByZXRsZW47Cj4gPj4gCQljb250aW51ZTsK
PiA+PiAJfSBlbHNlIHsKPiA+PiAJCWRldl9lcnIoInJlYWQgZmFpbHVyZSBhdC4uLiIpOwo+ID4+
IAkJLyogdGhpcyB6b25lIGlzIGJyb2tlbiwgdHJ5IG5leHQgb25lICovCj4gPj4gCQlyZXR1cm4g
LUVORVhUOwo+ID4+IAl9Cj4gPj4gfQo+ID4+ICAKPiA+IAo+ID4gCj4gPiBUaGFua3MsCj4gPiBN
aXF1w6hsCj4gPiAgIAoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGlu
ZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
bXRkLwo=
