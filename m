Return-Path: <SRS0=WqWW=OS=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ED9AC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 13:16:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 192F361159
	for <linux-mtd@archiver.kernel.org>; Tue, 28 Sep 2021 13:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 192F361159
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4PWT6fYHMBADkBmlbJiagY8kTOoJe9en4Oukg5ovEak=; b=yu/H3EIZL+P61C
	iSEkStWrdtXb7isMbBIUhHs5siVqp+cmZRBo2QDHXaY+QGpOQsmnya34t8LcvqGc4RiB+90p5kE0R
	3IrRGyEz9NvI+BqPpX3eY3zRBj0heKu0tqezNmeOAf4gtAwOerasA2kVnIc8lnE8x5LnC0C3RnAyA
	OoflP205ttt1wIds/nXQHOt+nF9GmFKlrPMwUt8bdKU6YmHUl7xCFzxXxLvl2su4O9LGbK9/5gKOF
	sH0GZYrLNQAhSWPuVHpb5EaagObukcrbEhEJuF9VBDu4UySEnn3UGdSceQYKumQZDPDLVJVEAETjD
	a0wfA9Ec+2vkUZkKfi2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mVCxv-007JDG-Rf; Tue, 28 Sep 2021 13:16:11 +0000
Received: from mail-ua1-x92b.google.com ([2607:f8b0:4864:20::92b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mVCxs-007JCY-Qd
 for linux-mtd@lists.infradead.org; Tue, 28 Sep 2021 13:16:10 +0000
Received: by mail-ua1-x92b.google.com with SMTP id 20so6522381uaj.6
 for <linux-mtd@lists.infradead.org>; Tue, 28 Sep 2021 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=0x0f.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fi6DG/t7j2/pxu+c0AJPr10+nggoTRsoICFD1lNKucU=;
 b=U2Lf0T2VnVWbOmIYI0oOLx599pU7rDKWZGF4FPFD1mpbfyQlYcxCZNrNblSJc/o+Zq
 8zeLn55dKxuI8iYTKwY1rXtHtx+4ApAMOYaUwVZyKxPhbPtP8u2Qte7VrXpQz7L36NIy
 wDuQDPy66Fqdgah3K1LxinsJ1cDLpBDOfPdNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fi6DG/t7j2/pxu+c0AJPr10+nggoTRsoICFD1lNKucU=;
 b=sAhBOfcBCHzHZLojTr2r+qDi7EyQTYH4ZgxneyqI8RjnnOC/3Tgb2YIfI1VilQZ7ee
 ijt8iUb8NVJH3Uu427tNFk2ITgTOK8JMdT7docKkKrjqnOdhaaeC0CDsWwlfMs10PCjY
 jQeK7XRHUxCwwO7wzFOKgOJzPuCDQW2SUTHL4DrCEuXvhIAI+leATF1IXsxHmVCx3CBG
 u2k1cN+bCP6UlCorurJUHKQgMyOnNP7f7uHSjlaBa6RDmlRe5sUbSjCBftz/PQjYVuIc
 nqaH2K0dWW74rJYTeV68KcFPykQYgSpRV/Sng+rXit5aOyyA59TkPeKOuDEh9+dzX+ta
 jXaw==
X-Gm-Message-State: AOAM532oiZoagwzkNk+3Br3ZDgbaIMRBGBegk9FompVRjWSgTb8ZuhUf
 AL1tbNKZCVGMiDEiO75kZKxf3EpazPp5naXzpPiwtlPgSvU=
X-Google-Smtp-Source: ABdhPJwf0Q1iOmCTn1+wbKGywa5PSrZWCmLjesHM4yZ/rTl8OBM4+F/L2XQ7i2ZiqYRUtl1L1lZgagXReoyxsWCjhxU=
X-Received: by 2002:ab0:73d7:: with SMTP id m23mr4766279uaq.118.1632834966378; 
 Tue, 28 Sep 2021 06:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210918072256.3505379-1-daniel@0x0f.com>
 <20210920112625.fnqayim5mg5iggag@ti.com>
In-Reply-To: <20210920112625.fnqayim5mg5iggag@ti.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Tue, 28 Sep 2021 22:15:55 +0900
Message-ID: <CAFr9PX=xKoa9fCbYf6Mpn=oudnY7A=6meKBSmzNHYLFad364tw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: Add support for ZB25VQ128
To: Pratyush Yadav <p.yadav@ti.com>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@microchip.com, 
 michael@walle.cc, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210928_061608_990641_83673FD2 
X-CRM114-Status: GOOD (  15.48  )
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

Hi Pratyush,

On Mon, 20 Sept 2021 at 20:26, Pratyush Yadav <p.yadav@ti.com> wrote:
>
> Zbit should be in bank 10, so it should be preceeded by 9 0x7f bytes,
> correct? I don't see any logic to handle that in SPI NOR currently so I
> assume this manufacturer does not implement the continuation codes.
>
> In that case, it should go to the manufacturer collisions driver
> proposed here [0].
>
> [0] https://patchwork.ozlabs.org/project/linux-mtd/patch/20210727045222.905056-6-tudor.ambarus@microchip.com/

Sorry, I'm not sure what I should do with this information. I didn't
even know about the continuation codes thing until now.
Is there something I need to do here or do I just need to wait for the
collision handling code to get merged?

Thanks,

Daniel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
