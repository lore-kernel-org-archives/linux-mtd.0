Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02C3C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Feb 2022 08:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LzYUiDZ5Ss59jAginZp5JsG6N8er/xBLGJRNFiIv/5o=; b=AUmhxMQ8Dv5lx3joeDALVFqitj
	qaGlxzva9SrSLPZS/dJABfHgmpPRxy8cT20LKQhYbrzIOISwhU9PpQhR4MR4NuX9KMuExBvmfbUwR
	/gnzlqztaGMEEugCXqxNO0Cj0x7xdjkuQAGWCJ94kCPiCHmIoYaBtpGepIRDaeVQKaV4Qj85dV8wm
	FtSedBuYxVsPLHrDVG/rsiqinZk8TGVgdjNT3NP9EY8iRd5LKFp5Dqv26U9WCn18HE4MaoMQpa54V
	cbowYuwHnFSBsWYCPuhgUAKz+ZgfiFbzqs/Q/GtAMHraAlVEKAAZCKmkF/nYLmwrdA5bjg47yZogi
	sMCEyZcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtA6-001gEn-WB; Tue, 15 Feb 2022 08:26:15 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJt9v-001gAZ-Nv
 for linux-mtd@lists.infradead.org; Tue, 15 Feb 2022 08:26:09 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 2639C2223A;
 Tue, 15 Feb 2022 09:25:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644913557;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0NserSeedPnp6XT1u/jN/mA6g6cQ/+ctGlpC4m9TEs=;
 b=t0LI/TVPjblGgnNqw2EGOfngyuRHAW/I/9f1wXgeDYMHS1I59kGNr8oxJdbTEFS5cEz6tq
 93bZigWY7gcF0uOIpdrksDvT8On0FDra9/lEOtpDjqB6SxEE2KTBsRUUOjf+6WcgnkQ7TK
 hwjakAAmg0WsU5h55GNKyk8MGv2CZKE=
MIME-Version: 1.0
Date: Tue, 15 Feb 2022 09:25:49 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v1 05/14] mtd: spi-nor: xilinx: rename vendor specific
 functions and defines
In-Reply-To: <d76f21dd-4038-57de-f2f6-6afa947b62cb@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-6-michael@walle.cc>
 <68aa414b-7a9d-1330-531c-37b2db2ab09d@microchip.com>
 <73d3d8ed2cb4ca1b06902b767fe529c3@walle.cc>
 <d76f21dd-4038-57de-f2f6-6afa947b62cb@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <c3a58de8ee39dd473483dfd0ed8a0058@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_002603_965526_9A073025 
X-CRM114-Status: GOOD (  11.88  )
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

Am 2022-02-10 09:06, schrieb Tudor.Ambarus@microchip.com:
> On 2/10/22 10:04, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Am 2022-02-10 04:08, schrieb Tudor.Ambarus@microchip.com:
>>> On 2/2/22 16:58, Michael Walle wrote:
>>>> EXTERNAL EMAIL: Do not click links or open attachments unless you 
>>>> know
>>>> the content is safe
>>>> 
>>>> Drop the generic spi_nor prefix for all the xilinx functions.
>>> 
>>> mm, no, I would keep the spi_nor prefix because xilinx_sr_ready is 
>>> too
>>> generic and can conflict with methods from other subsystems.
>> 
>> But all the other functions in this file start with xilinx_ ;)
>> 
>> I don't have a strong opinion here, other than it shouldn't
>> be called spi_nor_read_blaba() because that looks like a
>> standard spi nor function belonging in core.c
>> 
> 
> then let's prepend all with spi_nor_xilinx_*()?

I'm still not sure what to do here. Have a look at all the other
vendor modules in spi-nor. they are all prefixed with the vendor
name? E.g. there is a sst_write() which is far more likely to
cause a conflict. So should we rename all these functions? Or
do we just take our chance that it might have a conflict in
the future (with an easy fix to rename the function then). TBH
I doubt there will be a global symbol "xilinx_read_sr()".

But I care for consistency, so having some named xilinx_, sst_,
st_micron_ and some spi_nor_read_xsr sounds and looks awful.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
