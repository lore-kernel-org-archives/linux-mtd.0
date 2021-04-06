Return-Path: <SRS0=MIf+=JD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278ACC433ED
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 08:48:51 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B531561241
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Apr 2021 08:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B531561241
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=walle.cc
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=g5sjJ42fHot9K30JjS4N0LBWyjR35hsQL5OClMjsCn0=; b=h9FEENmNPzQ6nRaXL++KKjcQQ
	Tu1st70cQomuZlHbd5ONNrWcRUtkStV4OYmB7Mj8hXHRmgSnUh/FXWu9gydk8uRWxfl3NMTgD9vLH
	g9XUgldeQHMq+4tw8/2L9BKIb0ljXjzjgV4GTvJVRaYi7R6VP9bJCnNTNZpK/z9FzAC9j0pnQtRx3
	tm3Iz9w9P7FbfQuTAbDpbfsc943RP79FLbfgSyZs8BLpggAK1BVIuADBGFowp07bwS5hE70F+B9HP
	AszU5i9aPmEoEO97bGvvfZysBvGObnQM9yXin2UiwMuYlGVZICanqpvLMRgRaMXlsTXj/xXN9gPBy
	ZRao9dPjg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThN4-001tq3-Uw; Tue, 06 Apr 2021 08:47:39 +0000
Received: from ssl.serverraum.org ([2a01:4f8:151:8464::1:2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThMz-001tp6-RC
 for linux-mtd@lists.infradead.org; Tue, 06 Apr 2021 08:47:36 +0000
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id DFEE822235;
 Tue,  6 Apr 2021 10:47:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617698850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZRoz8Ro0cCt7fIaCtvweHH5BnfiGQ6TA020rkhXs0Y=;
 b=jefZUP9IZoBTB8Uw1AVCKrV+CRyKkrLi/+JRybG+G7ykggqy5N6iJROLp+P5El5cIasfjk
 lzyfmEn9XVfWe9ZPrvuorL1aWqtz/JDgSVN+jgzdzinZQ1Adzi+7XmOUcF0zPOcpJuC8QM
 3GaouHHEo31VSVIYSS9t58VGhbpcctE=
MIME-Version: 1.0
Date: Tue, 06 Apr 2021 10:47:29 +0200
From: Michael Walle <michael@walle.cc>
To: Vignesh Raghavendra <vigneshr@ti.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Tudor
 Ambarus <tudor.ambarus@microchip.com>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
 <richard@nod.at>
Subject: Re: [PATCH 2/2] mtd: spi-nor: add initial sysfs support
In-Reply-To: <658af7ad-c4ee-1c25-b51b-1f66b657aade@ti.com>
References: <20210318092406.5340-1-michael@walle.cc>
 <20210318092406.5340-3-michael@walle.cc>
 <658af7ad-c4ee-1c25-b51b-1f66b657aade@ti.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <4f1de957288118d5a627027ec4c37973@walle.cc>
X-Sender: michael@walle.cc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_094734_099889_CF8558C1 
X-CRM114-Status: GOOD (  17.79  )
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

Am 2021-04-06 09:56, schrieb Vignesh Raghavendra:
> Hi,
> 
> On 3/18/21 2:54 PM, Michael Walle wrote:
>> Add support to show the name and JEDEC identifier as well as to dump 
>> the
>> SFDP table. Not all flashes list their SFDP table contents in their
>> datasheet. So having that is useful. It might also be helpful in bug
>> reports from users.
>> 
> 
> Sorry for the delay..
> 
> There is already debugfs support for dumping JEDEC ID [1]. Any reason 
> to
> add sysfs entry as well?

This is per mtd while the sfdp is per flash device. IMHO both should
be at the same place.

> That brings up another question. Since SFDP dumps are more of a debug
> aid, should this be a debugfs entry rather than sysfs entry?

And you're not the first one asking that. My argument was that the
debugfs might not be available just when you need it. A developer
could easily rebuild a kernel, but imagine some user with a COTS
distro and some problems, then it is not that easy anymore. But
thats your call to make.

> Note that sysfs entries are userspace ABIs just like syscalls and thus
> need to be documented in Documentation/ABI/testing/ or
> Documentation/ABI/stable. Thus need to be carefully designed compared 
> to
> debugfs which are much more flexible.

Ok. But I don't see a problem adding these read-only files
  /sfdp
  /name
  /jedec-id

Do you?

-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
