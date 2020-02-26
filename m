Return-Path: <SRS0=a+Ch=4O=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_RHS_DOB autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2FFDC4BA09
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 01:32:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BEE921744
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Feb 2020 01:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IiM6cDcr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nA2f+OLz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BEE921744
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6aFz8+zWI5etywgHd2lAzwLOpzXuop605ahy/RjSwCY=; b=IiM6cDcrfVWCti
	JuIwhd7EIZVyYgv88XrGU6d8E7Vp5519vgM3NYh87MKKjvn5dJ57i8bqkaJDfH2uNv10rirlGw94W
	h4roGgYVlUjTMMOD7T+qFQxfRUOcpzotPU3IMEv9BYH6jSDGhejDnXpVDXnsX9u7TdGmzqKOX1fDQ
	xZJFlSjwUGMe/j/XzxJM3VKffUq4EV8/hD+7vDM+Az5s8qrUUbkaJqpsK2cbou8C0H8CeKA7eJR2N
	/Nd4GFO5WtqiMN3oXxLUbQMOk1GxnV+7GGshpluY4A+KVCjgriKDRkHZTIRYaVTYvesqQYI/3s8oC
	Q4AuVXVPzt07QDP86JIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6lYF-0005n5-5E; Wed, 26 Feb 2020 01:31:51 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6lYB-0005lj-NZ; Wed, 26 Feb 2020 01:31:49 +0000
Received: by mail-ot1-x342.google.com with SMTP id w6so1493047otk.0;
 Tue, 25 Feb 2020 17:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=m69OUPpDCFCPc/oa2eyFJo4I++z0wlZi/kprUKpLj3Y=;
 b=nA2f+OLzY/0xumh5TuXz4ftOJdyLWFEddIBk66xJxkReDm94lliWkpwvPZ4a2z3aL+
 7F+sqVUc1AzH4De2HzKgueukRv45rp0BhL1+N00JyaUl0pf8w2HajjUgeCkoJF7IJOlA
 ggEwGRbikFgBXKyJuSgVOcXhbcpJCTQKeyo/nw/xbjt6rWvnKRe6cB5I1Zh31qnj988D
 ZkrhLAL1NuHixK58f6i/pdi/eHNF5m+KjXIhJbAzoqxI3ZfMK2b0tUyDtQ86XgSM/Yq1
 8gK34CHyXzjHzraPQJFoD50QgHtNUe9dEYNAgyQra9e7EQzFbKF/kURdvfMeW7/ka4B6
 +tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m69OUPpDCFCPc/oa2eyFJo4I++z0wlZi/kprUKpLj3Y=;
 b=Np2/0CSAjUn6qZ6aih/3NLkJo7yTXkpoz6qrUEQsSsiHX33QlzgHEOj2tvf8oPftAy
 6Kih9+n8Jr0JShrV4Gfu/+kutg3oRiPNiDVqo9e7CxSkSPA+pkK5gNAC2H75+vASndiB
 6WNKFrtoaRDR4hv3Kq0T8hGDD//UO6Vgf4+U6IkguZwGZ+PIMANxaWzuIXWWmMANmrlI
 jx+XFviKUV4pbz43LtAh9dQpTpMazSqLpjGBXAfkPT75I5sds3tPqlR8d6/dbLD1fCGm
 x9p89lEV2QQyWSPXlZiHO3U3fwqkFiHSvpa61KrWVJNEvTEMXeP5UR88gNsbkcvcJeME
 vTjQ==
X-Gm-Message-State: APjAAAVL/4PfjELXC6mCyro07Dtt6CWVOfM/WeQlkF8sdoyLp+MrUO6T
 G4F6zYyzpyRt3FRM5PBypEHQdmXsihcvfV3x5xI=
X-Google-Smtp-Source: APXvYqx4k8rPNcqHzRcAhaiCXWJ4jVniE5gHoAh/s13hkt4+EPZPVv3r7htQo04hdVYPzVU1U3PK6wlRKTZrD779bTc=
X-Received: by 2002:a9d:6a4f:: with SMTP id h15mr1129292otn.86.1582680704677; 
 Tue, 25 Feb 2020 17:31:44 -0800 (PST)
MIME-Version: 1.0
References: <20200215065826.739102-1-gch981213@gmail.com>
 <20200218125557.GD4232@sirena.org.uk>
 <CAJsYDVL03KJv7eewGekBPCfpbOuTX0tJ6qZaydvJnBDzZ5vEwg@mail.gmail.com>
 <20200225173137.GA31830@bogus>
In-Reply-To: <20200225173137.GA31830@bogus>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Wed, 26 Feb 2020 09:31:33 +0800
Message-ID: <CAJsYDVKqcd-ytLLf5zKqs8DfjPAa5ELCX53OiPDAi-tDnLd=Eg@mail.gmail.com>
Subject: Re: [PATCH 0/2] rewrite mtk-quadspi spi-nor driver with spi-mem
To: Rob Herring <robh@kernel.org>, Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_173147_793921_10BD9D1E 
X-CRM114-Status: GOOD (  13.70  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi!

On Wed, Feb 26, 2020 at 1:31 AM Rob Herring <robh@kernel.org> wrote:
>
> On Thu, Feb 20, 2020 at 07:58:06AM +0800, Chuanhong Guo wrote:
> > Hi!
> >
> > On Tue, Feb 18, 2020 at 8:55 PM Mark Brown <broonie@kernel.org> wrote:
> > > This is an ABI break so you shouldn't be doing this, if the existing
> > > binding works it should continue to work.
> >
> > The missing spi-max-frequency is the only part preventing old
> > device tree to work with this driver.
> > If the goal is to make existing dt binding work, I could patch dt using
> > of_add_property in v2. I saw similar device tree patching for legacy
> > bindings in pinctrl-single driver.

I just noticed that of_add_property isn't a exported symbol, which means that
device tree patching isn't possible unless driver is builtin.

>
> You should should really only need 'spi-max-frequency' if the max freq
> is less than the minimum of the host and device max freq.

But current spi framework forces that a "spi-max-frequency" property
is present. [0]
Should we patch spi framework then?

[0] https://elixir.bootlin.com/linux/latest/source/drivers/spi/spi.c#L1951
-- 
Regards,
Chuanhong Guo

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
