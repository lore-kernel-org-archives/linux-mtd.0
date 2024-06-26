Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 929A2C3064D
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Jun 2024 05:35:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U7vSLxwGAmMp+421NlSIK2obsiA5gFT7/wXPbt7EWhU=; b=wVLhlzDPMfYN8Q
	e+gSH5E8AHklU8knXIPLTLBF3nNl6kO3McqRqAJjySTJUBksbODme4jHLpPyd4GOWZ+aoHN1O2IvY
	AvOjMb3buLnBJPDabIGO0FwQHtyNbFgEbS3taz2KC6u/gdJ3bkOMN4qiqwzjqDko9OxtFUzphNcM4
	o9e38/rFLEkiBI5ePy3BQ/gKZXpijvd6yosnDzlFoLedBJmiB0cGL/Y+Vee65suaEZ0YaG55On+pS
	NqmFuHMOuK8SOHrY+WoiRhdFkUJRtEG/08y0wErVE3F4cJZm6whFmU8V1xQ5U+0KbKQstiYCKk+MU
	dZ5fyFcLzXS6nN5BG7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMLJu-00000005U1A-3DO7;
	Wed, 26 Jun 2024 05:35:50 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMLJj-00000005Twt-3WCT
	for linux-mtd@lists.infradead.org;
	Wed, 26 Jun 2024 05:35:49 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C315FE0005;
	Wed, 26 Jun 2024 05:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yoseli.org; s=gm1;
	t=1719380133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hTBLI+EibBIM/islvmqEb9vNuvgw5disz9PcbN3jy0U=;
	b=MXOxUJkiDj/W/7OpA7Qvdj6LdARFfF+IyMRGQdcVUZJ94s7YmB9xyJLrhmSjDBMIXIptPX
	oUSTivbIk9cwF0O3zgn6QkfyaKm3VXmKbUGeyTfU26oHdHyk4qTn8G3HMChlIqCYv8Obtp
	6vYWb4t2FvFbuSz8u2Sv/RlPCeuzYv8//5dBGzUMAYmab0o7QxS8V05QjOfL4JRgR7nqam
	wXnq7g4LaVgcJfbhN1pPNBw4ohD8/x48oUh/n5LOKerbMZpG5pZbMt2mTxERVhcs/iVGKS
	bH14rDlauJhAkNb4UAJBMV1hLThSVBcSrvHWjzvF1I5kxUuL1C6LbdlQj7xKDw==
Message-ID: <8e62f256-b136-4a70-9915-cf979fab5dd0@yoseli.org>
Date: Wed, 26 Jun 2024 07:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: m68k 54418 fails to execute user space
To: Michael Schmitz <schmitzmic@gmail.com>, linux-m68k@lists.linux-m68k.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org
Cc: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Christoph Hellwig <hch@infradead.org>, wbx@openadk.org
References: <c252ab82-dc4a-4267-84c3-4a20471524c5@yoseli.org>
 <735e19b6-3747-417f-ba5b-1a7da137a3a3@yoseli.org>
 <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
