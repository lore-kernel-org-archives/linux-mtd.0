Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB21DC433FE
	for <linux-mtd@archiver.kernel.org>; Wed, 12 Oct 2022 19:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rhzC7Mbs2yV8Zk0XpU/cxr3lhr+7GXPn0EwqPbvVlgY=; b=TTXafxrvFTnXdL
	znbQP7LgiA9MEvYdfhhU4mB/ujogvuWuFqi5c64O6rg+P0WobjCWFuhjYh77Nh05I+p96PiPnCyeL
	Juut2L8eWZXEVj/MDm4EZw+T2t7pY3Z/SgjIr4AyCD0/emWk45nGYK6jmj6PuMuTvaZOcD9xHSSin
	9zva7CBHnjb3bLq3TGR2JHRfCw9IwGuFBbxdn7ebTu7pD2AV1HDt//RkTtj/RJrqDaZ4MbI5abWCl
	jbVL4Ab2xn72FObBpaNovmV60ylCguWdNH7zADbkw7ggBgfWWvDTJYw7D/KGp0ghIPZqK+MwinxSP
	RIzfM3YjPDO/qAq4Jjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihET-0098Yd-HQ; Wed, 12 Oct 2022 19:17:33 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oihEI-0098VS-34; Wed, 12 Oct 2022 19:17:23 +0000
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 2096E1C6C41;
	Wed, 12 Oct 2022 19:17:09 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf12.hostedemail.com (Postfix) with ESMTPA id AB9FC17;
	Wed, 12 Oct 2022 19:16:43 +0000 (UTC)
Message-ID: <f8ad3ba44d28dec1a5f7626b82c5e9c2aeefa729.camel@perches.com>
Subject: Re: [PATCH v1 3/5] treewide: use get_random_u32() when possible
From: Joe Perches <joe@perches.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org
Cc: brcm80211-dev-list.pdl@broadcom.com, cake@lists.bufferbloat.net, 
 ceph-devel@vger.kernel.org, coreteam@netfilter.org, dccp@vger.kernel.org, 
 dev@openvswitch.org, dmaengine@vger.kernel.org, drbd-dev@lists.linbit.com, 
 dri-devel@lists.freedesktop.org, kasan-dev@googlegroups.com, 
 linux-actions@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-block@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-ext4@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org, 
 linux-fsdevel@vger.kernel.org, linux-hams@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-mmc@vger.kernel.org,
  linux-mtd@lists.infradead.org, linux-nfs@vger.kernel.org, 
 linux-nvme@lists.infradead.org, linux-raid@vger.kernel.org, 
 linux-rdma@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-sctp@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, 
 linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 lvs-devel@vger.kernel.org, netdev@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, rds-devel@oss.oracle.com, 
 SHA-cyfmac-dev-list@infineon.com, target-devel@vger.kernel.org, 
 tipc-discussion@lists.sourceforge.net
Date: Wed, 12 Oct 2022 12:16:53 -0700
In-Reply-To: <20221005214844.2699-4-Jason@zx2c4.com>
References: <20221005214844.2699-1-Jason@zx2c4.com>
	 <20221005214844.2699-4-Jason@zx2c4.com>
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Stat-Signature: c3d78nppyrywoyngway5d943fw3wwtdu
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: AB9FC17
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/Qw27OeRP8/mQW0Su38d7rwhSo1NO9QCw=
X-HE-Tag: 1665602203-428634
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_121722_422909_EC666742 
X-CRM114-Status: GOOD (  12.20  )
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

On Wed, 2022-10-05 at 23:48 +0200, Jason A. Donenfeld wrote:
> The prandom_u32() function has been a deprecated inline wrapper around
> get_random_u32() for several releases now, and compiles down to the
> exact same code. Replace the deprecated wrapper with a direct call to
> the real function.
[]
> diff --git a/drivers/infiniband/hw/cxgb4/cm.c b/drivers/infiniband/hw/cxgb4/cm.c
[]
> @@ -734,7 +734,7 @@ static int send_connect(struct c4iw_ep *ep)
>  				   &ep->com.remote_addr;
>  	int ret;
>  	enum chip_type adapter_type = ep->com.dev->rdev.lldi.adapter_type;
> -	u32 isn = (prandom_u32() & ~7UL) - 1;
> +	u32 isn = (get_random_u32() & ~7UL) - 1;

trivia:

There are somewhat odd size mismatches here.

I had to think a tiny bit if random() returned a value from 0 to 7
and was promoted to a 64 bit value then truncated to 32 bit.

Perhaps these would be clearer as ~7U and not ~7UL

>  	struct net_device *netdev;
>  	u64 params;
>  
> @@ -2469,7 +2469,7 @@ static int accept_cr(struct c4iw_ep *ep, struct sk_buff *skb,
>  	}
>  
>  	if (!is_t4(adapter_type)) {
> -		u32 isn = (prandom_u32() & ~7UL) - 1;
> +		u32 isn = (get_random_u32() & ~7UL) - 1;

etc...

drivers/infiniband/hw/cxgb4/cm.c:	u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/infiniband/hw/cxgb4/cm.c:		u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/net/ethernet/chelsio/inline_crypto/chtls/chtls_cm.c:	rpl5->iss = cpu_to_be32((prandom_u32() & ~7UL) - 1);
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:		u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/scsi/cxgbi/cxgb4i/cxgb4i.c:		u32 isn = (prandom_u32() & ~7UL) - 1;
drivers/target/iscsi/cxgbit/cxgbit_cm.c:	rpl5->iss = cpu_to_be32((prandom_u32() & ~7UL) - 1);


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
