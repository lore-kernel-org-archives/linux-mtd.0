Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C76ACC6B33
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Oct 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1xF9Jyl02QJx5TalzfzqHt/wAFPayf/MWCbEjrpw1CA=; b=gcm3r+Vsl6w7hi
	6kZOFQ0tj4UGNCnn7Nrwb9We2Ii1nwMHhSOx5qkit2KQGzcvdHzebjBjUpMR4dGzFKDLdIxzIiE1+
	E5uIUwccMi1NGnnT+M0FUV0oy7j0vgJuhdmcOeWHGGvVwcW1MyXfH52NwjF3czwEo7G2Pv1WPmOqQ
	/Ft25CoCsjcBGhQkilkjBIcKDVZecVoFyIBJCAIXaOdJpQN2d274cXzAzQYSbFxJVNcuj+Qd8aoUH
	2nNeHZvzd++lqgMNp6XizDRQfdYOz/AZMaqTlxOr12pErHWfQZ4N21EToI5hNtfhaVoo6JM/h/HYl
	9EtuFAP0OuyCidOSRi8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHK5G-000000002Jt-3GUN;
	Thu, 15 Oct 2026 11:57:18 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHK5D-000000002JS-3rbh
	for linux-mtd@lists.infradead.org;
	Thu, 15 Oct 2026 11:57:17 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1370319a12.3
        for <linux-mtd@lists.infradead.org>; Thu, 15 Oct 2026 04:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792065435; x=1792670235; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=906FzucSaczRxmafxCH5c+olZhTAIC+89/t5khd2vjw=;
        b=O3Dy84cshWjmZIMQ1WPJwZuVEk7xq3kJMnNg8MBtSt2QTcGn8Daql87U/UE6CegxFh
         GtH0FZfa9U3EZk7F75fKygJZSgpF506sBISvPQbVhRr8tBfG6NxsSYIPHWFaSm+O3J2W
         BsmCpNTrY1d9ZosNa8kro8vL3tujcXHcLgFoQu+6GMqx3AauCnsVeV3Aqxd5P9ilFfxh
         Vu03eC+Y0G/I/HA+zPhWrZkx4YxYSU3hyUriFitKYXTJeJEnIHqCDi/lsdzR/WvSbzgx
         UEjBanPg2u+/lGi14Mcuaihi0uM58sylCHR8zE+cmE/xWonLNV4hbYVCbYAsBpEPp3gt
         /vHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792065435; x=1792670235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=906FzucSaczRxmafxCH5c+olZhTAIC+89/t5khd2vjw=;
        b=vdxlOR13nJbm1efsweWistzLutvBQsU7lOkQ3T2Ig4kspiVYXvhF9bgBm9Ea14K+iy
         Wb9ZTgi5p0+8f/b09yHMjWNqROc+uOMDKHueYHfJv+aSmHzfsOhgOuA4L4pN/vZaCvj5
         gAb7kzGKikOGyMKa2L4uT1AxmGvvI+DGMJ472gf/b0enUUHt/QhVMnuu+FZIDbPVMRZb
         Hr0tWAz/w3snL2/ktBC9EvjJcNgOfz8HcBZW98mcp+Qsgz2ND9MJMs3gU8EYFofhucTm
         EHsfJosZj1AYPnJr1XRMG5SaN/gA0e1bn+Qkd0isaKlE4ZJvIjATIpbmjjqHOPphrWei
         Ze5Q==
X-Gm-Message-State: AFq9FYJbhbqLRAt2QGqu5L60zUlWeg9uDzMjXXqXKNUQ0P2zEp6kK9ri
	yk+Xs8/h1OJT23GZgonz4DtBCOw3VXDQSFc50G/xkcLLo/6YbzfIskBiwf6dLWQIVzDDfQ==
X-Gm-Gg: AYBFou0ty00nMd6b4U/xHuNIqeHfb0LdM+C5fusfVmGuPaGGcQj1tPcqIw9i+AOmQUn
	QH9Rv+akp8XulP4eQGXR7CQEyv4OFo9P30ly3KuOVUhwyUQ0WvCy3W4qOIIicqes9SCXGs6u9Tt
	OvDeitKi05RdnmQwkPHzVZznI6Y4VRQ7HHfA1RYuA7uAMZd+ea+GNxbVArp2YheEG6PgeKLLY2Q
	cYRpGnXJMJY5my+Qfexjp6avJy+Vk5mvW8ZxAIL+rjzG6H66G3k2VYvqRfeL4MoyfPaYB6GwGMH
	PbJZbxr1IzFpeVCRSknYTNhe0lyWAiZhgrNGtcOMu+3ahe4RvStimWzmB6Lsl0NhsJxIaHiu439
	RddUCSw4sGCdR3n+/q8XqqTrnjUU3MesHz+mPD1nXsvoV4XqlFsgBx9DxBNElu0DRlsngrkGeyQ
	PsMcjqVMSlVD7omauFfkpsPKxOY3E+xAQ9KueOkM4klgVPpQYo/Y5cnUWYOsFX3XfB53Q0uwgOS
	TMeAQkgDabpHWrklB8WzT1WNBs=
X-Received: by 2002:a17:90b:2ec4:b0:39e:574d:3d2f with SMTP id 98e67ed59e1d1-3ab3a39ee2fmr16098050a91.7.1792065434854;
        Thu, 15 Oct 2026 04:57:14 -0700 (PDT)
Received: from localhost.localdomain ([183.250.189.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm4236919a91.3.2026.10.15.04.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 04:57:14 -0700 (PDT)
From: Ye Linfei <yelinfei66@gmail.com>
X-Google-Original-From: Ye Linfei <yelinfei@ruijie.com.cn>
To: chengzhihao1@huawei.com
Cc: linux-mtd@lists.infradead.org,
	richard@nod.at,
	miquel.raynal@bootlin.com,
	vigneshr@ti.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] mtd: ubi: use GFP_NOIO for lock tree entry allocation
Date: Thu, 15 Oct 2026 19:56:53 +0800
Message-Id: <reply-zhihao-patch2.1792046946.git.yelinfei@ruijie.com.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f89c80cb-d879-ede2-9459-1778ff2f71c2@huawei.com>
References: <cover.1792046946.git.yelinfei@ruijie.com.cn> <8b4e0b970271095df8321b1662aa464c5b9002dc.1792046946.git.yelinfei@ruijie.com.cn> <f89c80cb-d879-ede2-9459-1778ff2f71c2@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_045716_192162_BB1494C2 
X-CRM114-Status: UNSURE (   8.71  )
X-CRM114-Notice: Please train this message.
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

On Thu, 2026-10-15 at 19:03 +0800, Zhihao Cheng wrote:
> The ltree_add_entry() has many callers that not need GFP_NOIO, I think
> 'mtd: ubi: block: forbid direct reclaim I/O during synchronous read'
> is enough.

Agreed, and thanks for catching this.

With memalloc_noio_save() in place, the ltree allocation inside
ubiblock_read() already drops __GFP_IO implicitly, so the explicit
GFP_NOIO there adds nothing.  The remaining ltree_add_entry() callers
(ubi_eba_write_leb() and friends from cdev/update/wear-leveling paths)
run in process or kthread context rather than a blk-mq synchronous
dispatch loop, where swap I/O triggered by direct reclaim can complete
normally; forcing GFP_NOIO on them is unnecessary.

I will drop this patch and send a v2 with the block driver change only.

Ye Linfei

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
