Return-Path: <SRS0=tJq/=TF=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3152EC004C9
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:07:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED9FD2082F
	for <linux-mtd@archiver.kernel.org>; Sun,  5 May 2019 07:07:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Pg1CwN0s"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED9FD2082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opojKr1kPKx0Ss9fMWTyH64yL8cJ5W7BrNUDpSkQlT4=; b=Pg1CwN0sPgsza7
	QLtFknSFp6m10aR0Jmpfkc9qKmd1VqvYHQVvIsQoPyCI1lbvhVIefGISGQktNmJ7gpEGCaw7jOSd2
	i7XQOjOs6xnIpCw8xPaFkUjbLCmlkCCZIhVyAa97qdQh1hvtpLwP/Bn5vIPMTChIlVyvyZhMJQqwy
	vfFEBvmAhYBWgg5jGqydARAvmeVsOEPadAxExPwqXcidMF/WWRydWBAnmytLSMuJDvWgyspIP5XIN
	sDZfp1njcAWFIyDlodan5eazzssX5dlEpT+5QgWOr6k6b8WFkMmQ0/E49dNpIc8rfr8cTTfNWDNTL
	TQ26st1SBI8jaPBPfvSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hNBEh-0004FQ-GB; Sun, 05 May 2019 07:06:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hNBEa-0004Ex-Jx
 for linux-mtd@lists.infradead.org; Sun, 05 May 2019 07:06:54 +0000
X-UUID: 28f667fc4f2c49a287a48d1b7429f20b-20190504
X-UUID: 28f667fc4f2c49a287a48d1b7429f20b-20190504
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xiaolei.li@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 965582540; Sat, 04 May 2019 23:06:45 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 May 2019 00:06:44 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Sun, 5 May 2019 15:06:41 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Sun, 5 May 2019 15:06:40 +0800
Message-ID: <1557040000.26455.59.camel@mhfsdcap03>
Subject: Re: [PATCH v2 1/5] mtd: rawnand: mtk: Correct low level time
 calculation of r/w cycle
From: xiaolei li <xiaolei.li@mediatek.com>
To: Sasha Levin <sashal@kernel.org>
Date: Sun, 5 May 2019 15:06:40 +0800
In-Reply-To: <20190430103205.5175421744@mail.kernel.org>
References: <20190430100250.28083-2-xiaolei.li@mediatek.com>
 <20190430103205.5175421744@mail.kernel.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B9B3AC740D21CB2D906577B0BCF6E19197523C342EA54B9C5971A556DB209DBF2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190505_000652_661198_E7EC4612 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: richard@nod.at, linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 miquel.raynal@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Sasha,

I am not sure if it is caused by raw NAND code path change.

Raw NAND code was moved from mtd/nand to mtd/nand/raw subdirectory since
kernel v4.17.

The fixing commit: edfee3619c49 mtd: nand: mtk:
add->setup_data_interface() hook exists before kernel v4.17.

@Miquel, do you know if some other raw NAND driver ever encountered this
case? Thanks.

On Tue, 2019-04-30 at 10:32 +0000, Sasha Levin wrote:
> Hi,
> 
> [This is an automated email]
> 
> This commit has been processed because it contains a "Fixes:" tag,
> fixing commit: edfee3619c49 mtd: nand: mtk: add ->setup_data_interface() hook.
> 
> The bot has tested the following trees: v5.0.10, v4.19.37, v4.14.114.
> 
> v5.0.10: Build OK!
> v4.19.37: Build OK!
> v4.14.114: Failed to apply! Possible dependencies:
>     Unable to calculate
> 
> 
> How should we proceed with this patch?
> 
> --
> Thanks,
> Sasha

Thanks,
Xiaolei


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
