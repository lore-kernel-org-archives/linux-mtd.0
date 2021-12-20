Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D95C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Dec 2021 19:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m4WmxmT0olmm8DTLJZN4x+7zN7NxXK8DUbVy2HDN+ew=; b=hlSvqT4SGgHMRw
	BRH51BDSR6tMC8cHTTZtLRhYOIhf3LuBckCl2qX7m7cry+zXmipC/7B0RcYnbM2jcvliQDwDFkb7J
	2EE+xste4Qj4kgUyKJdPDWbxiP2QZRf5tHe8ZFSe0wGgBE5lWlfmKZh06iVxw+PUo18uuN+UdFAWM
	jeUq/sM0Ayv8tUhOhh7WMo8w4CTgCDfkD7eQ8vIsn8pwqRTMUo4EWPWYTPhMMDNl9lTu8agXMI41N
	8UcC4QLAL1WN0zyJPclUaMp6AjcqM1VWlsZx0CrYSdPNCkCbW295OGKWAayOgJHgi2/kGrgyME8bZ
	14Drrv55dvrRAkspLkDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzO4w-00414J-An; Mon, 20 Dec 2021 19:12:10 +0000
Received: from lelv0143.ext.ti.com ([198.47.23.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzNyu-003z3g-QA
 for linux-mtd@lists.infradead.org; Mon, 20 Dec 2021 19:05:58 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 1BKJ5sku026183;
 Mon, 20 Dec 2021 13:05:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1640027154;
 bh=UfAsvJvzGobRHWOzTq52zbMaISk7igct9boBOIHzTg8=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=KEIsXT/xlC8/bM+CkvvlLnDfNxo1P2ywNq6L1ATSEfow0qZD2KAYAQINyeNKiynlh
 0J8kfzoZDkdIwxv/ZHTmK/ehrcccnUs5wINzVz0C+tCg4FhD4VHJ3RRApYgDpelydg
 oso6RPdvbT7os9p/WsgNc3AQl/VJPek2ERhAyY2I=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 1BKJ5sOX080372
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 20 Dec 2021 13:05:54 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 20
 Dec 2021 13:05:53 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 20 Dec 2021 13:05:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 1BKJ5qU7015235;
 Mon, 20 Dec 2021 13:05:53 -0600
Date: Tue, 21 Dec 2021 00:35:52 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: <Tudor.Ambarus@microchip.com>
CC: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
 <zhuohao@chromium.org>, <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: core: Remove partid and partname debugfs files
Message-ID: <20211220190550.rejayqmhem5gwq5d@ti.com>
References: <20211217122636.474976-1-tudor.ambarus@microchip.com>
 <20211217122636.474976-3-tudor.ambarus@microchip.com>
 <20211220130743.jil62qbyb5lgds6p@ti.com>
 <25999218-8985-03fc-c53d-21bd2a25d365@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <25999218-8985-03fc-c53d-21bd2a25d365@microchip.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_110556_989512_22637C3D 
X-CRM114-Status: GOOD (  21.16  )
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

On 20/12/21 01:23PM, Tudor.Ambarus@microchip.com wrote:
> On 12/20/21 3:07 PM, Pratyush Yadav wrote:
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > 
> > On 17/12/21 02:26PM, Tudor Ambarus wrote:
> >> partid and partname debugfs file are no longer used in mtd, remove
> 
> s/file/files
> 
> >> dead code.
> > 
> > Hmm, spi-nor was the only user? Quick grepping does confirm that.
> 
> Yes.
> 
> > 
> >>
> >> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> >> ---
> >>  drivers/mtd/mtdcore.c   | 35 +----------------------------------
> >>  include/linux/mtd/mtd.h |  3 ---
> >>  2 files changed, 1 insertion(+), 37 deletions(-)
> >>
> >> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> >> index 9186268d361b..1977755fc955 100644
> >> --- a/drivers/mtd/mtdcore.c
> >> +++ b/drivers/mtd/mtdcore.c
> >> @@ -336,49 +336,16 @@ static const struct device_type mtd_devtype = {
> >>       .release        = mtd_release,
> >>  };
> >>
> >> -static int mtd_partid_debug_show(struct seq_file *s, void *p)
> >> -{
> >> -     struct mtd_info *mtd = s->private;
> >> -
> >> -     seq_printf(s, "%s\n", mtd->dbg.partid);
> >> -
> >> -     return 0;
> >> -}
> >> -
> >> -DEFINE_SHOW_ATTRIBUTE(mtd_partid_debug);
> >> -
> >> -static int mtd_partname_debug_show(struct seq_file *s, void *p)
> >> -{
> >> -     struct mtd_info *mtd = s->private;
> >> -
> >> -     seq_printf(s, "%s\n", mtd->dbg.partname);
> >> -
> >> -     return 0;
> >> -}
> >> -
> >> -DEFINE_SHOW_ATTRIBUTE(mtd_partname_debug);
> >> -
> >>  static struct dentry *dfs_dir_mtd;
> >>
> >>  static void mtd_debugfs_populate(struct mtd_info *mtd)
> >>  {
> >> -     struct mtd_info *master = mtd_get_master(mtd);
> >>       struct device *dev = &mtd->dev;
> >> -     struct dentry *root;
> >>
> >>       if (IS_ERR_OR_NULL(dfs_dir_mtd))
> >>               return;
> >>
> >> -     root = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
> >> -     mtd->dbg.dfs_dir = root;
> >> -
> >> -     if (master->dbg.partid)
> >> -             debugfs_create_file("partid", 0400, root, master,
> >> -                                 &mtd_partid_debug_fops);
> >> -
> >> -     if (master->dbg.partname)
> >> -             debugfs_create_file("partname", 0400, root, master,
> >> -                                 &mtd_partname_debug_fops);
> >> +     mtd->dbg.dfs_dir = debugfs_create_dir(dev_name(dev), dfs_dir_mtd);
> > 
> > What is the point of having creating the directory if there is not going
> > to be anything in it at all? I think we should drop the entire thing if
> There will be files in it: mtdswap_stats, nandsim_wear_report, docg3 files.
> 
> $ git grep dbg.dfs_dir drivers/mtd/
> drivers/mtd/devices/docg3.c:    struct dentry *root = floor->dbg.dfs_dir;
> drivers/mtd/mtdcore.c:  mtd->dbg.dfs_dir = root;
> drivers/mtd/mtdcore.c:          debugfs_remove_recursive(mtd->dbg.dfs_dir);
> drivers/mtd/mtdswap.c:  struct dentry *root = d->mtd->dbg.dfs_dir;
> drivers/mtd/nand/raw/nandsim.c: struct dentry *root = nsmtd->dbg.dfs_dir;
> drivers/mtd/ubi/debug.c:                debugfs_remove_recursive(ubi->dbg.dfs_dir);

Ok, I didn't see that. In that case,

Reviewed-by: Pratyush Yadav <p.yadav@ti.com>

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
