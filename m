Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E08CD1288
	for <linux-mtd@archiver.kernel.org>; Fri, 29 Mar 2024 08:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pL7r62yy3OP+19nbwhSEPTy0kENbcOjJScam1zhZUQ=; b=OndTB8d7DF237m
	YujnmoENcMI4XpErXYlz5bxLDuryIF/xsvgpNJsPHYj8bJg5rmF9EanRFv/WglAz4/1ljoRi7DYDB
	oihOAEuV6FRmiun3SbD4fHPIFCWul+Qgrop2361Cp6UOeux+DUDLUERXZ6zwf3iOL1XvWb11cB9Eh
	G8tUHyanGhQgdZ1aJSy8yIj9Wzv5zpLTueQnP+2DosBrfk/yW633v0RPi63T09TjuKZ6zQyT7+GME
	UkcvgrUb5WDPYyctlD7dgg6CcWuFGepXhiDG7qB25lP5/BmVvAkf+hKgXUMuJW4UQR8t+TsDFqmPV
	mgR1wmbULbbsMgnK3GNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7eO-0000000HK6D-3G1V;
	Fri, 29 Mar 2024 08:31:48 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7eL-0000000HK4c-0Orj
	for linux-mtd@lists.infradead.org;
	Fri, 29 Mar 2024 08:31:47 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id 6BBA1A3FA1; Fri, 29 Mar 2024 08:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1711701070;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=mMG84L8gAyywnfruMs/7YrQzIt5rcYa+J0EfZ4y542h+oRlZyND8IgqEPB3Y638U4
	 Uz/u8UHXL1a0C/gSbXqEIxUl7tG6ZRXXD6ZfJKZeC9EEgp/pBUICcp2WFGzhhgvqIz
	 k553tXbB2vi7iJlG80F5ljdOD/smGRQfE6feot0uFdssrPAtKdLp+oDrIS7fFn5fP5
	 UVRYiLIKRNf6vllEHhbfB1P7c/y7Mrxa4F476sxV3F0xoHcAmY7LvZzEkTrT+YFWOL
	 sV69t0Bm0nwIOF2ukOBO+/6Soe/DH82aepChtPM7cRXcQbrW2Red9d4paahW7rNlOl
	 MjpjoS1KHvLtg==
Received: by mail.createsavvy.pl for <linux-mtd@lists.infradead.org>; Fri, 29 Mar 2024 08:30:16 GMT
Message-ID: <20240329074500-0.1.e1.27v0i.0.f063kcm34o@createsavvy.pl>
Date: Fri, 29 Mar 2024 08:30:16 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_013146_123162_6A7554CE 
X-CRM114-Status: UNSURE (   1.45  )
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

RHppZcWEIGRvYnJ5LAoKQ3p5IGplc3QgbW/FvGxpd2/Fm8SHIG5hd2nEhXphbmlhIHdzcMOzxYJw
cmFjeSB6IFBhxYRzdHdlbT8KClogY2jEmWNpxIUgcG9yb3ptYXdpYW0geiBvc29ixIUgemFqbXVq
xIVjxIUgc2nEmSBkemlhxYJhbmlhbWkgendpxIV6YW55bWkgemUgc3ByemVkYcW8xIUuCgpQb21h
Z2FteSBza3V0ZWN6bmllIHBvenlza2l3YcSHIG5vd3ljaCBrbGllbnTDs3cuCgpaYXByYXN6YW0g
ZG8ga29udGFrdHUuCgoKUG96ZHJhd2lhbQpNYWtzeW1pbGlhbiBDaXN6ZXdza2kKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eCBNVEQg
ZGlzY3Vzc2lvbiBtYWlsaW5nIGxpc3QKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1tdGQvCg==
