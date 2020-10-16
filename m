Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6798EC433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 11:46:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F4322084C
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 11:46:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TSR+nJ+v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V4BeP3Q6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F4322084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GMFr4dGCW+MhV1GanwBT1s5SCVmoPcUEtnunUikWWfQ=; b=TSR+nJ+vvtC6GaMMMisKBKfSq
	U283weCxPvixB6b1PBmT1PN8eXB45tRXRWAl3EF6uU0sDRHl/I8Ah8l5kcO/qf9qsfLhGc8IE+rxm
	JwEbhb34xFhCMvoie1i5jR5n3MDK4csNNYP/kk9IKFVCN11QrdT1tLZN5Tz06NeNRVo8LE3Q7Sfut
	Ozki8AtYECFnA0AlgAoFw5bFynT/zeHa9+pUMjTc83ZN4VrSdPZ9LeGSypsj0832kl7Rh2bxzXql7
	6c0wlNiIWB/8H10B0WhC2pfpsOJjzP3yHP+zQ2FfPXJdI6QyY4AO2Ywpbsrs2mNYFWcqyOVuGi4KZ
	oxFnpxblQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTOAl-0005zN-BA; Fri, 16 Oct 2020 11:45:23 +0000
Received: from mail-lj1-x242.google.com ([2a00:1450:4864:20::242])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTOAj-0005ym-0S
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 11:45:21 +0000
Received: by mail-lj1-x242.google.com with SMTP id i2so2072465ljg.4
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 04:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qkBzanNxNgh3/pfMnQRrxnqg94cqLsuUzmClIKNo1Ps=;
 b=V4BeP3Q63R8s+4a6FqR9s3uQAYZ4e5/ntFRXiCTcxvJC/jQHWE8NmNUiK1zc6L9AEo
 NI6zjum4lI248gZ5WCW2PNU0cOyPmUulF8wQzobKPMo15bHkWsQjbTqWDflxtLzoOOi0
 CZn3H4u4ZrW43b83Ouo1HpVXqhsDBIBqx7RiXtdL3+zxU7CEY2XXH/5jfo3C7bVDFFro
 E0mjj9A6RW8GMI5Z/Pf6bxgeWcY+O2IqKbaf8E+EHUUqG4CjGrBD5ntCTifYnKrugiVS
 uSFX+XQmzaUGvxWm69Ye0fx0OJ+NyTPkBk7fwz3xu6gfiJO5bAgkKjTzfqj+uRD4zXrr
 eZHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qkBzanNxNgh3/pfMnQRrxnqg94cqLsuUzmClIKNo1Ps=;
 b=gVzh7ZXHrBeOBgLlcn6m5xnMqst818FZnZ898V/gZIJveSpoWnEHvy2Rr5zFtFIn+z
 2XxVG3F6tcqqu3KDbHg0LfXadKyHvwUVSWVwZtqXDRY1PZX6JPLTTd80MCL4fNb3Wb9A
 FawU2h2V6LXd+ca5KXq3QLvBU6jkB38MEr0TV4gjkUWGOaXHlAiEs7N45VKCOdP4nPbN
 6/fD2+9n1EzoF++s4oCh9ncELmqitpStXN5fkkFYASAJUu7LFxwHoNqkxYOUuzDNclX8
 BxWMUszMacTH8+1TpjUK1tjeEcUD6fZPgGC2bDCvh/fdp43lrCH/9bp+gvBNX5o3y2w/
 hiew==
X-Gm-Message-State: AOAM532XykwtmRj/engk8Zi67QEuu2KeEdrEMVCDJNhfsLPYbq+ysIfH
 tDqIbbw5ev796rHyPqywlTqgO2AatEP1+uRJMJE=
X-Google-Smtp-Source: ABdhPJw6UdMEnD/l0aZ8Gim+OplT1PUxFs9xudD7ilklzS+lYZZMaGe5/TbMoPSrK068LbJhuTDxqNRuHyDrIm/dkB4=
X-Received: by 2002:a2e:b4f5:: with SMTP id s21mr1426451ljm.44.1602848719750; 
 Fri, 16 Oct 2020 04:45:19 -0700 (PDT)
MIME-Version: 1.0
References: <20201016074942.29650-1-miquel.raynal@bootlin.com>
 <CAOMZO5BoLnbY=Y54SFYF+J2kbGyioHTZg=h_kw_JNXr_28ZOuA@mail.gmail.com>
In-Reply-To: <CAOMZO5BoLnbY=Y54SFYF+J2kbGyioHTZg=h_kw_JNXr_28ZOuA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Oct 2020 08:45:08 -0300
Message-ID: <CAOMZO5DR6rgqJwTGU7-9gFMPXqmFgq4cfpNQhFi-EE1cBSad3A@mail.gmail.com>
Subject: Re: [PATCH] mtd: rawnand: mxc: Move the ECC engine initialization to
 the right place
To: Miquel Raynal <miquel.raynal@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_074521_077388_B6C985DC 
X-CRM114-Status: UNSURE (   8.49  )
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
Cc: Han Xu <xhnjupt@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Miquel and Han,

On Fri, Oct 16, 2020 at 8:32 AM Fabio Estevam <festevam@gmail.com> wrote:

> The LS1043A uses a different NAND controller and its driver is
> drivers/mtd/nand/raw/fsl_ifc_nand.c

Should we follow the same idea here and move the ECC initialization to
fsl_ifc_attach_chip()?

Does this patch help?
https://pastebin.com/raw/xwHKXFmu

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
