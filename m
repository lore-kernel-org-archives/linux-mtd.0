Return-Path: <SRS0=RLHh=GQ=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51517C433DB
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 02:08:25 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3B6322DD3
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Jan 2021 02:08:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3B6322DD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0HrSnkU1A5f9pmkn4k4kNEE1H0meNvD/6Tcj67DhzD8=; b=tdvp6cULLQxUOQQeMS21w3Dani
	0Iw8hauESbNwIarKllxwZO+GgIG7YPiy0c1Ae4mKJsgpY7FsJyCgOKzUJTwyNwhtVZScHmVQcEPlm
	OrQ5XD9d0xQuQxVZri6Q+p6/cRPBG7IdoKandU8Fwh0R1A8x3jqA9bNs0WcGcLlMmFInF3qGJuHO9
	OuMGRbsin2RSyTBpn+DoTuYnzJ/HbgZurhFs0/co8pQIb5s51AxfX5iWpCjiIaEJm9MntOJKORdJC
	74W+or49UawytdPTGFJZsEOFyMdYnrEmXcGVCkPgoMuci8I25EJdSF/KrLJNL1kE0MQQAcvgKCROZ
	CRgLEDUw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzVYs-00043r-Ud; Wed, 13 Jan 2021 02:07:03 +0000
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzVYq-00041v-6R
 for linux-mtd@lists.infradead.org; Wed, 13 Jan 2021 02:07:00 +0000
Received: by mail-yb1-xb2b.google.com with SMTP id j17so686573ybt.9
 for <linux-mtd@lists.infradead.org>; Tue, 12 Jan 2021 18:06:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=TBQYuZI8DaOvoeP0alssuCEc4Y+YpVcfXzf9vkaSEfo=;
 b=E55ck9L/jwuQ/uBJSVVzSp5pxNe2i0BfniXZhoLt93Ki7Yn8WR6g5L32fwq+IVf77O
 u9aLWAQZeMWIWooc/QOEgCQWQjKGV8RV9ZQ9MyOOwjnk+Cqiw6m+Zv4JRXsOLqm747vV
 qGS39VkKE0bS+2Q5HmCgU6FlOmQmun7GQGXNSz1U64sgwetE2Me6R+II733GF40YK7NC
 ys/FLeOZsX+myTa8esKjb5aPD9TLPhT0i/Y+ENZ06jWH4ARFeJ850lyoJPVdgcN2FE4b
 2dq1mmpEZCIPvbUhxwxOLDvwQWJNPp00Uc0bxGvZGcGonLuQIXFPeG9TlQFQfMvDeRrl
 ingQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=TBQYuZI8DaOvoeP0alssuCEc4Y+YpVcfXzf9vkaSEfo=;
 b=E60CM/NtfoasPk70qBF6dQ0k0Q6MSm9brfnw2/O0qhTVwTEN1lUfXeik/qpd5WKrUD
 Usb7aTfOge9dSteDOTCRkG4QLWE3kZndFb/w7e+wByt3jdMVIZjbhLZBa6gQDYiwZe/N
 0giGxiEtDuK7BlY4ZpXPAZQCTG3+S6M0SjLfgKAuIQ72gBpyaiajckcRh3xQiTatAb8F
 hnGGc9s+QoJDxX69EmyaJ1Vo2nxpVZD/GlhNEalVGNP8oZZJAfd3CCV7DMoKg3Mo1tkP
 WG+5gbYPllG8wp/GnGIxONoFPtXS5M1FmlP0KSB/ybei1COPZQ/RPLKC6sZC9imBiB17
 EC0g==
X-Gm-Message-State: AOAM532OjNL08521DOKbEKRdJqJclP9MlJwdBBP3F/pHUL/ilsDOPh9h
 y0Fu+WQ4voJn+itL/fFFf1dRTVR5+2hUpyp+3Io=
X-Google-Smtp-Source: ABdhPJyDw7lUWAQN48YcOF+O9shsFDOmODVVY4jJzSkXS472v3TLBw4mWP1FNuGyipr9bNKvE/OAA3Fynsu0MZKwtTs=
X-Received: by 2002:a25:5a43:: with SMTP id o64mr77284ybb.387.1610503615740;
 Tue, 12 Jan 2021 18:06:55 -0800 (PST)
MIME-Version: 1.0
From: Bin Meng <bmeng.cn@gmail.com>
Date: Wed, 13 Jan 2021 10:06:45 +0800
Message-ID: <CAEUhbmUXiwiuPXHkAcfFQeNkp9xZk3gfCi+oVKSr2MF+5C44Zg@mail.gmail.com>
Subject: spi-nor dummy bytes for fast read command
To: Jagan Teki <jagan@amarulasolutions.com>, Vignesh R <vigneshr@ti.com>, 
 Tudor Ambarus <tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_210700_278101_EE7EAC27 
X-CRM114-Status: UNSURE (   7.14  )
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
Cc: U-Boot Mailing List <u-boot@lists.denx.de>,
 linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

It seems both U-Boot and Linux kernel spi-nor drivers have the same
assumption on dummy cycles required in a fast read command.

In U-Boot spi_nor_read_data(), there is a logic to calculate the dummy
bytes needed for fast read command:

    /* convert the dummy cycles to the number of bytes */
    op.dummy.nbytes = (nor->read_dummy * op.dummy.buswidth) / 8;

This logic assumes the (nor->read_dummy * op.dummy.buswidth) is a
multiple of 8, otherwise this won't work.

In Linux, the same logic exists in spi_nor_spimem_read_data().

Note on most flashes this is not a problem, however on some flashes
the dummy cycles for the fast read command is configurable. If the
dummy cycle is configured to some odd value which makes this
assumption false, then we get a non-working driver.

Regards,
Bin

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
