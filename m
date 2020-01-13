Return-Path: <SRS0=hwCG=3C=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 069D6C33CAB
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 07:47:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD1252073D
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Jan 2020 07:47:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZS5IOblc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD1252073D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Anl5zxZ0/BC7k7wo8gb1nig/L4LpsKWAI/sz61zytbU=; b=ZS5IOblchgM0wp
	oRRo3Ygm4nthup56hWl2duySmoRYDwZkEynAhgfSw5sVYCjGhiG8Afa3a4jwvxUmL1EBPhwZxjyd8
	V7HW5MO63o9WY5ZBW3U3pRSt2R5uYN/L/SX+0jvcUB8MnLlkFmPespa8oloVOvRJ97RuOsmbtMVTQ
	y/ZJ4bDH/dxOKhqdXIbKcM69IfDPOw/6K52adoIRk45pvhcoM7x5GsudZs49fJVe9aS0MPxApSOKR
	FujdlFZ80jBUKT7DxMaUppfzHMYltzfuH1OoYGfjSxb/euWRhwfwo0lUGJQEnnluT5G3kTI4c2Deq
	6oDLbPseNOfur+StEfTg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iquQp-0004oc-Pi; Mon, 13 Jan 2020 07:46:39 +0000
Received: from mail-ed1-f68.google.com ([209.85.208.68])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iquQn-0004o5-Ab; Mon, 13 Jan 2020 07:46:38 +0000
Received: by mail-ed1-f68.google.com with SMTP id m8so7574253edi.13;
 Sun, 12 Jan 2020 23:46:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9+NYHUXqWb5LThglCHJH2RV2/Z3BgkHI4Ngou8ygTeM=;
 b=B/nlr/OIlpwTd9td418golQHSuT1IDDoftuvid4SEK3OmyavaxJjeRQYbjDczyLj7l
 8nlU1BmStmJmdwkNsQq7oLTG86voAz9Tur9AAPrOKYshw2FtDifjz7jGiVMmAeAXC/K9
 ekuyXvQGifBMjy1CqTkrHqfyq734SR6E5kQlSaRg0O0Je764J6/bxSyNh9Ffhb5RXATA
 IgCvwo00x1yew8ObNUoqkDjS1nWG2A9gYqEIbIxhm0nItVJcJy1USuVBWCCFifCTqS29
 /J/TgaACg0Lx/TkkUg4pxuKNAwSTQ/6G5C9RCBSlr8ZqG4PMIItwR1s5yW+DU0F8+1W+
 Is1Q==
X-Gm-Message-State: APjAAAUPpqCEx7hgaRl7c2yjam5Cj6xLlnvfqUkXb+bU2PTLNVDon2E+
 kmKkAfR4t563o+ATPUFQ2i4=
X-Google-Smtp-Source: APXvYqzi2butQD8WUbdthxqJ+MEw6KBLKjtLWPlvu/eksm5HSQg2bqJpNmL4e5nbvOjMdE7ge3nd1Q==
X-Received: by 2002:a17:906:948e:: with SMTP id
 t14mr15643734ejx.123.1578901595055; 
 Sun, 12 Jan 2020 23:46:35 -0800 (PST)
Received: from pi3 ([194.230.155.229])
 by smtp.googlemail.com with ESMTPSA id n14sm400975ejs.40.2020.01.12.23.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jan 2020 23:46:34 -0800 (PST)
Date: Mon, 13 Jan 2020 08:46:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/3] mtd: onenand: Enable compile testing of OMAP and
 Samsung drivers
Message-ID: <20200113074632.GA1187@pi3>
References: <20191229183612.22133-3-krzk@kernel.org>
 <201912310904.9iM6MaFr%lkp@intel.com> <20191231073339.GA6747@pi3>
 <20200109161826.7fda02a4@xps13>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200109161826.7fda02a4@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200112_234637_365050_9CB41EB5 
X-CRM114-Status: GOOD (  16.98  )
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
Cc: linux-samsung-soc@vger.kernel.org, kbuild-all@lists.01.org,
 kbuild test robot <lkp@intel.com>, Richard Weinberger <richard@nod.at>,
 linux-kernel@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2020 at 04:18:26PM +0100, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> Krzysztof Kozlowski <krzk@kernel.org> wrote on Tue, 31 Dec 2019
> 08:33:39 +0100:
> 
> > On Tue, Dec 31, 2019 at 10:00:48AM +0800, kbuild test robot wrote:
> > > Hi Krzysztof,
> > > 
> > > I love your patch! Perhaps something to improve:
> > > 
> > > [auto build test WARNING on linus/master]
> > > [also build test WARNING on v5.5-rc4 next-20191220]
> > > [if your patch is applied to the wrong git tree, please drop us a note to help
> > > improve the system. BTW, we also suggest to use '--base' option to specify the
> > > base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
> > > 
> > > url:    https://github.com/0day-ci/linux/commits/Krzysztof-Kozlowski/mtd-onenand-samsung-Fix-pointer-cast-Wpointer-to-int-cast-warnings-on-64-bit/20191230-030838
> > > base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git bf8d1cd4386535004c4afe7f03d37f9864c9940e
> > > reproduce:
> > >         # apt-get install sparse
> > >         # sparse version: v0.6.1-129-g341daf20-dirty
> > >         make ARCH=x86_64 allmodconfig
> > >         make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
> > > 
> > > If you fix the issue, kindly add following tag
> > > Reported-by: kbuild test robot <lkp@intel.com>
> > >   
> > 
> > It is not related to my patch. I'll fix it up soon.
> 
> I would like this to be fixed before enabling compile testing, is your
> fix read?

Yes, you picked up the fix here:
https://lore.kernel.org/lkml/20200103164158.4265-1-krzk@kernel.org/

Best regards,
Krzysztof


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
