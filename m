Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBBE1CCF9EA
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Oct 2025 08:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=D054769zlFDbVa7tvf3RAzgpBThgnUVXHznEbCcgnZM=; b=uyx1jhob4tPATJ
	xgQAhYWm73HnZ5YmeowLvZ0OIETdcssGm2HyZT6nVI8Ed/mXJY8HiXf7j3xgCYMP4MZbEsAmSUMnY
	TbDUvZgIvZURflXMwKm83jauNoHG70FDVUmboPrt3O4npD32n4VGqjanA2H6xT1BrfXqe4KYng05u
	DslMQR5Kw207CXLRexMW6+WuKATAUpdFup/6n+a7XZK5ztLeItETy5oMZ4fOUxsV4jEfxqIZjXpFW
	h3kW646hQvaSATgZ/1NdBWiNiuyk6F8JBzIpXMsIE6cYUBqlOwebF17ki4zJdiFbTi8d64Cwcbkbe
	xUuvmuyGVcXC+j/sxLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIqP-0000000DP7O-2dth;
	Mon, 27 Oct 2025 08:44:49 +0000
Received: from mail.stratevo.pl ([51.75.21.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDIpg-0000000DOAZ-1VON
	for linux-mtd@lists.infradead.org;
	Mon, 27 Oct 2025 08:44:12 +0000
Received: by mail.stratevo.pl (Postfix, from userid 1002)
	id 7B8F923BE0; Mon, 27 Oct 2025 08:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=stratevo.pl; s=mail;
	t=1761554533; bh=WgPvEaA7Jyt6CWeuFbgwfiiyPfJ8i9ON9uEjDF6DE/Q=;
	h=Date:From:To:Subject:From;
	b=oyo1H/b0vVZ3SYjMH9SyTfHKUiXvCY4lOSQ3ZnqfFEKKt7baBMEBJT4HipcMxZ4XJ
	 J+m6mn44Yy9wpH9HOyanlmwXhIkSFoDq9qvNxWS5GKFj0+nosn6pJjTVaSFFdGxGjT
	 TFfQmVvtXiDwSfZ/zdCroEyvBfSC4TQAxpUCUn6c0uG5/A+hmzAaniEeR7NEgK+ckE
	 WuJbEjDie4xLhXCRQ929QD29PWfdTdPO8AS5/8GEskcJmteAdMWxfEAgk9AVJEMuPn
	 KFqZVkej1UpJMuNcqqG2Y2d2LPiH5j/HTtdS0Zs+/MpPkkrBgnFJNqBK6T457Ogcm2
	 UxuCXTShPpc8w==
Received: by mail.stratevo.pl for <linux-mtd@lists.infradead.org>; Mon, 27 Oct 2025 08:40:44 GMT
Message-ID: <20251027074500-0.1.3c.osph.0.sq2uk7tvi9@stratevo.pl>
Date: Mon, 27 Oct 2025 08:40:44 GMT
From: "Arkadiusz Jakubowski" <arkadiusz.jakubowski@stratevo.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Pytanie_o_samoch=C3=B3d_?=
X-Mailer: mail.stratevo.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_014404_726420_3C91712D 
X-CRM114-Status: UNSURE (   1.93  )
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

RHppZcWEIGRvYnJ5LAoKZmlybXkgdGFraWUgamFrIFBhxYRzdHdhIGtvcnp5c3RhasSFIHogbm93
b2N6ZXNuZWdvIHJvendpxIV6YW5pYSBkbyBtb25pdG9yb3dhbmlhIHcgY3phc2llIHJ6ZWN6eXdp
c3R5bSBwb3p5Y2ppIGZpcm1vd3ljaCBzYW1vY2hvZMOzdyBvcmF6IGljaCB3c2thxbpuaWvDs3cg
ZWtzcGxvYXRhY3lqbnljaCwgbS5pbi4gcHJ6ZWJpZWcgaSBzcGFsYW5pZS4gCgpKdcW8IHcga3LD
s3RraW0gY3phc2llIG9kIHdkcm/FvGVuaWEgb2JzZXJ3dWrEhSBuYXdldCAyMCUgb3N6Y3rEmWRu
b8WbY2kgendpxIV6YW5lIHogdcW8eXRrb3dhbmllbSBhdXQgaSBzcHJhd25pZWpzesSFIHJlYWxp
emFjasSFIGRvc3Rhdy4KCk1vZ8SZIG9wb3dpZWR6aWXEhywgamFrIHRha2llIHJvendpxIV6YW5p
ZSBzcHJhd2R6aSBzacSZIHcgcHJ6eXBhZGt1IFBhxYRzdHdhIGR6aWHFgmFsbm/Fm2NpPwoKClBv
emRyYXdpYW0KQXJrYWRpdXN6IEpha3Vib3dza2kKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQgZGlzY3Vzc2lvbiBtYWlsaW5n
IGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1t
dGQvCg==
