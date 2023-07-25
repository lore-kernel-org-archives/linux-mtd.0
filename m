Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2AAEB64DD
	for <linux-mtd@archiver.kernel.org>; Tue, 25 Jul 2023 05:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T9yRjKzW37OV672KKeUqJgBJyIHHVTB+5JIScrrmPN4=; b=Sa+RFEXWffPrVo
	g1qVyY4hiWMD1QZx4V99SuXzaaEtYTHUtOQ3vFrHYOMDw3kKj5d5FpgOJf1pfwZoR5PSBVC5R6UZd
	1Fq1q42yVG6VRq8tMwEKTKGgQyiw+QsVczL1GmWVpJZcFLRt6N3JG+y4HZEkVWpgTHrtPGwZZxE5B
	qKSmGVGuOR9JmcyJTa0CA1Cb3ZqPUQTzJOtRjqP5kWWWMz5En9d6aQEKSYehtzq+6azOcedyO8LO4
	nkvwXwWs7Mwtr063BgVf592sAph1XFOAi9GCRiwDWRqdleHcdFZApTCK0U4fPPZrjB2yuxGL8yxHN
	oXkmRyMYr6ngxHc2EfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qOAmS-006JeH-1R;
	Tue, 25 Jul 2023 05:40:20 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qOAmP-006JdO-1s
	for linux-mtd@lists.infradead.org;
	Tue, 25 Jul 2023 05:40:19 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3fbc656873eso51387595e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 24 Jul 2023 22:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690263615; x=1690868415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EPZ5A0Fv0jBh+2WplEexOHdYE9XQO9hqwRtuQ5unl3s=;
        b=ZvmFAJzpvX6m++KSa4PCatoOahVzquTIwgFhFbgKi1jKtvmCDRE3mD+btga+sBRTAg
         2h0FkEBZyZKGq1ONq4DB4MBYvVXiaqqt18G/DU0UgiMaopQ1FQkYNT2szLen5yi96Bbw
         M+YIJCqtwu4NK7kVsrRAEP1iZNjKF9aj0bcTv0ZF7GPEiZhvm+JQcBIHMMDQ+nHIW9uk
         pSz4DZLuY4gKoVkRFoba9C/GZ28O7mz1fQZjONKjbhVvVWfYqJZ2rR9gfKFSWkYUByN+
         Nz0RSZkRFdtfYZE0ZsP45Mw092Xfq/JS3MB3ak7mwUGS15S7W9gWJ/uie+lZyXZvJJjL
         bpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690263615; x=1690868415;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EPZ5A0Fv0jBh+2WplEexOHdYE9XQO9hqwRtuQ5unl3s=;
        b=RwfZG6HKDznbH8YeB7I0XQZ1se2jsF2GFBjqJuOiDcBYrI69YYaUpcqR4Xx3FsuHG1
         u+lMDHy6ZimjXeJw1eWsrggZFRlrJvOBz3RujzddTJZSWDlPW582qfM8bnh0px7CwQ7R
         PwUUsalSLBx30x7xlMrlmKEcEhcwhkv85W9LXCITvgZ/CUqdKxR38vMsmk9M88kF1Pbf
         YDJYRzA2AuFHNLl9bYQtFNklvXn8aZO/iiTF0bvbiKDn5dybqtZlcaoNm/5tL+kzRhyb
         A3tXWJWWli0CQIbWysdTQji7wqSOGYsfwwLUFmXb7CLFpTo5BGDQM454XGrBAmsIVifo
         zo6w==
X-Gm-Message-State: ABy/qLYvUTYfb/0qClSSrNAJWqS+21RVQCrki/pIOmfFWBtrRnQrUgL8
	7ETCYku6mJB2MY2oV0OzJgTBBA==
X-Google-Smtp-Source: APBJJlH8tkeqdWaNYgfjhDEo36VnYMPund2Vd7SZPeAwzQ1tNFzBUSE9mDfktHjPJZgQ2Lzk+bJioA==
X-Received: by 2002:a5d:5502:0:b0:317:5eff:1a2a with SMTP id b2-20020a5d5502000000b003175eff1a2amr3533650wrv.44.1690263615270;
        Mon, 24 Jul 2023 22:40:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id r11-20020a056000014b00b0031437299fafsm15082515wrx.34.2023.07.24.22.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 22:40:15 -0700 (PDT)
Date: Tue, 25 Jul 2023 08:40:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: hch@lst.de
Cc: linux-mtd@lists.infradead.org
Subject: [bug report] ubi: use blk_mq_alloc_disk and blk_cleanup_disk
Message-ID: <0647d000-a3f0-4362-a299-b83947c82dbb@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_224017_637422_D2097770 
X-CRM114-Status: UNSURE (   9.11  )
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

