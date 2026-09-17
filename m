Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C151CC982D0
	for <linux-mtd@archiver.kernel.org>; Thu, 17 Sep 2026 18:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ds338v3zwAcFSkr2s1kC14KPXN6X6fkfkmX4RBCy2o0=; b=zUhB21Be0Mv98y
	iLojXXbxWGHFe5l+g+FC81xwNCyMK+itsatbeRusA78On0ehnYAVk8pCNdZ+iwI7ezyYi44Nitq14
	LkBa6BoE/RIVDFDWfbGFfvUqEq0XD3Z30CYOty2pLsSu/L2DbdWvWI9URP/CSXwbcMPRjSFgyxT1c
	PdKpeWwKQIW/oFhU79OshSPusr820NYAlAw3EBBW62N8PvYtjjFu+lY88G3XfPySCxNDSe67nWd5N
	o8c9wdrk9UWXCJOJ92NgodpzZ72tYx5qvk4S/xF/0cuZWNgAiwicvbVpRsZE3eGB3Ei/kOFoiP7pU
	edGcgV0vfthONVa8+HpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Geh-0000000CCg9-0LCY;
	Thu, 17 Sep 2026 18:16:19 +0000
Received: from mx01.bremer-it.com ([2a01:239:410:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gee-0000000CCcr-2L4r
	for linux-mtd@lists.infradead.org;
	Thu, 17 Sep 2026 18:16:18 +0000
Received: from cashel.logfs.org (c-98-33-96-243.hsd1.ca.comcast.net [98.33.96.243])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(No client certificate requested)
	by mx01.bremer-it.com (Postfix) with ESMTPSA id 0924920ACF;
	Thu, 17 Sep 2026 20:15:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=barelysecure.org;
	s=dkim68; t=1789668960;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PDA2dRaD2XYs4viDCKuQp0KcwdHL+fraeSFF/rd3WCM=;
	b=Ho2sf6EZ0GEmRoN/Lyy36L1qAS8HAezzKWkwIRJZCR/OtOfg99UN84vRrDDaZXijoo9QPo
	mPCpw2r8TICt4Yn3UJNPl7UQEL/sAQ0Tt0tGptIOVIcjE7DRhl+bVX16Sn+LiBppXna+bo
	7azGI8MQR6RCPBM6sUFnRJ7tEB1PsxV2x4LCknC2mihA5l7+53ZR2BN8911Z+htK3pYBwV
	2buMslcwXNpZ8V9fgwOVFz+eb/ZFkCAD9fu+5EfQ5yBlNc08q/9R6+HCkDTBn0LC/gjsCN
	xLpnuNWusBGHN+/x+cgIXg8XInXRzSVVrGMpABwn7G1sR5bYvDmS7+mIOjN4gA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=joern@lazybastard.org smtp.mailfrom=joern@barelysecure.org
Date: Thu, 17 Sep 2026 11:15:53 -0700
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@barelysecure.org>
To: Chris Roy <iam@thechris.in>
Cc: Greg KH <gregkh@linuxfoundation.org>,
	syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com,
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, joern@lazybastard.org
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
Message-ID: <aqwuWWMwdIcx3704@cashel.logfs.org>
References: <CAE2Bdm3NuEHshrG6K2boKAnCQUvT5SX79cP9nPgS2s1afzY1hg@mail.gmail.com>
 <6aab0f82.e91c2013.3bdb06.0009.GAE@google.com>
 <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
 <2026091753-broadness-bootie-b683@gregkh>
 <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.40 / 14.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:7922, ipnet:98.32.0.0/11, country:US];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[7cab6a19619f1b8efc00];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_HAS_DN(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_SIGNED(0.00)[barelysecure.org:s=dkim68];
	URIBL_BLOCKED(0.00)[c-98-33-96-243.hsd1.ca.comcast.net:rdns];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: server01
X-Rspamd-Queue-Id: 0924920ACF
X-Spamd-Bar: +
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_111617_038892_16AC5CAA 
X-CRM114-Status: UNSURE (   9.71  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Sep 17, 2026 at 01:28:22PM +0530, Chris Roy wrote:
>
>  drivers/mtd/devices/block2mtd.c | 118 ++++++++++++++++++++-----
>  1 file changed, 98 insertions(+), 20 deletions(-)
[...]
>  /* Static info about the MTD, used in cleanup_module */
>  static LIST_HEAD(blkmtd_device_list);
> +/* Protects blkmtd_device_list and early-boot paramline updates */
> +static DEFINE_MUTEX(block2mtd_mutex);
> +static struct workqueue_struct *block2mtd_wq;

This is just awful taste.  You are inside a file called "block2mtd".
The prefix to the mutex an workqueue add absolutely nothing.  Calling
them just plain "mutex" and "wq" would have been a better choice.

Good names should tell the human reader something.  What is the mutex
protecting?  What is the purpose of the workqueue?  Pick a name that
gives us some information like that, please!


You seem to have used AI to write this code, so the bad name choice was
presumably also done by AI.  But you are still associating your own good
name with the code.  You should try not to harm your good name by
letting things like this slide through unchallenged.

J=F6rn

--
Do not stop an army on its way home.
-- Sun Tzu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
