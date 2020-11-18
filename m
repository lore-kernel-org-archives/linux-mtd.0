Return-Path: <SRS0=T29d=EY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF375C5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:09:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6245924656
	for <linux-mtd@archiver.kernel.org>; Wed, 18 Nov 2020 09:09:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rhYfHq9o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6245924656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5xkl8fplofrkV/v897EiFjcMFUEK3wlvcCEkAqDhPR8=; b=rhYfHq9oEYKvFYz6YtriZjZNg
	juwwDIBJFma9/69xGFPtueLS+G6I6ZW8G8wbua1vWHr6HhmPrpw6lyK+XES38Np62odCR7UNrzVft
	TwCBG2QwDYhdvolViUaPqMmIuOFvV9INqMBJa6Z7sBo+axDlQATf24iGNQOebSO/X+p4ZfwI+qqc+
	L1E/h75SJE4s6GHTgaRSGJawGUCzwzogwMJpzdTMqf8+XDFwSDIJnKALNBv4lupeSs8cJl7uk1OaT
	+RnWcTEWx8yhQmuNtbT8zZNesUF29jZu82GReTcaGb48q621uYDXJUry/L7p/3YvDaZgwYk9bKcCf
	gWtCNLvVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfJSU-0008Gf-SS; Wed, 18 Nov 2020 09:08:58 +0000
Received: from verein.lst.de ([213.95.11.211])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfJSR-0008Fu-VE
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2020 09:08:56 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3A46F67357; Wed, 18 Nov 2020 10:08:53 +0100 (CET)
Date: Wed, 18 Nov 2020 10:08:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: merge struct block_device and struct hd_struct
Message-ID: <20201118090853.GA21243@lst.de>
References: <20201118084800.2339180-1-hch@lst.de>
 <22ca5396-0253-f286-9eab-d417b2e0b3ad@suse.com>
 <20201118085804.GA20384@lst.de>
 <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1ded2079-f1be-6d5d-01df-65754447df78@suse.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_040856_158291_617DADEA 
X-CRM114-Status: UNSURE (   9.83  )
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

On Wed, Nov 18, 2020 at 10:04:04AM +0100, Jan Beulich wrote:
> That's the view of some people, but not all. Context can be easily
> established by those who care going to one of the many archives on
> which the entire series lands. Getting spammed, however, can't be
> avoided by the dozens or hundreds of list subscribers.

No, that is simply a completely broken model.  Mails a are trivial
to ignore, finding them OTOH is everything but.  Learn how to ignore
a few mails, it isn't hard at all.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