Hello Christoph Hellwig,

The patch 77567b25ab9f: "ubi: use blk_mq_alloc_disk and
blk_cleanup_disk" from Jun 2, 2021 (linux-next), leads to the
following Smatch static checker warning:

	drivers/mtd/ubi/block.c:390 ubiblock_create()
	warn: pointer dereferenced without being set 'dev->gd'

drivers/mtd/ubi/block.c
    349 int ubiblock_create(struct ubi_volume_info *vi)
    350 {
    351         struct ubiblock *dev;
    352         struct gendisk *gd;
    353         u64 disk_capacity;
    354         int ret;
    355 
    356         ret = calc_disk_capacity(vi, &disk_capacity);
    357         if (ret) {
    358                 return ret;
    359         }
    360 
    361         /* Check that the volume isn't already handled */
    362         mutex_lock(&devices_mutex);
    363         if (find_dev_nolock(vi->ubi_num, vi->vol_id)) {
    364                 ret = -EEXIST;
    365                 goto out_unlock;
    366         }
    367 
    368         dev = kzalloc(sizeof(struct ubiblock), GFP_KERNEL);
    369         if (!dev) {
    370                 ret = -ENOMEM;
    371                 goto out_unlock;
    372         }
    373 
    374         mutex_init(&dev->dev_mutex);
    375 
    376         dev->ubi_num = vi->ubi_num;
    377         dev->vol_id = vi->vol_id;
    378         dev->leb_size = vi->usable_leb_size;
    379 
    380         dev->tag_set.ops = &ubiblock_mq_ops;
    381         dev->tag_set.queue_depth = 64;
    382         dev->tag_set.numa_node = NUMA_NO_NODE;
    383         dev->tag_set.flags = BLK_MQ_F_SHOULD_MERGE | BLK_MQ_F_BLOCKING;
    384         dev->tag_set.cmd_size = sizeof(struct ubiblock_pdu);
    385         dev->tag_set.driver_data = dev;
    386         dev->tag_set.nr_hw_queues = 1;
    387 
    388         ret = blk_mq_alloc_tag_set(&dev->tag_set);
    389         if (ret) {
--> 390                 dev_err(disk_to_dev(dev->gd), "blk_mq_alloc_tag_set failed");

dev->gd is NULL so this will crash.  Although maybe it won't crash
because the dev_err() macro has special code to handle weird addresses
below PAGE_SIZE.

    391                 goto out_free_dev;
    392         }
    393 
    394 
    395         /* Initialize the gendisk of this ubiblock device */
    396         gd = blk_mq_alloc_disk(&dev->tag_set, dev);
    397         if (IS_ERR(gd)) {
    398                 ret = PTR_ERR(gd);
    399                 goto out_free_tags;
    400         }
    401 
    402         gd->fops = &ubiblock_ops;
    403         gd->major = ubiblock_major;
    404         gd->minors = 1;
    405         gd->first_minor = idr_alloc(&ubiblock_minor_idr, dev, 0, 0, GFP_KERNEL);
    406         if (gd->first_minor < 0) {
    407                 dev_err(disk_to_dev(gd),
    408                         "block: dynamic minor allocation failed");
    409                 ret = -ENODEV;
    410                 goto out_cleanup_disk;
    411         }
    412         gd->flags |= GENHD_FL_NO_PART;
    413         gd->private_data = dev;
    414         sprintf(gd->disk_name, "ubiblock%d_%d", dev->ubi_num, dev->vol_id);
    415         set_capacity(gd, disk_capacity);
    416         dev->gd = gd;
    417 
    418         dev->rq = gd->queue;
    419         blk_queue_max_segments(dev->rq, UBI_MAX_SG_COUNT);
    420 
    421         list_add_tail(&dev->list, &ubiblock_devices);
    422 
    423         /* Must be the last step: anyone can call file ops from now on */
    424         ret = device_add_disk(vi->dev, dev->gd, NULL);
    425         if (ret)
    426                 goto out_remove_minor;
    427 
    428         dev_info(disk_to_dev(dev->gd), "created from ubi%d:%d(%s)",
    429                  dev->ubi_num, dev->vol_id, vi->name);
    430         mutex_unlock(&devices_mutex);
    431         return 0;
    432 
    433 out_remove_minor:
    434         list_del(&dev->list);
    435         idr_remove(&ubiblock_minor_idr, gd->first_minor);
    436 out_cleanup_disk:
    437         put_disk(dev->gd);
    438 out_free_tags:
    439         blk_mq_free_tag_set(&dev->tag_set);
    440 out_free_dev:
    441         kfree(dev);
    442 out_unlock:
    443         mutex_unlock(&devices_mutex);
    444 
    445         return ret;
    446 }

regards,
dan carpenter

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
