Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 402C5C4451B
	for <linux-mtd@archiver.kernel.org>; Fri, 17 Jul 2026 15:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Dbo7+N97Na0dFqT+LpB6j/av27ez7fLP7h33WhHbLg=; b=4L83y5uuhajSZZ
	LB4iFNxycsMzZjK5gluKeMwWcqPgiDQD4LWRK4bjxLsJcJeZV4uovI6dhHPJYg2RQZ0GhtA/C0lns
	ZsrbFKXwhxWOaLATjHDIWxK3FkQAE8lPn3ZLjYdKk/4t3LFcAI0V1e0tfOS3W8uftvSI4tp6tL2bP
	UewZDgw5xl4JJCiRZaMaYBkbfHU0mfS7aWSLK112Aap3P/ob/Ej0j6DuBlc2Yv4a6+VfMPo/5zRDj
	i1+TJ1luTR0fgh2FNWyxlwTpNrrPczjmBPTMlmzH4ioNJJVxKoc1c1Zw6WHbNi7eKznjvr+UOQ8Aw
	jgHV9CMRmIFaMob0mRpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkLi-00000002aik-26SI;
	Fri, 17 Jul 2026 15:19:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkkLf-00000002aiM-0oOd
	for linux-mtd@lists.infradead.org;
	Fri, 17 Jul 2026 15:19:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2A3154E40E1F;
	Fri, 17 Jul 2026 15:19:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D975D60361;
	Fri, 17 Jul 2026 15:19:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F077E11BD0007;
	Fri, 17 Jul 2026 17:19:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784301571; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V2XjwLdFWw9nN68U+TmN+qUlrAWuoUqwH1z1OqQWIoQ=;
	b=UCkCll8yC5qvw1/4uJL5hRysuAoa+cfNboL+gXgwcmGz/J4O0sFcPlu9teLLBT9s6zltHW
	ihu/rmEUBfPoUA7cZKbIMb/RbUrn/qVvwsTvA0SKucUbnNTGK7mbB0fcdK4xUtHkIBOBew
	U2kYLa/oEIw4Ak7DbIApw/hRMBy1DeXEvafOemTc9V9iog31G4P1qcU/BWoOr4fblCy/zs
	dI3l6g1YBVKxuqofnnq2xTzbh4hGjOgu7Ve6LU5v7rY2nGDP5FwrA0G8QvAs3zR4pas5/p
	xUZLIeF3HdlzoZy27GytkWpYv8JkOp+fDknE1GvpOK3jiJslrWmjx73LsGbVmw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: <Takahiro.Kuwano@infineon.com>
Cc: <mwalle@kernel.org>,  <pratyush@kernel.org>,  <richard@nod.at>,
  <vigneshr@ti.com>,  <linux-mtd@lists.infradead.org>
Subject: Re: Sashiko to track linux-mtd
In-Reply-To: <8733xikmb9.fsf@bootlin.com> (Miquel Raynal's message of "Fri, 17
	Jul 2026 11:16:58 +0200")
References: <875x38mlk7.fsf@bootlin.com> <2vxz4iismi2m.fsf@kernel.org>
	<87pl19s7ng.fsf@bootlin.com>
	<0fe3140096bc48a8e71838362220d9f8@kernel.org>
	<b224c6938e084763b017c63e0aa3fa3f@infineon.com>
	<8733xikmb9.fsf@bootlin.com>
User-Agent: mu4e 1.12.7; emacs 30.2
Date: Fri, 17 Jul 2026 17:19:28 +0200
Message-ID: <8733xhiqyn.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_081935_376103_B8505503 
X-CRM114-Status: UNSURE (   2.56  )
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

SGVsbG8gZm9sa3MsCgo+IFNvIEkgd2lsbCBtYWtlIGEgUFIgZm9yIGVuYWJsaW5nIGl0LCBidXQg
bGV0J3Mga2VlcCBpbiBtaW5kIHRoYXQgdGhpcyBpcwo+IGV4cGVyaW1lbnRhbCBhbmQgY2FuIGJl
IHJlLWRpc2N1c3NlZCBhdCBhbnkgdGltZS4KCkZZSTogaHR0cHM6Ly9naXRodWIuY29tL3Nhc2hp
a28tZGV2L3Nhc2hpa28vcHVsbC8zMzYKClRoYW5rcywKTWlxdcOobAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4IE1URCBkaXNjdXNz
aW9uIG1haWxpbmcgbGlzdApodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LW10ZC8K
