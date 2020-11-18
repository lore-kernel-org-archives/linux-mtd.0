Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8351AC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:05:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFD892463B
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:04:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BN+4AHFO";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="bmXyeILM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFD892463B
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EjnZMlzd9FyY73RmjvCcCyn4eQpr9nEuGhWLk9nHI/w=; b=BN+4AHFOeq7msziSweuwybD+x
	xd4uqs2yZxTRL4CV+35zWFlRuPCOdIkN9R/QaGGolwQwrIuUoWFYSYp5lZlJTtopsQ5qkJYgbQ23N
	mcmT3b8v/8Gyz3AkvL8jwhxD4xlGKGU4N0JrJ9LaeOt9c3GDxBq9DNnAyFpqUP8Pz684dLNhIhIty
	61JUCuJwGNjhyBOo2xe8lOUM9Fl5hR7uU8tgs0VfBvuK0OAnDHnfV6zsAJ1/pAIQDp4D4poIOF3eM
	ZRgqx38PZusVezkQLOqL6dLwdw2Lz7Ky93wPI0e0uk7eEQG+rWQEMcbZOzEPFCFKtK97LfOsaqOpf
	xTWfKLRMQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJNo-0007T2-Ka; Wed, 18 Nov 2020 09:04:08 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJNm-0007SY-TS
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 09:04:07 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605690246; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LkhYOLJvmFdpwfgmCORfd6M3DajwjiKhI3bCgvrsEjU=;
 b=bmXyeILM/jFC2y7/cL8bo+i+qT42pSFQTqiJfE9lrw1eXqLr2D6ZDxQVQXD+H6sZYclscK
 41e7ZVfbBmnYeTwtVfb+7Gjw2bitCfE/o1RVw9BIO+YSUBtHEGFI6Iz3TDO51XM38Wl3km
 oroI4x9/8G6WspbnyxouqPKxYU34Y7M=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19B49B138;
 Wed, 18 Nov 2020 09:04:05 +0000 (UTC)
Subject: Re: merge struct block_device and struct hd_struct
To: Christoph Hellwig <hch@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
Date: Wed, 18 Nov 2020 10:04:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <20201118085804.GA20384@lst.de>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_040407_096214_165E8977 
X-CRM114-Status: GOOD (  17.55  )
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
Cc: linux-bcache@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org, linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 18.11.2020 09:58, Christoph Hellwig wrote:
> On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
>> since this isn't the first series from you recently spamming
>> xen-devel, may I ask that you don't Cc entire series to lists
>> which are involved with perhaps just one out of the many patches?
>> IMO Cc lists should be compiled on a per-patch basis; the cover
>> letter may of course be sent to the union of all of them.
> 
> No way.  Individual CCs are completely broken as they don't provide
> the reviewer a context.

That's the view of some people, but not all. Context can be easily
established by those who care going to one of the many archives on
which the entire series lands. Getting spammed, however, can't be
avoided by the dozens or hundreds of list subscribers.

>  If you don't want xen-blkfront patches to
> go to xen-devel remove it from MAINTAINERS.

Patches to Xen drivers very much ought to go to xen-devel imo, so
no - removal is not an option.

Jan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
