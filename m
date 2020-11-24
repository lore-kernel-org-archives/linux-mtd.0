Return-Path: <SRS0=p38J=E6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0859CC2D0E4
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:37:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8577F206C0
	for <linux-mtd@archiver.kernel.org>; Tue, 24 Nov 2020 17:37:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0Jnqdc/h";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/ritBav"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8577F206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QdJQRWwUBjJagZuzOQ49zKMvLctP5fnAMev3OdrNmPQ=; b=0Jnqdc/huiFmJU0uZ09d5sdPK
	TI06ZmsjnyXuW1M+f3oE8bGLdbBxlSxuEY0PycdnGtbrng+rzKPAsKOdeo4dX20FbNG7LPwdMLie6
	iWEE3aGZPeBzChJeFzU3rQM2jQo8rAziDwMmFw7yUk/8O5SSbJnar9ZfoOwnO673cIhKpbF5coNvs
	18Zzr8y9Gnti1VcvMfOS++IwPdzI39jNlCMqtueWTZA7fTbjj0qHvBB9Gk1RqrzE5e1q69Db1b9ST
	f2fsni0hxlX8MHsFo65UeVPf4NIEWfWiEMqeLjrzmfVzVEONSt3ntsEKy2vboX1zg7ZAXjaje4fYh
	N9C7/+cVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khcFf-00034N-33; Tue, 24 Nov 2020 17:37:15 +0000
Received: from mail-qt1-x842.google.com ([2607:f8b0:4864:20::842])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khcFc-00033N-2b
 for linux-mtd@lists.infradead.org; Tue, 24 Nov 2020 17:37:13 +0000
Received: by mail-qt1-x842.google.com with SMTP id f93so16632415qtb.10
 for <linux-mtd@lists.infradead.org>; Tue, 24 Nov 2020 09:37:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=RUiSFwuqBx5Z5RkIMV/LAo3IZ2wMWa1pe8Bi01kcv9s=;
 b=I/ritBavAlEmXZYTdxsCZ3TKkeS+XbD2T5fSeuu+WAKjEs5fvGA2bMQkLo5MtRefva
 qUl8yUxkVj+bBWUkgYhVfKpDhiO82hph16AQ0vGX7y+wlrcH9EWYcgfJQ+ri5yzcT/jj
 ur3RBED4twIKVJJFDo/q0nmklKouT/Ot6KY5VSp33Mrn+/sIul4sQvPJjUYsLJ8PVoUi
 uTUrhLlViP7uzPXo9Qlf/lrWs/mwSY/bN6T+YIT4kadfNOZMSiRbHdqwLGtEwY2FNG+a
 TyAacskIalN0dBCzTDwuIzKGsDgNK5Z2Dd7niqvvN6G5G9OXmjSjKHmLzT22iYm6LIXb
 z2wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=RUiSFwuqBx5Z5RkIMV/LAo3IZ2wMWa1pe8Bi01kcv9s=;
 b=t2sUYzSuV/lG5ZsB8HbT/AxUfFwXki7jYG9zElcVHb7OCfmnGrchuN95wz9UfYi08P
 0AOv7elI/IIWc0Huq3TaFg/iP+R04ugzS3SQa88+OfkJTreqPiJJpb+ZqQdMV/hITNG/
 GAj3jZ5KVHfNsaEPKPXblS2tIjNGXI1nuhbb1XJ2P0Sg7L1rTycBGnDG1vSFY9prui+O
 GNYxQzvq+gqCnrFsooCjZvX/zf5Jhxp5ilTJQk8oXo6AmbuFpX/IC93mao4ulE5d60Vb
 5NYJl4ufrT5hsgZyGY8o2C9Xylrj4Ovj2VskNrdFZgCK1g5nEw3Vd95n44hlv5J6XTfl
 ROdQ==
X-Gm-Message-State: AOAM530duMNYLmc4Hw+YnzMvRgbUJ/pQoijPGgy7xb9mHOmqs//sbVVq
 rWJu9F9JU4Q2oR9ZWMAny28=
X-Google-Smtp-Source: ABdhPJzns9py3D52IrNBrxEn0rk+MGg8bhauWe2r/6sVRsp+lUoI9EtR7DOBSR7jcCHuxmdt3gs4iQ==
X-Received: by 2002:ac8:4802:: with SMTP id g2mr5435506qtq.235.1606239429633; 
 Tue, 24 Nov 2020 09:37:09 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id 137sm13319731qkj.109.2020.11.24.09.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2020 09:37:08 -0800 (PST)
Date: Tue, 24 Nov 2020 12:36:46 -0500
From: Tejun Heo <tj@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/45] block: remove a duplicate __disk_get_part prototype
Message-ID: <X71ErqPWQu+CvXRI@mtj.duckdns.org>
References: <20201124132751.3747337-1-hch@lst.de>
 <20201124132751.3747337-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201124132751.3747337-12-hch@lst.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_123712_177709_6C167FB0 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue, Nov 24, 2020 at 02:27:17PM +0100, Christoph Hellwig wrote:
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Jan Kara <jack@suse.cz>
> Reviewed-by: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Acked-by: Tejun Heo <tj@kernel.org>

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
