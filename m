Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1093ACD4F54
	for <linux-mtd@archiver.kernel.org>; Wed, 27 May 2026 07:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bV3ciVgkOAluXDTpUCv1czuSUwRG2u5SZzpqjuBZOsU=; b=T3G4L2mPkqkdll
	M1T18saMEnGMQ6ZizO8IDYU7z6xcdmJAD1i3a33NPOD13XJ/HZgBaVYSGUOB34OtsDQHeIUXkQFWG
	ecfM4OaArBdUH1C6Z6gNXbOCjqScWFF1l8qsl2iRwgRi+GzcA9oYssFQDRLjcgGszAVIoIXZ4LeSD
	KO88htDt7/Gz1HeENBV0vPSaurepG2gerRxH43KJ+yQBZPbudqjvzYz4Q7fTpY0zsNGc/Z/86AYuS
	KdSqMEvlmhGmEA+ZkQTEiIp0q6BjHx0qMFevKYZ/uP7fUEkXuz5DrbCK8t1Ri9hfUXrGDOn/EAzpn
	qJhqycxoSwKe2K77aCWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS96V-00000003Uy0-0X8f;
	Wed, 27 May 2026 07:55:03 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS96T-00000003Ux3-02kX
	for linux-mtd@lists.infradead.org;
	Wed, 27 May 2026 07:55:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 7354D4E42D65;
	Wed, 27 May 2026 07:54:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 46EF4601A1;
	Wed, 27 May 2026 07:54:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D59741088805F;
	Wed, 27 May 2026 09:54:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1779868498; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=OR5smos8oJiaURiWgzDy2/Y7pE368dndxfCk9Gx4JZU=;
	b=chTzOlawSmtPlqEOmClvdzeITUwG+nxb480dBJ+3l2z9d1LFyEuBxLm0qXwyQXGs4njbBu
	8X6PxXwbaklFswz0xhAKayScSHM0kwhCcErCbbbvC9S1O6mJZJDMvkM0sSOjlfgOji5LUj
	OSmUJTVSLTkx4OkqY2KunLT7Ry5azbnyyi4zanRMOZwL6+BqK+N650LsKK7QYIAgeBdV75
	nKDzLGBagBtx6ydzyHeTh2Iq1aQTF3QvuWBfInMITdATUqmNvt+NpvXiUn1wpPmFkaQ/jb
	elBjn8hrvt7QNl90SdTH+9p+aFhT/gF+0/kogpw8Xh7QpJr4iWxStLjSuBS7cQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,  Jonathan Corbet <corbet@lwn.net>,  Shuah
 Khan <skhan@linuxfoundation.org>,  Pratyush Yadav <pratyush@kernel.org>,
  Michael Walle <mwalle@kernel.org>,  Takahiro Kuwano
 <takahiro.kuwano@infineon.com>,  linux-mtd@lists.infradead.org,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH -next] mtd: spi-nor: testing locking, fix new doc build
 warnings
In-Reply-To: <20260526172341.773398-1-rdunlap@infradead.org> (Randy Dunlap's
	message of "Tue, 26 May 2026 10:23:41 -0700")
References: <20260526172341.773398-1-rdunlap@infradead.org>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Wed, 27 May 2026 09:54:56 +0200
Message-ID: <87bje1l227.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_005501_183472_CC1AD6A7 
X-CRM114-Status: UNSURE (   4.12  )
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

T24gMjYvMDUvMjAyNiBhdCAxMDoyMzo0MSAtMDcsIFJhbmR5IER1bmxhcCA8cmR1bmxhcEBpbmZy
YWRlYWQub3JnPiB3cm90ZToKCj4gQWRkIGEgYmxhbmsgbGluZSB0byBwcmV2ZW50IGRvY3VtZW50
YXRpb24gYnVpbGQgd2FybmluZ3M6Cj4KPiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkL3Nw
aS1ub3IucnN0OjIxNTogRVJST1I6IFVuZXhwZWN0ZWQgaW5kZW50YXRpb24uIFtkb2N1dGlsc10K
PiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvbXRkL3NwaS1ub3IucnN0OjIxNjogV0FSTklORzog
QmxvY2sgcXVvdGUgZW5kcyB3aXRob3V0IGEgYmxhbmsgbGluZTsgdW5leHBlY3RlZCB1bmluZGVu
dC4gW2RvY3V0aWxzXQo+Cj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGlu
ZnJhZGVhZC5vcmc+CgpSZXZpZXdlZC1ieTogTWlxdWVsIFJheW5hbCA8bWlxdWVsLnJheW5hbEBi
b290bGluLmNvbT4KClRoYW5rcyEKTWlxdcOobAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNzaW9uIG1haWxpbmcg
bGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW10
ZC8K
