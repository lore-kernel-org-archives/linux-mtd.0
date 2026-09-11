Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BD9C88E4C
	for <linux-mtd@archiver.kernel.org>; Fri, 11 Sep 2026 09:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETROnFtKnP6NRC7CN9G1fGCSgQ/lfq05l9vsOSYqrd0=; b=KJZzYmBYV4zqd0
	Ve4XhZ2TJ8pNvhSB7fPxbal+Fd/i7hV141rOcv12MHaoPSUV6sFXpXzxL/w5vs8izOg+O8vNlbKGm
	eddJ1fmlTIVky/+feTtcf3vQG4M5so4XTdj3s88uSbxa3QVvufQnE6Tq8xMH/nHP+/6yXus6fzaAD
	JRSErYIHcWsOObYIXkqYVWKmVydE0u2PYrvt2vgu8IWhxAAXoXa/km8i+V64nF1cWZWKcDsZzahiD
	Dp1wDPaBpB6NYG1AA396NwTSH0pTtDHtO4EkeEWQV9anLnSRuz/bZ1ckJmK4ezqFhxJ4JxvOe2P4O
	nqq5bxzzUYuRu5Tp58+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQD-0000000GF71-11zm;
	Fri, 11 Sep 2026 09:19:49 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xQA-0000000GF6a-3kh7
	for linux-mtd@lists.infradead.org;
	Fri, 11 Sep 2026 09:19:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 196A41A0184;
	Fri, 11 Sep 2026 09:19:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E0355601DE;
	Fri, 11 Sep 2026 09:19:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 436D611C7AF8E;
	Fri, 11 Sep 2026 11:19:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789118382; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=KG94ASLKXP/d8lPTdsz9AhQ7xtqhzP7G6DgMzNl/mRo=;
	b=v01uTIx6IBAk4Y47nIMuLbGlCnjlSSLAyCCu9gcq+08UGN0p+JJnvX37LpWOlZzJJPwWUv
	GA1pCSN7Zev7o41/lm94vxA8V9Mk38URAb6XXBmsFWF38nbG4JJScrVROJbjX972fIhiNX
	i22m0wK/+GlKyPzlQjybVG2BcEfQAirjeAwUwC217muyeG4go8uQ7lU3mH/1ijVxkhto2B
	ghHCnuhZE+uPwOomW0OosxXoRMZhIU89VPWVrf+pY9pP1bSJz3jy3EyZxXhdGuIkxTgrMq
	9rnJ2UL4K2ji8e7WkvojJJSmr+6iUjFm7HIudwof2UKSh0A4aEOQx8Bqh5q3lw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>,  "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>,  "Richard Weinberger" <richard@nod.at>,
  "Vignesh Raghavendra" <vigneshr@ti.com>,  "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>,  "Jon Hunter" <jonathanh@nvidia.com>,
  "Steam Lin" <STLin2@winbond.com>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: Fix quad-enable for flashes with QER bit
 in SR1
In-Reply-To: <DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org> (Michael Walle's message
	of "Fri, 11 Sep 2026 11:04:31 +0200")
References: <20260911-perso-fix-spi-nor-qe-mxic-v1-1-fd6d91416a2a@bootlin.com>
	<DLCD7NN2IW82.33ISZCKO1E7UY@kernel.org>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Fri, 11 Sep 2026 11:19:39 +0200
Message-ID: <87o6e4qh5g.fsf@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_021947_072286_2CAE56DA 
X-CRM114-Status: GOOD (  10.77  )
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


>> -	ret = spi_nor_read_sr1_and_sr2(nor, sr);
>> +	if (qe_mask[0])
>> +		ret = spi_nor_read_sr1(nor, sr);
>> +	else
>> +		ret = spi_nor_read_sr1_and_sr2(nor, sr);
>
> Shouldn't that be the other way around?
>
> +	if (qe_mask[1])
> +		ret = spi_nor_read_sr1_and_sr2(nor, sr);
> +	else
> +		ret = spi_nor_read_sr1(nor, sr);
>
> I know qe_mask won't be spread across two SRs. Just to be
> correct and make it easier to grok.

Why is the second version easier to parse? First version is maybe more
future proof since we are treating a specific case. Because either it is
a specific chip (Mxic) or we end up in the more common case. There is
only one QER entry for qe_mask[0], many for qe_mask[1], and chances are
that in the future we will mostly see new chips only using a qe_mask[1]
mask. So having this in the else doesn't sound so strange to me? I also
don't think we will ever see masks spanning the two registers.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
