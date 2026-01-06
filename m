Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F76C47BE2
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jan 2026 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pSyECrJavvDQWzCgU1Im6QGjuC1HQvftfuECaK6VJtg=; b=QYl2RoHDEGLiUj
	G4WqNm6xtBitlnqbaig43Fm3VRvBBj/pyqGfsSnITlQcxWQaK97S0QPUn2kfuU9g2VL/PxCYWh3Jj
	KYbm6bJsjPTURTKnKWrp/8TzigLgh1A+5+IWIenkSA80TP2/DdiXGUd1LrzISyu1QQ+CUfd1ptwWy
	MTM4pWgWoA3nSMZK61BEx8HQWVU57kfOQ+67myjVZpIgnnoNcVZEa+3gX5xw/2McZx/F8aFicMTyy
	MAExQ2FpH9ipUwGcfoqXH1xqRF+1BOKVDc5fxyKYF4J65xR1eQbKMxm3TZMZB7h7HAOi92+qIFtcL
	+vep2y1PvtNrunMRB4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4ZB-0000000Coom-0mPZ;
	Tue, 06 Jan 2026 10:45:33 +0000
Received: from mail.parknet.co.jp ([210.171.160.6])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Z6-0000000CooP-0CcJ
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jan 2026 10:45:29 +0000
Received: from ibmpc.myhome.or.jp (server.parknet.ne.jp [210.171.168.39])
	by mail.parknet.co.jp (Postfix) with ESMTPSA id 0C7032051576;
	Tue,  6 Jan 2026 19:45:20 +0900 (JST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114; t=1767696320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=boNWa8fyq13gGHop3sc94GN25zz7q2/coNrFcXY2ZJQ=;
	b=dYgljkc1OtXsuk2qUUdexyCd53B+4R9nAqpkZqKl4AVM0xaarHGpQ0REZzvW3xKTWjcEXd
	sHU86e+PsD8pKaMJBpT4oL8kPiFBMvXVnCFlq7JYE1aaYRJt+7hjJ2GHQ1QRv0RFCthkDo
	OhAtqSfbx1e4l0Bb/Bx4ukFpnPWaisuIDsozGEdwBcshFYTzFEz1dcv7CR7bg3OJvThusj
	SnBdnw1MdU9tV+4IPjLWT9F1UKAJGxeyDcH7lPWdG6CWEPHyS/F44P5JrvBLdvRcMpI0Xq
	Dax2N0xe1YoNBXNKXfkbHXPipkRyvtJTVWCDxdgt+oYnWG5hgy6g2RfbNkIhPQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=parknet.co.jp;
	s=20250114-ed25519; t=1767696320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=boNWa8fyq13gGHop3sc94GN25zz7q2/coNrFcXY2ZJQ=;
	b=kLXn86oRIzqz2zJFiNQmCOYev0Y8ATK/gSFoEiXhC/hJ0sIIocjUl2KiQPbOQ2iM+Wd5a+
	MPAGNZ8NGriPHyDA==
Received: from devron.myhome.or.jp (foobar@devron.myhome.or.jp [192.168.0.3])
	by ibmpc.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 606AjI1r213026
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 6 Jan 2026 19:45:19 +0900
Received: from devron.myhome.or.jp (foobar@localhost [127.0.0.1])
	by devron.myhome.or.jp (8.18.1/8.18.1/Debian-7) with ESMTPS id 606AjI93516127
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 6 Jan 2026 19:45:18 +0900
Received: (from hirofumi@localhost)
	by devron.myhome.or.jp (8.18.1/8.18.1/Submit) id 606AjHxO516126;
	Tue, 6 Jan 2026 19:45:17 +0900
From: OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
To: Christoph Hellwig <hch@lst.de>
Cc: Christian Brauner <brauner@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>,
        David Sterba <dsterba@suse.com>, Jan Kara
 <jack@suse.cz>,
        Mike Marshall <hubcap@omnibond.com>,
        Martin Brandenburg
 <martin@omnibond.com>,
        Carlos Maiolino <cem@kernel.org>, Stefan Roesch
 <shr@fb.com>,
        Jeff Layton <jlayton@kernel.org>,
        Trond Myklebust
 <trondmy@kernel.org>,
        Anna Schumaker <anna@kernel.org>, linux-kernel@vger.kernel.org,
        linux-btrfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        gfs2@lists.linux.dev, io-uring@vger.kernel.org,
        devel@lists.orangefs.org, linux-unionfs@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-xfs@vger.kernel.org,
        linux-nfs@vger.kernel.org
Subject: Re: [PATCH 04/11] fat: cleanup the flags for fat_truncate_time
In-Reply-To: <20260106075008.1610195-5-hch@lst.de>
References: <20260106075008.1610195-1-hch@lst.de>
	<20260106075008.1610195-5-hch@lst.de>
Date: Tue, 06 Jan 2026 19:45:17 +0900
Message-ID: <87cy3nrpdu.fsf@mail.parknet.co.jp>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_024528_528515_67861AD3 
X-CRM114-Status: UNSURE (   9.72  )
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

Christoph Hellwig <hch@lst.de> writes:

> Fat only has a single on-disk timestamp covering ctime and mtime.  Add
> fat-specific flags that indicate which timestamp fat_truncate_time should
> update to make this more clear.  This allows removing no-op
> fat_truncate_time calls with the S_CTIME flag and prepares for removing
> the S_* flags.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

This breaks fat_update_time() by calling fat_truncate_time() with old
S_* flags (later patch looks like fixing though). Please add the commit
comment about it, or fix it in this patch.

Thanks.
-- 
OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
