Return-Path: <SRS0=3ySE=X5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0E9C47404
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 16:05:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55EF921D81
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Oct 2019 16:05:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SoBwyhO5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="CenJO02n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 55EF921D81
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jhlCDQICXJ7y9VdY/ouO1xeidg9yajuVcGL5HLTs5tI=; b=SoBwyhO5pZCzug
	bZpkWteLJnEL74Km+Q85DeVyXxMS71Uqaux5Owtysq4O5b3aBDciLrrVbEqbcwnwf4v4BD4G516Lb
	DoUG9TlOATFrq9NztRqO2YfsDOQYh1iefzG0Ixo6bRQgUEDL3oorQUtf6I2Bmoypv2un9YvAC0SuG
	DmgZV0kNgZBJphzgh8oC4mtjZMSdDeXGwpbpF2FopQ4OkQTn4NMWVl6cwDapQMUkQFxBd6RlL278m
	RkhUuEf8Ut/2hoZ69ngeejpmt20TeHvNUTfCoLOlJPmaJDwrrpDKXrMhtBNnhMGip7KXveXp7pf/v
	eSnFSG4Pwe1TUOexo2ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iGQ4x-0004jP-Et; Fri, 04 Oct 2019 16:05:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGQ4i-0003Mw-Tu
 for linux-mtd@bombadil.infradead.org; Fri, 04 Oct 2019 16:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yxFR3QFB+6P8VuCBxvISR8NYhojQvVkEciYRDV5Ac5o=; b=CenJO02nudXWEXRDFGssQ4YGKD
 2QP3csRZlgH4NBEl0oR81kZr1OgjgvSaSBuePh+5CsKi4YdyCwDTYgC+TT0C0cXil839t4Bh4dwWb
 euV6lj01RopSUbxyoslGU5ZGtmkaEe1DBU1phbDvurn/ahqEbI30Uh3527CQ+bJJXtYwquAO0DyfN
 T0uuMNpP5BBy0nh8+VLKhMkHinrY+WVKHgerqulzWN1N0T1wPGRySe8ETHClJEwBmD2JxKZMgo6Bm
 fMfCYRrbTWlICnrNVLSoWG2rFsDBd8mNK/G06BsXhuryUMkntN7eKWbc5jz4bSE/qKCgoh8oWNsJs
 Mdh3dzNg==;
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by casper.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iGQ54-0007Ae-UG
 for linux-mtd@lists.infradead.org; Fri, 04 Oct 2019 16:05:24 +0000
X-Originating-IP: 93.23.105.117
Received: from xps13.stephanxp.local (117.105.23.93.rev.sfr.net
 [93.23.105.117]) (Authenticated sender: miquel.raynal@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id E080C6000E;
 Fri,  4 Oct 2019 16:04:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Piotr Sroka <piotrs@cadence.com>
Subject: Re: [v8 2/2] dt-bindings: mtd: Add Cadence NAND controller driver
Date: Fri,  4 Oct 2019 18:04:15 +0200
Message-Id: <20191004160415.6134-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190926081358.24212-1-piotrs@cadence.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: 5121b4219972c16e9ac92545a6743af2e99d4abc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191004_170522_981917_23B05ED5 
X-CRM114-Status: UNSURE (   8.13  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Brian Norris <computersforpeace@gmail.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Marek Vasut <marek.vasut@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
 Kazuhiro Kasai <kasai.kazuhiro@socionext.com>,
 Richard Weinberger <richard@nod.at>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 "Paul E. McKenney" <paulmck@linux.ibm.com>,
 David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, 2019-09-26 at 08:13:21 UTC, Piotr Sroka wrote:
> Document the bindings used by Cadence NAND controller driver
> 
> Signed-off-by: Piotr Sroka <piotrs@cadence.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next, thanks.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
