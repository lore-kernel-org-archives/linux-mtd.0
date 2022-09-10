Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA5DBECAAD3
	for <linux-mtd@archiver.kernel.org>; Sat, 10 Sep 2022 23:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9lVW5NaRXvixTwijhG+TVVJjuD2a+1edYD7x7IWt2k=; b=G5fst9l5yzEgjN
	9ExUf/T6yCOKe+B3AzBjq/+LuwvnPacH/GY+nhmAEGwpEjDamn8+miDCgmkAMgDGgBkDifSfCVCFZ
	R3Y5BXlEID5kkuLMRlpMuWT8c6n/15LAdi5cyAVlgh0rewowqmkmz1rk8c95yMt6H4U5R+X3gGJcT
	lXjByybFs+Cr2wM7+Am23DRByYDo+e+o2mTMxziuc8JR3cAkP5XsCWasYNc2jBfWgWlp5LUNFnqk1
	ENA4AVe9jgrDJ0hWrWs7Atv+4Ec+tfN95ypUvtLqDs17ygT+hmIIQ4l//UGiwcXvUyaxvJdAuiDCu
	9/KfEi9NMsXaFn8kq1nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX9hf-00EHD0-Ay; Sat, 10 Sep 2022 23:15:59 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oX9hd-00EHAN-0i
	for linux-mtd@lists.infradead.org; Sat, 10 Sep 2022 23:15:58 +0000
Received: by mail-pj1-x102f.google.com with SMTP id fv3so4744733pjb.0
        for <linux-mtd@lists.infradead.org>; Sat, 10 Sep 2022 16:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=6QSUFHe/C+KBsozQr76ZZNs09yjlDPc8CjUFLh4l3jI=;
        b=lNJ7HcR8E0vpysaxw+U3XwWp5MGHBey58W0lFp8iZ50A8+Z0SaTpt24E1NVnXMziw7
         /5BNh7GUJ8qaREbl7pAykymUGafEQ8XdajM/SE2rCbX8DvFntmvcksaxzZ1byP8UA3nm
         4mEB3AbVJZ0DyW9joc3nU/0FhWKom5uY0dpjF9V7BXd61zi4tccMp1zskGFSwMdf7UeG
         VwWbvhWJ88vh32LKgvkoeg/8QvbbEFYvmNmcIjteNvqlXO2JTFAJNrbnjMqxt4JiCNXc
         vPo9LzNq8BNilbZmxh+1mEP/Cxrhcxi0JYhOkzbqvH7RsRVBGHgQp0ODZxD41v19z/9c
         5h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=6QSUFHe/C+KBsozQr76ZZNs09yjlDPc8CjUFLh4l3jI=;
        b=izT6orqgFmMIeL8vzEj3aFjh+Rwdck0GtuiLkZEtkZZA55lEBmjlflAoM9bjCsss1M
         3pktKjFgzq0/hmC+8PHhk57SxYjSkLzswvpYfWnuPfVnc8wbvnNnTeRVU2c405lYLWJx
         JJaTe1YE6m0pFLBVdUgp/YN0Xg71x9CWclpMiJtZSm8cCnz+8G2ezZDPHIGNhCvHcWY9
         ewLh+4jWsZBrZnFhgL68n/CiYndhodFN09yxT0kPMGTBK5OmKkWMHKjBPV1LGaa91hru
         YxN3SUv/FPc7LkRla/JhgpE0J3+/zXx99bONndnm1b9GiLa3i4xC08XyvI9B5NAHrcQ6
         kUoQ==
X-Gm-Message-State: ACgBeo2cpCNcaotaFkSWdlv/1ZghthOe+a7KfJKXmTQdQ6mtthoogFDl
	J8lJ4t+fCxE7yqkMT/Y7oU//HQkXnzUis6Am/bo=
X-Google-Smtp-Source: AA6agR4oOUdSnxSpDRsFECqGvCV5coQKcPtiZh+lkwHGeM452GRLmwnDP+3HEcYKfrRcGh01QjUIsCOEkq04r/1rIKk=
X-Received: by 2002:a17:90a:318a:b0:1fa:c68c:aa03 with SMTP id
 j10-20020a17090a318a00b001fac68caa03mr16237632pjb.172.1662851755225; Sat, 10
 Sep 2022 16:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5Audo1TRsmTG6WWMwRW2egq_VrZpeztHqLUHvG1DWyFgQ@mail.gmail.com>
 <DU2PR04MB8774944F96947DDB1F62224E97719@DU2PR04MB8774.eurprd04.prod.outlook.com>
In-Reply-To: <DU2PR04MB8774944F96947DDB1F62224E97719@DU2PR04MB8774.eurprd04.prod.outlook.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 10 Sep 2022 20:15:42 -0300
Message-ID: <CAOMZO5DKgrKBicsDScVEOgkWaWp80ntV_Y_+pcpC+FzuGTauFw@mail.gmail.com>
Subject: Re: gpmi-nand: Kernel hang on i.MX6SX
To: Han Xu <han.xu@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	dl-linux-imx <linux-imx@nxp.com>, Abel Vesa <abelvesa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220910_161557_080530_FCFFBE46 
X-CRM114-Status: UNSURE (   6.56  )
X-CRM114-Notice: Please train this message.
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

Hi Han Xu,

On Mon, Aug 22, 2022 at 5:12 PM Han Xu <han.xu@nxp.com> wrote:
>
> HI Fabio,
>
> Yes, I will upstream this patch for i.MX6SX.

Would you have any update on this?

Thanks

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
