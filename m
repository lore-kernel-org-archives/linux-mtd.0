Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7000C28D13
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Aug 2022 20:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lsjMHG9I9ijcpONpk3uSWTXEBz0/PHLRA5dSc3fll9s=; b=qC4wbuiTRiYZv4
	VCg2z6GmXxBMkQ+RIYb9GSdjKFnGnZ4luFdBM1d+yTFGmvKMt8vwh6+GmAaANI2PcGsJgY0/EWXfG
	QkDlKKWltSZ+Dd9vEIFF9Hum0pVAyHoBHEByYfGYS8C0bH+QSfybLeUYu4doESxTm69qNnnUqTQ8X
	E2yYTxrz8Gl3I4ZVg+0KTrKEpn36uAuPG6iBdnN5Uzwy0ZTDnHMyfiEYw8OMk8XpPo0iJjdVmMVRR
	CHSFOvKw8Pqkby3kEYF82nm5p1A1LPqQudZY3mgfzH5+3t3pgXmRf0WNAjIH6AEIWiDv1mL1ZI9/P
	ZoNzK968LICLpQKmG3qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQE1S-00EaI0-Jk; Mon, 22 Aug 2022 20:27:46 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQDeA-00ELjQ-KT
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2022 20:03:46 +0000
Received: by mail-pj1-x1034.google.com with SMTP id m10-20020a17090a730a00b001fa986fd8eeso15091929pjk.0
        for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2022 13:03:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=tgSw3wJhs3JlL6iZVDZiRmBXgKDn7wQxak83vuMJDvs=;
        b=Nd/YxqpiswK28/HE8BctQpJU/tjxDJbTe6RmWlbuOmAIYMTWGuChuyCpL53p95UKtu
         whriA1VM8bpR2IAviUsmmJkGmMfa2J8DgFEroIoF+LafosuVn/q4U6q8KQjZT98Xn7dp
         /LPIgMZRsclmjjl2dqpfEHVeMQ5D/Y0kuEsshBdtPBJmJtSh0MyTBMy718rLxrc2Be+k
         pYQXToeFpf5mOa4mH5El8xdkVdbCcSoGJAoziE1n9x/eGHZhFCW+XBjsIyxWhhEMCjXq
         HzYkhdT6TCAzmaidz5EFZqgiRmznTbu43KHJIvt5tVO/KMwKT2oeylrnxzqBBt5JBVup
         lXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=tgSw3wJhs3JlL6iZVDZiRmBXgKDn7wQxak83vuMJDvs=;
        b=aNmJkJzJgKcMuMMrglOGv+GOiQBujlJdp1wiZfIRDp78UgxDJ5bDO+qFK/bomvrsJv
         N9VAoJ/TbaOXw8tTBKsdsjJmlHCA7ilLStMuKT9Ji0dYDadgJzn8Wl77ddgyHynRl9EX
         OhNF7iVEwDYVCK5KdIOnazPbvFxGjXKJd9MRSg0FT0/IOO4CdJFeeT31NpWawccInAF+
         bvJsl5SRkfgCA7MsU8t1B4U3WeGCrcZFZAXp4aPGQBG2xc9WY7yFfm52ZycAhtJ2/LMV
         INaW8NP+oTGjwxbSvyTavftxBl37jHIcsHdmuwZTy1BUITmffCnkw/PG1GQEM8P8EvIP
         iyRg==
X-Gm-Message-State: ACgBeo15an7tDiB2ZMIrWgmGBLrv769Z+3NEUn/gnKUCYDda0J6dkzUZ
	+sjjqLEIzYeUiegCuhB8bxsdKuauFEEqD5MJJtk=
X-Google-Smtp-Source: AA6agR5QaJYpCmEYuWqVw/qkI3SKW44eotlmByoEutHHPkuyiWtOvYqSe6soJnopn3NelB/gsgVvJGyrHwUg5qtx/LI=
X-Received: by 2002:a17:90b:17ce:b0:1fb:3b43:f6f8 with SMTP id
 me14-20020a17090b17ce00b001fb3b43f6f8mr38819pjb.76.1661198619913; Mon, 22 Aug
 2022 13:03:39 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 22 Aug 2022 17:03:27 -0300
Message-ID: <CAOMZO5Audo1TRsmTG6WWMwRW2egq_VrZpeztHqLUHvG1DWyFgQ@mail.gmail.com>
Subject: gpmi-nand: Kernel hang on i.MX6SX
To: Han Xu <han.xu@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd <linux-mtd@lists.infradead.org>, 
	NXP Linux Team <linux-imx@nxp.com>, Abel Vesa <abelvesa@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220822_130342_719206_1FF2D3C8 
X-CRM114-Status: UNSURE (   5.96  )
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

I was working on a custom i.MX6SX-based board running mainline kernel,
and I faced a kernel hang while probing the GPMI NAND driver.

Applying your workaround from the NXP kernel avoids the hang:

https://source.codeaurora.org/external/imx/linux-imx/commit/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c?h=lf-5.15.y&id=d03eb99c393f8732f70a1d7d29a3b9c42cccbe48

What would be the correct fix for this that could be upstreamed?

Thanks,

Fabio Estevam

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
