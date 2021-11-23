Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F7C1C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 23 Nov 2021 13:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXIJnGdcLAzPNUj6bGWgpjXg+I4xp9akO6kM/qZ1W2g=; b=eWS4irIkUCOC5U
	VYsWa1wvkkAuTF0AV21xP6efs9wTpQnMOBwX2aqCgBgUGVh/UEFqmTT/5FUN7v/Gt0Q9eTEXePImX
	IgK4zdJSbRTfsCg0GdbFmTATM+6+owyngZqAgcbjOmpes3OqhnbcNttT4EyTgLMrBPIcrKUW+y+7M
	BQnMZW5loX1fkTpn5kOsd29IOGY68hxGUQsGKelmy6NS3+DCJCt5NqxUQzgQiqW/CI2yatGwVjUMU
	tygFWOtey9iXL92LdZfeatfnV5AjygddO35ZRju2EFKW1XmAO7ghdm0dQ/MtE0D/iXY8y3M9pTURs
	PtOAqM6wJdv5QlTBIjsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mpVhV-002L0l-MI; Tue, 23 Nov 2021 13:19:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mpVW7-002GlQ-7H
 for linux-mtd@lists.infradead.org; Tue, 23 Nov 2021 13:07:26 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DA17C1F45329;
 Tue, 23 Nov 2021 13:07:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1637672840; bh=aY5f0ZE6mRocfP077BfQ+DyVCFKvaNgVw0KqMYW9Oac=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SoWhcM/JM/MqGIt7YwcUG1aTR4lV8NcUNpHNd1tavD7rvzO2x0gjEKupPs1b+YzBt
 vPw0I+0zkNnYbx6A8kSyh3+3Nekn/rmpcINVmlUPyZdd6BTyJfjOsCqq3AHA59y4q8
 rGTD0h7Z3L29Ry3+IaC/6LNe6WQC4NNlMxn3w/9GUaW+zeWK4Mzypx6WsrqkWNjGs9
 1k+Lvc2gs11mnyD9k4ZU+nh5pHowjCrwAc5O7/cpxokvrFS8RjCklQE7ptesL3gRMt
 aATPBprqsyaSPNpulU6Fbw2nAIJxDIi/q1RVe+26YdITCHfTD2DR5nuumb9jgPeFen
 xMAU1FYo/Qrkg==
Date: Tue, 23 Nov 2021 14:07:15 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sean Nyekjaer <sean@geanix.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>, Boris Brezillon <bbrezillon@kernel.org>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] mtd: core: protect access to MTD devices while
 in suspend
Message-ID: <20211123140715.280b2f70@collabora.com>
In-Reply-To: <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
References: <20211102110204.3334609-1-sean@geanix.com>
 <20211102110204.3334609-4-sean@geanix.com>
 <CGME20211123120353eucas1p2fb2561b7cfddd8d6e7decaef8b504f4c@eucas1p2.samsung.com>
 <21092c0f-e11b-ac16-ab96-2a0556c0e30a@samsung.com>
 <20211123125012.ibzqu44ixmykbhkt@skn-laptop>
Organization: Collabora
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211123_050723_461428_FC6EA592 
X-CRM114-Status: GOOD (  10.39  )
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

On Tue, 23 Nov 2021 13:50:12 +0100
Sean Nyekjaer <sean@geanix.com> wrote:

> @Boris do we need to do something similar here to what we did with the
> mtdconcat stuff?

Absolutely, physmasp subdevices are never initialized/registered, so
you can't call any of the mtd helpers taking the suspend lock on those.
I guess it'd be better to call mtd_suspend/resume() on the concat device
in though:

static void physmap_flash_shutdown(struct platform_device *dev)
{
	struct physmap_flash_info *info = platform_get_drvdata(dev);

	mtd_suspend(info->cmtd);
}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
