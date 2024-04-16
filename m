Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F01C4345F
	for <linux-mtd@archiver.kernel.org>; Tue, 16 Apr 2024 07:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pL7r62yy3OP+19nbwhSEPTy0kENbcOjJScam1zhZUQ=; b=gA44UvE+2QYWFG
	ZknGWbME3IBtrpDjdsTk/MHc4oBSn46BGNuFJHgs77us0dSmOChJs/vsgHVaY/97Naso9b4rJI3Vn
	Dl2VImvT1s4+KtgIcdc7yOmw7Ehd7ikbX9cDWn0CSEQig6tmE8CAMOyrn2ha7HfxbDTaInr8yE/cx
	099W/USp8qYsZkg3vqmxGzXurs4VZsWFWlqjpLdTthFIm6dlobnQcp3pkwi3H8kAGxAkqXlwDZZCP
	X4N0RV1WaaG27sWhtMYTpdenkB4eZQ6GLiMHQj2crk5BY9SilKr1n7HkkqadBwqXeh+S+rUjB080J
	ytbn4hmf0NA9Es8um2Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdNH-0000000BIc5-1X7t;
	Tue, 16 Apr 2024 07:37:03 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdNC-0000000BIZr-1114
	for linux-mtd@lists.infradead.org;
	Tue, 16 Apr 2024 07:37:01 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id E1C5EA315B; Tue, 16 Apr 2024 09:36:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1713253010;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=AwFSDAC3E6VEiDoxeca07iZvNBpMoGXSpaLMOUVCqsDGDK+NNa2fBOf4/O8Tiid0a
	 56Pk+ZdqkbT8AIXrlOH4n/tFQOMV5Bhc9h07XIOmbC8RKw2/8a58HEsfawoj9p4Exi
	 c4UayGp3/NvQRbuq6jV3VjifjxIwDi+zorcsDYtkYeIOiDNSWUf2kGNbBrX6jL28i6
	 a8Q0fw88arpQX7EA0+RHJPxJoFGUTRUF/6E0TQPzTTt74R9/Nuxq/HMyzmHb+aCE7n
	 LgVNHSoVeNzDyrUf5DNjbdXDtjwSR1Nclb3uOKoaiWVS5ykKEFAysSWIbtBURnFlcp
	 4taB20rX0jioA==
Received: by mail.createsavvy.pl for <linux-mtd@lists.infradead.org>; Tue, 16 Apr 2024 07:36:14 GMT
Message-ID: <20240416084500-0.1.ec.2atwa.0.lrc74cut33@createsavvy.pl>
Date: Tue, 16 Apr 2024 07:36:14 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_003659_020493_A3ACA03D 
X-CRM114-Status: UNSURE (   0.38  )
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
