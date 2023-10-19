Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55DE2CDB465
	for <linux-mtd@archiver.kernel.org>; Thu, 19 Oct 2023 06:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EqAtk/a9UXfqO7yTAYTMC3Wo13caMphjgPX/cS5uET4=; b=AeGAchY5e6l9yM
	5npElBawY8Owl05KylGbH8z2iVAITwdCWsTHZ/bvXBSjgkmvJrEovCtgdK2b0nAXOb7bBIJFOHBrJ
	6rsXScvIaE4Mb7oJF5oBw5EjtKh9Rdyq8Up6XlTZLM5EULHsiQRf9sgn7772Xpm03QsdX/b8OmevV
	WJbybERnspak1P3nFQ8ktv5i6ze0r2VCsrdZ/Qg4EuCh3MFSEmizZA4NICAzTj4l1S0eaB7t5IYD2
	i1bLBpyN2rwtSjQr+Q8vn2txFBaqxH/D2pgG5L0Sx2jDOZUne14JTAP8M28s/+lR9KVlZbZE1CCgM
	7ojeTaeuSGfhuwACaK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMU1-00GVMJ-1b;
	Thu, 19 Oct 2023 06:26:13 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtMTw-00GVKs-37
	for linux-mtd@lists.infradead.org;
	Thu, 19 Oct 2023 06:26:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1ECC220007;
	Thu, 19 Oct 2023 06:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1697696763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HNNRaG2dqKNviipuJLjD/k7aYF+k9GHOUwNhRm6P7tc=;
	b=nOG+A8w8Ex2Py8fK1x1jePPuCwk8ZCKopqO8U4eGAQ1krekFAbawqQt8P22mqV/985zz03
	mRwy4Wd9kMxT2hkfpaj5XeSMqOixZEyrLK+kF9Di8r6EVzRg00O1I1T6mRSH6ve0PYGNtH
	rZjsAyHlVyYCP0jyPXEEsMvn1V3KFZa2p9qyVMueNHCoQ0AKiCHMe3NylwEWM18sm0lqwx
	AuwaQg1gLgFH0KM1kyrqGNrhtmH1V08P7gYAlgc6CHSR//1NhwcQs8zsGkT5Dw17HQtElD
	PYCYlRe5Q2l2dcln2xal8V5TbEXH3SPFLTizGEJv8rTkZQ9WOhU7hMqwiVoSAA==
Date: Thu, 19 Oct 2023 08:25:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Yi Yang <yiyang13@huawei.com>
Cc: <richard@nod.at>, <vigneshr@ti.com>, <mpe@ellerman.id.au>,
 <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
 <u.kleine-koenig@pengutronix.de>, <tudor.ambarus@linaro.org>,
 <robh@kernel.org>, <linux-mtd@lists.infradead.org>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v2] mtd: powernv_flash: check return value of
 devm_kasprintf()
Message-ID: <20231019082556.5053b900@xps-13>
In-Reply-To: <20231019013050.316022-1-yiyang13@huawei.com>
References: <20231019013050.316022-1-yiyang13@huawei.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_232609_324204_C4864767 
X-CRM114-Status: UNSURE (   7.39  )
X-CRM114-Notice: Please train this message.
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

SGkgWWksCgp5aXlhbmcxM0BodWF3ZWkuY29tIHdyb3RlIG9uIFRodSwgMTkgT2N0IDIwMjMgMDE6
MzA6NTAgKzAwMDA6Cgo+IGRldm1fa2FzcHJpbnRmKCkgcmV0dXJucyBhIHBvaW50ZXIgdG8gZHlu
YW1pY2FsbHkgYWxsb2NhdGVkIG1lbW9yeQo+IHdoaWNoIGNhbiBiZSBOVUxMIHVwb24gZmFpbHVy
ZS4gRW5zdXJlIHRoZSBhbGxvY2F0aW9uIHdhcyBzdWNjZXNzZnVsIGJ5Cj4gY2hlY2tpbmcgdGhl
IHBvaW50ZXIgdmFsaWRpdHkuCj4gCj4gRml4ZXM6IGFjZmU2M2VjMWM1OSAoIm10ZDogQ29udmVy
dCB0byB1c2luZyAlcE9GbiBpbnN0ZWFkIG9mIGRldmljZV9ub2RlLm5hbWUiKQo+IFNpZ25lZC1v
ZmYtYnk6IFlpIFlhbmcgPHlpeWFuZzEzQGh1YXdlaS5jb20+CgpQbGVhc2UgcmUtcmVhZCBteSBw
cmV2aW91cyBhbnN3ZXIgYW5kIGFkZHJlc3MgYWxsIGNvbW1lbnRzLgoKVGhhbmtzLApNaXF1w6hs
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
