Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B0D6C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 09:08:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7tS4/Dr6fYLkHW521+KKlEpX0ruI2SZhu+i+oxlWK60=; b=WISj1b36PezIvE
	csda+rziXmP9Zd4YrCz0dDViSoMiBNY/5kKCtIkfjndd362bQX+intCbYDHvXU2l5KscBUSjEUetS
	xR0mkBmi2r5wT/9PQulS493fiQA+UDGXgzjxw6TTPCbZHtPGtr1aaBruazmtF+0c1bnYtQlIrmLM9
	aHNl5O8nXR3Gnfh0i8zmSgOz9SG7+dhDAYeVf5h6jWxF4xDuEyif6M13Nne4wPjsXu7yxA5Sleqpr
	4m/IG0m1ojvclEnHAn1It8sxK6K1Dth8iTjKL3kNVmEeRAjDoLTlGESz1eyO8Y6ddhlwFYETxc8JC
	0stAeCP3f2B5Nu3chW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt42m-002i2D-4Q; Mon, 23 May 2022 09:08:04 +0000
Received: from mail.tireplot.pl ([46.183.184.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3Ed-002MJW-Rm
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 08:16:19 +0000
Received: by mail.tireplot.pl (Postfix, from userid 1001)
 id D186D4A3FA; Mon, 23 May 2022 10:06:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tireplot.pl; s=mail;
 t=1653293305; bh=Rfzvu4C+yJ1wyuJ4V+t/udh6cgYEQVnY6S5ltO4wdNg=;
 h=Date:From:To:Subject:From;
 b=tOBSbjFaTRR0snOFKlUxM6q6TxUhGahRPwwjQnnZrRH9Knl+nvn5LxOdMGsBy4OBg
 RAYTfvL/WVoTWeZrnTBphkcXcrzL1JJPOloHu6udNHnred0XvhVZWHm/AJ5Fsyi5FT
 XlLjwa+weEqYWJLm4qaSlvtywCTsdJptU083x1iiiS+gU5u4xqMpinIgYlytTMCpfi
 WJt0o0XPE1zj0Z6U0D+rL476yc9mbbr0d3oRX2sFineKeRSqE+P93RN5mIeI0uTbrr
 16jFbrtU0+D3OOW35rOze1vQCYgJHbOugqTGeflm8KjogbHBhiMKh2MxbWfE9tbasq
 lumC1aeNEA5qw==
Received: by mail.tireplot.pl for <linux-mtd@lists.infradead.org>;
 Mon, 23 May 2022 08:05:32 GMT
Message-ID: <20220523084501-0.1.2k.fyn5.0.o95ql0uplp@tireplot.pl>
Date: Mon, 23 May 2022 08:05:32 GMT
From: =?UTF-8?Q?"Arkadiusz_Soko=C5=82owski"?=
 <arkadiusz.sokolowski@tireplot.pl>
To: <linux-mtd@lists.infradead.org>
Subject: Koszty instalacji fotowoltaicznej
X-Mailer: mail.tireplot.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_011616_086826_2D8EA430 
X-CRM114-Status: UNSURE (   0.86  )
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

RHppZcWEIGRvYnJ5LAoKc3R3b3J6eWxpxZtteSBzcGVjamFsbsSFIG9mZXJ0xJkgZGxhIGZpcm0s
IG5hIGtvbXBsZWtzb3fEhSBvYnPFgnVnxJkgaW53ZXN0eWNqaSB3IGZvdG93b2x0YWlrxJkuICAK
ClNwZWNqYWxpenVqZW15IHNpxJkgdyB6YWtyZXNpZSBkb2JvcnUsIG1vbnRhxbx1IGkgc2Vyd2lz
aWUgaW5zdGFsYWNqaSBmb3Rvd29sdGFpY3pueWNoLCBkeXNwb251amVteSBuYWpub3dvY3plxZtu
aWVqc3p5bWkgcm96d2nEhXphbmlhLCBrdMOzcmUgemFwZXduacSFIFBhxYRzdHd1IG9jemVraXdh
bmUgcmV6dWx0YXR5LgoKTW/FvGVteSBwcnp5Z290b3dhxIcgZGxhIFBhxYRzdHdhIHdzdMSZcG7E
hSBrYWxrdWxhY2rEmSBpIHByemVhbmFsaXpvd2HEhyBlZmVrdHkgbW/FvGxpd2UgZG8gb3NpxIVn
bmnEmWNpYS4KCkN6eSBzxIUgUGHFhHN0d28gb3R3YXJjaSBuYSB3c3TEmXBuxIUgcm96bW93xJkg
dyB0eW0gdGVtYWNpZT8KClBvemRyYXdpYW0KQXJrYWRpdXN6IFNva2/Fgm93c2tpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXggTVRE
IGRpc2N1c3Npb24gbWFpbGluZyBsaXN0Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbXRkLwo=
