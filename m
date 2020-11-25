Return-Path: <SRS0=DcMO=E7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9110CC5519F
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 12:10:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EC60206F7
	for <linux-mtd@archiver.kernel.org>; Wed, 25 Nov 2020 12:10:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fXsFv2et";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBMGf8Zl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EC60206F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m0PDFpy5bzn5h0Yg+E/kuz5adgsPJwLRkDOFxQUM7vI=; b=fXsFv2etoUaDz+PE7fYX+E4FD
	orX3QOl39B5hBtwyrLdn4GcZXZ7zWmqtmUk1aMGmNNmAH8MOS6h31iYP8DRZBYno5Nv8TGHx1bpiM
	yZz7TrGwX0eqUGuWTWgBvxmMVykpWzDfIJPccrkA1dhbwh4IBY3QIqFQn98pUgCiGo86N6+v/fsK9
	QPNycJx2fNmlTMiaxiQf1CKteGne7TZrzQYhCniZodzwTeenW9xr9TmBvrm6EYMXWLBFP4qCI9GWd
	XlqpH6L9g3/1CDyeZTYZ26QWB7fBmVufyyiv8tNvNCxabJ+Fp/BA83ml2MPonyIPVuXh4G1is60lp
	ofVhBHk3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khtcj-0006ef-Sl; Wed, 25 Nov 2020 12:10:13 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khtch-0006de-Fv
 for linux-mtd@lists.infradead.org; Wed, 25 Nov 2020 12:10:12 +0000
Received: by mail-io1-xd36.google.com with SMTP id s10so1925338ioe.1
 for <linux-mtd@lists.infradead.org>; Wed, 25 Nov 2020 04:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7Gu8dfUtFbW1JkuoI0JsJxuRwdXnhq5kHzNpgpg59Vg=;
 b=qBMGf8ZlpGBDrQf4OZ1U5hpBWVyNLxT8t7mb89EQfIXn+CYHj49+4NspUMpFZN+IBb
 ow2ADzA501Y4hGPFKjrnnAGIPGi9hyvAwwXtpDtFAkYj7ksmhQny5Q5+xlY6jtJjsSvN
 iA9i5fMRanrtfyZfe3+dWZgmeaV0x4lRD+7LgXZczkfB+RbnQDZrkTxOZ7Es8MQAef6B
 e5RRaQ3t+46Lg0Zd/h/8g8StzDseAQGAZgvUuKfsUJH8/o4saKvewPtw+57G9TyZa/BY
 /ViJEbywwBG8XKFF7bgqckI6jrquPx5+GfHPK5ghMTcJ5KumQuJnVjVzT50eAtnQOxE9
 Uwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to;
 bh=7Gu8dfUtFbW1JkuoI0JsJxuRwdXnhq5kHzNpgpg59Vg=;
 b=QV6XPwQsQCIn32Mm0Ew7ZKZZ8eWiJULgCiOJXmIgY2+ntgAsAY5hcjkZORX4eBCobm
 WHaar05X9G/caifJzsxE+coWZ+/BRoIgwb05oh+iJkubsnSWObzhOXr9hKEhLh0DZLoZ
 EnPp8nbLs4z+LIO9aedkweEnBtxTGrN8gWk9re5RNFZY6aZjJTMHReUc3l1MLwPv/Nyg
 orx5Ww5ZRm+rh2arR6L7CTu1nwTtNlo4tWMkckHBwM4dw0J1Gv2eUxLfh/mbYEOtSdrR
 fCixW7CEQOhnUSdFLib93OlhrlGbSXDDfOIfMqCmvKvBH6Rtk9SRXCmUYe4qpG200x6h
 C4lg==
X-Gm-Message-State: AOAM5333DGT3RJeRBpseMTscbm/mVI4inu6RlD7XqoAjUpJAzycAjVNH
 srHr8P1v51k9N7IYzhT33wE=
X-Google-Smtp-Source: ABdhPJzrP+6qlAsvVf6NJAz9IW3W/tDwuPyEzkZeYfjLrVcKdFZvzQhG4Xm+JItZe22HwNKBFUD46g==
X-Received: by 2002:a5e:8206:: with SMTP id l6mr2327550iom.126.1606306209079; 
 Wed, 25 Nov 2020 04:10:09 -0800 (PST)
Received: from localhost (dhcp-6c-ae-f6-dc-d8-61.cpe.echoes.net. [72.28.8.195])
 by smtp.gmail.com with ESMTPSA id v85sm1343250ilk.50.2020.11.25.04.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:10:08 -0800 (PST)
Date: Wed, 25 Nov 2020 07:09:46 -0500
From: Tejun Heo <tj@kernel.org>
To: Jan Kara <jack@suse.cz>
Subject: Re: [PATCH 11/20] block: reference struct block_device from struct
 hd_struct
Message-ID: <X75JitlWvZieqIR3@mtj.duckdns.org>
References: <20201118084800.2339180-1-hch@lst.de>
 <20201118084800.2339180-12-hch@lst.de>
 <X708BTJ5njtbC2z1@mtj.duckdns.org>
 <20201125114044.GC16944@quack2.suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201125114044.GC16944@quack2.suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_071011_603655_0217F063 
X-CRM114-Status: GOOD (  18.49  )
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
 Coly Li <colyli@suse.de>, linux-block@vger.kernel.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-bcache@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hey, Jan,

On Wed, Nov 25, 2020 at 12:40:44PM +0100, Jan Kara wrote:
> > I don't think this is necessary now that the bdev and inode lifetimes are
> > one. Before, punching out the association early was necessary because we
> > could be in a situation where we can successfully look up a part from idr
> > and then try to pin the associated disk which may already be freed. With the
> > new code, the lookup is through the inode whose lifetime is one and the same
> > with gendisk, so use-after-free isn't possible and __blkdev_get() will
> > reliably reject such open attempts.
> 
> I think the remove_inode_hash() call is actually still needed. Consider a
> situation when the disk is unplugged, gendisk gets destroyed, bdev still
> lives on (e.g. because it is still open). Device gets re-plugged, gendisk
> for the same device number gets created. But we really need new bdev for
> this because from higher level POV this is completely new device. And the
> old bdev needs to live on as long as it is open. So IMO we still need to
> just unhash the inode and leave it lingering in the background.

You're absolutely right. I was only thinking about the lifetime problem
described in the comment. So, it just needs an updated comment there, I
think.

Thanks.

-- 
tejun

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
