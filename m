Return-Path: <SRS0=r2JG=TA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 275DAC43219
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 09:33:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED6BA21670
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2019 09:33:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X18lhsel"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED6BA21670
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=thorsis.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=qVU/LWWRfiyWcKN6q1/w2vCBrVzKsMTSN434iiI+ofg=; b=X18lhsel2xEw3cCYIbpGz9FXna
	bCAtC0+wQLbsxnQQpDMbXKzzBe7NY8mcL91fIRgnRmZKdxiGfggAQomWWueVZ9+T9hONZKZVH0uxX
	NrtzTLkXm3DXx7Qpj8rr0V+skZmN4LUCVxkajq7uX81uCn/fq2AYn/a2gtmXFlwKesGKU1LUCVW1I
	dqW0KHMVe9M/e3a21CxwPFPsitJ6syZgKAD4Es88H+G0MyT4SU+HosuOgPsB4o+tHMcxfMsUn6RR0
	X4JyN+RC5TBBySk8h3HUYHNMpAJ8XjuYIE5VibxjoMMA7cnk1MwE4IlO8eTXL//0oyyUAfpOgaCS+
	MranUsgQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hLP8d-0002VO-0Q; Tue, 30 Apr 2019 09:33:23 +0000
Received: from mail.thorsis.com ([92.198.35.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hLP8J-0001y1-PH
 for linux-mtd@lists.infradead.org; Tue, 30 Apr 2019 09:33:08 +0000
Received: from localhost (localhost [127.0.0.1])
 by mail.thorsis.com (Postfix) with ESMTP id 8CB3880
 for <linux-mtd@lists.infradead.org>; Tue, 30 Apr 2019 11:26:27 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.thorsis.com
Received: from mail.thorsis.com ([127.0.0.1])
 by localhost (mail.thorsis.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oJzsgYdf8cjw for <linux-mtd@lists.infradead.org>;
 Tue, 30 Apr 2019 11:26:27 +0200 (CEST)
Received: by mail.thorsis.com (Postfix, from userid 109)
 id 6DAFF4976; Tue, 30 Apr 2019 11:26:27 +0200 (CEST)
From: Alexander Dahl <ada@thorsis.com>
To: linux-mtd@lists.infradead.org
Subject: Re: atmel nand bindings vs. actual dts files
Date: Tue, 30 Apr 2019 11:24:44 +0200
Message-ID: <1947914.CcHDgmXbBm@ada>
In-Reply-To: <20190429115540.7d577a50@xps13>
References: <1823900.qPX5mxbl1h@ada> <4099561.5sHrvDXGx3@ada>
 <20190429115540.7d577a50@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190430_023304_378653_A9805EE0 
X-CRM114-Status: GOOD (  10.00  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGVsbG8gTWlxdcOobCwKCkFtIE1vbnRhZywgMjkuIEFwcmlsIDIwMTksIDExOjU1OjQwIENFU1Qg
c2NocmllYiBNaXF1ZWwgUmF5bmFsOgo+IEFsZXhhbmRlciBEYWhsIDxhZGFAdGhvcnNpcy5jb20+
IHdyb3RlIG9uIFRodSwgMDcgTWFyIDIwMTkgMTc6MjU6MTcKPiA+IEFtIE1pdHR3b2NoLCA2LiBN
w6RyeiAyMDE5LCAxNTowNzo1MiBDRVQgc2NocmllYiBBbGV4YW5kZXIgRGFobDoKPiA+ID4gU28g
aW5zdGVhZCBvZiAiYWx3YXlzIDB4ODAwMDAwIiB0aGF0IG5vZGUgaGFzIDB4MiBhcyB0aGlyZCBl
bnRyeSBmb3IgdGhlCj4gPiA+ICdyZWcnIHByb3BlcnR5LiBXaHkgaXMgdGhhdD8KPiA+IAo+ID4g
SSBkaWRuJ3QgaW52ZXN0aWdhdGUgdGhhdCBmdXJ0aGVyIHlldCwgYnV0IEknbSBjdXJpb3VzLCBz
byBpZiBhbnlvbmUKPiA+IGtub3dzPwo+IAo+IEkgc3VwcG9zZSB0aGUgYmluZGluZ3MgWzFdIGV4
cGxhaW4gdGhlIHNpdHVhdGlvbi4KPiAKPiBbMV0KPiBodHRwczovL2VsaXhpci5ib290bGluLmNv
bS9saW51eC92NS4wL3NvdXJjZS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGkKPiBuZ3Mv
bXRkL2F0bWVsLW5hbmQudHh0I0wzMgoKTm8sIHRoYXQgd2FzIG5vdCB3aGF0IEkgd2FudGVkIHRv
IGtub3cuIFRoZSBiaW5kaW5ncyBzYXlzIGZvciB0aGF0IHJlZyAKcHJvcGVydHk6IOKAnDNyZCBl
bnRyeTogdGhlIG1lbW9yeSByZWdpb24gc2l6ZSAoYWx3YXlzIDB4ODAwMDAwKeKAnQoKVGhpcyBp
cyB0cnVlIGZvciBzb21lIGR0cyBmaWxlcyBpbmNsdWRpbmcgdGhpcyBuYW5kIG5vZGUsIGJ1dCBu
b3QgZm9yIGFsbCwgCnNvbWUgaGF2ZSB0aGlzOgoKCW5hbmRAMyB7CgkJcmVnID0gPDB4MyAweDAg
MHg4MDAwMDA+OwoKT3RoZXJzIGhhdmUgdGhpczoKCgluYW5kQDMgewoJCXJlZyA9IDwweDMgMHgw
IDB4Mj47CgpUaGUgc2Vjb25kIGNvbnRyYWRpY3RzIHRoZSBiaW5kaW5nIGRvYy4gTW9zdCBvZiB0
aGlzIHdhcyBjaGFuZ2VkIHdoZW4gCnN3aXRjaGluZyBmcm9tIHRoZSBvbGQgYmluZGluZ3MgaW4g
Y2hhbmdlc2V0IHY0LjEyLXJjMS03LWcxMDA0YTI5NzdiZGMgYnkgCkJvcmlzIEJyZXppbGxvbi4g
SSB3YW50ZWQgdG8ga25vdyB3aHkgdGhlIGRpZmZlcmVuY2U/IAoKR3JlZXRzCkFsZXgKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgg
TVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
