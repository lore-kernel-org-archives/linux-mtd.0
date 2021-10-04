Return-Path: <SRS0=q46N=OY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F54BC433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 12:11:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDEBD61002
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Oct 2021 12:11:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BDEBD61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:Date:Cc:To:From
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4yUK0PUo5QLUFbDZirNh6TP+yku7NLoIfHLOn1KYrGw=; b=cgrUCmr+3E7ufA
	UEA7oXXjnHl1VcHFkT2Lwtq37piUuSD0ed8KPp3AJIey1c2zVEo5bnzB3qqRmqztGeT2hc3MPd06b
	ns/tlJECwnEBiJgvNzon0FRO5xteY6c/S5PKi7kP1v4JbyZA6HqMMwuIjGuF40UVDjKrPawv4li7Z
	UfXXRUswdQiIsr3MqDbqZH3CfP0iYKco84bsFMIy640ok8A871e/G7Q2p3nQpuKClRyLCyYbhDfBh
	bHF/UhilIfdhB6Lretwu44HUoqYWkTqYr/ixfXTiKo0rqTsxPNqEWibmizUBnAfNtMOcOTjRWJihr
	0ssIaszv3UnZCSI0fEtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXMo8-006OCp-Gz; Mon, 04 Oct 2021 12:11:00 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXMo5-006OAt-P1
 for linux-mtd@lists.infradead.org; Mon, 04 Oct 2021 12:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633349457; x=1664885457;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=b/VbAVXf8V1rUtjjhY58TDRgAT82p9nbfmXylEq2ISQ=;
 b=AWBz0zpWsfNf79DscdODxVzTRSOyMfA40owCqYz82E6aCAIZBE8GIORO
 oS3gOUPzJE3+9aIRetAVOBokMGsGc7Mm40nTbCRq5l2BdWEL6kBLgQI+h
 Ghx1QjshoqNAma2p+ISmPA7df4HXjAxohra4vDXNThkveJv1iYERac/lW
 RqN7+O7rGmM64obUAff43KhXBKSR9gUfxbWttud6BOSY4j2S5iAUiP1LB
 Ff5xmrUt9MHBdVFiTfPy/pH8QdYlGjBf9HtKOWrx9riTz0i48TrJ+P1OP
 9+hUaSI/sZKDVDhDGMUxR6wWRwAP7kgdr0ka6a0gnPsyNzuiUZ7XOqH+L g==;
X-IronPort-AV: E=Sophos;i="5.85,345,1624312800"; d="scan'208";a="19848754"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 04 Oct 2021 14:10:53 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Mon, 04 Oct 2021 14:10:53 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Mon, 04 Oct 2021 14:10:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1633349453; x=1664885453;
 h=subject:from:to:cc:date:mime-version:
 content-transfer-encoding:message-id;
 bh=b/VbAVXf8V1rUtjjhY58TDRgAT82p9nbfmXylEq2ISQ=;
 b=g1t2Pyc0oLZTY1MwNYw53DQSbKRCv9pKnrQ6VzbING+jEmGnn0ytL16A
 EwOuOFbl5c6CAb1ZRG01W7dpghAoZ27ksRiwyY9WrPWQZNXGIldrnH1l7
 x3PNcGY8fNfX/9CcQbdMwrRSTq0sddMUaxgd8fJ/3OgvQsv+8udG02LDl
 IrbhYpLYoCUNlw7DYoTt2qCd+aMNXQZArBA7gAyI9DhZ9VHleiCkJvHsh
 XSpQUBsHcgzlT4yT9IuMFgJTBoTfUnG0LRVFdHC/LUthtAiuOj8iKzsHd
 kLhuyLms9jsIuNFpi6oMvdXmJUdBGi4zMrbAhmz77N6njiIfl1Weqeaq1 g==;
X-IronPort-AV: E=Sophos;i="5.85,345,1624312800"; d="scan'208";a="19848753"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 04 Oct 2021 14:10:53 +0200
Received: from vtuxmail01.tq-net.de (localhost [127.0.0.1])
 by vtuxmail01.tq-net.de (Postfix) with ESMTP id 6058F280065;
 Mon,  4 Oct 2021 14:10:53 +0200 (CEST)
Received: by vtuxmail01 (kopano-spooler) with MAPI; Mon, 4 Oct 2021 14:10:53
 +0200
Subject: AW: (EXT) Re: [PATCH 2/2] mtd: spi-nor: micron-st: Add support for
 output-driver-strength
From: "Alexander Stein" <Alexander.Stein@ew.tq-group.com>
To: =?us-ascii?Q?Tudor=2EAmbarus=40microchip=2Ecom?=
 <Tudor.Ambarus@microchip.com>, 
 =?us-ascii?Q?Alexander=2EStein=40tq-sys?= =?us-ascii?Q?tems=2Ecom?=
 <Alexander.Stein@tq-systems.com>, 
 =?us-ascii?Q?miquel=2Eraynal=40bootlin=2Ecom?= <miquel.raynal@bootlin.com>,
 =?us-ascii?Q?richard=40nod=2Eat?= <richard@nod.at>,
 =?us-ascii?Q?vigneshr=40ti=2Ecom?= <vigneshr@ti.com>,
 =?us-ascii?Q?robh+dt=40kernel=2Eorg?= <robh@kernel.org>,
 =?us-ascii?Q?p=2Eyadav=40ti=2Ecom?= <p.yadav@ti.com>,
 =?us-ascii?Q?michael=40walle=2Ecc?= <michael@walle.cc>
Cc: =?us-ascii?Q?linux-mtd=40lists=2Einfradead=2Eorg?=
 <linux-mtd@lists.infradead.org>, =?us-ascii?Q?devicetree=40vger=2Ekern?=
 =?us-ascii?Q?el=2Eorg?= <devicetree@vger.kernel.org>, 
 =?us-ascii?Q?linux-kernel=40vger=2Ekernel=2Eorg?=
 <linux-kernel@vger.kernel.org>
Date: Mon, 4 Oct 2021 12:10:53 +0000
Mime-Version: 1.0
X-Priority: 3 (Normal)
X-Mailer: Kopano 8.7.82
Message-Id: <kcEE.Dc11rDoPQ8iRcxif5TBAOA.gESl4Bi51wE@vtuxmail01.tq-net.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_051058_166094_5920C98F 
X-CRM114-Status: UNSURE (   5.76  )
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

Hello,

> Does the micron flash define the SCCR SFDP map?

As far as I can tell, it only defines the Basis SPI protocol and the 4-byte Adress Instruction Table.
Dunno when the SCCR SFDP map was added, but this flash only announces JESD216B (SFDP 1.6)

Is there some tool for dumping/decoding the SFDP available?

Best regards,
Alexander


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
