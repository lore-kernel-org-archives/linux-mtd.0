Return-Path: <SRS0=ONRD=TU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEF06C04AAF
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 19:53:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDBA820863
	for <linux-mtd@archiver.kernel.org>; Mon, 20 May 2019 19:53:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cJMTsA5i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDBA820863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=allycomm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sQTWLS6AdHoO9q+Pj2T82ARFfOJs9F/kEdSFOWR8lMI=; b=cJMTsA5igk4PR2JKw6AwVaMGK
	37I2uCXqjgxOy8ny96B4XzZne3MN5Lkngm/oytqDsDHU2735D5S+0mX4qb5/ySd8JYE8GoN0CGsYX
	7vMx38u8Zs7oXo27dQH7rMbTs8Br3eDdu/uT0qdUY55WHO9C8IKRVmDC1v61/xoZaPMghgaJkUfoW
	PJ1im1lRZdwdAeq5rN43lGkNqaxCZyqoClZZH3LgoJb9LsQYphiSOnuHPO5vIXQLN26QWHAO6p9eL
	QdpbCOzkcf+e+CWsUQlc2TTmKK/B/J/OPQCIiLvMt2hPWBswQVV7iA/FmeURcRfNIU9U1rkKiLddM
	ZF3aNwM0w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hSoM8-0006qt-6E; Mon, 20 May 2019 19:53:56 +0000
Received: from mx.allycomm.com ([138.68.30.55])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hSoM2-0006jN-D3
 for linux-mtd@lists.infradead.org; Mon, 20 May 2019 19:53:53 +0000
Received: from JKLETSKY-MBP15.local (184-23-191-215.vpn.dynamic.sonic.net
 [184.23.191.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx.allycomm.com (Postfix) with ESMTPSA id 65AE03BCE2;
 Mon, 20 May 2019 12:53:49 -0700 (PDT)
Subject: Re: [PATCH v2 3/3] mtd: spinand: Add support for GigaDevice
 GD5F1GQ4UFxxG
To: linux-mtd@lists.infradead.org
References: <20190514215315.19228-1-lede@allycomm.com>
 <20190514215315.19228-4-lede@allycomm.com>
From: Jeff Kletsky <lede@allycomm.com>
Message-ID: <ef6d5586-b211-544a-2178-8636a5b949a8@allycomm.com>
Date: Mon, 20 May 2019 12:53:49 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190514215315.19228-4-lede@allycomm.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190520_125350_767807_9CFDEB8C 
X-CRM114-Status: UNSURE (   8.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

This series, https://patchwork.ozlabs.org/project/linux-mtd/list/?series=107874

superseded by https://patchwork.ozlabs.org/project/linux-mtd/list/?series=108868

mtd: spinand: Add support for GigaDevice GD5F1GQ4UFxxG  <https://patchwork.ozlabs.org/project/linux-mtd/list/?series=108868>

and marked as "superseded" in Patchwork

Jeff


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
