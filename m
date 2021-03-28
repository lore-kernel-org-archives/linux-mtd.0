Return-Path: <SRS0=g52K=I3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 324B8C433C1
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:08:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C02A76196C
	for <linux-mtd@archiver.kernel.org>; Mon, 29 Mar 2021 17:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C02A76196C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZGfwYsVRrzNyXogN65cNi390mMGgAg03ALfnivubdiw=; b=bSV5VRi27cDutggzKdv9OHaev
	ENo12vJt2ADGnU74QmLWNpEoSkQawNbtlwGhyBdjWvBQzhKdSgADgKFWOt/slNRxwf3IZ/HCihSVW
	2NrAj2M47X8t1d0LJ1KrrL+XqHsj53rSOPM3RDQxbv1KcfSuF3fjse3DcWCvedErCh0aq9tVJ/lyd
	+JBHjpkgBsDxA2Pf42JkA6409ubi6FpN1EazyxaIum2Hec8f0a97vk0V4G5NjUcwG2GQC5mMVHVRG
	8hHDkeQguNOiaYJv6ITuLdbmfR6rG6rUHhY8tyBLNFG9ooYzlmUUl1hDXh2RVDlIDIcTzYYYCEuhI
	UhYF2MvXw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQvMK-000r0m-2H; Mon, 29 Mar 2021 17:07:24 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQoup-000ZWo-Te
 for linux-mtd@desiato.infradead.org; Mon, 29 Mar 2021 10:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=fxOol+X2zAz3qd4iihAeYfR9EKOV0KdUru4kXOy/BGI=; b=lgZ+v3SaYo02eqJGqtjDZ0iFlL
 miUFnVthj4yD+RyPDOEtWlCIFhkILK8FgIDQN0Fafiok2VCwx0ucUSX0jAgD13MRO3yNqtPle7rpJ
 u07ZRa8Bwh3Gcjf3rEV1J3PlPj475kuGgs5zxkzmMVkUDUWtqTnM/fxxk4fKjUKApYn5SjQm7+f9X
 OArUXJXOg+rh4/c32XOqmNScw7LPnQ6y1KsAYCesmA57BlJ3v8A9VuM4S4dgEYLeJmiWbF6rBKI8T
 2q3YbreQ2adU03Ixk7H6NBEi7yA5vxDwASP53j3Q+ewR+a0MCWVf8qG+U5qySjr7FQ4Vbxi+LFYi4
 ENcuASYg==;
Received: from relay12.mail.gandi.net ([217.70.178.232])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQZDe-000KhY-OS
 for linux-mtd@lists.infradead.org; Sun, 28 Mar 2021 17:29:04 +0000
Received: from xps13.home (lfbn-tou-1-1325-59.w90-89.abo.wanadoo.fr
 [90.89.138.59]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id A0E14200003;
 Sun, 28 Mar 2021 17:28:36 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Michael Walle <michael@walle.cc>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] mtd: require write permissions for locking and badblock
 ioctls
Date: Sun, 28 Mar 2021 19:28:36 +0200
Message-Id: <20210328172836.10072-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303155735.25887-1-michael@walle.cc>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'1e97743fd180981bef5f01402342bb54bf1c6366'
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_182900_669853_DCB07018 
X-CRM114-Status: UNSURE (   6.43  )
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

T24gV2VkLCAyMDIxLTAzLTAzIGF0IDE1OjU3OjM1IFVUQywgTWljaGFlbCBXYWxsZSB3cm90ZToK
PiBNRU1MT0NLLCBNRU1VTkxPQ0sgYW5kIE9UUExPQ0sgbW9kaWZ5IHByb3RlY3Rpb24gYml0cy4g
VGh1cyByZXF1aXJlCj4gd3JpdGUgcGVybWlzc2lvbi4gRGVwZW5kaW5nIG9uIHRoZSBoYXJkd2Fy
ZSBNRU1MT0NLIG1pZ2h0IGV2ZW4gYmUKPiB3cml0ZS1vbmNlLCBlLmcuIGZvciBTUEktTk9SIGZs
YXNoZXMgd2l0aCB0aGVpciBXUCMgdGllZCB0byBHTkQuIE9UUExPQ0sKPiBpcyBhbHdheXMgd3Jp
dGUtb25jZS4KPiAKPiBNRU1TRVRCQURCTE9DSyBtb2RpZmllcyB0aGUgYmFkIGJsb2NrIHRhYmxl
Lgo+IAo+IEZpeGVzOiBmN2U2YjE5YmM3NjQgKCJtdGQ6IHByb3Blcmx5IGNoZWNrIGFsbCB3cml0
ZSBpb2N0bHMgZm9yIHBlcm1pc3Npb25zIikKPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIFdhbGxl
IDxtaWNoYWVsQHdhbGxlLmNjPgo+IFJldmlld2VkLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgo+IEFja2VkLWJ5OiBSYWZhxYIgTWnFgmVja2kgPHJh
ZmFsQG1pbGVja2kucGw+Cj4gQWNrZWQtYnk6IFJpY2hhcmQgV2VpbmJlcmdlciA8cmljaGFyZEBu
b2QuYXQ+CgpBcHBsaWVkIHRvIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L210ZC9saW51eC5naXQgbXRkL25leHQsIHRoYW5rcy4KCk1pcXVlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1U
RCBkaXNjdXNzaW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW10ZC8K
