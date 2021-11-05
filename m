Return-Path: <SRS0=f+i+=PY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448C1C433EF
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Nov 2021 14:49:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 142966120E
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Nov 2021 14:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 142966120E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Content-ID:MIME-Version:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yk4tJiYU4mL6+NroNit0gXXJEOkP37lM11ST3DJ/8gs=; b=fAhSp4xfphWPgB
	85qtF8/9UFLZMhesLJMp3LzbZEWPX+uI1HmfQOJnhwQrmmmyxFY0Fa4oK2dY4kGi++7lIU7Vk9RMm
	OK7TIn32WBnVurJ06Z0q3x/cToQjhvYDtNH89oxTDeRiL3pAdEcnfO1L6qMkL+bSbXauwsaC+gRZm
	y/nZb2v3iod3Y5VgG1zWCnuwvPOr5NADrf2/fANdnh7IlNzBNu4JlshNlhUF8kQi1+Po58GZLSUvg
	Wh9+tipIW3RqLdlVkXCupfQizCR2kBIoPfQKF6RsN1uKf6BFXdtiEL888GIv+yikYq2xMIeY1WSi0
	Fh0PhvWTTJcIUcNwLXNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mj0WP-00BbVe-9T; Fri, 05 Nov 2021 14:48:49 +0000
Received: from mx2.tq-group.com ([93.104.207.82])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mj0WM-00BbVF-I5
 for linux-mtd@lists.infradead.org; Fri, 05 Nov 2021 14:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1636123726; x=1667659726;
 h=from:to:subject:date:message-id:mime-version:content-id:
 content-transfer-encoding;
 bh=HTQ6K8nrVpIwTlpQ/MIAG6K1kZpRA4FqX25exC3rfBQ=;
 b=KartdxV4HPR3wrEBNtWFW1r+o5kGQVe7/tnkuHOYMLaX4CaS7D9mL2y/
 CPdrvjtezo2HfHxJhtXcHpSCtu5aWOq71UHZsDc8dzHq7hNZZ9FVWY7VO
 67nOECXuLxRsIfaE546lv3U70EX9oAuIGoIcmRnbcBRRXH81yBP2/Zz7U
 e9dMoWNyqj9fA0kBNv1lgJhSu3fuMziRy4CkOW0udwJi3nh/JzlVfmXGT
 Qbk4PZgoXcoERtLz1zQlN45rzVe9KJ0FUSmzezqr62QKyuRavF+incIgW
 o/SeJ83tadOX1ANOMJDRH/bJC4rTwpTpO6oOYozGTqv7z1jQ3kx3umwzw A==;
X-IronPort-AV: E=Sophos;i="5.87,212,1631570400"; 
   d="scan'208";a="1150002"
Received: from unknown (HELO tq-pgp-pr2.tq-net.de) ([192.168.6.18])
 by mx2-pgp.tq-group.com with ESMTP; 05 Nov 2021 15:48:38 +0100
Received: from mx2.tq-group.com ([192.168.6.8])
 by tq-pgp-pr2.tq-net.de (PGP Universal service);
 Fri, 05 Nov 2021 15:48:38 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr2.tq-net.de on Fri, 05 Nov 2021 15:48:38 +0100
X-IronPort-AV: E=Sophos;i="5.87,212,1631570400"; 
   d="scan'208";a="1150001"
Received: from vmail01.tq-net.de ([10.150.72.11])
 by mx2.tq-group.com with ESMTP; 05 Nov 2021 15:48:38 +0100
Received: from vmail01.tq-net.de (10.150.72.11) by vmail01.tq-net.de
 (10.150.72.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.15; Fri, 5 Nov
 2021 15:48:38 +0100
Received: from vmail01.tq-net.de ([10.150.72.11]) by vmail01.tq-net.de
 ([10.150.72.11]) with mapi id 15.01.2308.015; Fri, 5 Nov 2021 15:48:38 +0100
From: "Stein, Alexander" <Alexander.Stein@tq-group.com>
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c
Thread-Topic: UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c
Thread-Index: AQHX0lQ3ieC2hoEX8UubG3WxX1NQXw==
Date: Fri, 5 Nov 2021 14:48:38 +0000
Message-ID: <b7442713fa00ac3b1d32d83392c45985dc09199b.camel@tq-group.com>
Accept-Language: de-DE, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.150.72.21]
MIME-Version: 1.0
Content-Language: en-US
Content-ID: <13F5C490C65CC04CA93702EAB35C892C@tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_074847_005150_FF0B346B 
X-CRM114-Status: UNSURE (   8.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

running on linux-next-20211101 I get the following UBSAN message during
boot on my board having mt25qu512a mounted:
> UBSAN: shift-out-of-bounds in drivers/mtd/spi-nor/core.c:2237:24
> shift exponent 4294967295 is too large for 32-bit type 'int'

Using some debug output I could track it down to sfdp.c passing 0 for
size. This will cause an underflow for 'ffs(erase->size) - 1'.
I'm not sure what size_mask is used for, so I don't know how to fix it.
But better to let you know at least.

Best regards,
Alexander

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
