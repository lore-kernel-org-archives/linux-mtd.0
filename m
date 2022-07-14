Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551A8C43334
	for <linux-mtd@archiver.kernel.org>; Thu, 14 Jul 2022 14:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7ANm2Thmlg16nyB+0OTQNRr/5FN23Wel5nT8iWI2j0=; b=viOKiwYge0lp2hV1JDnnpAGkH8
	6Y9MjN799I/dPk9q/bESuHvJDlWdSPj3sJ/1GyIRvxLDtJ3bpOqI8yvXGZKa/Ohksutdv73plVx94
	wnu0acs+sslS5IO2a3B5cI7DUt+WIQmIsKTMMqEshX7ZbW4w6Yfl7fsHOF9FCSHsZlREAAwJA28no
	QHlACjsasKDtTmBAUmD1eIMVVlalEMjXx5AP3znWQmimkjWL0prfFoooC6RHOVejLa3Yv7nSYcz3w
	oGAsbH0EPlTGrKCQ1rMmVaieMv3PXsADAcnjWN/5qrZgiEVfhEdppQfK70CGWP8EZ+z83rNKrGaot
	JNjzORUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBzit-00F9dn-RX; Thu, 14 Jul 2022 14:21:47 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBziq-00F9bh-Qc
	for linux-mtd@lists.infradead.org; Thu, 14 Jul 2022 14:21:46 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ssl.serverraum.org (Postfix) with ESMTPSA id F07DC22238;
	Thu, 14 Jul 2022 16:21:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
	t=1657808503;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ARwQmK+Zn7XxkXBzKIw1XwYHkKCHPIp+ddhgm/M3Pmg=;
	b=SzVShp5bZoWWMgWcakWgs3exPvFqi0wzHExpf1BJHssBzSJrhuWFHWD/Yd/QnQrU+0lcyj
	e1CidoD8hPPWIFQ8nhf+SJzoqKXkPAkDI4yNYW2nPXZrCr2WNfWMV9VVQxyf/5jyYLBh7o
	VKj6d7Fenlrzgg/hrFmucBFbOdjljsg=
MIME-Version: 1.0
Date: Thu, 14 Jul 2022 16:21:42 +0200
From: Michael Walle <michael@walle.cc>
To: Jae Hyun Yoo <quic_jaehyoo@quicinc.com>
Cc: clg@kaod.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, p.yadav@ti.com, quic_ggregory@quicinc.com,
 quic_jiles@quicinc.com, tudor.ambarus@microchip.com
Subject: Re: [PATCH] mtd: spi-nor: winbond: add support for W25Q512NW-IQ/IN
In-Reply-To: <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
References: <20220710145721.1207157-1-quic_jaehyoo@quicinc.com>
 <20220711095042.2095360-1-michael@walle.cc>
 <a42fbef2-3eff-9e88-233e-a805cfbe2376@quicinc.com>
 <4972a85d04e39ebb7b4a5872f6632c45@walle.cc>
 <2260955b-354d-ceda-cadc-49453bfca3e4@quicinc.com>
 <00f0c9d480ef5a414f1c34492661bd9e@walle.cc>
 <63cedfce-34bb-ed63-3871-75a6c3dd5d73@quicinc.com>
 <6be710bb5c1bf0449e54a54b78f6f7a0@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <47c01d768ea56edc9a2f9d317af7b495@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_072145_065465_26DE9B8E 
X-CRM114-Status: GOOD (  10.46  )
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

Am 2022-07-14 16:16, schrieb Michael Walle:
> Am 2022-07-14 15:47, schrieb Jae Hyun Yoo:
>> On 7/14/2022 12:41 AM, Michael Walle wrote:
>>> What does "doesn't boot at all" mean? Are there any kernel startup
>>> messages?
>> 
>> I'm sharing the error messages below.
> 
> Thanks.
> 
>> [    0.748594] spi-nor spi0.0: w25q512nwq (65536 Kbytes)
>> [    0.865216] spi-aspeed-smc 1e620000.spi: CE0 read buswidth:4 
>> [0x406c0741]
>> [    0.872833] ------------[ cut here ]------------
>> [    0.877984] WARNING: CPU: 1 PID: 1 at drivers/mtd/mtdcore.c:583
>> add_mtd_device+0x28c/0x53c
>> [    0.887237] CPU: 1 PID: 1 Comm: swapper/0 Not tainted
>> 5.15.43-AUTOINC-dirty-23801a6 #1
> 
> Could you please try it on the latest (vanilla) linux-next?

or spi-nor/next [1] as there are quite a lot of changes. The
patches shall be based on that.

-michael

[1] 
git://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git#spi-nor/next

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
