Return-Path: <SRS0=qoSA=CO=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3A5C433E2
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 20:51:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DFDB20738
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Sep 2020 20:51:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xWgHQRea";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="NChQ5QRl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DFDB20738
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9syc8nclKDwnn0zaDWyC9D5L8jTCJL81vZdOidgkkiQ=; b=xWgHQReaPgZTDkweGTOwnxjOMi
	ieM9dkTOiVVACq4aFsNZZJvC9xzBxjZgq3hthb6VxFdA5WnVU+lmmYNwop57YDFgRkM2FBEk2J4ec
	xyBoc8LF+mtY/5PS3WlLFrXw/DyWbi10lmaz8ctPKNZtNszHho5qjzb3SBYQy7UiHO/llDtguOM1l
	8DVmuPuyXJtf6Jbbd3L0XdIIRbd5Vjzq1lXWZCfny6s/c/a35CR+JFDeDIm9oWk7cR1YZ7NsH+p9l
	px/7nRUJlOtewINjf4dTb+uVFlqBjPNXmftxu3kFSXvlRtAz48KCLTtEbetvlMkxYKaQHR+d33zG7
	gBbJ0M9w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEf95-0002u0-Mm; Sat, 05 Sep 2020 20:50:47 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEf93-0002tD-2e
 for linux-mtd@lists.infradead.org; Sat, 05 Sep 2020 20:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599339036;
 bh=bor4CEdYF1V2mtU3/M6bTkzsiyDSM5d0H+HasDvMa98=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=NChQ5QRlHjzgcut4ig2y/0EQb/m5wKlvN1urLI2wR3ka1fTNhhuKCl3DsWxhxvnM0
 mOsfKwt9eitUfYvz9CV3JMqlhHzeronJ3iLpIeaxvfnxYUyKAWX+ywf+CqIFvGgVm0
 jx66tVKYQQLjV7/bUkMlfTmZl4be7ib/T4h+BReE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([5.146.195.151]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MMXUD-1jxH8d0oMh-00JeMR; Sat, 05
 Sep 2020 22:43:32 +0200
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: linux-mtd@lists.infradead.org
Subject: [PATCH v2 0/2] ubifs: Fixes around ubifs-authentication.rst
Date: Sat,  5 Sep 2020 22:43:24 +0200
Message-Id: <20200905204326.1378339-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:6Mu0SdARJcxwbmery0IeDoo6tYPNLibtRBfZ3PBuSS279pqe03n
 t99PeIZEDrGDlKLxiRYfUcaGosOTs+g6UYhcG9lIHc7Kd4qdtdlbtCA8wKRfV7/lllCegE1
 G4dhk0svxySQcGcUfwTCt3MaXjaAqZQgmzjk8A7MDeCzCQpsM6SxToPoXXmrVqBZtUij4i2
 VxGp6soRb/MdvhAVw96cQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ir8l8cwbibQ=:wOXeXBqt1Pa6jVE38kUUdg
 g7UukDgmYAwfVFIX7BKd8fmeIv42LayYAkodq+JRwbhWGAPtDWLuMrerqsNRIa/EWlRQyZOid
 ayIZmRycA4ZB+ZGQKXpSLtvkL8c3fbTFvyKUzGv9BBnRY2LuYfIKBACajuBds8F9yIxp1NJi9
 EFlPqpRmPTFoYCIrn9Ej45fyeD8E47pS5xjgbKwhV/nqI0Rkgsc66CaInnnqzVwtvUUB3uFdB
 A1CSHNOoJl/LSio1XmVfi/i4skhOmrUUx83IBg/fMvUu9tKPPUM6Q8HfsxVCEsYfG4bEvjgs3
 HeoGkcJRCFHHYMScnZEmUVZmy8rujmtMo+tlMCO8mswTwPRweBCj8dbTxRH99krCB+bBCKIch
 GLiYaBdRFCVARvSsD8YQKILsdiC4pF6YqGcAeohCHfxcPrUp++tXxJD3bQ/JGscMkL5LGIzrL
 EaHHB5395lX2piTqlWVX0nRb11xfrcJbPesBXANfTfT0B5jCMy48ojJb2OQKeG+jJmWN5UOaA
 QRX6dDiQSebwe5pNSnSv2xGgJnGo6r1HnUFbMZgv3+RR/8UmQk/GR8ndwUbIZlwX/NVlc+hQl
 pBvTMjjljBf3z5vyNufxamL4A4HvcbAxbfeyEUpibvxflrRi6QdVMY35DGWjBHZkt2lB1wQxA
 x/4ctqgjsdNe4d7/ejn/U5YUk0LTHqfSLB5HukFx2KXSDvAK+h5VaHuUShhts409KXBvQr17L
 6n+0CwPFJDVjewnLcmsG9bCFEdlCGyTc+vCnV9C99rqyaLNRZEPkDOjaQ/2BWbhDyvS/+A2vG
 Xs75clxnsRtCrQs6UqtBh0+BKYb/7OmzmRHi5PcjhGzZGQpL78c6UI8sOxgnPmENnJxRxr/cV
 Ma8c4h9PAw1BHlETt6okdYoFzgtqQotQKwqrj71pGCthFrSh8e1nl4AX+4xG0wr3uws9mvyii
 WiEUJPu0oLpKAqyaQCN9w3uHC73KPB95AUYin011ZWILgBSQxunIili8LLvrzCY13FLqCicO9
 urtlV4gLLUeP/he10RQqfd7x1Yoydv6NTwfibhkg+ec4x5HjfHcNEAy1AUqS/XplCQJMKVfdR
 njwO/mC2GbRY8Y6LhjMJ+3o3DDQpTh6Lur1szcg1JSLcgRPgBJpyY56DknFwAkutrIfNGlV5G
 aJTxsKkpUIb23f5DQOF++3o8d8x1Gr6qNZcB72ET+JKCiNN96s0zw40Yv4cJhNill5OICFtXP
 BEgA58RTtdXYsGUwOehBhOKboO6vt4+V2YzP8NA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_165045_315345_123F6FAE 
X-CRM114-Status: GOOD (  12.20  )
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
Cc: Rob Herring <robh@kernel.org>, Miklos Szeredi <mszeredi@redhat.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Richard Weinberger <richard@nod.at>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-doc@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Tobin C. Harding" <tobin@kernel.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jaskaran Singh <jaskaransingh7654321@gmail.com>,
 "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

SW4gdGhlc2UgdHdvIHBhdGNoZXMsIEkgYWRkIHViaWZzLWF1dGhlbnRpY2F0aW9uLnJzdCB0byBN
QUlOVEFJTkVSUyBhbmQKYWRkIGEgaGVhZGluZyB0byBwcmV2ZW50IHRoZSBjaGFwdGVyIGhlYWRp
bmdzIGZyb20gYmVpbmcgbGlzdGVkIGluCmZpbGVzeXN0ZW1zL2luZGV4Lmh0bWwuCgp2MjoKLSBS
ZWJhc2VkIG9uIDUuOS1yYzMKLSBSZW1vdmVkIHBhdGNoZXMgdGhhdCBoYXZlIGJlY29tZSBvYnNv
bGV0ZQoKdjE6Ci0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDIxNDE3MDgzMy4y
NTgwMy0xLWoubmV1c2NoYWVmZXJAZ214Lm5ldC8KCkpvbmF0aGFuIE5ldXNjaMOkZmVyICgyKToK
ICBNQUlOVEFJTkVSUzogQWRkIHViaWZzLWF1dGhlbnRpY2F0aW9uLnJzdCB0byBVQklGUwogIGRv
Y3M6IHViaWZzLWF1dGhlbnRpY2F0aW9uOiBBZGQgYSB0b3AtbGV2ZWwgaGVhZGluZwoKIERvY3Vt
ZW50YXRpb24vZmlsZXN5c3RlbXMvdWJpZnMtYXV0aGVudGljYXRpb24ucnN0IHwgNiArKysrLS0K
IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMSAr
CiAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCi0tCjIu
MjguMAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tdGQvCg==
