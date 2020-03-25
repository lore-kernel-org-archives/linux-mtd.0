Return-Path: <SRS0=FPAn=5K=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC057C1975A
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 15:52:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AEC22077D
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Mar 2020 15:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FDU9yNpc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=cogentembedded-com.20150623.gappssmtp.com header.i=@cogentembedded-com.20150623.gappssmtp.com header.b="uicKA8wI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AEC22077D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cogentembedded.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PPrP4zKrXQgOwUjADJBNVqZNOOUT4Em9x/JqiAdJYmQ=; b=FDU9yNpcByvFLp
	IzcQkaKf6e5c7zYkVt7FF8NRj5OGH6QMKHQGIahcxNne8uwKFVYBfS3iB3iOeb3i6jQLS2B7a1kAn
	OBFgYEO8NLVyG5Go9QFfgo2BhpOvzIbF13GHQveyl4g+1/jks1lTWuRo0tKwuyUY7VI8KOjdu59PD
	bRMsSjyo8Zvn4mP+CxURD6wRSBrDlhIFEDk9RHISSjcL3+Yuo7LyYBtSJ5bFn2FNzAng12HJJaq0s
	0VlJdXtMrAel2Icx/GQvYVgfJIZU1WITA0B/sxG18TATk/vrFw2lQFT2+tuEXjV5mi40zvkMMvtjk
	cNJ+aXk0+wfggQzRCqoQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH8K7-0006pb-TN; Wed, 25 Mar 2020 15:52:07 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH8K4-0006or-G2
 for linux-mtd@lists.infradead.org; Wed, 25 Mar 2020 15:52:06 +0000
Received: by mail-lj1-x241.google.com with SMTP id w1so3003733ljh.5
 for <linux-mtd@lists.infradead.org>; Wed, 25 Mar 2020 08:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cogentembedded-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FFKgDeHvhTCS00AQN8L5xpmPeeM6E1oKLK7azqnWDiE=;
 b=uicKA8wIvWFlXoj/N3LEYBm1C4A3V4P9iw9tec/gYSHrhStzUBQCHg9572Xte1kjgR
 ThMBTvZUPKiWKz7FpDL5FpZdKIk2YCmk4xT9mv8vXzDYbG7BnewAeqmTmjbMblvWal3H
 mWL8hgD8rxlqA3cc+cD7G6ybnkogU1aJ7AGejI0PI8JR5OHaQ8Yinse9H4h+GK2Hb1A4
 AO25iODgSANaemv90W5sSFYFQjzOpxBoKLIe96Vf8WjB/zrqJX1NEJY7yq750pQkaqOk
 1+9OYeGLNZxl0e6F3esYfat8n9CQbuKfwTbzDvu3Chf0eeKLqiEo59Jx1mNdOEbnZcqK
 7RZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FFKgDeHvhTCS00AQN8L5xpmPeeM6E1oKLK7azqnWDiE=;
 b=kaLHCt0FV2KaxjSdy13liB0oQcEXstjjFIGKIapnrKF7EtE9/BgrHyG4NaGxBsLO1o
 a0GzbBnZMEooX6qx2AmtDlZjm3QqKg6ZpWqi+nqfLKWIdH+aSogaSR9ej3aUY3exxRX8
 r0DaTGmorYB8+UKLf0ZU5HFsxE53KPc4D1KfNNOc99vWoWEaz4Pe+Rxfy7ltljKxxmNF
 Zd6yq7hYqoym5khT6Li1IT9dvPxpMdMOOZlZ3XH8cRicDSD8r9HskhKdNizMOte8v9AE
 VpB/p81D09XyRz3ip79ol3IYZyZyLpG6veIRGy2bIg/5IUov7xeRgb80dPYUEv3uzTYA
 94RA==
X-Gm-Message-State: AGi0Pubb0ShLmJs4QOOn+VfGqflM4PHX5fd/sC4GVo4tNWGZP7xyWtlg
 JUh0N9kRwNbFEzw8mzy7vt7n5Q==
X-Google-Smtp-Source: ADFU+vv75ZUwXg2vEi4sa3vjU/XvBmaxBeQGnk0gRxgFefclx3FSltiYeD1SYorsoysNlfqIA2nFcA==
X-Received: by 2002:a2e:964e:: with SMTP id z14mr2510095ljh.44.1585151522265; 
 Wed, 25 Mar 2020 08:52:02 -0700 (PDT)
Received: from wasted.cogentembedded.com
 ([2a00:1fa0:4678:2dac:733f:487d:7a84:7bac])
 by smtp.gmail.com with ESMTPSA id l21sm275175lfh.63.2020.03.25.08.52.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Mar 2020 08:52:01 -0700 (PDT)
Subject: Re: [PATCH 1/4] ubifs: remove broken lazytime support
To: Christoph Hellwig <hch@lst.de>, Theodore Ts'o <tytso@mit.edu>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Al Viro <viro@zeniv.linux.org.uk>, Richard Weinberger <richard@nod.at>,
 linux-xfs@vger.kernel.org
References: <20200325122825.1086872-1-hch@lst.de>
 <20200325122825.1086872-2-hch@lst.de>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Organization: Cogent Embedded
Message-ID: <3771d2fd-b563-b74d-491b-e2bab9242126@cogentembedded.com>
Date: Wed, 25 Mar 2020 18:51:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20200325122825.1086872-2-hch@lst.de>
Content-Language: en-MW
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_085204_949416_ECB93F54 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, linux-mtd@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hello!

On 03/25/2020 03:28 PM, Christoph Hellwig wrote:

> When "ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs" introduces atime
> support to ubifs, it also lazytime support, but that support is
                           ^ includes?

> terminally broken, as it causes mark_inode_dirty_sync to be called from
> __writeback_single_inode, which will then trigger the locking assert
> in ubifs_dirty_inode.  Just remove this broken support for now, it can
> be readded later, especially as some infrastructure changes should
> make that easier soon.
> 
> Fixes: 8c1c5f263833 ("ubifs: introduce UBIFS_ATIME_SUPPORT to ubifs")
> Signed-off-by: Christoph Hellwig <hch@lst.de>
[...]

MBR, Sergei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
