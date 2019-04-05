Return-Path: <SRS0=PylK=SH=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5930EC4360F
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 13:23:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D93A21850
	for <linux-mtd@archiver.kernel.org>; Fri,  5 Apr 2019 13:23:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gJ59+6xF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D93A21850
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h1c7uCtW+ZEQkRx7w0TsdzsApbvUpXl0CT+QfBMEcPY=; b=gJ59+6xFmk6HJh
	kYuH13hGXxVxm2urlo7KvK2F7SneLrNDyVLG4GOci8s8KO3PabnNwEJ+CK98Y8YkqZH1ZrkN0ZD3V
	IzsFfLwB5CaPkwkk2MpWpyP83cMEblZ5WTtT9RMQ40uy18K7QIsSTMEiTlI3/vzVucQpP/UD+0LzW
	moU6oNVUkKMgq4KDz79kHxlaw0kVEAaUbBQ6bg9Fcqg58MrfcZyB8OvdEwbgqDz7MjHP5A/K6+i73
	5vKyz6CZDkGyNSD+r9lBS9qPy1vEtVMOy5wQ+M2BaABt/JQNBCggLlwvdRQYU+ODq8MEFPeOIHX2/
	bOpgyT/FSS/wz7rQx0RQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCOoH-0008P2-3L; Fri, 05 Apr 2019 13:23:09 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCOoE-0008Oe-Ar
 for linux-mtd@lists.infradead.org; Fri, 05 Apr 2019 13:23:08 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 4175F6091849;
 Fri,  5 Apr 2019 15:23:04 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id XOCmzb7ru6lG; Fri,  5 Apr 2019 15:23:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id D0050609184D;
 Fri,  5 Apr 2019 15:23:03 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rFdwqRcsm_C5; Fri,  5 Apr 2019 15:23:03 +0200 (CEST)
Received: from blindfold.localnet (unknown [82.150.214.1])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id A14806091849;
 Fri,  5 Apr 2019 15:23:03 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Lars Persson <lists@bofh.nu>
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
Date: Fri, 05 Apr 2019 15:23:03 +0200
Message-ID: <2946812.3xOJdY2bgb@blindfold>
In-Reply-To: <CADnJP=usEgBQH5tL2k79kFhraDvir6Byt5j7n1FHfT8z84ET+A@mail.gmail.com>
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <1586391.XHllXIAzYb@blindfold>
 <CADnJP=usEgBQH5tL2k79kFhraDvir6Byt5j7n1FHfT8z84ET+A@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190405_062306_524608_A0407E89 
X-CRM114-Status: GOOD (  13.62  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Freitag, 5. April 2019, 15:19:31 CEST schrieb Lars Persson:
> On Thu, Apr 4, 2019 at 11:53 PM Richard Weinberger
> <richard@sigma-star.at> wrote:
> > Can you please run your tests again with this patch applied?
> > It needs further optimization, but we are on the right track.
> >
> > diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
> > index 2f1618f300fb..c15e484f73a4 100644
> > --- a/fs/ubifs/orphan.c
> > +++ b/fs/ubifs/orphan.c
> > @@ -691,8 +691,21 @@ static int do_kill_orphans(struct ubifs_info *c, struct ubifs_scan_leb *sleb,
> >                 n = (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
> >                 for (i = 0; i < n; i++) {
> >                         union ubifs_key key1, key2;
> > +                       struct ubifs_ino_node *ino;
> > +
> > +                       ino = kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
> > +                       if (!ino)
> > +                               return -ENOMEM;
> >
> >                         inum = le64_to_cpu(orph->inos[i]);
> > +                       ino_key_init(c, &key1, inum);
> > +                       err = ubifs_tnc_lookup(c, &key1, ino);
> > +                       if (!err && ino->nlink) {
> > +                               kfree(ino);
> > +                               continue;
> > +                       }
> > +                       kfree(ino);
> > +
> >                         dbg_rcvry("deleting orphaned inode %lu",
> >                                   (unsigned long)inum);
> >
> 
> Thanks Richard. The power-cut test is OK now with this change. I run
> it with chk_fs=1 and it passes every time.

Cool, please let it run for some more time, just to be sure.
I will also do more tests on my side and optimize the patch.

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
