Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA790C43334
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Jul 2022 16:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:References:
	In-Reply-To:Message-ID:Cc:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=nD3fDXzMLo2bQCQYlcexfl5qqwmt6rQpxjLE4gPXo4Q=; b=OwjooUTc4oE9EJXpVpuYQtcIzF
	KVse2lZuM0aj0H7H5l8CG9b/pYF4mpXiAehROCJ8ZDNBG79Gc/qd1gADaHhOF9dWwHdf68rLqA/JT
	COuyCHdPo+z/ocEkUREpBvpsx9SM2zHm9E63dPZiz545xjZen/xBANVOLFr3T6+TXBcA+GXSEBhli
	4Joon2Tb5TiFyGNn+9sgeCCmTP4wsNEGa4BCstQjD0qZuLNtYs4a3jncQwtYghwexCk8MYVwSGlgz
	cDoPm5vNkkFxzryxpcaAdGqrPusg2Eiz2C6XtP0WKI7JkxiDuX0KgsSnwr1Zu3TspvVy4TzPSAwGB
	F2bqb3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9U4o-00Gt6P-QK; Thu, 07 Jul 2022 16:10:02 +0000
Received: from sender-of-o53.zoho.in ([103.117.158.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9U4m-00Gt5D-5W
	for linux-mtd@lists.infradead.org; Thu, 07 Jul 2022 16:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1657210195; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=CObAYOgV35zS3R3raTi9n7O2w4JBuhywsZufHhPEXbI/jSD4RTAuLy+/Vfl5GRP0q1ytOpwkkOEmjbry4VW07WXY12fxsv7DVWUpgtLxDe/yDg6ep0bHwS15+xHzrVHpGorg1j1/nidh8xxbkDYkizeAVockPjYICOGPyBDmfXs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1657210195; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=/gSZARatcisMo59OnwdFpAj4ZMFOcjkUzgk7epbNE2I=; 
	b=YEQfHYVWOE8HiZJ5VL/3uz12OOaJbTbnjOcwoalVovhSVT01lQypYcoGuh6Qbd/Yd5EqHOUNtXmY9fyZhBi/JYveo1m0mTQIQhWv+rHsrqoFi59PrlhgbHnOgDsFQlqOQjQ40t5vqEa17+Hb9g+NlwwxlHNhFNIjbK1f20LwctU=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=siddh.me;
	spf=pass  smtp.mailfrom=code@siddh.me;
	dmarc=pass header.from=<code@siddh.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1657210195;
	s=zmail; d=siddh.me; i=code@siddh.me;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/gSZARatcisMo59OnwdFpAj4ZMFOcjkUzgk7epbNE2I=;
	b=TauEg0PanYubxQhxt4GXU5UYGMq+WoavDW/9QtyYudro4Px0WKAC5LYy+QetPazG
	pf+G7dybsIfARRSzh4+D5F49N3aJv0bTvoh7TSMdV5fYWHDXMapIuUKbM3JiQB/Acqf
	+BBEJP+erB7b25gSfUHcW7SjP2Q14r0MRhR3Vso0=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1657210184231166.44837593893465; Thu, 7 Jul 2022 21:39:44 +0530 (IST)
Date: Thu, 07 Jul 2022 21:39:44 +0530
From: Siddh Raman Pant <code@siddh.me>
To: "syzbot" <syzbot+fe013f55a2814a9e8cfd@syzkaller.appspotmail.com>
Cc: "linux-kernel" <linux-kernel@vger.kernel.org>,
	"linux-mtd" <linux-mtd@lists.infradead.org>,
	"linux-next" <linux-next@vger.kernel.org>,
	"miquel.raynal" <miquel.raynal@bootlin.com>,
	"richard" <richard@nod.at>, "sfr" <sfr@canb.auug.org.au>,
	"syzkaller-bugs" <syzkaller-bugs@googlegroups.com>,
	"vigneshr" <vigneshr@ti.com>
Message-ID: <181d96ca20b.6fc4a90525206.7370482761379113134@siddh.me>
In-Reply-To: <0000000000005fcfa605e339458c@google.com>
References: <0000000000005fcfa605e339458c@google.com>
Subject: Re: [syzbot] linux-next boot error: general protection fault in
 add_mtd_device
MIME-Version: 1.0
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_091000_737646_0E1E142D 
X-CRM114-Status: UNSURE (   3.68  )
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

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
