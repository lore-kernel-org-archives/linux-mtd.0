Return-Path: <SRS0=2g81=4H=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 834D5C34047
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:18:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50A6A206E2
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Feb 2020 11:18:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b6HZa8nm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50A6A206E2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7E6TGCADK567VdW86nhFO7nNw6uFAWvYgfnzORz5RR4=; b=b6HZa8nmj6WTZ8
	9cs/kFAuOdqHeB/yJqRUeX4vvakvEt7FQCKW89ohjQh+nyOxkoKjqaE/AqG++rDTzIQ2z6ehJkieE
	QjxeFI5PiCSECKge2V086uNplgNcePxrlomsyo4JhMs0uw4jWPmwz3W4benx7Vq9T7tSWL9TnLbJG
	UOQ7Q90QMpeqERp+AgygodxXLY6LkRH0A9ZHAvooU/HtcHPktgvGOsI4yWa6FF8Rc4Dvx6YtBksk4
	6UdnqgMzYmnnqHQoZ+uQgJfijjLmYCxqABedQnfX93wTR57ZDomQUqB2b0lemcfBRfVNVRjwGA5V9
	N1dWG94DpfjUTzbnZOqQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j4NMo-0006SI-JJ; Wed, 19 Feb 2020 11:18:10 +0000
Received: from ms.lwn.net ([45.79.88.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j4NMm-0006Rv-Ge
 for linux-mtd@lists.infradead.org; Wed, 19 Feb 2020 11:18:09 +0000
Received: from localhost.localdomain (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 5CECF2E5;
 Wed, 19 Feb 2020 11:18:03 +0000 (UTC)
Date: Wed, 19 Feb 2020 04:17:58 -0700
From: Jonathan Corbet <corbet@lwn.net>
To: Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH 4/4] docs: ubifs-authentication: fix Sphinx warning
Message-ID: <20200219041758.3b7316b8@lwn.net>
In-Reply-To: <20200214170833.25803-4-j.neuschaefer@gmx.net>
References: <20200214170833.25803-1-j.neuschaefer@gmx.net>
 <20200214170833.25803-4-j.neuschaefer@gmx.net>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200219_031808_555672_42F6E17A 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Miklos Szeredi <mszeredi@redhat.com>, Rob Herring <robh@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "David S.
 Miller" <davem@davemloft.net>, linux-mtd@lists.infradead.org,
 "Tobin C. Harding" <tobin@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

T24gRnJpLCAxNCBGZWIgMjAyMCAxODowODowNyArMDEwMApKb25hdGhhbiBOZXVzY2jDpGZlciA8
ai5uZXVzY2hhZWZlckBnbXgubmV0PiB3cm90ZToKCj4gVGhpcyBmaXhlcyB0aGUgZm9sbG93aW5n
IHdhcm5pbmc6Cj4gCj4gRG9jdW1lbnRhdGlvbi9maWxlc3lzdGVtcy91Ymlmcy1hdXRoZW50aWNh
dGlvbi5yc3Q6OTg6IFdBUk5JTkc6Cj4gICBJbmxpbmUgaW50ZXJwcmV0ZWQgdGV4dCBvciBwaHJh
c2UgcmVmZXJlbmNlIHN0YXJ0LXN0cmluZyB3aXRob3V0IGVuZC1zdHJpbmcuCj4gCj4gU2lnbmVk
LW9mZi1ieTogSm9uYXRoYW4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KClNv
IHRoaXMsIElNTywgc2hvdWxkIGJlIGZpeGVkIGluIHBhdGNoICMyLCB3aGVuIHlvdSdyZSB0b3Vj
aGluZyB0aGUgZmlsZQphbnl3YXkuICBJIGRvbid0IHNlZSBhIGxvdCBvZiB2YWx1ZSBpbiBhZGRp
bmcgYSB3YXJuaW5nIHRvIHRoZSBkb2NzIGJ1aWxkCnRoZW4gaW1tZWRpYXRlbHkgcmVtb3Zpbmcg
aXQuCgpBbHNvLCBwbGVhc2Ugc2VuZCBhIGNvdmVyIGxldHRlciB3aXRoIG11bHRpLXBhcnQgc2V0
cyBsaWtlIHRoaXMgc28gd2UKa25vdyB3aGF0IHRoZSBvdmVyYWxsIG9iamVjdGl2ZSBpcy4KCk5v
dGUgYWxzbyB0aGF0IE1hdXJvIGlzIGFsc28gcGxheWluZyB3aXRoIHRoaXMgZmlsZSAoYW5kIHVi
aWZzLnR4dCwgd2hpY2gKcmVhbGx5IHNob3VsZCBiZSBpbmNsdWRlZCBhcyB3ZWxsKSBhdCB0aGUg
c2FtZSB0aW1lLgoKVGhhbmtzLAoKam9uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVREIGRpc2N1c3Npb24gbWFpbGluZyBsaXN0
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbXRkLwo=
