Return-Path: <SRS0=Gxb9=XX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31110C4360C
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2019 16:07:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C731E2086A
	for <linux-mtd@archiver.kernel.org>; Sat, 28 Sep 2019 16:07:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NZ1SDDbh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C731E2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mclink.it
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:To:References:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XG9KXSwjTzTiPLwl2g8TVS8P9R4v7sJGLW7SA64pJNc=; b=NZ1SDDbhLeiREESf5uWWmDLjXM
	VlcVLex3kU4IaKHcuTHR3rZXJAfWVBXB9RyMHzA4O4CB2msakAjQpbKlXRKv5D6y3P24eSdYgTcF7
	ZOEhT6zV04Jv5Iw4yUCUm6iq//76sO6plmZxho1J+Hm4YDW2tHFuBpkFmWVL/m4Q+zA64dcrssDQA
	5qhGgVZIFiKF//Uool3Xk2lK7m1vUpEblr5LsDZrrjM3neqxhqxvczvSz8auwjRT687P50lTkabYW
	FM1IBK4Fj3bfDDBEWP5Ld6nq+JvUY+wmzaHKxD5Dik1uPS/JUZLCti7xNc+nqI4MA7P7sUtuO1hWC
	9AqpV0ng==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iEFGE-0001bi-IV; Sat, 28 Sep 2019 16:07:54 +0000
Received: from relaygw1-3.mclink.it ([213.21.178.134])
 by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iEFG8-0001b9-WF
 for linux-mtd@lists.infradead.org; Sat, 28 Sep 2019 16:07:50 +0000
Received: from [172.24.30.42] (HELO smtpoutgw2.mclink.it)
 by relaygw1-3.mclink.it (CommuniGate Pro SMTP 6.0.2)
 with ESMTP id 164629715 for linux-mtd@lists.infradead.org;
 Sat, 28 Sep 2019 18:07:41 +0200
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2B+AQCshI9d/4zK9V8NWRwBAQEEAQEMB?=
 =?us-ascii?q?AEBgWeEOoQikFglg22GCIE9j20JAQEBAQEBAQEBNwEBhEACg1o4EwIMAQEFAQE?=
 =?us-ascii?q?BAQEFBItyAQEEI2YLGAICJgICVxMGAgEBgx6Bd6x+dYEyhU2DL4FIgQwojGSBQ?=
 =?us-ascii?q?YERJwyCXz6FEYI+glgEgS8BAQGLOIkggTOVWQEGAoFWTpUFBhuZNqlRgXmCXoF?=
 =?us-ascii?q?OUCSQFXKODAEB?=
Received: from host140-202-dynamic.245-95-r.retail.telecomitalia.it (HELO
 [192.168.7.100]) ([95.245.202.140])
 by smtpoutgw2.mclink.it with ESMTP; 28 Sep 2019 18:07:41 +0200
Subject: Re: mtdpart add/del usage
References: <1fc7208e-145f-aeb5-61c5-cc6a8a8aedf6@mclink.it>
 <CAFLxGvy67vrX9t==UK5U+P+LW=h0aGt_MGFFfAvCspi9GnayRQ@mail.gmail.com>
To: linux-mtd@lists.infradead.org
From: Mauro Condarelli <mc5686@mclink.it>
Message-ID: <0d603876-f7ac-5dec-5345-7e4369ab038f@mclink.it>
Date: Sat, 28 Sep 2019 18:07:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFLxGvy67vrX9t==UK5U+P+LW=h0aGt_MGFFfAvCspi9GnayRQ@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190928_090749_199915_EB65A7B1 
X-CRM114-Status: UNSURE (   8.22  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org



On 9/27/19 4:31 PM, Richard Weinberger wrote:
> On Fri, Sep 27, 2019 at 3:21 PM Mauro Condarelli <mc5686@mclink.it> wrote:
>> / # mtdpart del /dev/mtd3 3
>> mtdpart: error!: Failed to issue BLKPG ioctl
>>          error 22 (Invalid argument)
> Is /dev/mtd3 really the master partition?
No.
It is not.
On a recent kernel I managed to have this work (using
"CONFIG_MTD_PARTITIONED_MASTER=y").
> IIRC you can only apply such changes on the mtd master
> partition.
Is it possible to retrieve (or re-create) the master device in an older
kernel (3.18)?
It does not have MTD_PARTITIONED_MASTER config option.
I know it won't be able to del/add partitions, but being able to write
to the whole,
unpartitioned device would be *very* useful nonetheless.

Thanks in advance
Mauro Condarelli

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
