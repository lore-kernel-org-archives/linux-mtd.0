Return-Path: <SRS0=Hh9c=LR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1367C48BE5
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 09:42:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6B54611AD
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jun 2021 09:42:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6B54611AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=csgroup.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nh6te4o9I+QRiTXQVQSsMMv9eWSd/WVQOV9V/e+YgxY=; b=TF6htiQqfbFN4JAt+ZuAJA/sxQ
	4mp3Simf4OJkO5+Zc00omAdCZWwEt20z2adXEtS3ftKL9LXwJUSdsDodUpI8f48Q0I2IS0XI80AaZ
	8TSyQSLnczEujCm9mxpTwnPQlYQsqaBzchdcAXL1ySsC9QPZDY74Xc3vpjhSbCs6hltBeIdaGcTIz
	Uekak9FfgYt0f0xeMdbAg0s33zJfCr6M+rmLkXfxyA2/unJh/cuX2tdvWXtTcuSliA3oDHV20LR/i
	KWO21w5XuL9v2Q/81hlNKkGj1tovmtCINkzwRzc3LeZFSnMSGz2vZoVV4+YBCeavyrZZsESnmpASL
	U3FDtbRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvzOe-00A9mK-UB; Wed, 23 Jun 2021 09:42:12 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvzOa-00A9kr-DG
 for linux-mtd@lists.infradead.org; Wed, 23 Jun 2021 09:42:10 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G8yw119tfz9xPS;
 Wed, 23 Jun 2021 11:41:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PDR_xenBtm_C; Wed, 23 Jun 2021 11:41:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G8yw02Y0jz9tTS;
 Wed, 23 Jun 2021 11:41:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F146D8B7CC;
 Wed, 23 Jun 2021 11:41:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VRZeKfM3XHFy; Wed, 23 Jun 2021 11:41:51 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 594E58B7CB;
 Wed, 23 Jun 2021 11:41:51 +0200 (CEST)
Subject: Re: nand: WARNING: a0000000.nand: the ECC used on your system
 (1b/256B) is too weak compared to the one required by the NAND chip (4b/512B)
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <817e89d4-790d-41a4-2a8e-9e119597e459@csgroup.eu>
 <20210618084326.0a074fb7@xps13>
 <d37a8a7e-6181-9642-18fb-470d1d8cf006@csgroup.eu>
 <20210618225032.69cdc30c@xps13>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6eb7f394-7e0e-8ecf-e741-f6e6cc322689@csgroup.eu>
Date: Wed, 23 Jun 2021 11:41:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210618225032.69cdc30c@xps13>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210623_024208_650810_A3CE0FA7 
X-CRM114-Status: GOOD (  20.73  )
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

