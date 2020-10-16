Return-Path: <SRS0=K4do=DX=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60B09C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:05:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CDDC21655
	for <linux-mtd@archiver.kernel.org>; Fri, 16 Oct 2020 21:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oM5QfFhu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gSNoR9QA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CDDC21655
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NUkVf6ODfucHlHitomVVTofRsCEXNah3biyS6CwUmes=; b=oM5QfFhuUmshL4VvG5RsUXOCf
	kolCGC6GYQNCXH5EgkR1HVH68tULu9gzGPOodops1E1+f6O1P8Is1xEslJOol+FKDsgXV/gLG1mQa
	7nSsHL1gF4rmmBKiVeOwHizkhTPdrc3lX7j8plibPOeIaT/0Vt9z3p5+KlDdlZBevKC3sNiRZ01p0
	MsIBwLWmHWW4nKEhrkZkmQeZ/KfRpTg32cGta0/pOTM5cVZwu96qzq5lcij+7kXoxp/1ZpXofAl5d
	UuBBVdXFOCHlUpI+AB/7UXU6QoF2wk6eRRTiwG51dlwDUjcoej+hs4izihRik+h0xvCwFCpQMD4UL
	aq4n7D7Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTWtb-0005Y4-4U; Fri, 16 Oct 2020 21:04:15 +0000
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTWtY-0005Xc-1c
 for linux-mtd@lists.infradead.org; Fri, 16 Oct 2020 21:04:12 +0000
Received: by mail-lj1-x243.google.com with SMTP id c21so4042360ljj.0
 for <linux-mtd@lists.infradead.org>; Fri, 16 Oct 2020 14:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dObFEQvsFDU+j3Zy521Dwg4onjspAlJxCROxSW2WlHs=;
 b=gSNoR9QAVXhebLC2S1nKeCeFVYh0TRir6tWZiyUGzndMfhNrI0+GB6vyxPzxBSrN3c
 lChTfaQ+icI0QfZZG0SQrZnhwVGwfHw/vb5YbBKXrVp3nH/zTOseYNGNn6R02E3Yrq1X
 nri/oTRS/350313f0fqi8H9qhRWd++ktWWdM+/SX9UtjrcWJ4MMAVu7VuwFXmrYNtBZU
 BV+63r0N2ouLaOOqfX2XoDlpKXuVz1CEyr9jVomW3OLdtKKsAn5MuvjTKE4Eu2MWPMpG
 J2O/lpbDu1CsMVXbvFJzmNYMOmWfjafZhrKg29F4a5253MbOKQZDmJnu/NMSnG7vovcH
 t0dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dObFEQvsFDU+j3Zy521Dwg4onjspAlJxCROxSW2WlHs=;
 b=tX+gcydxqqhtCqv9zYRhr6tRVwfqQ673ysF/X+HQJzEXZLcO5SMozvs/3CPo0vyPcV
 s11LpCBrs60a+gjsCK3yK05OyB6DSoXorlIgaSHJjCDtvETg3tpdYMsvf7oQzNBb4OHi
 jRg0q0HUGjebNmcKORUN9dkTOkqSq97DSDVlkuksva568Xy5VJVzxYzdLd2B9FtlCFD/
 ECcNuKVeO56lN4k4GZUm0NWcwB04uXXy8m2R8pRlZzK3hXOmxiTC6FOB3xKuxj4P55M8
 5e/R8WemHUP36vuNdGRxPWgImIZS82GOmcGEzxH75R62j2SdPCERvUKlY636MNB89Gsb
 grPg==
X-Gm-Message-State: AOAM533j/TQcU3fGJaGZZF1h8veZh5MDUUikFt1VvCSbtE8zjMOXvrLo
 8wuQ5e3HtQhrj8mZMCUSv6FWNZEEXJDLY4gO5Fw=
X-Google-Smtp-Source: ABdhPJx/SCBe1xcoRQ8AFwK+VFhpcHrrLRymjJ6TZIg+LYIXZrmriluI8Bp5YzvKVRin+DWEmOZoW5Tvfxx4+f2HoLk=
X-Received: by 2002:a2e:99ca:: with SMTP id l10mr2191071ljj.218.1602882250709; 
 Fri, 16 Oct 2020 14:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200827085208.16276-1-miquel.raynal@bootlin.com>
 <20200827085208.16276-10-miquel.raynal@bootlin.com>
 <CA+EcR21PQRrKMLiRYH+2mAkGhTPmxqKUO6hxwvAHQCZ4g3Jhvg@mail.gmail.com>
 <CAOMZO5AVU2RMPP55abXvueHMC=FE1rXjfPVn1+Xv4GqumD18vg@mail.gmail.com>
 <CA+EcR22BaKLMU7V9uDfgQctQm-ttfno9VKWqFpp4D-mPYR405g@mail.gmail.com>
 <20201015092502.2ea2a7fc@xps13>
 <CA+EcR23vtjOBzt+7v=s1i0YqCW-A1v_h2ZtHcToBzvSrPaZkpA@mail.gmail.com>
 <20201016191424.2a41b632@xps13>
 <CA+EcR20Lm2m-bkECKWC5RvB8wb1C_s7uH2PENzLK0iD14oAGUg@mail.gmail.com>
In-Reply-To: <CA+EcR20Lm2m-bkECKWC5RvB8wb1C_s7uH2PENzLK0iD14oAGUg@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 16 Oct 2020 18:03:59 -0300
Message-ID: <CAOMZO5DXJ=V0xvyEFWkwCEzwsiv6Gt4Gb+4BjmHfTTOBkDdvsA@mail.gmail.com>
Subject: Re: [PATCH v13 09/20] mtd: rawnand: Separate the ECC engine type and
 the ECC byte placement
To: Han Xu <xhnjupt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_170412_182353_3F3FD48F 
X-CRM114-Status: UNSURE (   9.47  )
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
Cc: Richard Weinberger <richard@nod.at>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi Han Xu,

On Fri, Oct 16, 2020 at 2:51 PM Han Xu <xhnjupt@gmail.com> wrote:

> If I am correct, the patch "mtd: rawnand: Fix wrongful fallthrough
> NAND_ECC_SOFT" is the fix. But I didn't see it in the next branch,
> only the other two patches in the patch set applied.

Could you please try the patch below against today's linux-next?
http://lists.infradead.org/pipermail/linux-mtd/2020-October/083123.html

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
