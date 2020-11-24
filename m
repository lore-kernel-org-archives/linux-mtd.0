Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F363C64E7A
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDB12206E0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 21:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BjKNbXHg";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SBpFqtt8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDB12206E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZOwgmwPUkK3dmYydssQreK9etUIPIpFiHhS93dxtlCI=; b=BjKNbXHgakuOLzuUkQqYE3bYa
	/YEnGmNl28fZ/0KFVZPhNCsXugQPyA046nhkDeBXt5npZyHEW/uG2cv5Nc2jqF9axJ0D5PjUpqsJG
	Ng7VVzghl6tN5jHnIMn7bvO6nPHeiE4p5V4VUgfKu5tbTaRa5C4Jyt3iaMEm/4PZsOwA5Gamq3YHI
	Gm6vM/W1qjB0LM4VbQgl4qQnrB5nJDQepoOaDlVpkV3YRely1VLewDAJuGpbKKofMIu69fuQ7MXe5
	4djqtl1Mmbi0eSrEDguNW+fz0zVf1+go4G08yvjYH2BLmJQaZTXI4EKquzqwnCMdbdDpYE5dCJ9pj
	ML6Cy2xTA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khfjZ-0000vd-DI; Tue, 24 Nov 2020 21:20:21 +0000
Received: from mail-qv1-xf42.google.com ([2607:f8b0:4864:20::f42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khfjW-0000uH-BZ
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 21:20:19 +0000
Received: by mail-qv1-xf42.google.com with SMTP id ec16so11401203qvb.0
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 13:20:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3HC7ZqQanyIo8VeBYdMEle4L/4ENFYEM5MkKt8pSh/w=;
 b=SBpFqtt8PXbzCveB3YbrqNUj//b1rdDV1EqJm8ZT0/PCMKGkmFs6PzBliBJcdVTLfk
 tv/ZuM+3J7XM+n5fEUuohYu6uKi1fCr78XSUa/5RUJdfK+5UfN3C0U3yX9T9Q54Q5SaR
 vVOVCypSCFl85W7pD0ksSCQvKz2n77IAVCPEhA9UoBfthB9BvyYs6pYTaIL0wmQf9aCu
 xcqLyNke/DBRRYIHLihURVxMheAgoXZ/e0RlaCkV/7/TeYdWzBYlD3KA6yr3YBRfdQIT
 T2cBKt53JFvRl9mTVJp+iF+XYLyh3G75CH9aRMRIV/K8O2t4jUxGxv8CwdtQFQ8WaWa/
 HyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=3HC7ZqQanyIo8VeBYdMEle4L/4ENFYEM5MkKt8pSh/w=;
 b=Af6o0XdMqqQXl0w/5DTDgyUTSO6gcni3FDXNb4JHKqLGaNcGjyNxJz3eO97spf80nK
 CJqtAf/wXMSBmoJe5Ew3xKaFD8urPrQs7DfQkFGpS+bipZqoyJntM9rHceKgN++JM6ad
 MCFV22y+tlGQgcF0eqaYMfQFSUcTQDHK94OQeLeNKCLYhgBx+FYndL0VqDGTEFqkW9Ws
 qNf+PMFPXSPBO992W7rMxJp6Lirg6J1I6EHaJ412Ny50Xows8DbWZMsr5KfDU4VHIbIn
 cSylD/28v+JNBT48z5tOdBSL65qOgy5xcqD4RNPnXd1zWt+o2B2SQepiMyEKpSMqanqh
 OnSA==
X-Gm-Message-State: AOAM530UX/qoa1NZmAPhBqXKEAz0mIX2g6ieKaqDZL0Vt7qolSY+eVHe
 HAoQ3k2bCdcdsN2zZ9Q8kYs=
X-Google-Smtp-Source: ABdhPJxH3CMpes4k7VUBJmRwBA7xuLJPWwlXmpOLLvAcoVgK+lPVzlEL/k+veWQQUizcViCkQhf2+Q==
X-Received: by 2002:a05:6214:2a1:: with SMTP id m1mr370118qvv.35.1606252816750; 
 Tue, 24 Nov 2020 13:20:16 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id o16sm451985qkg.27.2020.11.24.13.20.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 13:20:16 -0800 (PST)
Date: Tue, 24 Nov 2020 16:19:53 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 27/45] block: simplify the block device claiming interface
Message-ID: <X714+RhOhKVlNrAo@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-28-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-28-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_162018_434856_2161297E 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: Jens Axboe <axboe@kernel.dk>, Jan Kara <jack@suse.cz>,
 Mike Snitzer <snitzer@redhat.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.com>,
 Josef Bacik <josef@toxicpanda.com>, Coly Li <colyli@suse.de>,
 linux-block@vger.kernel.org, Richard Weinberger <richard@nod.at>,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>, linux-fsdevel@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-mm@kvack.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Nov 24, 2020 at 02:27:33PM +0100, Christoph Hellwig wrote:
> Stop passing the whole device as a separate argument given that it
> can be trivially deducted and cleanup the !holder debug check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
