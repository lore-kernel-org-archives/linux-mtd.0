Return-Path: <SRS0=L51Y=CT=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B96C07548
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 10:16:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1A2F52078E
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Sep 2020 10:16:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GbgwazyD";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="bOXL4Pce"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1A2F52078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ieee.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZY8YVUVTaGEfa9n05kgrMHUNYRLwxemXGHWMcwJbK5E=; b=GbgwazyDnOAjHL0wVMri+kKyMl
	DtYdOFKrXOYGOyNYffNtG/2kjTwWOvGG77bCC4S2iaP5qbrv4CYloqqCi3Qx1juJoUO1IZ3BWtKNP
	cwV4a+KpfIuepxis9ba22QneItBMZW8poqqQhDM/rV7VvfD9SXp9rx4pWWoiThwx9NSgInRXuSEPX
	43NsO2+yU4gn7+isjuWKDmSjKZHgMPpIIe71z9Ympp2HOi5L6zHghMvB3b/HhgiPJ15cXWWU7wVuM
	DAucrI2iSBO4NYm/5F4yLwbjgETeejvUyTAibV7w3eCoAyfFJEDY3r9WagXTsVJwZsZjaLQ98UZpy
	a7J158bQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGJc1-0000UY-3W; Thu, 10 Sep 2020 10:15:29 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGJbz-0000U1-8j
 for linux-mtd@lists.infradead.org; Thu, 10 Sep 2020 10:15:28 +0000
Received: by mail-ed1-x529.google.com with SMTP id ay8so5706350edb.8
 for <linux-mtd@lists.infradead.org>; Thu, 10 Sep 2020 03:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ieee.org; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=IkO00cXlno6ML26ALPUqqWWgcbqKhnTBTDUipAGH060=;
 b=bOXL4PceroD+eN3swyKjZj44cxdvHJ0z44TWqhLh5oFrF0+LVq59KU6Q/d9m9GeB0x
 YqZ4r5d+tGoFVhJl95TYBH+ZtuJ0CUaoMxqdMw1DXkyINZjD7aU8VQ5ARK803VQH8v0I
 58mUfCoOn6k5cUbWT7unZ+Ht5HY1f53TXkACA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=IkO00cXlno6ML26ALPUqqWWgcbqKhnTBTDUipAGH060=;
 b=ALdOpqkS2LpLjPWxfaYYgsc6UDBtpbrag9/h8XUXFvBH7NYmcqOS1RppZaeg00NOjX
 +ULblkU5HGe4ZSXR3AQoeK3KmoziuRHMJprSWTmjy+kV6DyvqdujiRTFAkjlSKcPohiL
 qN+LxlA1nTaPC3YkLtmODRUnYUEDQHyeibS2kb7jYt1GvqbUpTaFq2jehV86KvL+zFGo
 LvH4oQYqvt3LLWZmCwsn2xVfMi8CDalrPcgxyjQXLq/uTPdjNuEbkp5PrV9Bkb2lXBxz
 tIej9sMhyXwN+VwJIswcuUvw1IzvaBACR6JCAjp4xz1QfuLP10TmE4zPX4OQz3WguM0c
 XETA==
X-Gm-Message-State: AOAM532zs48Ot34g+PyHG0/vgEx1mQoZ71bsqvih1Ea4OhXOpV5Vh9r/
 VULePNMBlZkLN63O3SwzVsPJRfd3JNxtfGbo4q+Aq4/x5d/4Rg==
X-Google-Smtp-Source: ABdhPJzTjIQ4SmzqdztN+tBzP27pKneUnOlzgwdrmdsl8WaU1nw6VzLdcMkCotB9UnaruwJciEvuX3oZhjoHC0NFcck=
X-Received: by 2002:a50:c019:: with SMTP id r25mr8747699edb.285.1599732925488; 
 Thu, 10 Sep 2020 03:15:25 -0700 (PDT)
MIME-Version: 1.0
From: Randy Yates <yates@ieee.org>
Date: Thu, 10 Sep 2020 06:15:14 -0400
Message-ID: <CALJBDKhs0WWcO21rUmY5Q_DOBoDdt2Qehnrh+ZaW2NkfjvAMYg@mail.gmail.com>
Subject: Identifying a UBI Image and locating the volume table
To: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_061527_329379_D078A247 
X-CRM114-Status: UNSURE (   7.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

I have a 256MB NAND flash with 2048-byte blocks and 64-byte ECC areas.
I am trying to determine where the UBI image lies within this flash.
there are large portions of the flash which do not have an ec header
mapped, so i am trying to determine how many UBI images and their
location in the flash. how to do?

I am also not finding where the volume table is supposed to be located
in a UBI image. I see it defined in ubi-media.h, but i cannot find
anything specific in the documentation (e.g. Memory Technology Device
(MTD) Subsystem for Linux.) that says where it is supposed to be
located.

Any pointers would be appreciated.

--Randy

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
