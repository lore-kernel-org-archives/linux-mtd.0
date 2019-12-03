Return-Path: <SRS0=TEJX=ZZ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52DE0C432C0
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 10:46:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2544A20659
	for <linux-mtd@archiver.kernel.org>; Tue,  3 Dec 2019 10:46:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CThzpCiQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2544A20659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1F5x5caOArNFnXvb8mFZ9Str35gnuYWTd5poVPPpNfc=; b=CThzpCiQA4qcDM
	Y5SlVKohiz1DcX9fKiC2tdf3m9c6y2t4RUZyY0MUk8Ie5o5aOeOlOHr1RCIX3IUzde3gVwShIoNR2
	TY2s6bMu0cD9ZeJdPhK6JMPqvMvnfbLWGCCsPHl/BVv53oXVQf0WWu+5eFqVEOSQtI6J8zJBKb9Vc
	DzXfd+nFxNeA+B2emYUejNvRes6fXnePuDrP2MuU6LpZx9UcZXrbcsHfQGE+YbyFDhd/a19MG5czo
	QLfHIMHAZ4clmFxhP7grSbxkJDa5W8qDPlZoEk0wLtpAM+zU22VsdC1XxD0OLBzY2FHH8HIC608E2
	Wxbrruj6DZ5e2lCldKZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ic5h3-0003p0-Tn; Tue, 03 Dec 2019 10:46:09 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ic5h0-0003mx-J1
 for linux-mtd@lists.infradead.org; Tue, 03 Dec 2019 10:46:08 +0000
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1ic5gu-000196-VF; Tue, 03 Dec 2019 11:46:00 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <sha@pengutronix.de>)
 id 1ic5gs-0007aN-U8; Tue, 03 Dec 2019 11:45:58 +0100
Date: Tue, 3 Dec 2019 11:45:58 +0100
From: Sascha Hauer <s.hauer@pengutronix.de>
To: naga suresh kumar <nagasureshkumarrelli@gmail.com>
Subject: Re: ubifs mount failure
Message-ID: <20191203104558.vpqav3oxsydoe4aw@pengutronix.de>
References: <MN2PR02MB5727000CBE70BAF31F60FEE4AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
 <20191203084134.tgzir4mtekpm5xbs@pengutronix.de>
 <MN2PR02MB57272E3343CA62ADBA0F97E5AF420@MN2PR02MB5727.namprd02.prod.outlook.com>
 <614898763.105471.1575364223372.JavaMail.zimbra@nod.at>
 <CALgLF9KPAk_AsecnTMmbdF5qbgqXe7HNOrNariNVbhSr6FVN2g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALgLF9KPAk_AsecnTMmbdF5qbgqXe7HNOrNariNVbhSr6FVN2g@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 11:45:00 up 148 days, 16:55, 148 users,  load average: 0.14, 0.11,
 0.12
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191203_024606_639036_E87680B7 
X-CRM114-Status: GOOD (  16.54  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Michal Simek <michals@xilinx.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 siva durga paladugu <siva.durga.paladugu@xililnx.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Dec 03, 2019 at 04:06:12PM +0530, naga suresh kumar wrote:
> Hi Richard,
> =

> On Tue, Dec 3, 2019 at 2:40 PM Richard Weinberger <richard@nod.at> wrote:
> >
> > ----- Urspr=FCngliche Mail -----
> > > Von: "Naga Sureshkumar Relli" <nagasure@xilinx.com>
> > > https://elixir.bootlin.com/linux/v5.4/source/fs/ubifs/sb.c#L164
> > > we are trying to allocate 4325376 (~4MB)
> >
> > 4MiB? Is ->min_io_size that large?
> if you see https://elixir.bootlin.com/linux/latest/source/fs/ubifs/sb.c#L=
164
> The size is actually ALIGN(tmp, c->min_io_size).
> Here tmp is of 4325376 Bytes and min_io_size is 16384 Bytes

'tmp' contains bogus values. Try this:

----------------------------8<--------------------------------

From 34f687fce189085f55706b4cddcb288a08f4ee06 Mon Sep 17 00:00:00 2001
From: Sascha Hauer <s.hauer@pengutronix.de>
Date: Tue, 3 Dec 2019 11:41:20 +0100
Subject: [PATCH] ubifs: Fix wrong memory allocation

In create_default_filesystem() when we allocate the idx node we must use
the idx_node_size we calculated just one line before, not tmp, which
contains completely other data.

Fixes: c4de6d7e4319 ("ubifs: Refactor create_default_filesystem()")
Reported-by: Naga Sureshkumar Relli <nagasure@xilinx.com>
Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 fs/ubifs/sb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ubifs/sb.c b/fs/ubifs/sb.c
index a551eb3e9b89..6681c18e52b8 100644
--- a/fs/ubifs/sb.c
+++ b/fs/ubifs/sb.c
@@ -161,7 +161,7 @@ static int create_default_filesystem(struct ubifs_info =
*c)
 	sup =3D kzalloc(ALIGN(UBIFS_SB_NODE_SZ, c->min_io_size), GFP_KERNEL);
 	mst =3D kzalloc(c->mst_node_alsz, GFP_KERNEL);
 	idx_node_size =3D ubifs_idx_node_sz(c, 1);
-	idx =3D kzalloc(ALIGN(tmp, c->min_io_size), GFP_KERNEL);
+	idx =3D kzalloc(ALIGN(idx_node_size, c->min_io_size), GFP_KERNEL);
 	ino =3D kzalloc(ALIGN(UBIFS_INO_NODE_SZ, c->min_io_size), GFP_KERNEL);
 	cs =3D kzalloc(ALIGN(UBIFS_CS_NODE_SZ, c->min_io_size), GFP_KERNEL);
 =

-- =

2.24.0


-- =

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
