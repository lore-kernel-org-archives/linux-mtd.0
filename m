Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98DECC4332F
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Dec 2023 09:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K330c8MFUyB9byuCSLiZZ8WfUSfrQkoYM/t2dg3G1Yc=; b=rU3GPSTRks+ulX
	sSQvwMjdnyZvS+w6OUdqkBOfyo/hwwahliofpWpMVFz/jXWIZkBmtFfFoRZx40iaFhvVU/Hww5yVR
	CGtGO8bUt49OszBPA7cYDBmBteGrEs4Q6QZAR9YtufT2uqWkzXuznM/RWGVnudElQMuN0MPpmSi+t
	p1wetX0EEkUker8folFEtEAJDyJPm4/ojzG0YICIaFkZyIqXJ8zYs9sl5FsOMcHS5Y3zN3VFWfkAe
	s0npSTJ3lSsmYw+GDT+ufg1hmzq/dqa0diOM21rFQdn+DoVzZQq8xNYZovNyEQqzHI0rMEnzx8i6x
	AJyM+h7h57JpJW1XL8cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLMk-00E7tJ-0k;
	Wed, 13 Dec 2023 09:17:18 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDLMh-00E7rE-0e
	for linux-mtd@lists.infradead.org;
	Wed, 13 Dec 2023 09:17:16 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1d3470496e2so10223995ad.1
        for <linux-mtd@lists.infradead.org>; Wed, 13 Dec 2023 01:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702459030; x=1703063830; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6dWtH4l2sr6SInDUeH4HeJtqF5U7qc0sqpIf7I8dGXA=;
        b=KqlsJUHiHL0+PrJly5CfQNQAG4BIlTvjyZrwWRDa+6R3nEu7A2RhFtIDfF6HL83kv9
         sVd4LBWbCzzaqUXQBeM7JntDgJ/cNqW/Nj+Dz/1WYGUs6qPC7tzMdJqNVBiOLC5yFztr
         3l4mdT70TQr0QAt26wjLWkWKaHEmeOPLjhFVMS66MDyiA+a0ci2KAXZcd5Tipk04ripc
         TF4Sn8XPj69QP3mD6oANeLJ8FRBvCSPBdkVlJIMvKvV7A79UayDcs0K6STsFyyTewKo9
         OjgI18G57Pb9gZukbOnQNuVjZBzNR+QGz+Lr3pKtaZZ1cSNjI5/+19stCmCey2kuJLG9
         mo+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702459030; x=1703063830;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6dWtH4l2sr6SInDUeH4HeJtqF5U7qc0sqpIf7I8dGXA=;
        b=OR+77jlQu80hwd3S4cdNjrSE89R3yH18AD8q1tgO17yGSub6PA8jYhW5W02u4LxoyN
         Zz21nz8zmZGTE1Lo15MCKxyTIh7x/xddr7shIPTmjmQISIkf6vZooaRoXrwF/gKAN0Ag
         Wv0s2pBlVnVzpgxrr36nf9RFaZkxKpxRrj1hPFHL5QpbwiGnr8DKoLrJZUwzXkpje3YD
         GilbnjnR8Pk6K4+OB+9YdB21ydFdlhk/A/Xo/stQugV/iK8KL5EfWPCLLiPR1hTrWiZm
         pxTr0yD9lV39F2gYXZWL0WBFQnE0mGboqEV2Z8iNxBsCg6X1JDCgUKiCAGuFrcsDrjsS
         J1Fg==
X-Gm-Message-State: AOJu0YyOLTTvzbxtZLIkbqvgU6G8LMHjta7T7cqUdz2IV3X6fxRlCQH0
	n2hYRESC1jf0tPgW8JLJO5O/aCll3EVff5l6uZY=
X-Google-Smtp-Source: AGHT+IHEtZLBXjbp8ya+8KC9CN3Yc1gsTFITOh1XQBBdC7tKLSjI7yvQq6//V70Sr7BFrW+cZbsN01kY/dFJw7seGXY=
X-Received: by 2002:a17:90a:a392:b0:286:6cc1:781b with SMTP id
 x18-20020a17090aa39200b002866cc1781bmr6878101pjp.94.1702459030609; Wed, 13
 Dec 2023 01:17:10 -0800 (PST)
MIME-Version: 1.0
References: <20231207075147.21851-1-jaimeliao.tw@gmail.com>
 <f015ef75d6bb0a9f8edba37b40affb60@walle.cc> <CAAQoYR=8b7NR8h0SHz=bp9=XHzZebDQhPUOc20b0eAF6Vd1kAw@mail.gmail.com>
 <e08b45ea59a0ba96de99a42ddf7b6769@walle.cc> <CAAQoYRmYxmD8v20_Q=YShj_xv1vsV7fXnAGPYPBSP=XJmoG2-Q@mail.gmail.com>
 <eb0667ee62c304b041f7861788ca0c7d@walle.cc> <CAAQoYRkR0Jgr96n0-h9_6HTjmSPBq-YKskFN5+e-m6HBSbCocQ@mail.gmail.com>
 <b3ce3771a751d85a76225d53cc565b70@walle.cc>
In-Reply-To: <b3ce3771a751d85a76225d53cc565b70@walle.cc>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Wed, 13 Dec 2023 17:16:51 +0800
Message-ID: <CAAQoYRk+3PfwPeDBTOfchnzqFfnxUfTsVAtsv9=ED2aOofJekg@mail.gmail.com>
Subject: Re: [PATCH] mtd: spi-nor: core: Introduce spi_nor_abort_octal_dtr()
To: Michael Walle <michael@walle.cc>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	jaimeliao@mxic.com.tw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_011715_241256_DFF2D682 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Michael


>
> Hi,
>
> >> >> To me it seems, that spi_nor_select_{read,pp,erase}() will select
> >> >> the wrong commands/proto. So it should be fixed there. Probably
> >> >> shared_mask is wrong.
> >> > Features in shared_mask have include 2 parts as below.
> >> > 1. Flash support the feature (by parse SFDP or ID table flags)
> >> > 2. spi host controller support the feature (In
> >> > spi_nor_spimem_adjust_hwcaps)
> >> >
> >> > But I think Octal DTR is a special case because, in addition to the 2
> >> > points
> >> > mentioned above, there are also other conditions that need to be met.
> >>
> >> Correct. And btw we would have the same problem for quad_enable if we
> >> wouldn't
> >> have a default.
> >>
> >> So in spi_nor_default_setup() I'd suggest to add something along
> >>
> >> if (!nor->quad_enable)
> >>    shared_mask &= ~SNOR_HWCAPS_4_4_4;
> > I think this check is unnecessary for quad_enable.
> > Because of "spi_nor_sr2_bit1_quad_enable" would be a default
> > method for enabling quad mode in spi_nor_init_default_params().
>
> Yes it is at the moment. But if a flash happen to have no
> quad_enable we'll have a problem for whatever reason. so for the
> sake of completeness we should mask that bit.
Got it.

>
> >> /* skip octal command mode if we don't have a .octal_enable callback
> >> */
> >> if (!nor->octal_enable)
> >>    shared_mask &= ~SNOR_HWCAPS_8_8_8;
> > Sound great.
> >
> > Could I follow the suggestion for preparing v2 patch?
>
> sure.
>
> > BTW, I think discard is better than abort.
> > What do you think?
>
> Where do you need that word? You shouln'd need any more
> than the code above.
Ok.

>
> -michael

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
