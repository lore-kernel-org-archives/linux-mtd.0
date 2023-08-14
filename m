Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CA8C001DB
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Aug 2023 08:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n29i+KpTpgFJdUSTzXslYhMLFjGWMIKL4A4s2G5Dg4E=; b=SwGPOKCiVYrGRu
	UVmQfnC66FTAUWPgIlSubeP09X40fHt2zC/OmkByc2dvYVxOQKnJPhlF2nFlpiJIjHDZoh+SPP1f2
	rG1ZQfCGcYytEU/NYk9kY5OLsv7lSOADyvcEpaE+w03DlpNHhDN0oV96/bPnL7uuNrxpZm5bddzb5
	qotOdX5J+vG33S9I9eMBgHjB6bP7feH+WcEHeNiiPCWVzm2hGP/SgR4kV8N9F3cJWmcEzXGwLracw
	ccT3EvO1ekFrxDwa9PnVXv8fR/H29GGaVJ/D/E003jgZZ1JYZxO2TQ5pUvYU+PtWz5cggRThoi+lR
	fhTszlQL46Eqz2f/qz+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSsw-00GWNI-1S;
	Mon, 14 Aug 2023 08:25:10 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVSsu-00GWM3-00
	for linux-mtd@lists.infradead.org;
	Mon, 14 Aug 2023 08:25:09 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso3071770a12.3
        for <linux-mtd@lists.infradead.org>; Mon, 14 Aug 2023 01:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692001506; x=1692606306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VL6wheYWlDdK/hajOlaxjlN+U10dnc9wnojVex3bOEc=;
        b=om/A0VNaix8kG+Yg0rc8zjZ4rRbtpLsrlxKcJ+K2UIzUxF+vBVEXRhihJr38jGK5wG
         LSjwtsL8RWjte316YZ1BQ3sHBRWExv2vL4WYVrooNYsUuEW4jwvIw/p5F53ko99LvTS9
         85VmGsjLO9yDVCIM6PrWaygWWDZMAV4x0Caln4jqZ5v0sqq6LDhRHHts4icRY8a4lAqb
         IQ8M92i+UndmNiFvjcommAGveD62BqWKPBp/ZHH+M/MzrNoPt/H09w9NdJEPVYSkc0yF
         IaArmi8MwQfT1HJPzAn3ewEgxKiGfaKgb6SyCcixZC8l3ReacYOH1npjdl9hFcvrxsj8
         +8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692001506; x=1692606306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VL6wheYWlDdK/hajOlaxjlN+U10dnc9wnojVex3bOEc=;
        b=eJldNjrMRmpw635WF7GxXaNK1O3LbIfKKHEcEDJ4OA8nAjodzRNlrwW2h8xitaomQv
         NFh0ufdMHB6VlvHhiDFNYHZKvc+a7hzTRw96cYeeJPC75iUBpDw4DuU/Z7Nt5zFzbvUN
         leY3+ex1Xg8Qd3Uzb+PKteJItg3gi1cKx4t7qkbru8JB1negVjZqaP6yAp40i0ChMzAg
         LbGqp5RyCv/Ke4XSk6ktTwxuPrvHnMmKvtYoFbVkvD5g1KKz+QNknzfAraj9yvE1njV0
         rCNZIlBMloOpNsPZ/OndX+6MU6JuwGq5N5rh6kp1FOPvKYvWvBkNfu33QS/rdnmmIGVY
         guQw==
X-Gm-Message-State: AOJu0YyEqb8cGzHsvQ1w+v9ObXFWs69FqBO1pZYON5bqesqe5vaweVNm
	fTrUVxo6rQV89KMds5feP2oMigqZ4QPtKQAqNYw=
X-Google-Smtp-Source: AGHT+IGXpOJpw9oyqHoYt6izHEGpcG2FIejyntdSw2y2mb7JKcLdQ9WoNgpkR+7jxK7JD7vXoZG5Vg+NaiRkgBtrAGo=
X-Received: by 2002:a17:90a:a117:b0:267:8012:b393 with SMTP id
 s23-20020a17090aa11700b002678012b393mr8001732pjp.34.1692001506159; Mon, 14
 Aug 2023 01:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230804095409.278419-1-jaimeliao.tw@gmail.com>
 <20230804095409.278419-3-jaimeliao.tw@gmail.com> <70e42ee5e4c5aba05ac896cb94956f25@kernel.org>
 <CAAQoYR=JQVd3iqfCYKjvkbFSGVWJRX1xFni6CsNht9prhuQ1EA@mail.gmail.com>
 <92234e4c5aca657a966d7c4d9d5f219a@kernel.org> <CAAQoYRnpGmo4Li5fJoRWq6_C4cF+OdzbuvQKtiGDJL1HcChXvA@mail.gmail.com>
 <ab8e506ea941749b07f0a93565e731c0@kernel.org>
In-Reply-To: <ab8e506ea941749b07f0a93565e731c0@kernel.org>
From: liao jaime <jaimeliao.tw@gmail.com>
Date: Mon, 14 Aug 2023 16:24:54 +0800
Message-ID: <CAAQoYRnJTXGEYbhS1HkBC2p5QtPPFZdACw4zdE5aYoBpeGwefg@mail.gmail.com>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: core: Hook manufacture by checking
 first byte ID
To: Michael Walle <mwalle@kernel.org>
Cc: linux-mtd@lists.infradead.org, tudor.ambarus@linaro.org, 
	pratyush@kernel.org, miquel.raynal@bootlin.com, leoyu@mxic.com.tw, 
	JaimeLiao <jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230814_012508_039303_DF99378D 
X-CRM114-Status: GOOD (  19.21  )
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
> >> >> This won't work beacuse the manufacturer id is not always
> >> >> one byte long, think of continuation codes. In fact, as the
> >> >> flash_info table is of now, we cannot even rely on the
> >> >> continuation codes, but we have to always check for the
> >> >> complete id_len, i.e. there is at least one hack where
> >> >> the id is reversed and the manufacturer is the last byte,
> >> >> iirc. some oddball cypress mram chip.
> >> > According JEDEC standard, 1st byte is manufacture ID.
> >> > I check id table, "cy15x104q" with multi manufacture ID in
> >> > later bytes by RDID command(9F).
> >>
> >> Yes the currently supported cy15x104q is broken.. but nevertheless
> >> it's there. Also some spansion flashes uses winbond manufacturer
> >> ids.
> > Ok, got it.
> > I have a idea, create a member maybe name .check_vendor in
> > spi_nor_manufacturer.
> > A example, macronix_check_vendor function for checking this IC whether
> > belong macronix or not.
> > Each vendor could create their checking function for ID table didn't
> > include that ID.
> > Is it ok?
>
> Honestly, I'm against adding that vendor discovery stuff to the
> generic nor driver. What's the use case of it? You can just
> read the ID from userspace and a tool there can decide which
> flash it is.
Most of information could get by parsing SFDP.
We hope that highest protocol(8D-8D-8D) could used without adding IDs.
Because of octal_dtr function is still reply on mafacturer hook function.
So that vendor discovery could make up deficiency.

>
> -michael
Thanks
Jaime

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
