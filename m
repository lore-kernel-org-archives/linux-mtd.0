Return-Path: <SRS0=Nzsu=GJ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E719C433DB
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:51:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759082311B
	for <linux-mtd@archiver.kernel.org>; Wed,  6 Jan 2021 14:51:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759082311B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RCuOPPetdrTn9vzvzen6m/C44kgX1d8QvrOBxk2wAbw=; b=qk1kD/CU1bKo7Bgd9wXAnigSQ
	28A6t9bfEl/D+HHLmjGRRdNHWe3ew7VVepnMc04fHf6qfLO3lDUw9UxRL8dlxUTDIbGsvnDO+9Cqr
	TQ2eCTUd6eeIQ7KAlrmAbnO7IO15CQ3ogtxrIfJS1KogNJeJSYkdQELlATgEs7yqIQKkp4Qu+DXaX
	tyIEvbjKmDvWZvIpe3mCfn7VX1zpvFKrBgJdQVHwEtgAPT2hGMIQgKY8AWOyY8WKCZDZsSHQXD0K1
	hTgW+bME8rOHCTr8ZExoSGTe9gOvuuEJIHW3PAli1g9P/Hjrm5eONxdqxl4kOiZL635gOvzUIulnD
	sUg26i0rw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxA8T-0001S4-UU; Wed, 06 Jan 2021 14:50:05 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxA8Q-0001Qf-J2
 for linux-mtd@lists.infradead.org; Wed, 06 Jan 2021 14:50:03 +0000
X-Originating-IP: 91.224.148.103
Received: from xps13 (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 388DC60006;
 Wed,  6 Jan 2021 14:49:55 +0000 (UTC)
Date: Wed, 6 Jan 2021 15:49:54 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: Re: [PATCH -next] mtd: use resource_size
Message-ID: <20210106154954.4f85ed76@xps13>
In-Reply-To: <20210106131831.301-1-zhengyongjun3@huawei.com>
References: <20210106131831.301-1-zhengyongjun3@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210106_095002_745758_1D37EFCC 
X-CRM114-Status: GOOD (  12.53  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8sCgpaaGVuZyBZb25nanVuIDx6aGVuZ3lvbmdqdW4zQGh1YXdlaS5jb20+IHdyb3RlIG9u
IFdlZCwgNiBKYW4gMjAyMQoyMToxODozMSArMDgwMDoKCj4gVXNlIHJlc291cmNlX3NpemUgcmF0
aGVyIHRoYW4gYSB2ZXJib3NlIGNvbXB1dGF0aW9uIG9uCj4gdGhlIGVuZCBhbmQgc3RhcnQgZmll
bGRzLgoKVGhlIGNvbW1pdCBtZXNzYWdlIGFuZCB0aGUgcGF0Y2ggY29udGVudCBkbyBub3QgbWF0
Y2guCiAgCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhlbmcgWW9uZ2p1biA8emhlbmd5b25nanVuM0Bo
dWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL210ZC9tYXBzL3BjaS5jIHwgOCArKysrLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL210ZC9tYXBzL3BjaS5jIGIvZHJpdmVycy9tdGQvbWFwcy9wY2ku
Ywo+IGluZGV4IDM3N2VmMGZjNGUzZS4uY2EwMGQyMTFlNzNlIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvbXRkL21hcHMvcGNpLmMKPiArKysgYi9kcml2ZXJzL210ZC9tYXBzL3BjaS5jCj4gQEAgLTkw
LDggKzkwLDggQEAgaW50ZWxfaXE4MDMxMF9pbml0KHN0cnVjdCBwY2lfZGV2ICpkZXYsIHN0cnVj
dCBtYXBfcGNpX2luZm8gKm1hcCkKPiAgCXUzMiB3aW5fYmFzZTsKPiAgCj4gIAltYXAtPm1hcC5i
YW5rd2lkdGggPSAxOwo+IC0JbWFwLT5tYXAucmVhZCA9IG10ZF9wY2lfcmVhZDgsCj4gLQltYXAt
Pm1hcC53cml0ZSA9IG10ZF9wY2lfd3JpdGU4LAo+ICsJbWFwLT5tYXAucmVhZCA9IG10ZF9wY2lf
cmVhZDg7Cj4gKwltYXAtPm1hcC53cml0ZSA9IG10ZF9wY2lfd3JpdGU4Owo+ICAKPiAgCW1hcC0+
bWFwLnNpemUgICAgID0gMHgwMDgwMDAwMDsKPiAgCW1hcC0+YmFzZSAgICAgICAgID0gaW9yZW1h
cChwY2lfcmVzb3VyY2Vfc3RhcnQoZGV2LCAwKSwKPiBAQCAtMTg1LDggKzE4NSw4IEBAIGludGVs
X2RjMjEyODVfaW5pdChzdHJ1Y3QgcGNpX2RldiAqZGV2LCBzdHJ1Y3QgbWFwX3BjaV9pbmZvICpt
YXApCj4gIAkJcmV0dXJuIC1FTlhJTzsKPiAgCj4gIAltYXAtPm1hcC5iYW5rd2lkdGggPSA0Owo+
IC0JbWFwLT5tYXAucmVhZCA9IG10ZF9wY2lfcmVhZDMyLAo+IC0JbWFwLT5tYXAud3JpdGUgPSBt
dGRfcGNpX3dyaXRlMzIsCj4gKwltYXAtPm1hcC5yZWFkID0gbXRkX3BjaV9yZWFkMzI7Cj4gKwlt
YXAtPm1hcC53cml0ZSA9IG10ZF9wY2lfd3JpdGUzMjsKPiAgCW1hcC0+bWFwLnNpemUgICAgID0g
bGVuOwo+ICAJbWFwLT5iYXNlICAgICAgICAgPSBpb3JlbWFwKGJhc2UsIGxlbik7Cj4gIAoKVGhh
bmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
