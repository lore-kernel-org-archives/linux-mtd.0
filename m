Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78539C5479D
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Jan 2023 00:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY6RYle6itXujZT1lPjp73IDuq3DJgHl7UXLTmEMI/E=; b=WMsD0QiocNNS/U
	a0Z1LiKgQK8M9dc2lgla6V5mAlbKeiw29Uzr1vOWguAXpm4fU36UydBQ2M9Fd2i3X54N/OZthrrnx
	qssXoWLmFoT4Rf7ELu0hB4qTmqcMNVRsxZXhkzz4JZbWv7GpjkhWdBdqormS65MQWbcBYtxl9qnID
	GhCH89Sq6mHmvXefFPkFJm0M8mToZ6sSPFUmOu0A1dBarkseJo2CRwsHFWWPdK5Blmi7sKWqcyqSh
	OIZFqgFALxgAIEq6N65LOUESemFBbntTiCqvxLJB2Y7C7yQOZoBLPcVujX/O1vNnM7XWrnTKrk9dO
	wVHrUK31dX2QBtgNl2hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDxNY-00G3Td-1g; Sat, 07 Jan 2023 00:48:08 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDxNK-00G3PN-TE; Sat, 07 Jan 2023 00:47:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5B20B61FBF;
	Sat,  7 Jan 2023 00:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E251C433D2;
	Sat,  7 Jan 2023 00:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1673052472;
	bh=nNZcUm2y6TRRNHYmy0+qpiZspVpC072+41FVY/tKC7Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cYJQWGa79RwekO/UXP3plTpopDgQkWdLf6BXafu/pwqkk5wJUE5Ko9BxRcaL9EGsd
	 RgCymAUjIHT7QHTNtJi76uZnX5KfDvIpquWglGa1n4ieQS7jsOvCYRLwoZp0/RNOLO
	 swWhSpCpNMdYsYpmttFF0E39evxAgC35q3cy5O9s=
Date: Fri, 6 Jan 2023 16:47:51 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Tudor Ambarus
 <tudor.ambarus@linaro.org>, <arnd@arndb.de>, <richard@nod.at>,
 <krzysztof.kozlowski+dt@linaro.org>, <herbert@gondor.apana.org.au>,
 <robh+dt@kernel.org>, <claudiu.beznea@microchip.com>, <broonie@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-crypto@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <pratyush@kernel.org>, <michael@walle.cc>, Tudor Ambarus
 <tudor.ambarus@microchip.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2] MAINTAINERS: Update email of Tudor Ambarus
Message-Id: <20230106164751.7ddaf5c54e0a764344806848@linux-foundation.org>
In-Reply-To: <f653b23f-cf25-61ec-60d4-91dd7823edd2@microchip.com>
References: <20221226144043.367706-1-tudor.ambarus@linaro.org>
	<feb09bac-0ea4-9154-362b-6d81cba352a8@linaro.org>
	<678ad800-7a3b-e2bf-6428-f06d696d8edb@linaro.org>
	<20230106165506.0a34fa78@xps-13>
	<f653b23f-cf25-61ec-60d4-91dd7823edd2@microchip.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_164755_014583_20390BA6 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, 6 Jan 2023 16:59:52 +0100 Nicolas Ferre <nicolas.ferre@microchip.com> wrote:

> > Are MAINTAINERS changes accepted through fixes PR? I see a number of
> > experienced people in Cc:, I would like to hear from you folks, because
> > I never had to do that before. If yes, then I'll do it right away,
> > otherwise I'll apply to mtd/next. I'm all ears :)
> 
> I remember a conversation that stated that MAINTAINERS changes must land 
> in Linus' tree the quickest, because it'll just avoid confusion and 
> bouncing emails.

Yes, I always merge MAINTAINERS fixes asap.

Probably these fixes should be backported into -stable kernels also -
we don't want incorrect email addresses in *any* kernel.  But I don't
do that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