CgpMZSAxOS8wNi8yMDIxIMOgIDIwOjQwLCBNaXF1ZWwgUmF5bmFsIGEgw6ljcml0wqA6Cj4gSGkg
Q2hyaXN0b3BoZSwKPiAKPj4+PiBOb3cgYW5kIHRoZW4gSSdtIHVzaW5nIG9uZSBvZiB0aGUgbGF0
ZXN0IGtlcm5lbHMgKFRvZGF5IGlzIDUuMTMtcmM2KSwgYW5kIHNvbWV0aW1lIGluIG9uZSBvZiB0
aGUgNS54IHJlbGVhc2VzLCBJIHN0YXJ0ZWQgdG8gZ2V0IGVycm9ycyBsaWtlOgo+Pj4+Cj4+Pj4g
WyAgICA1LjA5ODI2NV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0Mg
ZXJyb3IKPj4+PiBbICAgIDUuMTAzODU5XSB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJv
ciAtNzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyA2MAo+Pj4+ICAgICBieXRlcyBmcm9tIFBF
QiA5OTo1OTgyNCwgcmVhZCBvbmx5IDYwIGJ5dGVzLCByZXRyeQo+Pj4+IFsgICAgNS41MjU4NDNd
IGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4+Pj4gWyAg
ICA1LjUzMTU3MV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJy
b3IKPj4+PiBbICAgIDUuNTM3NDkwXSB1YmkwIHdhcm5pbmc6IHViaV9pb19yZWFkOiBlcnJvciAt
NzQgKEVDQyBlcnJvcikgd2hpbGUgcmVhZGluZyAzMAo+Pj4+IDczIGJ5dGVzIGZyb20gUEVCIDEw
NzoxMDg5NzYsIHJlYWQgb25seSAzMDczIGJ5dGVzLCByZXRyeQo+Pj4+IFsgICAgNS42OTExMjFd
IGVjY19zd19oYW1taW5nX2NvcnJlY3Q6IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4+Pj4gWyAg
ICA1LjY5NjcwOV0gZWNjX3N3X2hhbW1pbmdfY29ycmVjdDogdW5jb3JyZWN0YWJsZSBFQ0MgZXJy
b3IKPj4+PiBbICAgIDUuNzAyNDI2XSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJlY3Rh
YmxlIEVDQyBlcnJvcgo+Pj4+IFsgICAgNS43MDgxNDFdIGVjY19zd19oYW1taW5nX2NvcnJlY3Q6
IHVuY29ycmVjdGFibGUgRUNDIGVycm9yCj4+Pj4gWyAgICA1LjcxNDEwM10gdWJpMCB3YXJuaW5n
OiB1YmlfaW9fcmVhZDogZXJyb3IgLTc0IChFQ0MgZXJyb3IpIHdoaWxlIHJlYWRpbmcgMzAKPj4+
PiAzNSBieXRlcyBmcm9tIFBFQiAxMDc6MjUxNDQsIHJlYWQgb25seSAzMDM1IGJ5dGVzLCByZXRy
eQo+Pj4+IFsgICAyMC41MjM2ODldIHJhbmRvbTogY3JuZyBpbml0IGRvbmUKPj4+PiBbICAgMjEu
ODkyMTMwXSBlY2Nfc3dfaGFtbWluZ19jb3JyZWN0OiB1bmNvcnJlY3RhYmxlIEVDQyBlcnJvcgo+
Pj4+IFsgICAyMS44OTc3MzBdIHViaTAgd2FybmluZzogdWJpX2lvX3JlYWQ6IGVycm9yIC03NCAo
RUNDIGVycm9yKSB3aGlsZSByZWFkaW5nIDEzCj4+Pj4gOTQgYnl0ZXMgZnJvbSBQRUIgMTE2Ojc1
Nzc2LCByZWFkIG9ubHkgMTM5NCBieXRlcywgcmV0cnkKPj4+Pgo+Pj4+IE1vc3Qgb2YgdGhlIHRp
bWUsIHdoZW4gdGhlIHJlYWRpbmcgb2YgdGhlIGZpbGUgZmFpbHMsIEkganVzdCBoYXZlIHRvIHJl
YWQgaXQgb25jZSBtb3JlIGFuZCBpdCBnZXRzIHJlYWQgd2l0aG91dCB0aGF0IGVycm9yLgo+Pj4K
Pj4+IEl0IHJlYWxseSBsb29rcyBsaWtlIGEgcmVndWxhciBiaXRmbGlwIGhhcHBlbmluZyAic29t
ZXRpbWVzIi4gSXMgdGhpcyBhCj4+PiBib2FyZCB3aGljaCBhbHJlYWR5IGhhZCBhIGxpZmU/IFdo
YXQgYXJlIHRoZSB1c2FnZSBjb3VudGVycyAoVUJJIHNob3VsZAo+Pj4gdGVsbCB5b3UgdGhpcykg
Y29tcGFyZWQgdG8gdGhlIG9mZmljaWFsIGVuZHVyYW5jZSBvZiB5b3VyIGNoaXAgKHNlZSB0aGUK
Pj4+IGRhdGFzaGVldCk/Cj4+Cj4+IFRoZSBib2FyZCBoYWQgYSBwZWFjZWZ1bGwgbGlmZToKPj4K
Pj4gVUJJIHJlcG9ydHMgInViaTA6IG1heC9tZWFuIGVyYXNlIGNvdW50ZXI6IDQ5LzIwLCBXTCB0
aHJlc2hvbGQ6IDQwOTYiCj4gCj4gTW1taC4gSW5kZWVkLgo+IAo+Pgo+PiBJIGhhdmUgdHJpZWQg
d2l0aCBoYWxmIGEgZG96ZW4gb2YgYm9hcmRzIGFuZCBhbGwgaGF2ZSB0aGUgaXNzdWUuCj4+Cj4+
PiAgICAKPj4+PiBXaGF0IGFtIEkgc3VwcG9zZWQgdG8gZG8gdG8gYXZvaWQgdGhlIEVDQyB3ZWFr
bmVzcyB3YXJuaW5nIGF0IHN0YXJ0dXAgYW5kIHRvIGZpeCB0aGF0IEVDQyBlcnJvciBpc3N1ZSA/
Cj4+Pgo+Pj4gSSBob25lc3RseSBkb24ndCB0aGluayB0aGUgZXJyb3JzIGNvbWUgZnJvbSB0aGUg
NS4xeCBrZXJuZWxzIGdpdmVuIHRoZQo+Pj4gYWJvdmUgbG9ncy4gSWYgeW91IGZsYXNoIGJhY2sg
eW91ciBvbGQgNC4xNCBJIGFtIHByZXR0eSBzdXJlIHlvdSdsbAo+Pj4gaGF2ZSB0aGUgc2FtZSBl
cnJvcnMgYXQgc29tZSBwb2ludC4KPj4KPj4gSSBkb24ndCBoYXZlIGFueSBwcm9ibGVtIGxpa2Ug
dGhhdCB3aXRoIDQuMTQgd2l0aCBhbnkgb2YgdGhlIGJvYXJkLgo+Pgo+PiBXaGVuIGJvb3Rpbmcg
YSA0LjE0IGtlcm5lbCBJIGRvbid0IGdldCBhbnkgcHJvYmxlbSBvbiB0aGUgc2FtZSBib2FyZC4K
Pj4KPiAKPiBJZiB5b3UgY2FuIHJlbGlhYmx5IHNob3cgdGhhdCB3aGVuIHJldHVybmluZyB0byBh
IDQuMTQga2VybmVsIHRoZSBFQ0MKPiB3ZWFrbmVzcyBkaXNhcHBlYXJzLCB0aGVuIHRoZXJlIGlz
IGNlcnRhaW5seSBzb21ldGhpbmcgbmV3LiBXaGF0IGRyaXZlcgo+IGFyZSB5b3UgdXNpbmc/IE1h
eWJlIHlvdSBjYW4gZG8gYSBiaXNlY3Rpb24/CgpVc2luZyB0aGUgR1BJTyBkcml2ZXIsIGFuZCB0
aGUgTkFORCBjaGlwIGlzIGEgSFlOSVguCgpJIGNhbiBzYXkgdGhhdCB0aGUgRUNDIHdlYWtuZXNz
IGRvZXNuJ3QgZXhpc3QgdW50aWwgdjUuNSBpbmNsdWRlZC4gVGhlIHdlYWtuZXNzIGFwcGVhcnMg
d2l0aCB2NS42LgoKSSBoYXZlIHRyaWVkIGJpc2VjdGlvbiBiZXR3ZWVuIHRob3NlIHR3byB2ZXJz
aW9ucyBhbmQgSSBjb3VsZG4ndCBlbmQgdXAgdG8gYSByZWxpYWJsZSByZXN1bHQuIFRoZSAKY2xv
c2VyIHRoZSB2NS41IHlvdSBnbywgdGhlIG1vcmUgZGlmZmljdWx0IGl0IGlzIHRvIHJlcHJvZHVj
ZSB0aGUgaXNzdWUuCgpTbyBJIGxvb2tlZCBhdCB3aGF0IHdhcyBkb25lIGFyb3VuZCB0aGUgcGxh
Y2VzLCBhbmQgaW4gZmFjdCB0aGF0J3MgbWFpbmx5IG9wdGltaXNhdGlvbiBpbiB0aGUgCnBvd2Vy
cGMgY29kZS4gSXQgc2VlbXMgdGhhdCB0aGUgbW9yZSBwb3dlcnBjIGlzIG9wdGltaXNlZCwgdGhl
IG1vcmUgdGhlIHByb2JsZW0gb2NjdXJzLgoKTG9va2luZyBhdCB0aGUgR1BJTyBuYW5kIGRyaXZl
ciwgSSBzYXcgdGhhdCBuby1vcCBncGlvX25hbmRfZG9zeW5jKCkgZnVuY3Rpb24uIEJ5IGFkZGlu
ZyBhIG1lbW9yeSAKYmFycmllciBpbiB0aGF0IGZ1bmN0aW9uLCB0aGUgRUNDIHdlYWtuZXNzIGRp
c2FwcGVhcmVkIGNvbXBsZXRlbHkuCgpOb3Qgc3VyZSB3aGF0IHRoZSBmaW5hbCBzb2x1dGlvbiBo
YXMgdG8gYmUuCgpDaHJpc3RvcGhlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
