Return-Path: <SRS0=eMUk=JE=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5695C433ED
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 03:25:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43B6F6139B
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Apr 2021 03:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43B6F6139B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4E06pttjnJeKgDln5VpVnbBgJAQTFXt84aWOgrQ12SY=; b=jzBaWGVbu0dACjnjnji2KgMQZ
	P2RxnX0cr5HOAVLrb4bKyCLszICaTPuLNi6ks/F+VaR6xdw9+3xPUayPdKUZ52IveVh1d7k5ySNy/
	MTzIw9+EmQ4Mo3XZ1DsPmHlPyNyhR4lHR6mRZiIUEWO+XJW7hGi5qXkaQP4b58hdf/aluNND2Ps3h
	hXYfpZfO9cERKBh7WCWOkbbecd5J9BGSlZqht/jRWUCNhTfTelm3So11mtKtjgVbHerydHOG1n26E
	lko5Y2SpiIIKhYDTHeY4h0+lITOtXZrFzxiRuHlsKgxEcOr5qM9+9TyuilpFSJ7gdoeW83hwVb9ch
	vcE5qBCuA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTyne-003ukF-B5; Wed, 07 Apr 2021 03:24:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTynA-003udI-1q; Wed, 07 Apr 2021 03:23:47 +0000
X-UUID: 543b496c40a547a5855915a7cb26bcbc-20210406
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=6p+Sqw+2wiM1G9Ia9wdDLxw/Y5+M1qO/dO+F1uZZDGk=; 
 b=IXXcWshEAKNEyft7pQP3wF5j9gSHIlyls3bXxSThTBGJKdyPJtvaeeszJi/+kDqKO2WmPXeGk+8AEqbYv21+bBFn2NeSRfCsq1Z43QHsW59LKfuGmWcuhAG1LQkHaKGmU5oB+wTl46ulI5MjfVmvXTx8Jf4Zvwj8fcEZ5jFxu5M=;
X-UUID: 543b496c40a547a5855915a7cb26bcbc-20210406
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <guochun.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 940958413; Tue, 06 Apr 2021 20:23:32 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 6 Apr 2021 20:23:30 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs07n1.mediatek.inc
 (172.21.101.16) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 7 Apr 2021 11:23:29 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 7 Apr 2021 11:23:28 +0800
Message-ID: <1617765808.4370.1.camel@mhfsdcap03>
Subject: Re: [PATCH v1 1/1] ubifs: only check replay with inode type to
 judge if inode linked
From: Guochun Mao <guochun.mao@mediatek.com>
To: Richard Weinberger <richard@nod.at>
CC: Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>
Date: Wed, 7 Apr 2021 11:23:28 +0800
In-Reply-To: <20210316085214.25024-2-guochun.mao@mediatek.com>
References: <20210316085214.25024-1-guochun.mao@mediatek.com>
 <20210316085214.25024-2-guochun.mao@mediatek.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_042345_248765_63BF2F01 
X-CRM114-Status: GOOD (  21.17  )
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

Hi Richard,

Gentle ping.


On Tue, 2021-03-16 at 16:52 +0800, guochun.mao@mediatek.com wrote:
> From: Guochun Mao <guochun.mao@mediatek.com>
> 
> Conside the following case, it just write a big file into flash,
> when complete writing, delete the file, and then power off promptly.
> Next time power on, we'll get a replay list like:
> ...
> LEB 1105:211344 len 4144 deletion 0 sqnum 428783 key type 1 inode 80
> LEB 15:233544 len 160 deletion 1 sqnum 428785 key type 0 inode 80
> LEB 1105:215488 len 4144 deletion 0 sqnum 428787 key type 1 inode 80
> ...
> In the replay list, data nodes' deletion are 0, and the inode node's
> deletion is 1. In current logic, the file's dentry will be removed,
> but inode and the flash space it occupied will be reserved.
> User will see that much free space been disappeared.
> 
> We only need to check the deletion value of the following inode type
> node of the replay entry.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> ---
>  fs/ubifs/replay.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/ubifs/replay.c b/fs/ubifs/replay.c
> index 0f8a6a16421b..1929ec63a0cb 100644
> --- a/fs/ubifs/replay.c
> +++ b/fs/ubifs/replay.c
> @@ -223,7 +223,8 @@ static bool inode_still_linked(struct ubifs_info *c, struct replay_entry *rino)
>  	 */
>  	list_for_each_entry_reverse(r, &c->replay_list, list) {
>  		ubifs_assert(c, r->sqnum >= rino->sqnum);
> -		if (key_inum(c, &r->key) == key_inum(c, &rino->key))
> +		if (key_inum(c, &r->key) == key_inum(c, &rino->key) &&
> +		    key_type(c, &r->key) == UBIFS_INO_KEY)
>  			return r->deletion == 0;
>  
>  	}

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
