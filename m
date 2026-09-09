Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B64F4C79F8C
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Sep 2026 05:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:References:
	In-Reply-To:Message-ID:Subject:Cc:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DddTCdqpp1oMWJA3HGXo2+jyJeVOiNSqA3p7xHXDs5Q=; b=Nz9b2zvYXVWtH3HaJv+aSCQ43M
	hXa7Kgu2DMENJv9+nmh2FACuDmKmkwHi5XLjDOa0jxwOivu6v0QSlks3Jzpwj7dZ8i8u4O4XS2DCB
	ZZEl2+gSplL+J8wF70Qswe1MwLCe0Q4GJx6O+M2fyrdWS6zcvs+LLMItnbrvg+spKV1PCycfblEt8
	X1yynfze5DOBnR96nWTwHx8RvYXyBQnXwXq+648VHYhFfDhxy4HP3Bm28n9KmSmPeEHg4vGG0hNbY
	NYujgXJupa2y2IRFONSNZ6Ci3ZzRj87NyUTiZ+9Ock8kEiZvNPS8SED0/v46rCk+xIzBChguOLicF
	RxTwpCBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AwP-0000000AnbZ-2w4o;
	Wed, 09 Sep 2026 05:33:49 +0000
Received: from calculus.sigma-star.at ([188.245.196.96])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4AwL-0000000Anap-3ytb
	for linux-mtd@lists.infradead.org;
	Wed, 09 Sep 2026 05:33:48 +0000
DKIM-Signature: v=1; a=ed25519-sha256; s=v1-ed25519-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788932007; bh=Fm7fbqSVPqek4l5kO46jVd1
	tjrUVWIRYB522nhXE9sk=; b=QfGuFAP9IHjivEQyn9y1wD8AJJ6Ks2FHMZfSpZo1oA/eCxnkT+
	edRPgCH3YkFBxGT1x3LiEE342/Gooagq94Cw==;
DKIM-Signature: v=1; a=rsa-sha256; s=v1-rsa-20260901; d=nod.at; c=relaxed/relaxed; r=y;
	h=Date:Message-ID:Subject:To:From; t=1788932007; bh=Fm7fbqSVPqek4l5kO46jVd1
	tjrUVWIRYB522nhXE9sk=; b=CWGRrnICFY9FAia8adXPeNZvX/+LyKPT7YECWYkJgyvzZ7gmXG
	5FdpIq+bFLbwr9mZnwq1r3p23LbRSSDs2+1hpTAlgTvl7oGUHZEQT7UcDow13Yewb3mzALrwLem
	rxPLHKkPMUiBf0AhCFjgUm+pQx9/7grY2o2N2CK2UO9/xp8tBiyR1tgzULHurCjfFIbbCW2O6BD
	NfcnOtWYzJAM/IKdUiQTcgzjIYHr88GTebZFARIfi4oNXeHVyw0dgVgSjDuOcwG+jgSVB2w+DAw
	vRhuX5k6nihMXD4I6zJG8Xln2TKk+6yGKjBAKyk0rk77LuU6b5ak+auVHNxE1QfGuNw==;
From: "Richard Weinberger" <richard@nod.at>
To: "Lucas Jeffrey" <luquijeffrey@gmail.com>, <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	"Lucas Jeffrey" <luquijeffrey@gmail.com>, 
	<syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com>
Subject: =?us-ascii?Q?AW:_[PATCH]_jffs:_initialize_inocache_to_NULL_when?=
	=?us-ascii?Q?_initializing_a_jffs2=5Finode=5Finfo?=
Message-ID: <mttnxeuy.56ba8b97-1e95-445b-b832-7ecca9937f48@nod.at>
In-Reply-To: <20260909023955.1642244-1-luquijeffrey@gmail.com>
References: <20260909023955.1642244-1-luquijeffrey@gmail.com>
Date: Wed, 9 Sep 2026 05:33:27 +0000
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_223346_146348_EB21142D 
X-CRM114-Status: UNSURE (   7.68  )
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

Am Wed, Sep 9, 2026, 04:40 schrieb Lucas Jeffrey <luquijeffrey@gmail.com>:

> When a jffs2_inode_info is allocated via new_inode(), due to memory reuse it
> can retain stale values from its previous use.
> 
> If the new jffs2_inode_info object allocated retains an old reference to a
> freed inocache, the function jffs2_new_inode may crash if either
> jffs2_init_acl_pre or jffs2_do_new_inode returns an error value because
> when calling iput() with the inode it will eventually attempt to free again
> the inocache.
> 
> Reported-by: syzbot+3a8099322b09d8d073d1@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3a8099322b09d8d073d1
> Signed-off-by: Lucas Jeffrey <luquijeffrey@gmail.com>

This was reported earlier but the reporter went silent.
https://lore.kernel.org/linux-mtd/849183271.921.1787173413104.JavaMail.zimbra@nod.at/

Thanks,
//richard

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
