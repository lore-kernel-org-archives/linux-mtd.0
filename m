Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D303C83F15
	for <linux-mtd@archiver.kernel.org>; Thu, 31 Aug 2023 03:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MtUXDjfkIGtOlR8nSwAzoUrDTPGCJlX1DodK36rPtt0=; b=iNFHxLiq/KXO/a
	pM7bUnx1zqjZ7O8RuOTeskySQ5VRbY/XGqFHaeSmnsDsGL1Pbr+83Sy2mTEyhlynlng/090UJDG2i
	l5NeSm0qWDGhjg5NJ1Ieu5cGCytYQ6CDCUNbsAlHbfOJYP3ml09KfX73K9ru/7qV5r4d7LTJABqB7
	k8bvHL2McNqItLvJwVYN4nENlrfDhk/TzkY+1I3C+M4p2WTC+iCvXJX8Bwukxn5nhzK/5P/Zz+a76
	GK9g/0r1ysB/k2C5rlhh9HjUfJfh8zYWL6MiEQXyBEYTyz8hnbrmfCZRthSG7b2f7bqn5T1igsGvy
	ldKMzMyzgGXJj088iv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbYDA-00EXUZ-27;
	Thu, 31 Aug 2023 03:19:12 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbYD6-00EXU0-0Y
	for linux-mtd@lists.infradead.org;
	Thu, 31 Aug 2023 03:19:09 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2685bcd046eso257225a91.3
        for <linux-mtd@lists.infradead.org>; Wed, 30 Aug 2023 20:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693451944; x=1694056744; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5697xlLAtX6twxyAu8LMNSIvSh/52eNe+lLpP2cgKg8=;
        b=OXekqfe0SKTTmq3e5bEYfdAN1H68VHt+g1y8DfCaf0PyuZiN646y8vHTrvfJSf/ew+
         imQq+E5LQQOVDlnr/pAximeEGVMEcluO2uswc3m1Bb1+LmJYs47fwO5XZJrPU61uR/44
         tvrRWeSfjEVzd/jfitH+17795ew+EfzVTGFmrpC1xeW4Jen+3zA9B19NhjpGVZLnaHJl
         zC3i3AjaZytY0/bmY/lrnwHuqnNc7cXr1499FfBr309LwMZbYp/z1pgRQLNUo/CjcQPQ
         DobzdlEiBNDUKHneaXmc+xsibcb48pS1M6puqYmPVNthttUcEiKfJaHrZM4sKid6xkgh
         MFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693451944; x=1694056744;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5697xlLAtX6twxyAu8LMNSIvSh/52eNe+lLpP2cgKg8=;
        b=U3j8YzcMgoppx5Ms1vauo/UV8JbosPpsUSH1RhTaS7S4zVb9LNM9ie2416MNy80VCg
         mW9Z2n0+Ste5pAKu40QjjD5jYkxspTopE7homo4AoD/thtuHusS1j6hJzT0qJrxbo6hA
         wNwKhYw+GMx0LP6FVK0VuD0thtFEgBLwTDBN4auRw8M6xYGAqq5petnDPcoRZ4u0mXRw
         13UUtF5ml+ijjx+omPqBh0SJiCPML3jjgse0TcYClmSmm5gTvwYzBnJNsoDOKvk2fhk9
         wemI5WNcfVN8JevFCkH8urNu/Hbxa0WpyGqjo5CDoWVXyQZYMu/qr31gMR3uM6oasm08
         MYhw==
X-Gm-Message-State: AOJu0YzfbSKPC2I2VD4bnBo5la7t0Z+H3tLp6LUfmZUdFTCR1jgRxUg4
	MQxopz+bzC8rPZH2N1cneR8BOQmwHRxQNpWsRvs=
X-Google-Smtp-Source: AGHT+IGYvwacjdvXvhRaRlvBGin1KP/LKx3R0/AdGWkJKqoy88pfu5QZE39s0uoR5CslXQ0hhnbjUCUrQf9AG2ILjxc=
X-Received: by 2002:a17:90a:d085:b0:268:b682:23da with SMTP id
 k5-20020a17090ad08500b00268b68223damr3773201pju.34.1693451944418; Wed, 30 Aug
 2023 20:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com> <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
 <92234e4c5aca657a966d7c4d9d5f219a@kernel.org> <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
 <ab8e506ea941749b07f0a93565e731c0@kernel.org> <CAAQoYRnJTXGEYbhS1HkBC2p5QtPPFZdACw4zdE5aYoBpeGwefg@mail.gmail.com>
In-Reply-To: <CAAQoYRnJTXGEYbhS1HkBC2p5QtPPFZdACw4zdE5aYoBpeGwefg@mail.gmail.com>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Thu, 31 Aug 2023 11:18:47 +0800
Message-ID: <CAAQoYRk5y_jJqKt-CBQ8vyOi7ppGbestzaCgFbw1fjetk07+ug@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_201908_215172_E6F4D144 
X-CRM114-Status: GOOD (  23.55  )
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

Hi Michael , Tudor


>
> Hi Michael
>
> >
> > Hi,
> >
> > >> >> This won't work beacuse the manufacturer id is not always
> > >> >> one byte long, think of continuation codes. In fact, as the
> > >> >> flash_info table is of now, we cannot even rely on the
> > >> >> continuation codes, but we have to always check for the
> > >> >> complete id_len, i.e. there is at least one hack where
> > >> >> the id is reversed and the manufacturer is the last byte,
> > >> >> iirc. some oddball cypress mram chip.
> > >> > According JEDEC standard, 1st byte is manufacture ID.
> > >> > I check id table, "cy15x104q" with multi manufacture ID in
> > >> > later bytes by RDID command(9F).
> > >>
> > >> Yes the currently supported cy15x104q is broken.. but nevertheless
> > >> it's there. Also some spansion flashes uses winbond manufacturer
> > >> ids.
> > > Ok, got it.
> > > I have a idea, create a member maybe name .check_vendor in
> > > spi_nor_manufacturer.
> > > A example, macronix_check_vendor function for checking this IC whether
> > > belong macronix or not.
> > > Each vendor could create their checking function for ID table didn't
> > > include that ID.
> > > Is it ok?
> >
> > Honestly, I'm against adding that vendor discovery stuff to the
> > generic nor driver. What's the use case of it? You can just
> > read the ID from userspace and a tool there can decide which
> > flash it is.
> Most of information could get by parsing SFDP.
> We hope that highest protocol(8D-8D-8D) could used without adding IDs.
> Because of octal_dtr function is still reply on mafacturer hook function.
> So that vendor discovery could make up deficiency.

For this part, have any ideas?
We hope that we could do something for reducing reliability of ID table.
It will be good if new flashes could get all features without comparing flash id
on ID tables.

>
> >
> > -michael
> Thanks
> Jaime

Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
