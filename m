Return-Path: <SRS0=afzE=YB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D285FC4360C
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 15:55:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A226E206C0
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Oct 2019 15:55:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YURplC8K"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A226E206C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hA7h2myWgCVM4feuzMypHXeNQqoyCffCCBnevWEJuJI=; b=YURplC8KV92k7U
	QweIoWToXudVlDRvxnOAUoLvZ3ZRZIgwPX+SuNDR/ehGV1HJsonol6Mkt+p4a7iIcZsOdJYdJjuw3
	L8HvWx9z2SGhp+pmqv64g+DuPkPZDUcmY+KgevIxJoAqSQZAhr0cOCWBOvYky4drmsFoyZDoWaMYn
	3q7Pay4n3TBlAmi6q9Yd/Rlk5G2951uyhafRcv9sDHXiB4UnF2wJ62hzHrYyk1JdbLbudiMei+A96
	rD2KS27HTxTUN0YOlF48wlS0tTDM5lIYA0crRVCiemv2E0h1KvT32+B7GtiUe9muQILtYNrjfMDk+
	NRrFhglZb9XsUa3ffo4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iHrpa-0008N7-Pf; Tue, 08 Oct 2019 15:55:22 +0000
Received: from relay10.mail.gandi.net ([217.70.178.230])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iHrpX-0008Mb-06
 for linux-mtd@lists.infradead.org; Tue, 08 Oct 2019 15:55:20 +0000
Received: from xps13 (lfbn-1-17395-211.w86-250.abo.wanadoo.fr [86.250.200.211])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay10.mail.gandi.net (Postfix) with ESMTPSA id 339FE24000C;
 Tue,  8 Oct 2019 15:55:13 +0000 (UTC)
Date: Tue, 8 Oct 2019 17:55:12 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] mtd: physmap_of: add a hook for Intel IXP4xx flash
 probing
Message-ID: <20191008175512.00630a82@xps13>
In-Reply-To: <20190201100421.27504-2-linus.walleij@linaro.org>
References: <20190201100421.27504-1-linus.walleij@linaro.org>
 <20190201100421.27504-2-linus.walleij@linaro.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191008_085519_175399_3482F581 
X-CRM114-Status: GOOD (  17.93  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, Marek Vasut <marek.vasut@gmail.com>,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgTGludXMsCgpMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+IHdyb3Rl
IG9uIEZyaSwgIDEgRmViIDIwMTkKMTE6MDQ6MjEgKzAxMDA6Cgo+IEluIG9yZGVyIHRvIHN1cHBv
cnQgZGV2aWNlIHRyZWUgcHJvYmluZyBvZiBJWFA0eHggTk9SIGZsYXNoCj4gY2hpcHMsIGEgY2Vy
dGFpbiBiaWctZW5kaWFuIG9yIG1peGVkLWVuZGlhbiBtZW1vcnkgYWNjZXNzCj4gcGF0dGVybiBu
ZWVkIHRvIGJlIHVzZWQuCj4gCj4gSSBoYXZlIG9wdGVkIHRvIHVzZSB0aGUgcGF0dGVybiBzZXQg
YnkgcHJldmlvdXMgcGx1Zy1pbnMKPiB0byBwaHlzbWFwIGZvciBHZW1pbmkgYW5kIFZlcnNhdGls
ZSwganVzdCBvdmVycmlkZSBzb21lCj4gZnVuY3Rpb25zIGFuZCByZXVzZSBtb3N0IG9mIHRoZSBw
aHlzbWFwIGNvcmUgY29kZSBhcyBpdAo+IGlzIHRvIG1pbmltaXplIG1haW50ZW5hbmNlLgo+IAo+
IFBhcnRzIG9mIGRyaXZlcnMvbXRkL2l4cDR4eC5jIGFyZSBjb3BpZWQgaW50byB0aGlzIGZpbGUu
Cj4gCj4gQWZ0ZXIgd2UgaGF2ZSBJWFA0eHggY29udmVydGVkIGZ1bGx5IHRvIGRldmljZSB0cmVl
LCB0aGUKPiBkcml2ZXJzL210ZC9peHA0eHguYyBmaWxlIHdpbGwgYmUgZGVsZXRlZCBhbmQgdGhp
cyB3aWxsCj4gYmUgdGhlIG9ubHkgYWNjZXNzIHBhdHRlcm4gdG8gdGhlIElYUDR4eCBmbGFzaC4K
PiAKPiBJIGRpZCBub3Qga2VlcCB0aGUgcXVpcmsgaW4gdGhlIGZsYXNoIHdyaXRlIGZ1bmN0aW9u
Cj4gYWZ0ZXIgcHJvYmUsIHdoZXJlIHRoZSBvbGQgY29kZSBmb3IgYSB3aGlsZSBjaGVja3MgZm9y
Cj4gYWNjZXNzIHRvIG9kZCBhZGRyZXNzZXMsIGZhaWxzIGFuZCBhc3NpZ25zIGEgImZhc3RlciIK
PiB3cml0ZSBmdW5jdGlvbiBvbmNlIGl0IGhhcyBjb252aW5jZWQgcHJvYmUgdG8gb25seSB1c2UK
PiAyLWJ5dGUgYWNjZXNzZXMuIEFzIHdlIG1hbmRhdGUgdGhhdCB0aGlzIGRldmljZSBzaG91bGQK
PiBiZSB1c2luZyBiYW5rLXdpZHRoID0gPDI+IHRoaXMgc2hvdWxkIG5vdCBiZSBhIHByb2JsZW0K
PiB1bmxlc3MgbWlzY29uZmlndXJlZC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlq
IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+CgpJIGFtIGNoZWNraW5nIHdoYXQncyBpbiBvdXIg
cGF0Y2h3b3JrIGZvciBhZ2VzIGFuZCBJIGZvdW5kIHRoaXMsIGNhbgp5b3UgcmViYXNlIG9uIGEg
cmVjZW50IHZlcnNpb24gYW5kIGlmIGFsbCB0aGlzIHN0aWxsIGFwcGxpZXMgY2FuIHlvdQpyZXNl
bmQ/CgpUaGFua3MgYW5kIHNvcnJ5IGZvciB0aGUgaW5jb252ZW5pZW5jZS4KCk1pcXXDqGwKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
