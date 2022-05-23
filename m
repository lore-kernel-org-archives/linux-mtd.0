Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D999C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 23 May 2022 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+fSE6Scecgu+MKvIa55cQemODaPOKClay36R4R2Bqxc=; b=3acHLnwc5JnbKYMq99LOyBAmyW
	3sF8Sxibd0+MGc+XdEVgPFSQ+2SjHZ6jpDpHJc2uf7iTl36FrSRcIoJx3RLyAu1kPmE7BuGtml8yN
	0y+FN3l0DV5X3jVPQxG/rCbQ4NePiif2g3HjHroICaRAeYdk+7AmiS6bDzRt2KfXHNhh/KZkBXTQP
	hrJf6Q7KAm4nJRRx6nBMzrt7dFh0JT/n4j1+tDlVGjT4m1v7ok+MRRiZ/efP3mJmoOkbVtwFTngul
	0QlrqULS0Xmg3l4laAVKOOr9LZLyeBqBM8wF3pbUIpKYkVnW5UAaJxqQf2zJbT0+7gfI8M/a2dTy0
	ugHSZDwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt3OE-002QA0-So; Mon, 23 May 2022 08:26:11 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt2ti-002D2e-Ff
 for linux-mtd@lists.infradead.org; Mon, 23 May 2022 07:54:40 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 00DC52223E;
 Mon, 23 May 2022 09:54:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1653292469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nQd9mRIHd5HSKD0thiQmrkrrJ499m3Sgzr8RpImTClw=;
 b=uexTZvcTXG1n68dSnxbq7ygIbq0oAIhBbYviFY52m8xr/0EBvdPUB/S0U5K9EvXeEDKErD
 RHFHq7f/1Ike13lwAzuc6I27hJSaQN/IG12Sbtp+zusbKuj8xfub5iJloNmhkL/aX0rM62
 rlXAgEPVPQijHnlA+Y5MiSfhQ5MDOiE=
MIME-Version: 1.0
Date: Mon, 23 May 2022 09:54:27 +0200
From: Michael Walle <michael@walle.cc>
To: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Cc: linux-mtd@lists.infradead.org, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] mtd: spi-nor: macronix: Add support for mx66l2g45g
In-Reply-To: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
References: <20220522054802.1719443-1-jiaqing.zhao@linux.intel.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <04c432289041752d113c15245361ade8@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_005438_772946_551D46BE 
X-CRM114-Status: UNSURE (   7.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2022-05-22 07:48, schrieb Jiaqing Zhao:
> Macronix mx66l2g45g is a 3V, 2Gbit (256MB) NOR flash that supports
> x1, x2, and x4 operation modes.

I presume this one supports SFDP? Please provide an SFDP dump, see [1].
If it supports SFDP please try to use the SNOR_ID3() macro [2].

Also please add what was tested in your commit message.

Same goes for your patch 2/2.

-michael

[1] 
https://lore.kernel.org/linux-mtd/4304e19f3399a0a6e856119d01ccabe0@walle.cc/
[2] 
https://lore.kernel.org/linux-mtd/20220510140232.3519184-1-michael@walle.cc/

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
