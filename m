Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0208C433F5
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Feb 2022 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KB0qt+7B6dwtzl6Ih5hM/Ijia3NC8Xiw1D1vMj+TtfE=; b=o/ct7A1ZS2s7hu3LMMrYz37HKj
	NZmW2WutqqdHiOxmomytHJf9UyigEQbP3jRCms5JJyvCtZUjjrDt/xOMhBZ6KeT9DseQD5WE4MJ1U
	3PYWooT2YzWYTGO8KnOYQgwCRADOHr3oe/Eoff3m0I5bVhgG3N3aOM82K4RjbDBJhO691ukJ/FEPx
	0ooTmeFqoyY/xjRgRysMihD07d+AY4kRhhxezSoxfNxw8/JNMxw8bSMcLCwSTUWfkOrBw00DnzunB
	QnAbhv1LJDYwtW5vwQmuXz7P3E4qGB9HUUbApvbWeXWxT8OCp6sUsZCQSGot3eZcpsLecYYknu5cp
	udUNZUjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nI4Oj-002ykt-Sl; Thu, 10 Feb 2022 08:01:50 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nI4Of-002yil-82
 for linux-mtd@lists.infradead.org; Thu, 10 Feb 2022 08:01:47 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 924112223A;
 Thu, 10 Feb 2022 09:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1644480101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f/wqfZ7Tr1j9aSdCRb6UxeY6aGR1bPLimuxomNP4AWQ=;
 b=DIkgjIue5Cuw5V1TANoCyK23hr+AMqR+LeQLRZd5aglf77JppssV8wm8LBHnvv5akISPrd
 xjHkI/PRZ7Zo7I7Erxswr67nxpdG4pymxpkolZCsGNnphd3W9Y15lsAvQR8SXwbKLsufsZ
 0PIx1UjLjieWSA6Dx6wxMNgflIisecY=
MIME-Version: 1.0
Date: Thu, 10 Feb 2022 09:01:39 +0100
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 p.yadav@ti.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com
Subject: Re: [PATCH v1 02/14] mtd: spi-nor: slightly refactor the
 spi_nor_setup()
In-Reply-To: <f4a7a2c2-579c-f558-3d85-cf0709a6060c@microchip.com>
References: <20220202145853.4187726-1-michael@walle.cc>
 <20220202145853.4187726-3-michael@walle.cc>
 <f4a7a2c2-579c-f558-3d85-cf0709a6060c@microchip.com>
User-Agent: Roundcube Webmail/1.4.12
Message-ID: <0280538304fe8c837af0356ae469f428@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_000145_507016_79D50569 
X-CRM114-Status: GOOD (  10.17  )
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

Am 2022-02-10 04:00, schrieb Tudor.Ambarus@microchip.com:
> On 2/2/22 16:58, Michael Walle wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you know 
>> the content is safe
>> 
>> Instead of always using a function pointer (and initializing it to our
>> default), just call the default function if the flash didn't set its 
>> own
>> one. That will make the call flow easier to follow.
>> 
>> Also mark the parameter as optional now.
> 
> what should be done in the future?

What do you mean? IMHO the default path should be visible in the
function. Eg.

int spi_nor_bla(nor) {
     if (nor->some_exceptional_cb)
         return nor->some_exceptional_cb(nor);

    return usual_cb(nor);
}

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
