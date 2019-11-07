Return-Path: <SRS0=+z0R=Y7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDC7FC43331
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 15:36:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE7D2178F
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Nov 2019 15:36:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A4Ou2/Fa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ijCUyc5i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE7D2178F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WlcCc7z48krlqe8O3tq/r6lRvBJLD+oQyB8IU1vvrY=; b=A4Ou2/FaX5prdL
	j2CDYYgKWeinmjrKmoCvJG3mqLagIJCTqzy1Gs4hb3CszWYXlUuiMMbwlMiJho7AKvaBH5J9eI8is
	6TQd1sLUrnrb+qZDEiaOD67OOGq9lDBFtWN2Us8X1J8YLkdohFVXhxkD7mgAB5+B3ialhOUex/mjS
	G5ABI3NUcJEXj6jdPD87eB2TmDwRIim8oaCnYS2BCKrV17l+fuXkFzhvfZe9SEbRME0mqqe1QpVoh
	nFAKRzf87vBNd5bIwpafALVCkIUabv4Wx1XFsB10fOTTU1G80WwKqGO95XNYMnKZ8axW2Qps25fX+
	IvgVBKy3iJDUwd9VUEvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSjpJ-0003ZS-Lc; Thu, 07 Nov 2019 15:36:01 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSjoP-0001aT-Jv; Thu, 07 Nov 2019 15:35:07 +0000
Received: by mail-ot1-x341.google.com with SMTP id d5so2378820otp.4;
 Thu, 07 Nov 2019 07:35:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=w4Awp6aOhgxlUbwSvEpd03sWLJcXbVuHqaesNRPrPJo=;
 b=ijCUyc5iys61fP5qEnvqB8BCmoBcDMao3mCulvGbWvgt55dkkYzlQq0oJND3XvRnBi
 YX/rX62aJZPdsgNa5wqocPqqKdiY4uUUBqLXVdkOVPvGzrCzQWan6hlUDPEy6m+8yrx/
 ryzXIA6mflIgSgR//YvsyL1BcQ/3ElJPQwUxHHpuzOgUDRau5Aho3VfkvjiXUhq/UMSo
 L2QLyWG0HdNqsrpkzuBewcFBc4q3C6WsFKch57Su8Q3AFKl/WCGb1LZSgIPs7q2NFUaJ
 COtnVEMPQS6kzIgp3u/4H2p1rCrdZu6XeNJqzALe+E896Lw+1OuBmqf8O38BJwTTKygZ
 XYIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=w4Awp6aOhgxlUbwSvEpd03sWLJcXbVuHqaesNRPrPJo=;
 b=TRgB0CWnUjnKwUqcpFhrGRs/MhA92eMe5szad1yAb+hxxI5qdTVpdpgpGFFFFTrue5
 Cas21OE9Y3utZXMOZv4BWAnVCV6vITkW1NmWG5njddreDwT09he7AScFNKwzkNH5CXI1
 lh6rRXCXn6kWmfEmelcE2G9vuDyv6cwniyAFGxDpa00i5KXhVFsPLmX/ukxpF1APELxk
 3wjf2bWLj817eEUsTzT0EIQmLs5xFNqR2snS2KJe6XsafqYB4uOLayZZP5zd9d+SEMvw
 Yg6Uy7hJQ5DELsjuCS8QAv77DBtSlvF1/FA442EdiW269k6MZw+Jln8JYN4N8B+pZ8IF
 98lw==
X-Gm-Message-State: APjAAAVi7nItYiO7xXi72CHVKrVRb5NT1ZNbyTDQprjiQDf3ovfoesHa
 VspW+CpUx1m+9cUcNaF+6GlvLNDWO2xe9pGTLrg=
X-Google-Smtp-Source: APXvYqztU5GX0wlrnLPTMRH3pBVlSCTlwNpEd98regvGSDq6dRbCARkLpuzO2q7834lI/wC55JMJf9/Mpu2uMwyeWNY=
X-Received: by 2002:a9d:1b0d:: with SMTP id l13mr1540580otl.84.1573140903023; 
 Thu, 07 Nov 2019 07:35:03 -0800 (PST)
MIME-Version: 1.0
References: <20191106140748.13100-1-gch981213@gmail.com>
 <20191106140748.13100-2-gch981213@gmail.com>
 <1573132996.8833.3.camel@mtksdaap41>
In-Reply-To: <1573132996.8833.3.camel@mtksdaap41>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 7 Nov 2019 23:34:49 +0800
Message-ID: <CAJsYDV+UJFHsZWMOrvQFRm5BeG-6-YW8KSatSTxA=_gPuHJ6sw@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: mtk-quadspi: add support for memory-mapped flash
 reading
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_073505_705432_9DBCF243 
X-CRM114-Status: GOOD (  10.45  )
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
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Thu, Nov 7, 2019 at 9:23 PM Yingjoe Chen <yingjoe.chen@mediatek.com> wrote:
>
> On Wed, 2019-11-06 at 22:07 +0800, Chuanhong Guo wrote:
> > PIO reading mode on this controller is ridiculously inefficient
> > (one cmd+addr+dummy sequence reads only one byte)
> > This patch adds support for reading from memory-mapped flash area
> > which increases reading speed from 1MB/s to 5.6MB/s
>
> This may not be true for all MTK SoC. Which one are you testing?
>

I tested it on MT7629.
There should be a 5x reading speed increment under DMA or direct read
mode than PIO mode because PIO mode needs 30 or 36 clocks for every
single byte of data while DMA or direct read only needs 24 or 30
clocks for initial command/address/dummy and every byte of data after
that only need 8 clocks.

Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
