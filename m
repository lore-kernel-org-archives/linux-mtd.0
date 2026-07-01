Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5368FC43458
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Jul 2026 13:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKFk5fytPS3xUb75SCp4NGmVDuJW1mqB2qYE0y/PMRE=; b=triQU8em/359aD1TgZvQKJd5a9
	QQ6pa4Iwk9I6dHEBnUzfJ+CFLU+G9DQXyvIAxYIZbh0Tw6bH3fi8WISL+0q6TZBoSqa8/0kyJcNeK
	een6g5PBUcXNnN493C8nxVwSOwG6e0NVmseVZ4xfCZXXZoW1pxx9XYOklxgYdBjM2TnttLdgtJ+ar
	nbFEoA7wSn5GLy/yJWtHUDBx2o1x0QKxWJK9Ps/9Is0YXDHHWzGGxLQAv/LbNSYam1BjTAOcILBnn
	ehpupAnZXgdh0U76Ejx6YVqbeAjhSQFr8CWRck+N8ix1x+vx03gRk334swHpHomdlckJmfp4CTi5f
	THKi8QNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevEi-00000002Ciw-2gBm;
	Wed, 01 Jul 2026 13:44:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wevEh-00000002Cim-2ylg
	for linux-mtd@lists.infradead.org;
	Wed, 01 Jul 2026 13:44:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BDA4419C8;
	Wed,  1 Jul 2026 13:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C9131F000E9;
	Wed,  1 Jul 2026 13:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782913459;
	bh=NK6YP/bdhXkNOBHiOO/t/Jufjg7fsinWaedzpOSHruA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Sf6fArem1RKCaJCTCIlW4G8QUAL/QRcWi9a+uqe17owJBqMvNWOxlBEHk5EOvLQ3g
	 sWXLN0eemHQm6yvZY6ZoqaTFxKSifmgvf1WWyy0Xs59auAhseqFt8jC3mFWsmVNjJB
	 OPT2p8PV3oXsDvw5qRrFZ3XyZdd/UcDTUpsUF1ZLDh9cqxRRIv0p2n/A6nSWAH1MNW
	 FvQWCb/AXuNoB3Of2ZDEQAsNTsItmCGGaOXWHF7YfZQGFi6n6EZ2MGq0491NVtDgC7
	 xcR8hHvZGomF4K7VKEQjRjyX9cfIyT3Rvztmo9fXYlzJKVvEPCwD8sl0lXZ+S9bUPY
	 iYcM8o/86v32w==
MIME-Version: 1.0
Date: Wed, 01 Jul 2026 15:44:15 +0200
From: Michael Walle <mwalle@kernel.org>
To: Cheng Ming Lin <linchengming884@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Pratyush Yadav
 <pratyush@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 alvinzhou@mxic.com.tw, Cheng Ming Lin <chengminglin@mxic.com.tw>
Subject: Re: [PATCH] mtd: spi-nor: Add support for MX25L12833F and MX25L12845G
In-Reply-To: <CAAyq3SZ-FuKeY7_-vKRY+Aqd975B2cfSyky4Qid=FwNWN5RSCw@mail.gmail.com>
References: <20260528051751.1648246-1-linchengming884@gmail.com>
 <DIU3OK3ELUD5.CUL6R3KNX0O9@kernel.org>
 <CAAyq3SY86mVwYtQMqhcZHjTxiD93awQZPDzHr8e5-+B9caNgbA@mail.gmail.com>
 <87eciwhtf8.fsf@bootlin.com> <DIU5AHNXBPN2.27JOC8D5COWAM@kernel.org>
 <CAAyq3SYX9UPwhC_Ume_S2yxhQwimRvB=Y6O_+FFqokhNmw7jQg@mail.gmail.com>
 <DIXQA3JV2N5M.2UHTAAXQEWB86@kernel.org>
 <CAAyq3SZ-FuKeY7_-vKRY+Aqd975B2cfSyky4Qid=FwNWN5RSCw@mail.gmail.com>
Message-ID: <b2b9f1cc82acc1ff7f57c0ae04a23141@kernel.org>
X-Sender: mwalle@kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

>> Oops, I've forgot to add you on CC. Sorry. I've just send a series
>> to get rid of that legacy handling. Please give it a try on your
>> flashes.
> 
> No worries at all! Thanks for the heads-up.
> 
> I have tested your series on our Macronix flashes, and everything works
> perfectly.
> 
> Quick question regarding my own patch series:
> should I wait for your series to be applied before sending out my v2,
> or is it okay to send it now?

Ah I forgot to get back to you. You've already send v2 and v3. That's 
fine.

Could you send a Tested-by tag?

Thanks,
-michael

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
