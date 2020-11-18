Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 838EAC56202
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:24:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0947C21D7E
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="weEUASLe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=suse.com header.i=@suse.com header.b="i0CTyeL1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0947C21D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rduQ2DG5AxRiSUPP3THfw0fM4/XM7aPhGpln+MMYVzE=; b=weEUASLeo6R0Cg4PfBrDX+UjE
	U0ZjsxtPsY0Z9SvDOQ8XOeK60C2VVSDtUkFyhIK3MC9uxO9Kwgm4YFwJu2UPeXQTyunz9tCWcPzyF
	+0lv68Qmf/sJSHJFqXyS/Sc5j0UlRzwtDckne04ax2N6QIZ/9ovN14fv9KvUgY8He8eF7huj0cS8o
	cY2Vcv637AAAA9iQLRMDOBD+7Zlkr0ldzp7bVPmssmPkeaikE4dYgw3FBB3HABXy+RBy9aisW61X2
	CCIZ9fmuIljF6RQGyc/E4Xko5SBJlZIGXYaMCGJ0VhYP8ElYUr79dfamzQKAb/+e0VxCF+VTk59Rc
	mdvyQLEiA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJgy-0002TY-6t; Wed, 18 Nov 2020 09:23:56 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJgv-0002Sk-Gk
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 09:23:54 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1605691432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mPuZTYIAwAqalq/3PBMt9FUGU5aCOv8nZscLB8ryTqE=;
 b=i0CTyeL1nWw+YANGFV2rMzpIxuK6HpHkslVxAt1+sbizisxFXYmthJpOtqYWv5OEwI8nEF
 5up2ifEYyQez4h2UgcHFo2aze20C95gWGI0urEOXhGszYfyJOCLUL6zcVAJa/mzXzhiIoD
 LlL4BiGABS8D6M/Aksgo6qs6jBauHxs=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 004B0ABDE;
 Wed, 18 Nov 2020 09:23:51 +0000 (UTC)
Subject: Re: merge struct block_device and struct hd_struct
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
 <1ded2079-f1be-6d5d-01df-65754447df78@suse.com> <X7Tky/6dDN8+DrU7@kroah.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <61044f85-cd41-87b5-3f41-36e3dffb6f2a@suse.com>
Date: Wed, 18 Nov 2020 10:23:51 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <X7Tky/6dDN8+DrU7@kroah.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_042353_705794_B64B465F 
X-CRM114-Status: GOOD (  19.03  )
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
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On 18.11.2020 10:09, Greg KH wrote:
> On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
>> On 18.11.2020 09:58, Christoph Hellwig wrote:
>>> On Wed, Nov 18, 2020 at 09:56:11AM +0100, Jan Beulich wrote:
>>>> since this isn't the first series from you recently spamming
>>>> xen-devel, may I ask that you don't Cc entire series to lists
>>>> which are involved with perhaps just one out of the many patches?
>>>> IMO Cc lists should be compiled on a per-patch basis; the cover
>>>> letter may of course be sent to the union of all of them.
>>>
>>> No way.  Individual CCs are completely broken as they don't provide
>>> the reviewer a context.
>>
>> That's the view of some people, but not all. Context can be easily
>> established by those who care going to one of the many archives on
>> which the entire series lands. Getting spammed, however, can't be
>> avoided by the dozens or hundreds of list subscribers.
> 
> kernel patches are never "spam", sorry, but for developers to try to
> determine which lists/maintainers want to see the whole series and which
> do not is impossible.
> 
> Patches in a series are easily deleted from sane mail clients with a
> single click/keystroke all at once, they aren't a problem that needs to
> be reduced in volume.

This doesn't scale, neither in the dimension of recipients nor in
the dimension of possible sources of such series.

While it may seem small, it's also a waste of resources to have mails
sent to hundreds of even thousands of people. So while from a
technical content perspective I surely agree with you saying 'kernel
patches are never "spam"', they still are from the perspective of
what "spam mail" originally means: Mail the recipients did not want
to receive.

Jan

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
