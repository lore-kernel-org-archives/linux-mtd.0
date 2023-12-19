Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6DFC41535
	for <linux-mtd@archiver.kernel.org>; Tue, 19 Dec 2023 12:56:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2PmxQYglJRJDJXbQRviA9KaAsv2kCH7Q3fl7Dss0xg=; b=mEVvxvMAhiREBY
	hCP8990w94k97SbJaBLR5yMfDZXHgkyqa7Cc9N6w/IB2StLz52IxF56m6NuHQKhhUgyOao67BVNl7
	n4Fg2VES0c+ryjFbWzeCVBOYJwkUr4xL3V1w6xN9cI8W+TM6rSGFh9LcEXnzyHv3jeBfXUruYukDU
	IckCmlJ/+8MtSldEoiWw5iwVU8HIYAMVUOzZexteXIPUxdpEF8GASTzCLxOOVbCLxrZJKBsvn7dvH
	AVYKRxlhuc+6xsxkSAfeUGZCEbB/qS7PQXxe6DFyZkHUv+vUc9tirYhGZzIpGglN0052X33PCxTiV
	x/ODqrJegSCXklfxh78g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZdn-00E6Bx-18;
	Tue, 19 Dec 2023 12:56:07 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFZdh-00E69O-06;
	Tue, 19 Dec 2023 12:56:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D9CA1C000E;
	Tue, 19 Dec 2023 12:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1702990557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eZ4FFwu75FPNZaoEBUmiGs2Cfmi6sxpqh1/xjHDIrSs=;
	b=QKCcZVXaHhki+uoPYuWE2TI2e3//UYWwasRttEklWVrTsJsfjzy/T/V7J5Hhh7iFJXzbQk
	G+9HgVNzCTtJzyfAQLYukrL4XalJ+Q8j94CAuzKCzonv6Ow0Kh5pXRktmO4npeLAdExtLr
	Cg2URAKPN/eu5hsEOwnsORRLt1NsKnpYJyhCszHbFlC99WSKerbssnzird70zwhJ6E1HOp
	byzJgUnEI+PtE+kSAYH+zeUJccQZksPbJF+tYPgYP6vhQpBtAccGaj/U1aAYk7kM6WtjQ1
	MTXbmAD29boQ34Sd0gOcpT1xfqu2wTIspoGTCXRrA41B+peaEkAfO4ZYily3Qg==
Date: Tue, 19 Dec 2023 13:55:53 +0100
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH v6.8 1/2] nvmem: layouts: refactor .add_cells() callback
 arguments
Message-ID: <20231219135553.4e1b74f4@xps-13>
In-Reply-To: <20231219120104.3422-1-zajec5@gmail.com>
References: <20231219120104.3422-1-zajec5@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231219_045601_365922_89FEA54E 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SGkgUmFmYcWCLAoKemFqZWM1QGdtYWlsLmNvbSB3cm90ZSBvbiBUdWUsIDE5IERlYyAyMDIzIDEz
OjAxOjAzICswMTAwOgoKPiBGcm9tOiBSYWZhxYIgTWnFgmVja2kgPHJhZmFsQG1pbGVja2kucGw+
Cj4gCj4gU2ltcGx5IHBhc3Mgd2hvbGUgInN0cnVjdCBudm1lbV9sYXlvdXQiIGluc3RlYWQgb2Yg
c2luZ2xlIHZhcmlhYmxlcy4KPiBUaGVyZSBpcyBub3RoaW5nIGluICJzdHJ1Y3QgbnZtZW1fbGF5
b3V0IiB0aGF0IHdlIGhhdmUgdG8gaGlkZSBmcm9tCj4gbGF5b3V0IGRyaXZlcnMuIFRoZXkgYWxz
byBhY2Nlc3MgaXQgZHVyaW5nIC5wcm9iZSgpIGFuZCAucmVtb3ZlKCkuCj4gCj4gVGhhbmtzIHRv
IHRoaXMgY2hhbmdlOgo+IAo+IDEuIEFQSSBnZXRzIG1vcmUgY29uc2lzdGVudAo+ICAgIEFsbCBs
YXlvdXRzIGRyaXZlcnMgY2FsbGJhY2tzIGdldCB0aGUgc2FtZSBhcmd1bWVudAo+IAo+IDIuIExh
eW91dHMgZ2V0IGNvcnJlY3QgZGV2aWNlCj4gICAgQmVmb3JlIHRoaXMgY2hhbmdlIE5WTUVNIGNv
cmUgY29kZSB3YXMgcGFzc2luZyBOVk1FTSBkZXZpY2UgaW5zdGVhZAo+ICAgIG9mIGxheW91dCBk
ZXZpY2UuIFRoYXQgcmVzdWx0ZWQgaW46Cj4gICAgKiBDb25mdXNpbmcgcHJpbnRzCj4gICAgKiBD
YWxsaW5nIGRldm1fKigpIGhlbHBlcnMgb24gd3JvbmcgZGV2aWNlCj4gICAgKiBIZWxwZXJzIGxp
a2Ugb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCkgZGVyZWZlcmVuY2luZyBOVUxMcwo+IAo+IDMu
IEl0IGdldHMgcG9zc2libGUgdG8gZ2V0IG1hdGNoIGRhdGEKPiAgICBGaXJzdCBvZiBhbGwgbnZt
ZW1fbGF5b3V0X2dldF9tYXRjaF9kYXRhKCkgcmVxdWlyZXMgcGFzc2luZyAic3RydWN0Cj4gICAg
bnZtZW1fbGF5b3V0IiB3aGljaCAuYWRkX2NlbGxzKCkgY2FsbGJhY2sgZGlkbid0IGhhdmUgYmVm
b3JlIHRoaXMuIEl0Cj4gICAgZG9lc24ndCBtYXR0ZXIgbXVjaCBhcyBpdCdzIHJhdGhlciB1c2Vs
ZXNzIG5vdyBhbnl3YXkgKGFuZCB3aWxsIGJlCj4gICAgZHJvcHBlZCkuCj4gICAgV2hhdCdzIG1v
cmUgaW1wb3J0YW50IGhvd2V2ZXIgaXMgdGhhdCBvZl9kZXZpY2VfZ2V0X21hdGNoX2RhdGEoKSBj
YW4KPiAgICBiZSB1c2VkIG5vdyB0aGFua3MgdG8gb3duaW5nIGEgcHJvcGVyIGRldmljZSBwb2lu
dGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJhZmHFgiBNacWCZWNraSA8cmFmYWxAbWlsZWNraS5w
bD4KClJldmlld2VkLWJ5OiBNaXF1ZWwgUmF5bmFsIDxtaXF1ZWwucmF5bmFsQGJvb3RsaW4uY29t
PgoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
