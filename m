Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533B1C54E58
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Mar 2024 08:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+pL7r62yy3OP+19nbwhSEPTy0kENbcOjJScam1zhZUQ=; b=sZbzhWClr/vw+Y
	W8kKM8SsycfaXeuFCPrWQwPocNml7P2UYFwQPbEGZIFjPiaDYgCMYH/S8UFNXUuCWO6VQyLJEgw0h
	lAo+FKd37TzgiL4ePTaG72h79jWL4E+hejFi7AlTrCphAqQw2XLy01SIFxmDVMJ5TI7zjg6adTmf4
	wVPIuYwApAfUboUTyepcT5xLEkEmVme3qn12E/pUmAWJdyiJs8w2aDsO0XcpNirlQAxbgyLd4QI7K
	ilPBrN1gGBKz6b8dImMnU7Rtw4JuVyW9zrx70UJHtTzu24lCNG1j+Cn4SYO37MvrVj5NBB/QvoV0r
	4imsL3SNbumM6dBjx5bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxWx-00000004t7M-2R79;
	Tue, 12 Mar 2024 08:30:39 +0000
Received: from mail.createsavvy.pl ([51.195.117.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjxWr-00000004t6Y-40gP
	for linux-mtd@lists.infradead.org;
	Tue, 12 Mar 2024 08:30:36 +0000
Received: by mail.createsavvy.pl (Postfix, from userid 1002)
	id 4CC34A2C4F; Tue, 12 Mar 2024 08:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=createsavvy.pl;
	s=mail; t=1710232226;
	bh=Q787bUI8wqiKELAtyWRvCTxaBwNaZfpooGhkyk63cfU=;
	h=Date:From:To:Subject:From;
	b=bBFAyLagbPiqezxjRWLJeQw0BeR0+UmPmTuqJmlU8C+n0Ck8tRc8BXr9yMA8Ar8wp
	 C35mATElI9kSJxhiiDYzl7TG/QvWtk4Kd2WQFnkXJ1xqEGY22raeALLGExcqIG4nFx
	 NCzYGsgxnQTS23lD8FkqjnZ6I/V+TAMm1+zcvw9KmZdbsuVbcTkzd1p8rp6q03fwSW
	 iAciGLdDnJx8rLgm/37LE5+Tg9YatgR0lTceyGEe2UpbMD3E79XMtj3O/3iOjB/+Ka
	 S0tmp/PeTNyNbP9VkV+2L1CnquD1NfuAbLseDWq8eB8EthlYmvINj9c+KejLVQpy3u
	 4a7u8iriq6BFA==
Received: by mail.createsavvy.pl for <linux-mtd@lists.infradead.org>; Tue, 12 Mar 2024 08:30:23 GMT
Message-ID: <20240312074500-0.1.do.24dc0.0.8uein9w3u6@createsavvy.pl>
Date: Tue, 12 Mar 2024 08:30:23 GMT
From: "Maksymilian Ciszewski" <maksymilian.ciszewski@createsavvy.pl>
To: <linux-mtd@lists.infradead.org>
Subject: =?UTF-8?Q?Prosz=C4=99_o_kontakt?=
X-Mailer: mail.createsavvy.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_013035_018002_A1F794DF 
X-CRM114-Status: UNSURE (   1.46  )
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
