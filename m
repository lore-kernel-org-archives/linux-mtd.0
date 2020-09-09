Return-Path: <SRS0=hzeh=CS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E148C433E2
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 17:54:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D62B721D46
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2020 17:54:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vK+yaUp+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D62B721D46
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lwn.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lAdZC/5nnD7mjcgVLore0+xDh5ZG9G+sLWUA50TYznc=; b=vK+yaUp+eGayjHOf7N9nilUBV
	QsZJY7g3PtNnZd+psfgEgmh540L7afUs3JX/CjFKtpgjVVizG21bBr103Ax9z0lHGAVJLf2JpCGD5
	OpHhTMjKnl7/2vWzZ7I+SnLXVsVhEmoc6Q0amb6Bt6zgTDffq+C6BOPnZ27MeFORqZiMnJgIBLK4I
	BXIGivw9ER00aZprVq1g2chxse4/fZuqYmwiyZ7NsNW3nJ65voHPHmGBhqqwcauRF/yvKKPpEdBS9
	08nG8IDW2mJLyUoleJizC7Yq0NuZXJX1t3z6sscoUKxxIyfHpSFMqAYNAL3TL2JPpP3wWqH8E/2CW
	oXFi4BWAA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kG4I8-0005yy-NA; Wed, 09 Sep 2020 17:53:56 +0000
Received: from ms.lwn.net ([2600:3c01:e000:3a1::42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kG4I5-0005xV-UV
 for linux-mtd@lists.infradead.org; Wed, 09 Sep 2020 17:53:54 +0000
Received: from lwn.net (localhost [127.0.0.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 869CE37C;
 Wed,  9 Sep 2020 17:53:51 +0000 (UTC)
Date: Wed, 9 Sep 2020 11:53:50 -0600
From: Jonathan Corbet <corbet@lwn.net>
To: Jonathan =?UTF-8?B?TmV1c2Now6RmZXI=?= <j.neuschaefer@gmx.net>
Subject: Re: [PATCH v2 0/2] ubifs: Fixes around ubifs-authentication.rst
Message-ID: <20200909115350.04c2f5b4@lwn.net>
In-Reply-To: <20200905204326.1378339-1-j.neuschaefer@gmx.net>
References: <20200905204326.1378339-1-j.neuschaefer@gmx.net>
Organization: LWN.net
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_135354_221313_7C11E724 
X-CRM114-Status: GOOD (  10.74  )
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

T24gU2F0LCAgNSBTZXAgMjAyMCAyMjo0MzoyNCArMDIwMApKb25hdGhhbiBOZXVzY2jDpGZlciA8
ai5uZXVzY2hhZWZlckBnbXgubmV0PiB3cm90ZToKCj4gSW4gdGhlc2UgdHdvIHBhdGNoZXMsIEkg
YWRkIHViaWZzLWF1dGhlbnRpY2F0aW9uLnJzdCB0byBNQUlOVEFJTkVSUyBhbmQKPiBhZGQgYSBo
ZWFkaW5nIHRvIHByZXZlbnQgdGhlIGNoYXB0ZXIgaGVhZGluZ3MgZnJvbSBiZWluZyBsaXN0ZWQg
aW4KPiBmaWxlc3lzdGVtcy9pbmRleC5odG1sLgoKSSd2ZSBhcHBsaWVkIHRoZSBzZXQsIHRoYW5r
cy4KCmpvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
