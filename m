Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9ECC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 18:07:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 71895206D5
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 18:07:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V+rDoFw5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mFcTt0Mg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 71895206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=i+BnL01iYJ1KT9mbgkdeiYwJ6xzGWNn6HjGYs7mXajI=; b=V+rDoFw5/jEv97YlRy1bbZOI9
	a95d2pvDwnPnzhsEuVFgHnlo6mjVsYUfOpH2a4bOzIkcDf3k+DNgW0DRU7DX5qFlc3EipKn7DLwvc
	cEHTTSRF32nHS06AKZOgsp7IFV+ISwgqfj24I7WUOUoglSIPYKfg9YfxUAPg3SkzNUFSoAopU6mrn
	IqB+OXt56VYioSXCJgLMPTOC1dUPcL4UHRH7/FZQx1rY62XFuUGT8mXoEb6/f9umDHiPwlfRzw3uu
	FT2y6i5OYRWbDvRxKZvDFdPgEZt7e7tcHJM3HNzgHMIUG6sp3lvMQKD1JowRNlisv5qKEaYkATRCK
	s9fmVadbQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khchl-0007vh-PD; Tue, 24 Nov 2020 18:06:17 +0000
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khchj-0007vC-AA
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 18:06:16 +0000
Received: by mail-qt1-x841.google.com with SMTP id m65so16704324qte.11
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 10:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=XGgWvl0Napb7ckr1b5Je/XF/vo+wq/s703ULFNCgBaI=;
 b=mFcTt0MgjM9IqQp5CjNn460f80WY5TgOpPJ6Ay4ntldAJKb6Rjl0HTJIZ+yFn5diNg
 Y9XgufAijyGSVMo3oa5mbzUjsTfdGF4klUksliDQRN3qDG0d8QMDnfA4E5LuG2LRxix9
 hartKdsjUyOnRZk1OwfqKdcIsVXRFfJDauC2DAxEf1EDFmBabgsDa0m7UqLxfYY5bZRj
 zYqj7h62Xy2JH5Y5YERtz3Jqa3G8xCCNygCgwbvWWscHLpe2a2ipXU92XYpjwaNY0VJ2
 iVk3YMDEtvOraBt/erbOI6z6NYw/s24zXpCk/3X14GTWVBM8KYbSPmvWGmoSgwz5tNpw
 HXSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=XGgWvl0Napb7ckr1b5Je/XF/vo+wq/s703ULFNCgBaI=;
 b=SIOy1a05R9Vkwf6keB1N8nu2yz8QtyKDYmcexmTIXtf0q0rhdHV4qK+QFVoYAuYJQ5
 OI/qZbAWU7wsyfmdf0MCR79QQG0CsX0E/ivZO3c24IBD8x9AGcj6wgWnb9+iWx1hBG1N
 gjNpMn8bu4FELCsalipWHTMqF2d9flcClj4iwKL/TDMv1gaF2VbyzmbhMruNljwBVWie
 3Ll0p9xM0saNAM6cSsov8BWovBwPjEragGStpgJodS1Vx1M3jA76zrSScI+pEEu3zGeP
 Z4SX2H/HImjb/kF9gWX49jLnLLN+V/gkCDgOWDRtvLfhiyVm1ayReHouyGjw9M7NhKkJ
 ZQ7w==
X-Gm-Message-State: AOAM531uwtl1cq1iNG3chpFzdcNQarHQZaWoLh8ZGddi2q3TdzbZoqTt
 TGWinTpNWc94TvTWNvMGd/I=
X-Google-Smtp-Source: ABdhPJy4KzGqVN9OifimW7Bbj0BtBOYaib7uEK7t2ko3uV9boQAgproJwZycxdIrJmhhR00FFdaCLQ==
X-Received: by 2002:ac8:58c7:: with SMTP id u7mr5558192qta.54.1606241173470;
 Tue, 24 Nov 2020 10:06:13 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id s7sm13264706qkm.124.2020.11.24.10.06.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 10:06:12 -0800 (PST)
Date: Tue, 24 Nov 2020 13:05:50 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 22/45] block: opencode devcgroup_inode_permission
Message-ID: <X71LfgUr2lIKqDx+@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-23-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-23-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_130615_418313_1EF427E3 
X-CRM114-Status: GOOD (  12.63  )
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

On Tue, Nov 24, 2020 at 02:27:28PM +0100, Christoph Hellwig wrote:
> Just call devcgroup_check_permission to avoid various superflous checks
> and a double conversion of the access flags.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
