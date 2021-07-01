Return-Path: <SRS0=sguX=LZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8302AC11F69
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 06:16:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 226486148E
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Jul 2021 06:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 226486148E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5QlTlknm/UC9JhugtCizZmwlcmipIy3vv8mMuivIB0=; b=2J37WfZda6lhBH5frtXxQCQvxy
	fw8C14AHrRjrC1uZ2oEC6U7nkWPdsaTDN9KNT+lJ9ztdqzWPegkySGmqeAUDJwaIbcPpFVmInCq9q
	iQyu1V6SBnD8Y6MDz1NuQhv+9IYyXMINc/hjgfuYTR+1FSej81m8ct7MNnWgDva4SrxEzPcpQb+EX
	dcxiXefSZlnu20HU2v2TRhS3YaIzTwu0kSjgDH2YNNTIn7/O+W3kCHyNE7kNOkHotcWxiYp1pKEgi
	Nuo2/O7jud1EVIZTx1gVb7OeXAVi+E806PpFibditD8ckdUBmVHB9b6OO2OmXrqnjeJZw6jcvrNtI
	nOYYgYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lypzH-00GDnK-NZ; Thu, 01 Jul 2021 06:15:47 +0000
Received: from ssl.serverraum.org ([176.9.125.105])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lypzD-00GDmD-S8
 for linux-mtd@lists.infradead.org; Thu, 01 Jul 2021 06:15:46 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 94DD722205;
 Thu,  1 Jul 2021 08:15:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1625120138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nNOZQZIfkYPdDMP6ecWgezCU+qxx2h3/IFPaJaDDFKA=;
 b=QnFrRSmRsq12eXkdJMUkXh8OsXkWgr/EDei9w5Mcp2onjfwSpMe+61DGL4UBhdix4+IlxD
 oe4jC+eLiI0WwerOxuaczcV1V+mCDHSeYqBrLjVKSo1mMGmFFzt4VJVfxn35iHgQiwZ/7y
 rerC3ywU3/COxkZanXhRherVbZhLsPc=
MIME-Version: 1.0
Date: Thu, 01 Jul 2021 08:15:35 +0200
From: Michael Walle <michael@walle.cc>
To: Tudor.Ambarus@microchip.com
Cc: code@reto-schneider.ch, linux-mtd@lists.infradead.org, sr@denx.de,
 reto.schneider@husqvarnagroup.com, miquel.raynal@bootlin.com,
 p.yadav@ti.com, richard@nod.at, vigneshr@ti.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] mtd: spi-nor: Add support for XM25QH64C
In-Reply-To: <a5877032-ab30-a85d-cd42-93b75a84ab49@microchip.com>
References: <20210613121248.1529292-1-code@reto-schneider.ch>
 <1ba367f93650cb65122acd32fb4a4159@walle.cc>
 <0328347c-572d-b636-5542-99cb36e9efa9@microchip.com>
 <064317e561f1ad20282efe778f633723@walle.cc>
 <a5877032-ab30-a85d-cd42-93b75a84ab49@microchip.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <3b2184a8c637e89ffba3013bbee0393a@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210630_231544_118244_C37865C5 
X-CRM114-Status: GOOD (  13.42  )
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

Am 2021-06-30 20:28, schrieb Tudor.Ambarus@microchip.com:
> On 6/30/21 5:15 PM, Michael Walle wrote:
>>> 
>>> Can the SFDP dump fit in the commit message when introducing a new
>>> flash ID?
>> 
>> As ASCII hex dump? I'd guess we need some instructions how to do
>> that. 4k would be 256 lines with 16 byte per line.
>> 
>> But yes, I had the same thought.
> 
> How about asking for the SFDP data in the cover later each time a
> new flash addition is proposed?

Ahh, I like the idea to put it onto the ML only. What do you think
of putting it into the comment section of the patch (ie. the one
after "---". This way we can have a backreference with a Link:
tag of the patch.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
