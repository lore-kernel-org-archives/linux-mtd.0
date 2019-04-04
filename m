Return-Path: <SRS0=4b6q=SG=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B5EDC4360F
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 21:53:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6717820882
	for <linux-mtd@archiver.kernel.org>; Thu,  4 Apr 2019 21:53:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U+boekZo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6717820882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sigma-star.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vdBNqS8wGLhncbWIzMsXZV1cb/ftF3zjjSQpz8RSaCw=; b=U+boekZoCDO3hG
	ZWfplPAH9iiTra5I0te0tF+zIIBqvyULvr32uehPSFwH+mGt1EEhWLS3QbH/G5AVEQxusJ/qGHE6K
	a/EYSznr29MI4WosL69fYC+b5hTbwtjQ2NejZRnAFh8bY3ePr2g7VjBS/3vFib9AKjAxvIaQO8bAG
	YLemYJM00UOcvTmtuLG0YV8Qt05XmsUFVAW5SHHjEWqR1wYKf0Hw2njN4ZwntdaUBrw/YTlRcmwmL
	Kyw/EXzdZy8qha7Rm0tZ6gBHufKSTAvQKq6yMukVS+czNrrxsBOA1GvcHZq8Ch7nMdClWHpGn5MtE
	MMrZkLGoiTJ5Gn9pqrNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hCAIQ-0002Bx-Vf; Thu, 04 Apr 2019 21:53:18 +0000
Received: from lilium.sigma-star.at ([109.75.188.150])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hCAIN-0002BV-Tl
 for linux-mtd@lists.infradead.org; Thu, 04 Apr 2019 21:53:17 +0000
Received: from localhost (localhost [127.0.0.1])
 by lilium.sigma-star.at (Postfix) with ESMTP id 9F80E18098AA9;
 Thu,  4 Apr 2019 23:53:12 +0200 (CEST)
From: Richard Weinberger <richard@sigma-star.at>
To: Lars Persson <lists@bofh.nu>, linux-mtd@lists.infradead.org
Subject: Re: UBIFS file-system corruption (missing inode) after power-cut on
 4.14.96
Date: Thu, 04 Apr 2019 23:53:09 +0200
Message-ID: <1586391.XHllXIAzYb@blindfold>
In-Reply-To: <CADnJP=so8PSqJ4NgqSyqSk5UEtO2wzSC_LG0Seo0+Yuf45oefA@mail.gmail.com>
References: <CADnJP=vQURY9u7Fb=Bt=udf89A6VX_TccBXfk8q2kdkqMnqj4A@mail.gmail.com>
 <CAFLxGvye+F5hB+1DUUhDzjaHB5ajC_M+W3fyt5x840sO68RgUQ@mail.gmail.com>
 <CADnJP=so8PSqJ4NgqSyqSk5UEtO2wzSC_LG0Seo0+Yuf45oefA@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190404_145316_103801_7D71327B 
X-CRM114-Status: GOOD (  12.32  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Freitag, 29. M=E4rz 2019, 10:43:33 CEST schrieb Lars Persson:
> On Thu, Mar 28, 2019 at 6:31 PM Richard Weinberger
> <richard.weinberger@gmail.com> wrote:
> >
> > Can you please share me your corrupted fs?
> > I'm not so sure what is really the root cause.
> > The thing is, ubifs_delete_orphan() does not need to tigger a commit.
> > Ff something depends on a commit, we have another problem, I fear.
> >
> =

> Thanks. The download link for the file-system was shared to your gmail ad=
dress.

Can you please run your tests again with this patch applied?
It needs further optimization, but we are on the right track.

diff --git a/fs/ubifs/orphan.c b/fs/ubifs/orphan.c
index 2f1618f300fb..c15e484f73a4 100644
--- a/fs/ubifs/orphan.c
+++ b/fs/ubifs/orphan.c
@@ -691,8 +691,21 @@ static int do_kill_orphans(struct ubifs_info *c, struc=
t ubifs_scan_leb *sleb,
 		n =3D (le32_to_cpu(orph->ch.len) - UBIFS_ORPH_NODE_SZ) >> 3;
 		for (i =3D 0; i < n; i++) {
 			union ubifs_key key1, key2;
+			struct ubifs_ino_node *ino;
+
+			ino =3D kmalloc(UBIFS_MAX_INO_NODE_SZ, GFP_NOFS);
+			if (!ino)
+				return -ENOMEM;
 =

 			inum =3D le64_to_cpu(orph->inos[i]);
+			ino_key_init(c, &key1, inum);
+			err =3D ubifs_tnc_lookup(c, &key1, ino);
+			if (!err && ino->nlink) {
+				kfree(ino);
+				continue;
+			}
+			kfree(ino);
+
 			dbg_rcvry("deleting orphaned inode %lu",
 				  (unsigned long)inum);
 =

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
