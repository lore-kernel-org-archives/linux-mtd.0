Return-Path: <SRS0=z5ty=FE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C367CC5519F
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:09:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42E4F206ED
	for <linux-mtd@archiver.kernel.org>; Mon, 30 Nov 2020 07:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y67mCNSw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42E4F206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7u9XwIsLKtMObtYD1mBCg+Ztz174+vDc1vMmnYCpqtE=; b=Y67mCNSwldKC/jQ1rK2r4AQIM
	2eOGhMMcftury0Ljx62uuzSU9iw2IYLxLRnEoLRfJKyDgBmZKWkozRZDDebwNkj6ab8Y/DFOF1Lwf
	lDBeu3dWzxeAW130fuZ6L5uFAxF1Q/sw7iMU+dKnZ6Wo0lzPF1FL4rZ/WvdkfA1Tjqn+vkbw+Tuz7
	ufhW1XazdNT+7Iox3xGSGdI1ErOWNrmPYjubACWAsBH+FlFz743J4po1kFGQ/0Djsqnr+m1cc3Qsy
	VTn/alZD0HuKcEU20OTSs3hluLgvHh+vQI/HKXmLH/H24/eJEwyynlpl0Rufui1VxmP90q+4GT0Xk
	9k2t9kUvA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjdIf-0002Te-Bf; Mon, 30 Nov 2020 07:08:41 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjdIc-0002SE-5o
 for linux-mtd@lists.infradead.org; Mon, 30 Nov 2020 07:08:38 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 205A9AC55;
 Mon, 30 Nov 2020 07:08:37 +0000 (UTC)
Subject: Re: [PATCH 08/45] dm: simplify flush_bio initialization in
 __send_empty_flush
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
References: <20201128161510.347752-1-hch@lst.de>
 <20201128161510.347752-9-hch@lst.de>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <8e58e368-5772-6d97-06d0-f58346cc1865@suse.de>
Date: Mon, 30 Nov 2020 08:08:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128161510.347752-9-hch@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_020838_350058_979D41D7 
X-CRM114-Status: GOOD (  24.79  )
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
Cc: linux-bcache@vger.kernel.org, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>, linux-mm@kvack.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, Tejun Heo <tj@kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gMTEvMjgvMjAgNToxNCBQTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gV2UgZG9uJ3Qg
cmVhbGx5IG5lZWQgdGhlIHN0cnVjdCBibG9ja19kZXZpY2UgdG8gaW5pdGlhbGl6ZSBhIGJpby4g
IFNvCj4gc3dpdGNoIGZyb20gdXNpbmcgYmlvX3NldF9kZXYgdG8gbWFudWFsbHkgc2V0dGluZyB1
cCBiaV9kaXNrIChiaV9wYXJ0bm8KPiB3aWxsIGFsd2F5cyBiZSB6ZXJvIGFuZCBoYXMgYmVlbiBj
bGVhcmVkIGJ5IGJpb19pbml0IGFscmVhZHkpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IEFja2VkLWJ5OiBNaWtlIFNuaXR6ZXIgPHNuaXR6ZXJA
cmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvbWQvZG0uYyB8IDEyICsrKy0tLS0tLS0tLQo+
ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS5jIGIvZHJpdmVycy9tZC9kbS5jCj4gaW5kZXggNTA1
NDFkMzM2YzcxOWIuLmFiMGE4MzM1ZjA5OGQ5IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWQvZG0u
Ywo+ICsrKyBiL2RyaXZlcnMvbWQvZG0uYwo+IEBAIC0xNDIyLDE4ICsxNDIyLDEyIEBAIHN0YXRp
YyBpbnQgX19zZW5kX2VtcHR5X2ZsdXNoKHN0cnVjdCBjbG9uZV9pbmZvICpjaSkKPiAgIAkgKi8K
PiAgIAliaW9faW5pdCgmZmx1c2hfYmlvLCBOVUxMLCAwKTsKPiAgIAlmbHVzaF9iaW8uYmlfb3Bm
ID0gUkVRX09QX1dSSVRFIHwgUkVRX1BSRUZMVVNIIHwgUkVRX1NZTkM7Cj4gKwlmbHVzaF9iaW8u
YmlfZGlzayA9IGNpLT5pby0+bWQtPmRpc2s7Cj4gKwliaW9fYXNzb2NpYXRlX2Jsa2coJmZsdXNo
X2Jpbyk7Cj4gKwo+ICAgCWNpLT5iaW8gPSAmZmx1c2hfYmlvOwo+ICAgCWNpLT5zZWN0b3JfY291
bnQgPSAwOwo+ICAgCj4gLQkvKgo+IC0JICogRW1wdHkgZmx1c2ggdXNlcyBhIHN0YXRpY2FsbHkg
aW5pdGlhbGl6ZWQgYmlvLCBhcyB0aGUgYmFzZSBmb3IKPiAtCSAqIGNsb25pbmcuICBIb3dldmVy
LCBibGtnIGFzc29jaWF0aW9uIHJlcXVpcmVzIHRoYXQgYSBiZGV2IGlzCj4gLQkgKiBhc3NvY2lh
dGVkIHdpdGggYSBnZW5kaXNrLCB3aGljaCBkb2Vzbid0IGhhcHBlbiB1bnRpbCB0aGUgYmRldiBp
cwo+IC0JICogb3BlbmVkLiAgU28sIGJsa2cgYXNzb2NpYXRpb24gaXMgZG9uZSBhdCBpc3N1ZSB0
aW1lIG9mIHRoZSBmbHVzaAo+IC0JICogcmF0aGVyIHRoYW4gd2hlbiB0aGUgZGV2aWNlIGlzIGNy
ZWF0ZWQgaW4gYWxsb2NfZGV2KCkuCj4gLQkgKi8KPiAtCWJpb19zZXRfZGV2KGNpLT5iaW8sIGNp
LT5pby0+bWQtPmJkZXYpOwo+IC0KPiAgIAlCVUdfT04oYmlvX2hhc19kYXRhKGNpLT5iaW8pKTsK
PiAgIAl3aGlsZSAoKHRpID0gZG1fdGFibGVfZ2V0X3RhcmdldChjaS0+bWFwLCB0YXJnZXRfbnIr
KykpKQo+ICAgCQlfX3NlbmRfZHVwbGljYXRlX2Jpb3MoY2ksIHRpLCB0aS0+bnVtX2ZsdXNoX2Jp
b3MsIE5VTEwpOwo+IApSZXZpZXdlZC1ieTogSGFubmVzIFJlaW5lY2tlIDxoYXJlQHN1c2UuZGU+
CgpDaGVlcnMsCgpIYW5uZXMKLS0gCkRyLiBIYW5uZXMgUmVpbmVja2UgICAgICAgICAgICAgICAg
S2VybmVsIFN0b3JhZ2UgQXJjaGl0ZWN0CmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICs0OSA5MTEgNzQwNTMgNjg4ClNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdtYkgs
IE1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZwpIUkIgMzY4MDkgKEFHIE7DvHJuYmVyZyks
IEdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lv
biBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tdGQvCg==
