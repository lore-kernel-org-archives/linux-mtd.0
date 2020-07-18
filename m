Return-Path: <SRS0=UfuN=A5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBAEDC433E4
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jul 2020 17:25:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D8EA2073A
	for <linux-mtd@archiver.kernel.org>; Sat, 18 Jul 2020 17:25:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1ka51ds";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=pensando.io header.i=@pensando.io header.b="Yub5c1d0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D8EA2073A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pensando.io
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u0eyec6AySFwQn7uOIsSL4jc4SgH2hU1yQyggjKYDbE=; b=Q1ka51ds7yo5bKLru/JUq12fQ
	J1iQSsuEI3u9eghsd8umCPjaYF7sWIe0T7zl9kWwy5xphQkVGqvFEerfgZd6/f/hzPo32AO0XL4eP
	SbUWwEqSvNgK5p1x8ayiNe/6uAMfGsHY+mAL90KWlLvOVfxNrBZsgsa3CKBDoVotlzOmD8bRrLWZ1
	7R5eo0Xqw4Fn4Wtx2tKvI1gzo9jBFHOffIFlIY+1wxdOpUA2C9b+nlXVPhX0IfP9wAfnF/PWZFa+6
	T+wytILly+xpQslPFcUOOqUv/B1TqD56d+CvDuH5B6xDJA6fDoMdSrsOl4hfs3y40GrngAIsUrDQ5
	3IiEzRguw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwqYj-0001NT-4P; Sat, 18 Jul 2020 17:23:37 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwqYc-0001NA-GG
 for linux-mtd@lists.infradead.org; Sat, 18 Jul 2020 17:23:31 +0000
Received: by mail-wr1-x441.google.com with SMTP id f18so14147637wrs.0
 for <linux-mtd@lists.infradead.org>; Sat, 18 Jul 2020 10:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pensando.io; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xlcHFOFIS/SF+vz0aquHvtYMGyg6W2Rnh0XWS57TYI4=;
 b=Yub5c1d0shh0smgz1P135Fty0FPEL2U7UyQ4g9hqlYphDzfQNxO+XgZvjVq2IoVRxu
 LtJlP83u4PqslZ1NRyPd+0vFDS6Wa3p/aXhIiNyv9cb2mk/hsXTcNChmDq99sLB2D/6U
 Pew3AOvHP2HClm0ClVJVZEcfB7Zuu9BLbgjB03jNkp6UjAm+rPgTYfqFGNFqvbPjKsUo
 lHslDTv5807FZV0goQ5feGM7/UUSueuuxq843BOT3dXa5lZq0ZaJfDDJ0BBDJiQDpcIn
 IuLbIa8LstCJxbtJvW9icq020I+7wuTfszQc7VbuM+rqBSFmweK/HSlPXJaW4rlHC3oP
 wufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xlcHFOFIS/SF+vz0aquHvtYMGyg6W2Rnh0XWS57TYI4=;
 b=E9g1zJQtHbyLNOv5Bdyo4xCgvsakrECM4TFyu45ejdNKULpnD1qOIW0h0lMcGjEH8k
 jNdd5hdTWL8JtfrD6Too0EJhdrQEJQLPbuufc3g0U63NwrCpkJ6bYEguV9I503qTzbGd
 DZ278sUjAv763LpACDq0ZQqtMLYIarDR9PXi/7uVsIjoQfTTYSoaBl1ewjbJJwEhB4DI
 5+mGodHqpbvy1uV/j84iHzRWHnAcppRKvJoqD20CGRDiKzEuZdNQYwEs+4N5estZStrz
 KpgoBrWi0on6SUgqg5myqtsuMQg7Me1KXvo0rdRQnOdtFHXhlO0Afo/2HupIVQrlVmpb
 WDxA==
X-Gm-Message-State: AOAM533rGt6UcwNrQgv3fKp9PYys+6lVzAt6TbFcw4zH86HCVA3xG8k4
 hAfLiLCt0q8q++uwG7RRPOM5QK8XZ9CMjQo8m8I6sA==
X-Google-Smtp-Source: ABdhPJwr0tk27P3L9gH74mxRwrtv0FDXJ9skB16R0PbzNtQR3SMfXu7gO2nXKOjtDo4jXdJ2mqNTg2PxrTKR6Ryxk+k=
X-Received: by 2002:a5d:40c9:: with SMTP id b9mr14679018wrq.425.1595093009085; 
 Sat, 18 Jul 2020 10:23:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200716211631.38949-1-dac2@pensando.io>
 <20200716211631.38949-3-dac2@pensando.io>
 <1724beec-aceb-b6e9-1288-da340d3fd43c@microchip.com>
 <CA+nMikFFaxZxNP_d24+YGWfWG1yAV41FRyxQn=gweY0-T3aV_A@mail.gmail.com>
 <6c29b0f3-65d3-1e69-58ce-cbb84c88910a@microchip.com>
In-Reply-To: <6c29b0f3-65d3-1e69-58ce-cbb84c88910a@microchip.com>
From: David Clear <dac2@pensando.io>
Date: Sat, 18 Jul 2020 10:23:18 -0700
Message-ID: <CA+nMikEHs+CNDwk_Q6ohHdQRCyMirsMB_0AfueP08qYuttJ6tw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Support SPI_NOR_DUAL_READ on Micron
 mt25qu02g.
To: Tudor.Ambarus@microchip.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200718_132330_837560_5C8A583D 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Shannon Nelson <snelson@pensando.io>, linux-mtd@lists.infradead.org,
 vigneshr@ti.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, Jul 17, 2020 at 10:35 PM <Tudor.Ambarus@microchip.com> wrote:
> On 7/17/20 9:00 PM, David Clear wrote:
> > I withdraw this patch and will work on getting the Macronix patch cleaned up and
> > tests documented.
>
> No, please keep this patch as well. [...]

Ok, will do.  I'll re-submit the original patch with additional notes
on Macronix testing.

Regards,
David.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
