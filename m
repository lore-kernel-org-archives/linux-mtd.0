Return-Path: <SRS0=dDgs=E2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46736C5519F
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 08:50:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9167522253
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Nov 2020 08:50:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v3+22hb8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9167522253
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NVGf/f3HrzJMEbIUWO6Hi5DxzGCtAAfcDjiJJ+cRqeQ=; b=v3+22hb8Ca5TN5y5rm/OqLFKE
	uuYFPglWUBUNN/sVUSSwIGaGVbyYpWfwEBstxFCVA9Opmz8fHr8Ag+KMS5iDErsMjD1IHYFGHpOYY
	CSFHit8Bc35DjDn50OK53E5N93nif9kFxHN/57b/+0GgWxhK0sCjmCLtuDcHYUAVoM0KsfuqzPMQD
	f5ZpT2tZANW/BZ3CmxB4D0CUoJQ12OsU5KuftGeITC1pkLkwXpjXfaRSxo8WZR2Dms4J3LNeBkX/a
	jmS5vXt5ec5hNouMIRFQdC3WcakIgtZzAgmPxlogfMQUNWtZ6JqepPc38oyXnv3qfnjpiHf22Oapl
	bJMZBvkJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kg27G-0001wH-2W; Fri, 20 Nov 2020 08:50:02 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kg27E-0001va-2K
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2020 08:50:00 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id A171367373; Fri, 20 Nov 2020 09:49:56 +0100 (CET)
Date: Fri, 20 Nov 2020 09:49:56 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 07/20] init: refactor name_to_dev_t
Message-ID: <20201120084956.GA21715@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-8-hch@lst.de> <20201118143747.GL1981@quack2.suse.cz>
 <20201119075225.GA15815@lst.de> <20201119082505.GS1981@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201119082505.GS1981@quack2.suse.cz>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201120_035000_250871_D10F7A2A 
X-CRM114-Status: UNSURE (   9.10  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Richard Weinberger <richard@nod.at>, Josef Bacik <josef@toxicpanda.com>,
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, dm-devel@redhat.com,
 linux-mtd@lists.infradead.org, linux-mm@kvack.org, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Nov 19, 2020 at 09:25:05AM +0100, Jan Kara wrote:
> OK, understood. Still it would seem more logical to leave blk_lookup_devt()
> declaration inside #ifdef CONFIG_BLOCK and just delete the !CONFIG_BLOCK
> definition (to make it clear we ever expect only users compiled when
> CONFIG_BLOCK is defined). But whatever... Feel free to add:

Not having the ifdef would allow using IS_ENABLED() around it.  Which
is what I did in one of the earlier variants before settlings on this one.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
