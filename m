Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F66C433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:34:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAD5961058
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 16:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AAD5961058
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6d5Kd872tZkQRVZgS1WGAWd+CJBYkBSQuRppM2fEjI=; b=Zgm+Jby6rgg1KF
	SRi6AJ0/K/FnKietWkv/hY3wXLR+VWE1Ysisqp68/IxH9TRnu6eBhhtPfynQR43JpGxcmYZxE6YFG
	LkXdBBKCLHroEznWgXzZFFBT0cWS2fuGtaBsBFa07Ch8HJ4Hlfa2LelrouXCZf4fOMQ7P3yeIlOqx
	J65Qazqd2Fx70pUY8n2EWzR4qX4JJD0E+EPc0sS08gZROxK+HryfCp1UtZe0RVq0k2fJ1cn4h6UUi
	uNrsRWy9I+k2ddokTnvsbdtP6wpCGththoB4evoNeRVL5iQd7syW0JZsRGqH6aegC8EPRKqWbwUPj
	Cml7kY25C4jwa72d/k2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVG3b-008622-Qe; Tue, 28 Sep 2021 16:34:15 +0000
Received: from lelv0142.ext.ti.com ([198.47.23.249])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVG3Z-00860v-4l
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 16:34:14 +0000
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18SGY7oi003138;
 Tue, 28 Sep 2021 11:34:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1632846847;
 bh=xSTXq8R8vgo138+dhfYd3IzStIxHaO1s9BsjwZOMBLA=;
 h=Date:From:To:CC:Subject:References:In-Reply-To;
 b=VASFaVffwcLLoVPVobvxVSOnepc8KJZeW9yh3KTCIul8r/ahsukmB2n4U0qNH0AhO
 tenUt9266pe4KizjcUzqr7sSF4wlkPgNZDkR+VD2RaX+hS11nCskGtoDrroYe2UT5D
 EZKbRyOGmZGyLCSQ+/zjFs97yhewrNgWZuZPfUnU=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18SGY7Fl034589
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 Sep 2021 11:34:07 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 28
 Sep 2021 11:34:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 28 Sep 2021 11:34:07 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18SGY6LM028980;
 Tue, 28 Sep 2021 11:34:06 -0500
Date: Tue, 28 Sep 2021 22:04:05 +0530
From: Pratyush Yadav <p.yadav@ti.com>
To: Daniel Palmer <daniel@0x0f.com>
CC: <linux-mtd@lists.infradead.org>, <tudor.ambarus@microchip.com>,
 <michael@walle.cc>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Add support for ZB25VQ128
Message-ID: <20210928163403.iufy6rgn7imiebpz@ti.com>
References: <20210918072256.3505379-1-daniel@0x0f.com>
 <20210920112625.fnqayim5mg5iggag@ti.com>
 <CAFr9PX=xKoa9fCbYf6Mpn=oudnY7A=6meKBSmzNHYLFad364tw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFr9PX=xKoa9fCbYf6Mpn=oudnY7A=6meKBSmzNHYLFad364tw@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_093413_297054_43BDC4A5 
X-CRM114-Status: GOOD (  22.62  )
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

On 28/09/21 10:15PM, Daniel Palmer wrote:
> Hi Pratyush,
> 
> On Mon, 20 Sept 2021 at 20:26, Pratyush Yadav <p.yadav@ti.com> wrote:
> >
> > Zbit should be in bank 10, so it should be preceeded by 9 0x7f bytes,
> > correct? I don't see any logic to handle that in SPI NOR currently so I
> > assume this manufacturer does not implement the continuation codes.
> >
> > In that case, it should go to the manufacturer collisions driver
> > proposed here [0].
> >
> > [0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210727045222.905056-6-tudor.ambarus@microchip.com/
> 
> Sorry, I'm not sure what I should do with this information. I didn't
> even know about the continuation codes thing until now.
> Is there something I need to do here or do I just need to wait for the
> collision handling code to get merged?

I think that should be what you need to do. Tudor, any plans on 
re-rolling that patch series in the near future?

> 
> Thanks,
> 
> Daniel

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
