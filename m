Return-Path: <SRS0=/qel=ZA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66264FA372C
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 03:51:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 318E620865
	for <linux-mtd@archiver.kernel.org>; Fri,  8 Nov 2019 03:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yz1i7P3b";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E0tKYfww"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 318E620865
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Fm+LOG37JPv3ckxmdJI5I4JE4McPNxbzmpqKy34hKM=; b=Yz1i7P3bR0WSPx
	drNscrZ4lcb28E7d6M/FbmxPRfJ9DhEpumE9rZgY1n6C0bnNB2ioOfojnYJYd7TUls4j7/pR0cCJT
	NvSc9ttgbmZd8Ml+pKA9/xjJWjvUPb4hwKqAuIiSclKhx8AyAkLPX7DSa+fpsCObggnie8UEXo0Oq
	yFTIAmbcHR0b6fAuVTovnFp4DRWsgMpzLhJGdPfkYHWs8yTspVk9IMO3AN9HlNWt9PJrW1qHlgtvv
	lpRAAXkbFX+FiMgtlkKr31UUn1fX/QwqlShqF3X+mApGuOLsDW5EWV1qfw5lLbmMageHKDMobxnQ4
	tyk8RHb6LdqiVDqqDd2Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSvIw-0002GI-E4; Fri, 08 Nov 2019 03:51:22 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSvIt-0002FK-G1; Fri, 08 Nov 2019 03:51:20 +0000
Received: by mail-ot1-x343.google.com with SMTP id t4so4086689otr.1;
 Thu, 07 Nov 2019 19:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rhuDy7k1YQ8fNXLKpPn/sc6C1FLdaiYWgUMBjQg/bFo=;
 b=E0tKYfwwrZDCdsh04gyklOIRSpMjrcZf7XFyRLcpx8x0pxA4Humn44TwuUQLZfK/1b
 DIJAUa72iHHl3W8JOk9gC0IoqX+RzQFpVTlLZbUsAIV+H8JULQJjB7WF+xoI4A7ibEeb
 x4OmdARMasC/SpvW/Qxj/m8VVxYvMnAHuzB5pYghTduxlcAih6ob712gkfAOl0RUFWfv
 6bj1niVXsQ8yZlejOg7g+4vxz+99Xjublz3dvnsnE+PC00dP5xGPe1roWntjK5FEmWsz
 JgDdCFE8U/7BdNPxiBYtudoex4LpRAacGADeazvwjutcDrZ0v61hhKDNtV75Kab+ZWHC
 TCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rhuDy7k1YQ8fNXLKpPn/sc6C1FLdaiYWgUMBjQg/bFo=;
 b=cw/FRrgWSYpSVH1Kf3WEj0pxaBPlFS3UZvYpm1+Pj36DKzSO/1JDSR/tW6wLg5XJOr
 cur6hQccijyxfscwtArGr7Q+49t9t2ue8hAgHP+w2RdQv7ZW1E+LFlB34SL40/cm1GHB
 5osdTKDrqCtJ6e24mHR0iydDElcgoCHiDqFBA63NPdQ1LZJ5zwEOmwlZ7hXBawZte/ft
 cxlxMKr9QDCSpnI9bafEs7bwMuXuhbZrtvT4/hafzozz2M9OWXjYRlk5S5glcPMYSbEV
 GW3yu0dIf0ZR7TeHv2laBPHWVHau1BxCKnsTdfKE7RVvPiguWXunRKGaPJpXFKTqe8OM
 OYsA==
X-Gm-Message-State: APjAAAUKqegDK3YjaZujtTymS/Z6emimlwR/JyZKWVFlumrpqRCOUYhV
 GHPRUSeUJnqspOM1RzFPd2xfcSEGgCZ/S5a1NEnF3HBh
X-Google-Smtp-Source: APXvYqy2t/kO5ZRGsn5pm8g1lSt5wtAL2Dz+sn0BJoP+m3eFEMrEvRM44WhCuk2uQLh+OC2wKvuDp/aXC2cBaaLmIIw=
X-Received: by 2002:a9d:6b81:: with SMTP id b1mr6069691otq.70.1573185077890;
 Thu, 07 Nov 2019 19:51:17 -0800 (PST)
MIME-Version: 1.0
References: <20191106140748.13100-1-gch981213@gmail.com>
 <20191106140748.13100-3-gch981213@gmail.com>
In-Reply-To: <20191106140748.13100-3-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 8 Nov 2019 11:51:06 +0800
Message-ID: <CAJsYDVJ8zFBJBQHVgyWE1joqGhsq9AibKqrgCZToySPT3p0PnA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: mtd: mtk-quadspi: update bindings for
 mmap flash read
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_195119_556765_5183A98A 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Nov 6, 2019 at 10:08 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> update register descriptions and add an example binding using it.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

I'll abandon this patchset and implement DMA reading instead.

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
