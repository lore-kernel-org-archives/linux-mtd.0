Return-Path: <SRS0=qOpI=IG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDF1AC433E0
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 12:39:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DE56651DC
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Mar 2021 12:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5DE56651DC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MyJIZhBVjrDaBqPpwcRjQF6NbKug3jUNigjimrWPPEw=; b=YFESuDFzyqHV+Ndh8+tpAym6v
	kz+sYZWiDIUlzPq0GVQoUhPZvVrlGOuES2snNafQpHRrY2XDxjJQOnycGCHxnNac8IwtNukjGVIQZ
	HynBuL/i4gvjXxkHTexI4VCBdp6FtCx3EaoUJZpwhRarQ0gf3ilBDBa5mtymgkysWEUO+S8D1piWx
	Gjm0sh+UoGIV2RIFvxQzQd5XzV9gLVv6TgTkzY//9S5bxzfoGhZ4IJHe3pL4G2jO55I2Te91yay5F
	iXvOU5xRnGyjl1RzDKf+u7Redf6AUNTurPKK1MdxAr/XnOSujBbR+W+45L60Z97e/a44kL9PzVXef
	7zq32ziig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJF9C-00H9iN-2E; Mon, 08 Mar 2021 12:38:06 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJF97-00H9gS-0n
 for linux-mtd@lists.infradead.org; Mon, 08 Mar 2021 12:38:02 +0000
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 4468F22239;
 Mon,  8 Mar 2021 13:37:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1615207073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/Nd2XLILx6qK4M3sK24ynBpK7DPuWFrIQMzeGgCcEoo=;
 b=Va8PmHZ5DCjOU6qiskmSHA0gS9qXfeHzECggHq25LSV1pBjWOXHE41ajOOSOvdgWDljmU4
 Ez4TKnTV0XTUhkWl/fsddKxxwnJoKzKtiRomBw8XcD9f/2Zhbd8QfBO7r4KQg/OIprEcNp
 h7EI5petsP23RFsrhvuU4+C+fe5arTM=
From: Michael Walle <michael@walle.cc>
To: mail@david-bauer.net
Cc: tudor.ambarus@microchip.com, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, Michael Walle <michael@walle.cc>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH 2/2] mtd: spi-nor: use 4 bit BP for large Macronix flash
Date: Mon,  8 Mar 2021 13:37:47 +0100
Message-Id: <20210308123747.26142-1-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210303094833.139221-2-mail@david-bauer.net>
References: <20210303094833.139221-2-mail@david-bauer.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210308_123801_245815_47F23098 
X-CRM114-Status: GOOD (  12.57  )
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

[This time with the correct message id for the reply. Sorry]

Hi David,

Thanks for your patch.

> Macronix SPI-NOR chips with 128 or more 64k blocks have 4 block
> protection bits in their status register. Add the corresponding
> flag in order to clear these bits when unloking the flash.
> 
> Otherwise, the flash might not be writable depending on the state the
> bootloader left the flash in.
> 
> Fixes commit 62593cf40b23 ("mtd: spi-nor: refactor block protection functions")

Macronix didn't support locking before your patch 1/2, right?
Therefore, this patch will just adding features.

Please limit this patch to devices which you are able to test and
mention in the commit log on what SPI controller it was tested on.

-michael

> 
> Signed-off-by: David Bauer <mail@david-bauer.net>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
