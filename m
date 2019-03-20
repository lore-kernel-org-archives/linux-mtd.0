Return-Path: <SRS0=zR1V=RX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 410FEC4360F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 21:07:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12C502184E
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2019 21:07:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RUHkXmxM"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12C502184E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=De8qibQFAN7Sv+Gvw/O41ru+Qv/vArcXmctkFNrcGKI=; b=RUHkXmxMouNV+C
	Sm0tNJDKh2QFATWKPPq1b37DldOQml34yaEpd7+xjLEB8vkL+N2BGkavcmOXJ5uLhChtee7jif4V9
	R8JEV2W7j6tYqVrS7/Nbd6YDDi+WSvKD+LcBvLcUJl7K4throRVC0CdSKGDLb4QZIC7ljAjo5HZNC
	s1tw/3nff3xlAz7SQKE5nXeqJGDlceu67gXqEH5YjL1bUv/wjST6TgthSfZqg6gSWQBzUCoGPEauh
	fsDFP+mlxvptQPZYaPUmaB9Np5EKajjNOKFQQLAdHwl7mD+Us83wA3c+onuvhpn9wfEimR1GNv7GV
	MI3V3uyKOTQjZRXxu9YQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6iQL-0006Dm-JI; Wed, 20 Mar 2019 21:06:57 +0000
Received: from lithops.sigma-star.at ([195.201.40.130])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6iQI-0006DR-I5
 for linux-mtd@lists.infradead.org; Wed, 20 Mar 2019 21:06:55 +0000
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 58683609187F;
 Wed, 20 Mar 2019 22:06:53 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id YGw392y7buh6; Wed, 20 Mar 2019 22:06:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by lithops.sigma-star.at (Postfix) with ESMTP id 07CEE60ED8A7;
 Wed, 20 Mar 2019 22:06:53 +0100 (CET)
Received: from lithops.sigma-star.at ([127.0.0.1])
 by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id CemW--m36dOW; Wed, 20 Mar 2019 22:06:52 +0100 (CET)
Received: from blindfold.localnet (213-47-184-186.cable.dynamic.surfer.at
 [213.47.184.186])
 by lithops.sigma-star.at (Postfix) with ESMTPSA id ACD6D609187F;
 Wed, 20 Mar 2019 22:06:52 +0100 (CET)
From: Richard Weinberger <richard@nod.at>
To: yang.yang29@zte.com.cn, dwmw2@infradead.org
Subject: Re: [PATCH] jffs2: check dstlen for jffs2_zlib_compress()
Date: Wed, 20 Mar 2019 22:06:52 +0100
Message-ID: <4416301.M1b3l0cs3q@blindfold>
In-Reply-To: <201903201046335762775@zte.com.cn>
References: <201903201046335762775@zte.com.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_140654_752598_E32C65DB 
X-CRM114-Status: UNSURE (   7.06  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Am Mittwoch, 20. M=E4rz 2019, 03:46:33 CET schrieb yang.yang29@zte.com.cn:
> Hi Richard:
> =

> =

> =

>    Is the patch make any progress ?

Well, you ignored my questions.
Can you please check my last mail?

Thanks,
//richard



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
