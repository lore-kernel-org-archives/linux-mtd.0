Return-Path: <SRS0=8K5C=DL=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656D0C4363C
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 14:12:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7747C20735
	for <linux-mtd@archiver.kernel.org>; Sun,  4 Oct 2020 14:12:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IHEPq1Md";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=walle.cc header.i=@walle.cc header.b="bxjyZbK6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7747C20735
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:To:From:
	Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kIGxeOirWB7YDgR4PqJlRkdlnU/chcOk1JE9XXrRnA4=; b=IHEPq1Mdgbew77Lt8mf5pqSgn
	fAO6NZkNBG24HwCx6OZbHeCAihpYYvJVcc3A/Hrz5m13jTQdNODl5hyXTdar/5SL3gIRL6VWqLo6T
	0V5A2KuQHvgFl/hbcDyULTiAybxO7b0HkHCh4vdMt93yTYYSR1cTdnAPbWw+hMFbG7LgBuKll2No8
	qXenIY+3jPhQdbF8l31TJnXQIAi+2salzGOxBex3RItlcKBs+UaFoJ89E8UMrAQ5FkYSzbmbze/bz
	QhEBPE54NBj2OBPkt7CjAqhSJLQkGJ+qc0R1wuDxeoK+Mn2npd8g0AhBaS3L9cy+WxSAGYCQhnRIE
	o4jtNHT6w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kP4j9-0002xZ-Di; Sun, 04 Oct 2020 14:11:03 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kP4j1-0002wL-Dk
 for linux-mtd@lists.infradead.org; Sun, 04 Oct 2020 14:10:58 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 5EC4022EDE;
 Sun,  4 Oct 2020 16:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1601820647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xVT1+uHV60x1aVCZ95DvmbILFkWAS7anVazJ1b7EIoQ=;
 b=bxjyZbK6MEBzL6yVKoDx8aHhT0lKMZgS8k28EDwu4jzwfjSz9EgVO8yaOQ9xd5pwL0MLXF
 SozTiDFIWc06BrLqCfdvkzaB7gPFuJJ5KlTAOaJbY07+8dGVGEP/DWriD4Sx7PJMCsrdXq
 H/7bdvJ4zxTVXy/g/w16ekHa98GQytQ=
MIME-Version: 1.0
Date: Sun, 04 Oct 2020 16:10:46 +0200
From: Michael Walle <michael@walle.cc>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH] mtd: spi-nor: Prefer asynchronous probe
In-Reply-To: <CAD=FV=VddVg=QLS32Jr-Mxh6nyiB2=1MybxGiYuuaKd+fQ4+Lw@mail.gmail.com>
References: <20200902160002.1.I658d1c0db9adfeb9a59bc55e96a19e192c959e55@changeid>
 <20201003150633.23416-1-michael@walle.cc>
 <CAD=FV=VB-ML0=kmN-yAH7sD-sMiX9Cq1_9B9QwVL=Ed5ZrGnbg@mail.gmail.com>
 <b376b3f2e41662237d50d589e3696b06@walle.cc>
 <CAD=FV=VddVg=QLS32Jr-Mxh6nyiB2=1MybxGiYuuaKd+fQ4+Lw@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.8
Message-ID: <23aa87ccb6ae4133a17885b809194161@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201004_101055_625258_4FB8D6AF 
X-CRM114-Status: GOOD (  13.26  )
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
Cc: vigneshr@ti.com, tudor.ambarus@microchip.com, richard@nod.at,
 LKML <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 miquel.raynal@bootlin.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Am 2020-10-03 19:00, schrieb Doug Anderson:
> On Sat, Oct 3, 2020 at 9:54 AM Michael Walle <michael@walle.cc> wrote:
>> While debugging another issue I also noticed that sometimes my
>> /dev/mtdN devices were reordered. Note that I have two SPI flashes.
>> Might this also be connected to the async probe?
> 
> It's likely.  My guess is that you shouldn't really be depending on
> the numbering.  If you need to depend on the numbering, there should
> be something that guarantees it like a device tree alias.  We have
> struggled with similar things on MMC for years and I guess Ulf finally
> decided that we weren't going to get a better solution than the device
> tree aliases.

But this has to be supported by spi-nor first, right? So that would also
be something which has to be added before we can make the probe async.
And as far as I know there is no such mechanism like /dev/disk/by-X for
/dev/mtdN.

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
