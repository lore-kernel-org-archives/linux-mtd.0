Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB31C77B75
	for <linux-mtd@archiver.kernel.org>; Tue, 23 May 2023 16:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ULw6QQWXC5IwYMF4iEro1NPu7WBvoPD4a7y/IJ1w+fg=; b=dYjnzGNUZw/tf9
	OHcXKfeBAVHcg9dFM59JJ+SAbSCQXSFtyiwGz+0ZK825HlILIcsc5wythYMbkG4ruIPKdshRVSc0a
	t3dZKO49LD51jup2w6x2rXwnpkYGecxXaty63qmbjjbv+skQatSsQxIw1cKjeu0Li8MysBhzwZZuK
	SgTMefPt57zThZzEZA9iA4UtWivlo0WphI00ib/Y5KmDEYiQ8OG0s6tovMiR96+wvAvV+Q0rgcrgn
	aRKNJlH8Wp34fap3XquQGYPCOG8jqku2Vi1YpgF3yIZLxpl6x2Cr38FYUFQOFTzBMhiGP2kUyggJp
	IBaicEjCGTobHywZJQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VIs-00AsGW-0H;
	Tue, 23 May 2023 16:56:06 +0000
Received: from mail-qv1-f41.google.com ([209.85.219.41])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1VIp-00AsFp-24
	for linux-mtd@lists.infradead.org;
	Tue, 23 May 2023 16:56:04 +0000
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-623f24b7ec9so35806016d6.3
        for <linux-mtd@lists.infradead.org>; Tue, 23 May 2023 09:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684860961; x=1687452961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I895gSBgpzDKKLUi/M3iUfQpFGQN//aYkK8LK5AguTA=;
        b=IXZ8hb3xsm1kFIdYAdhlohROXCzSlqZHYuuqk4k2uMBekewMRXnJd/sEDV2ZKyBQjF
         lJ+GoDJEl9s3FGTIR8R3q+a0MlB2mLuRZcL05letmImdKiNEMo0yjdKZvXASTSRzOvqp
         RUqE2JuHgz1k6ipYRn6xwFK+MCEryuxp66kb0stxXOiSTH6C47CGJ3pTdIdig2bLd0ZQ
         ANpM6Rz35m4VD4tVqanAzdTbkeqWaMv5It9Lpdqh3dvaRSpN+GTa7SIM1QL1f8+HcKsp
         w49JuUkqM7A43KfsvdjWEyO6mzbOfIKAl/ESr3Tmdhs+wgzYWdlqJwX51HjckX6eOpbC
         b4wg==
X-Gm-Message-State: AC+VfDy59iLUUMVjo/fxpjsSBfjxg77CexemKD9AW2a6Rbeannjpyq0E
	MGqUMavEKOjly32+A487YrTg
X-Google-Smtp-Source: ACHHUZ7flOXCsLoBxKovnaaX/oi0L/ZSk0yhITAbxyTXaocIhbpqrKl1r3JlMCNYZavegSmc6yz+9Q==
X-Received: by 2002:a05:6214:2aa4:b0:5ef:a772:2731 with SMTP id js4-20020a0562142aa400b005efa7722731mr22618918qvb.11.1684860961501;
        Tue, 23 May 2023 09:56:01 -0700 (PDT)
Received: from localhost (pool-68-160-166-30.bstnma.fios.verizon.net. [68.160.166.30])
        by smtp.gmail.com with ESMTPSA id cz10-20020a056214088a00b0062120b054easm2895666qvb.20.2023.05.23.09.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 09:56:01 -0700 (PDT)
Date: Tue, 23 May 2023 12:56:00 -0400
From: Mike Snitzer <snitzer@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Joern Engel <joern@lazybastard.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>, Pavel Machek <pavel@ucw.cz>,
	dm-devel@redhat.com, linux-kernel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 17/24] dm-snap: simplify the origin_dev == cow_dev check
 in snapshot_ctr
Message-ID: <ZGzwIGPfRggsU0Ek@redhat.com>
References: <20230523074535.249802-1-hch@lst.de>
 <20230523074535.249802-18-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523074535.249802-18-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230523_095603_681925_837C49A2 
X-CRM114-Status: GOOD (  11.10  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, May 23 2023 at  3:45P -0400,
Christoph Hellwig <hch@lst.de> wrote:

> Use the block_device acquired in dm_get_device for the check instead
> of doing an extra lookup.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Mike Snitzer <snitzer@kernel.org>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