Content-Language: en-US, fr
From: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
In-Reply-To: <7fb2988d-ab89-405f-8cf1-edcdd2196376@gmail.com>
X-GND-Sasl: jeanmichel.hautbois@yoseli.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_223540_126751_12C38DF2 
X-CRM114-Status: GOOD (  17.90  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTWljaGFlbCwKCk9uIDI2LzA2LzIwMjQgMDM6NTYsIE1pY2hhZWwgU2NobWl0eiB3cm90ZToK
PiBKZWFuLU1pY2hlbCwKPiAKPiBPbiAyNC8wNi8yNCAyMDo1NiwgSmVhbi1NaWNoZWwgSGF1dGJv
aXMgd3JvdGU6Cj4+Cj4+IFdoZW4gSSBwcmludGsgdGhlIGRvX3BhZ2VfZmF1bHQgZmlyc3QgZGVi
dWcsIEkgZ2V0IGZvciB0aGUgZmlyc3QgY2FsbCAKPj4gdG8gbHM6Cj4+IGJhc2gtNS4yIyBscwo+
PiBbwqDCoCAxNC43MDAwMDBdIGRvIHBhZ2UgZmF1bHQ6Cj4+IFvCoMKgIDE0LjcwMDAwMF0gcmVn
cy0+c3I9MHgwLCByZWdzLT5wYz0weDcwMDY5ZWU2LCBhZGRyZXNzPTB4NzAwNjllZTYsIAo+PiAw
LCAocHRydmFsKQo+IAo+IFBhZ2Ugbm90IHByZXNlbnQsIHJlYWQgZmF1bHQuIFBsZWFzZSBkaXNh
YmxlIG9iZnVzY2F0aW9uIG9mIGtlcm5lbCAKPiBwb2ludGVyIGFkZHJlc3NlcyBieSBwcmludGsu
IE1heWJlIGFsc28gZGlzYWJsZSBhZGRyZXNzIHNwYWNlIAo+IHJhbmRvbWl6YXRpb24gd2hpbGUg
ZGVidWdnaW5nIHRoaXMuCgpSYW5kb21pemF0aW9uIGlzIGRpc2FibGVkLCBJIHRoaW5rIEkgZG9u
J3QgaGF2ZSBoYXNoIHBvaW50ZXJzLi4uIFdpbGwgCmhlY2sgYWdhaW4sIHRoYW5rcyBmb3IgdGhl
IGV4cGxhbmF0aW9uLgoKPiAKPj4gVGhpcyBjYWxsIHdvcmtzIGFsbW9zdCBmaW5lIChJIHN0aWxs
IGhhdmUgdGhlIGFzc2VydCBmYWlsZWQ6IAo+PiBmb2xpby0+cHJpdmF0ZSAhPSBOVUxMIGlzc3Vl
KS4KPj4KPj4gQW5kIHdoZW4gSSBjYWxsIGl0IGEgc2Vjb25kIHRpbWUsIEkgZ2V0Ogo+PiBiYXNo
LTUuMiMgbHMKPj4gW8KgwqAgMTkuODIwMDAwXSBkbyBwYWdlIGZhdWx0Ogo+PiBbwqDCoCAxOS44
MjAwMDBdIHJlZ3MtPnNyPTB4MCwgcmVncy0+cGM9MHg2MDExZDY1YSwgYWRkcmVzcz0weDcwMGUy
MDA0LCAKPj4gMiwgKHB0cnZhbCkKPiAKPiBQYWdlIG5vdCBwcmVzZW50LCB3cml0ZSBmYXVsdC4K
PiAKPiBJdCB3b3VsZCBiZSBoZWxwZnVsIGlmIHlvdSBjb3VsZCBnZXQgYSBkdW1wIG9mIC9wcm9j
LzEvbWFwcyBiZWZvcmUgdGhlIAo+IGV4ZWN2ZSgpIHN5c2NhbGwgaW4geW91ciBoZWxsb3dvcmxk
IGluaXQgcmVwbGFjZW1lbnQuIFRoYXQgbWlnaHQgY29uZmlybSAKPiBhbGwgdGhlc2UgYWRkcmVz
c2VzIGFyZSBsZWdpdCAoYXNzdW1pbmcgbWFwcGluZ3Mgc3Vydml2ZSBhY3Jvc3MgCj4gZXhlY3Zl
KCksIHRoYXQgaXMpLCBhbmQgd2hhdCB0aGV5IGNvcnJlc3BvbmQgdG8uCgpFeGVjdXRpbmcgbW91
bnQgL3Byb2Mgd2lsbCBtYWtlIGl0IGltcG9zc2libGUgdG8gdGhlbiBjYWxsIGNhdCAKL3Byb2Mv
MS9tYXBzIDotKC4gQ2FuIEkgZW5hYmxlIGEgcHJpbnRrIHNvbWV3aGVyZSBpbiB0aGUga2VybmVs
IHRvIGRvIAp0aGUgc2FtZSBtYXliZSA/CgpKTQoKPiAKPj4KPj4gVGhlIGFkZHJlc3MgY29ycmVz
cG9uZHMgdG8gdGhlIGRlZmluZWQgem9uZSBFTEZfRVRfRFlOX0JBU0UgYXMgSSBzZXQgCj4+IGl0
IHRvIDB4NzAwMDAwMDAuCj4+Cj4+IHJlZ3MtPnBjIGlzIG5vdCB0aGUgc2FtZSBhcyB0aGUgYWRk
cmVzcy4gSXQgbWlnaHQgYmUgdW5yZWxldmFudCwgYnV0IAo+PiBhbnkgaGVscCBpcyBhcHByZWNp
YXRlZCB0byB1bmRlcnN0YW5kIHRoZSBwcm9jZXNzIGJlaGluZCA6LSkuCj4+Cj4+IEkga2VlcCBk
aWdnaW5nLCBhbmQgSSBhbSBpbiB0aGUgYXNtIHBhcnQgd2hpY2ggZmVhcnMgbWUgYSBiaXQgIQo+
IAo+IEkgZG9uJ3Qgc2VlIHRoYXQgeW91J2QgbmVlZCB0byBsb29rIGF0IGFueSBhc20gY29kZSBo
ZXJlLgo+IAo+IENoZWVycywKPiAKPiAgwqDCoMKgIE1pY2hhZWwKPiAKPj4KPj4gVGhhbmtzICEK
Pj4gSk0KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
