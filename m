Return-Path: <SRS0=R5zI=V5=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC243C19759
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 15:24:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1DBA20665
	for <linux-mtd@archiver.kernel.org>; Thu,  1 Aug 2019 15:24:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Qp6U3mjE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I4/fSki/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1DBA20665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jwtPed29pKvVzTAxe+nlXZ/DqRUmq0aU7hDMPlzJXgI=; b=Qp6U3mjEPS94BW
	ycf2BsNolFtv04t6WFDJUDUW2nODNzWD62Nx8H9TValTTI1qFHlRMEGS5XTALMklpghvp1Dg/lZPX
	p/mNdlG/ZxaS7FR/og7PplKLqqtfWCvn/nJrMKntMzYVF86lmkzbdxj0EMtWpdWnQjVyNn+q+Z4o4
	k+dNVksDed0kHc5P/gzBRBye046FjXBode4DBpTWnHljYnf1nmtusdKP1fpXLsKpF8ggJX+1M0C35
	5LmspILszUP55mPU5clnLHosQdJj+KbaHtEHfu7KXsz4wBK4araOnshPGSIg0xQjmqRQig/O2Xzt8
	W59r8JjKzbTwR4Q+32ww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1htCwF-0000wV-Fy; Thu, 01 Aug 2019 15:24:19 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1htCwA-0000vN-Mq; Thu, 01 Aug 2019 15:24:17 +0000
Received: by mail-io1-xd42.google.com with SMTP id s7so145050323iob.11;
 Thu, 01 Aug 2019 08:24:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MBiW41NqW4TAnHAH02ISFrYBi40GZVKimkx9qKPuwA4=;
 b=I4/fSki/ZDrS6t7bxww5FkiNPP2v+Wto9BSBGL3O8+1uX0mJYcLuDX9I5jr6F7Vo2F
 RVdBOEz9IE8EgNq14z9ZkR5Ab/zYBF6nELYdYTXnVW/1zOmAKi+XJDMjr9fEkjdVq94C
 Q4T5EOR/uFZmmt2HU6d+B1lOkrDlksNvJMoH1DSmCX8gQy7rebL3Wl43K0EdtxIL48Aq
 DyyonSFKF0HO8VIRLQ1RD4cM4Mz6RDrYsGPJ9osBOspZLkFykPhjikc/mO8jATnLcCug
 KdO2mkv9Tgv/mSw58s9mgTpSvGCfA3J8s8fMadt8Exwq5BnB25/J7+ANWwc1yzKC1n9T
 /phw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MBiW41NqW4TAnHAH02ISFrYBi40GZVKimkx9qKPuwA4=;
 b=qhleTqBwkvo152/gFXctdCUqUolDNMQ+L6fw1TGRy8deSYqXumni+ltUTAPQ1IpBSZ
 Jle7f5nx8j/cOKWx9WU4w/Wtjn4L1vCbOlk/fIKmhWAdtj1zL6KVWzjk8xLLSvdJ+8mc
 NZ1ppJW8KNOU3RZFkt9O9NX0Y2GB6ks54sYf2NltAXHAG1eYG2DnXiWpW1HKfGDSls5B
 0NkfWZvFp0m31kZZ5OWj3kUesREGh5FkGhFBPAi1obwoLLvcHqalWxFXPixmg3NiaGT5
 DtamgNUYDOHg4kuVV25gBoC59EAeK6O0cp55uYBAC+pOy3Yh/yWgwbux08EIRTnrLX3F
 JM/g==
X-Gm-Message-State: APjAAAWYLgHk4yCoptw/vhH2805TeUDEf+11SRc3hVNr9maFfCQefiOu
 HhJmSOwD7iYuj9aAW7rcSB3NAY7Z1KdP0jeVoo0=
X-Google-Smtp-Source: APXvYqwzE2acoA4+wz4386LeXXCfJdLnqPuKvYgJFDux4lZmG/U1xFLAmvWFRo2QrkPNbI1+x3/JUs5uKgzYilBc8zU=
X-Received: by 2002:a6b:f406:: with SMTP id i6mr48192506iog.110.1564673053693; 
 Thu, 01 Aug 2019 08:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <1560942714-13330-1-git-send-email-Ashish.Kumar@nxp.com>
 <1560942714-13330-3-git-send-email-Ashish.Kumar@nxp.com>
 <20190709200857.GA8477@bogus>
In-Reply-To: <20190709200857.GA8477@bogus>
From: Han Xu <xhnjupt@gmail.com>
Date: Thu, 1 Aug 2019 10:24:02 -0500
Message-ID: <CA+EcR20ui8Liot+PtzdU6CJb5WzLDHS0Xc7VR7qGAOpD5=ArNQ@mail.gmail.com>
Subject: Re: [Patch v3 2/2] dt-bindings: spi: spi-fsl-qspi: Add bindings of
 ls1088a and ls1012a
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190801_082415_943977_C1282C9E 
X-CRM114-Status: UNSURE (   9.82  )
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
Cc: devicetree@vger.kernel.org, bbrezillon@kernel.org,
 Kuldeep Singh <kuldeep.singh@nxp.com>, Ashish Kumar <Ashish.Kumar@nxp.com>,
 broonie@kernel.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Tue, Jul 9, 2019 at 3:09 PM Rob Herring <robh@kernel.org> wrote:
>
> On Wed, 19 Jun 2019 16:41:54 +0530, Ashish Kumar wrote:
> > Signed-off-by: Kuldeep Singh <kuldeep.singh@nxp.com>
> > Signed-off-by: Ashish Kumar <ashish.kumar@nxp.com>
> > ---
> > v3:
> > Rebase to top
> > v2:
> > Convert to patch series and rebasing done on top of tree
> >
> >  Documentation/devicetree/bindings/spi/spi-fsl-qspi.txt | 2 ++
> >  1 file changed, 2 insertions(+)
> >
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Han Xu <han.xu@nxp.com>

>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Sincerely,

Han XU

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
