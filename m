Return-Path: <SRS0=tAZV=SU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C27CC10F0E
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:44:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 356442054F
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Apr 2019 19:44:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nsTVPzHr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="PDjG2y4A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 356442054F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3pvFNeWdHBD47OLouht9Ubh13KFHvqU561+k1YZ1BiM=; b=nsTVPzHrD9Sm4W
	zPiF+1gCtdNi4f+ljHypcH+DtvM9VhXqgJLGmM0lLa82Pz66MFkEJvjtFYCR6la62KUOXgmAiZ4Or
	yaKlQbop1VS8Z6U3DVJHOZfT5Ig/5iaukVbGr1LeuZnlYik+XB+zIWeveOpB67qG3pArCQwRsvGf5
	USZpNnD0PW1LytDo8G4NSiZrXjZvBW6/CtvuTKOWhmjoc/YkR/ssf3etpyk+B6oz4lTcQ9zcOzBuv
	kkX+gqPUN6qBM+Tjt7UL0mUYB2f0HijYPw3ZuTZY7/8gqDPXl7atuoMoMxoiZ78fMUUT4v4zkPvRZ
	lob2VvM3yH0K0wDKgiWQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hHCxJ-0005vx-ED; Thu, 18 Apr 2019 19:44:21 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hHCxF-0005uj-DH; Thu, 18 Apr 2019 19:44:19 +0000
Received: by mail-ot1-x344.google.com with SMTP id d24so2658834otl.11;
 Thu, 18 Apr 2019 12:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bx5KZfdXjm8ofYlrpIW9ivlLzCel7RPnKzTt4neA1m4=;
 b=PDjG2y4A+ODJSC0q5bF1f9z9TQsnJEK6Z/nQLQt6t6m+YV8A+/CJ5zo+I9dRy7vnTK
 AqE2sG9BqaK/BTOKWz/xe3nFKoForFr8PjoeE2FbzLdBSRfk2/e4N5dKybQfA6JnEPB/
 AZe0PZX3LzhwWkAR/sfZO16S6VWzJeyVNVYPNU4a+g2byBvhyoJsul3efRIdpnoSOJAL
 8hYOGDhaGN/PRqpNUr+Hh0m2SYSu3TnUKRHCnDKXHcBzTllEoufAV5/stkq0bx8SkrSH
 0PK3Lsxdp2SV/M1qIjVTsGYi/pxWmMcn3dpIJ9NTotVkZKiNIACd1DbS66zS1ie3Agk+
 x6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bx5KZfdXjm8ofYlrpIW9ivlLzCel7RPnKzTt4neA1m4=;
 b=jTbMpBdtuaSLuNPuvbRcwCxYzX5ntebZ9tgP6TJ9UcTMtmdY6knvLXhmz3v114pGyC
 OiU9ktb5+2K3FPOapNm6pycKsnd7iwmGZNH5UEvNgY+qeuZz+UdTWCUgv7S6Av6NSgWL
 N119jukyQmYx1Ku832ILGTxenhsGJY8BXyuZX1mF4igPBuVNSkorqYjnfhGZab6ymPYF
 iTWkMXSmx+48wAo1UNAJc3VV38pUxGYbGZkNEcAc5QC+00bmK9JjTN9vyI1/S7OCYSUP
 z/LVjXPVpLwE6Qtt2/meO8prJfP+bQmqDad1edzTzWRxa1lGCGrC0QEYvklCJRJlyp9z
 g6Ug==
X-Gm-Message-State: APjAAAUcgeMu5LORr+C5Ad7skMpqeaINZEgIUWl2Fz/RqQ3E8KEmJ0/Z
 oR6D+Oxc/yNprd1mMMJSDBXx+RZqIrnu4rC049Y=
X-Google-Smtp-Source: APXvYqyijd+OHnD93J6murDFe1J7q1CB4zrpQTFpLXHp4Y+tOsizvLu6b1hoZweO/hrVZVErO+7FYTomNtc/0Yz5UU4=
X-Received: by 2002:a9d:5e90:: with SMTP id f16mr56649724otl.86.1555616655912; 
 Thu, 18 Apr 2019 12:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190411220056.19109-1-martin.blumenstingl@googlemail.com>
 <20190411220056.19109-5-martin.blumenstingl@googlemail.com>
 <bd1900db-7ca1-a6e5-39f9-db54e0b570dd@amlogic.com>
In-Reply-To: <bd1900db-7ca1-a6e5-39f9-db54e0b570dd@amlogic.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 18 Apr 2019 21:44:05 +0200
Message-ID: <CAFBinCB9Z_H4wX3_g2hVL-XnS6Oq-KtPHa4Z1ws79FGp5jCapQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd: rawnand: meson: only initialize the RB
 completion once
To: Liang Yang <liang.yang@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190418_124417_476285_38F66F09 
X-CRM114-Status: GOOD (  17.68  )
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
Cc: jianxin.pan@amlogic.com, bbrezillon@kernel.org, richard@nod.at,
 linux-kernel@vger.kernel.org, marek.vasut@gmail.com,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-amlogic@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Liang,

On Mon, Apr 15, 2019 at 8:04 AM Liang Yang <liang.yang@amlogic.com> wrote:
>
>
> On 2019/4/12 6:00, Martin Blumenstingl wrote:
> > Documentation/scheduler/completion.txt states:
> >    Calling init_completion() on the same completion object twice is
> >    most likely a bug as it re-initializes the queue to an empty queue and
> >    enqueued tasks could get "lost" - use reinit_completion() in that case,
> >    but be aware of other races.
> >
> > Initialize nfc->completion in meson_nfc_probe using init_completion and
> > change the call in meson_nfc_queue_rb to reinit_completion so the logic
> > matches what the documentation suggests.
> >
> > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > ---
> >   drivers/mtd/nand/raw/meson_nand.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/mtd/nand/raw/meson_nand.c b/drivers/mtd/nand/raw/meson_nand.c
> > index 57cc4bd3f665..ea57ddcec41e 100644
> > --- a/drivers/mtd/nand/raw/meson_nand.c
> > +++ b/drivers/mtd/nand/raw/meson_nand.c
> > @@ -400,7 +400,7 @@ static int meson_nfc_queue_rb(struct meson_nfc *nfc, int timeout_ms)
> >       cfg |= NFC_RB_IRQ_EN;
> >       writel(cfg, nfc->reg_base + NFC_REG_CFG);
> >
> > -     init_completion(&nfc->completion);
> > +     reinit_completion(&nfc->completion);
> Tested-by:Liang Yang <liang.yang@amlogic.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>
thank you for reviewing and testing my patches!

[...]
> Tested-by:Liang Yang <liang.yang@amlogic.com>
> Acked-by: Liang Yang <liang.yang@amlogic.com>
please consider the following note for future code-reviews:
most maintainers take the patch from patchwork and apply it to their git tree.
however, patchwork is not smart enough to detect when the same
Tested-by/Acked-by is sent multiple times.
this results in the same Tested-by/Acked-by being listed multiple
times in the final commit: [0]

what I do instead is to reply with one set of Tested-by/Acked-by
(below the author's Signed-off-by) which is then valid for the whole
patch.
There's no problem to have Tested-by and Acked-by at the same time,
the issue only shows up if you send Acked-by (or any other tag) for
the same patch multiple times.


Have a great day!
Regards,
Martin


[0] https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git/commit/?h=nand/next&id=39e01956e2f70ff9f0e97db1a69c9847aa1d5d8b

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
