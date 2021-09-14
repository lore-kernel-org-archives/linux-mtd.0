Return-Path: <SRS0=r5sn=OE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 418CFC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:02:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF74560698
	for <linux-mtd@archiver.kernel.org>; Tue, 14 Sep 2021 17:02:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AF74560698
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dcqYPyMa/NuLazSa+r+v6MKnEQraYKjhWjfhri1Dnm0=; b=pOaa+oxzfUaeY7
	FzJKmCnlS1Ny21ZS2cyL+Rm9T4woavAEFzhXRF8x3oBeDie8Fw+VOAGpbrjNXCx60iBk/d0n1C0ez
	ORDdTG7vYRJBFS70Tm8yq/XmJuqknKecPJuB2G1xj2YnXAqOG+0AB+Hk1E9z8S93RIuks+BZzuTOH
	a7Syn7sOQhVi+U31FlPyJNFprLwBqT0tor/7mRQY3nZNHFoSNlK70lZjO2Q5R2iuI1x5V5rkCBqC6
	7tDxZtQ45+8hknrcWn6HHagEFtD0ulE/Fc/3AO1XDk8BvpWtDi0bxZObvLGkP4fye2SRlMBHS+FhD
	Wm1gy8HXdkwtpGvKeyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQBos-006WGw-KT; Tue, 14 Sep 2021 17:02:06 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQBop-006WFv-Ny
 for linux-mtd@lists.infradead.org; Tue, 14 Sep 2021 17:02:05 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 2FD0B40008;
 Tue, 14 Sep 2021 17:01:57 +0000 (UTC)
Date: Tue, 14 Sep 2021 19:01:56 +0200
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Xin Xiong <xiongx18@fudan.edu.cn>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra
 <vigneshr@ti.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, yuanxzhang@fudan.edu.cn, Xiyu Yang
 <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>
Subject: Re: [PATCH] drivers/mtd/nand: fix reference count leaks in
 ebu_nand_probe
Message-ID: <20210914190156.56509462@xps13>
In-Reply-To: <20210910165316.2500-1-xiongx18@fudan.edu.cn>
References: <20210910165316.2500-1-xiongx18@fudan.edu.cn>
Organization: Bootlin
X-Mailer: Claws Mail 3.17.7 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210914_100203_960683_E8D6AFDB 
X-CRM114-Status: GOOD (  10.57  )
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

SGVsbG8sCgp4aW9uZ3gxOEBmdWRhbi5lZHUuY24gd3JvdGUgb24gU2F0LCAxMSBTZXAgMjAyMSAw
MDo1MzoxNiArMDgwMDoKCj4gVGhlIHJlZmVyZW5jZSBjb3VudGluZyBpc3N1ZSBoYXBwZW5zIGlu
IHNldmVyYWwgZXJyb3IgaGFuZGxpbmcgcGF0aHMKPiBvbiB0d28gcmVmY291bnRlZCBvYmplY3Qg
cmVsYXRlZCB0byB0aGUgImVidV9ob3N0IiBvYmplY3QgKGRtYV90eCwKPiBkbWFfcngpLiBJbiB0
aGVzZSBwYXRocywgdGhlIGZ1bmN0aW9uIGZvcmdldHMgdG8gYmFsYW5jZSBvbmUgb3IgYm90aAo+
IG9iamVjdHMnIHJlZmVyZW5jZSBjb3VudC4gRm9yIGV4YW1wbGUsIHdoZW4gcmVxdWVzdCBkbWEg
dHggY2hhbiBmYWlscywKPiB0aGUgZnVuY3Rpb24gZm9yZ2V0cyB0byBkZWNyZWFzZSB0aGUgcmVm
Y291bnQgb2YgImVidV9ob3N0LT5kbWFfcngiCj4gaW5jcmVhc2VkIGJ5IGRtYV9yZXF1ZXN0X2No
YW4oKSwgY2F1c2luZyByZWZjb3VudCBsZWFrcy4gV2hhdCdzIG1vcmUsCj4gdGhlICJlYnVfaG9z
dC0+Y2xrIiBvYmplY3QgYWxzbyBuZWVkIHRvIGJlIGhhbmRsZWQgY29ycmVjdGx5Lgo+IAo+IEZp
eCB0aGlzIGlzc3VlIGJ5IGtlZXBpbmcgdGhlIHJldHVybiB2YWx1ZSBhbmQganVtcGluZyB0bwo+
ICJlcnJfY2xlYW51cF9kbWEiIGxhYmVsLgoKSSB0aGluayBpdCBoYXMgYWxyZWFkeSBiZWVuIGZp
eGVkIHVwc3RyZWFtOgowNzkyZWM4MjE3NWUgKCJtdGQ6IHJhd25hbmQ6IGludGVsOiBGaXggZXJy
b3IgaGFuZGxpbmcgaW4gcHJvYmUiKQoKVGhhbmtzLApNaXF1w6hsCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Np
b24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtbXRkLwo=
