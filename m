Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788F4FF60CE
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Mar 2026 06:24:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eWpRPxo3drjA4q3o92v79UPvloxmCr2ZBQNbH7NSn74=; b=l8Q++MQSvZcUvm
	/sxV8iJP3sQuiY6Gkd801Eibe8vyTBkeJRqdi6WmSa/WozJotFfAzCziQqDVHj9cbK0M4TeCQDcvq
	tJGmITb/GqvNNDEHZn2vkUC/YNhFm/YzvpY6rhIyXs7HNGHCgcLp47JNIHK9Hga2Fap7Lu4RwEG7d
	yMnY5gyFpXM0OEqK7/aBvOMrHF+eiqN0P/Pc8zmxR05NJFBXXO1Q/cZAHqxiaayAOhcR1V/j/12KF
	AViACNSNII9h7+w9zk1ocDaH18uZ9xh4ZfHUlUoFgjQeoNjg2SSufsqQ26Hin1t6wa4mzRd30W+Su
	v+GY6eYfUpOf8Fc5DSug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SWm-0000000CM7l-0rys;
	Tue, 31 Mar 2026 06:24:40 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7SWj-0000000CM7P-3xOh
	for linux-mtd@lists.infradead.org;
	Tue, 31 Mar 2026 06:24:39 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-354bc7c2c46so3124740a91.0
        for <linux-mtd@lists.infradead.org>; Mon, 30 Mar 2026 23:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774938277; x=1775543077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vWlAHWkTCyA7++NZ0O2EqtDYUYeKrn9fUAwZU7E8i7s=;
        b=h2rybFYVVeut4Tw4sofj2lPpjn3IFClaJHne06wCNFZcY7BlbQzgaNPxhGRe+00/b3
         1UhjG8CfiYwHV/27MnRsfU21yH483fi5dNwSoVqZ4skGKJ6cvgAWWJhrGlnRnlOCmzwQ
         afm3IgSB1+7L39/582MakhqLT+vIBGh9kLRCAFPq8nWmbhKHmD8WK/YEzDoS8l8e1rT2
         14DgJNcHFV33s5WYqO8MCyQyQyzKKXDgI0u/9a3QaBCL74oFpO7NFSOg3jyNdJmm3bDf
         z3QM1SXJDcWzQ3OrIuYX6a7VpNqRRtcxJIjlqVtW7CHyZUmECgA0ICYb3MjJlf9Y45pA
         aonw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774938277; x=1775543077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vWlAHWkTCyA7++NZ0O2EqtDYUYeKrn9fUAwZU7E8i7s=;
        b=fto2gV5Kqx3CFBwswho1N/hr+O6NZNYLlxaQxGm8Xxru5wov9/fOni5esDwiToucXl
         QJPBjCHwIkqt8qmsOUPjPDbvclQs0yUSBMLQygPfYO4zNNUO1MNCijLf3jFlTgCMdsfy
         cbUl4qPz0iEGyBg2cGatC0La5OysDSNFhH4WAhMpti3BSTQpGwuCPdSABWJgqRigu2Th
         rlodsidv4j8sqoBgjgnAGgfAeLgSx6dEkaUmd+PHWlv0ZHE9eI8iSCKFDWM+TKCjxsGO
         D4XPDzvOjb7VmEZqp08O+i+l7NEdcWkpNt9kVZxF49YgkUygMUCzpc0WRp9xwo+EfW8F
         3Z7A==
X-Forwarded-Encrypted: i=1; AJvYcCWUlTeGgCXBzWXjNKeKskSCNhDbJY4uH2fjdLwmDvx1puCMeeZPmpNWlLHdiqXAN9pMxmRPQYUHz6g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCv9gM5BccGPutkVgY8ctM7+V76dZpWcDWIBZdi9HF5eAPaKf+
	UrsTQWbI/ui6oxeGeAPiCqBrT/GOS0xXTdgSeafO82khjCqTVSbgujJL
X-Gm-Gg: ATEYQzwYQJD6cd6w8TGgjr8icBrfxPM6R5RH9OB9qUwQZM5R+nULsdVkZqqWz/kNV1J
	CPlcLOAjJnqaGmrjBTC31AvA2Ri9NbJ4RA1DsvLuYg0sYupWHJpzduYwLnC2Zz4kcn3MLhLSeFw
	b7vCeBQae7AV1fuW/ZqTB1XwIevccoR7FY3HR/IfeTd2U3VXW7eT3zH19zIQlIiFpIkRdOtyanL
	y6Tkj35QBu7+yianU4AIZucD3PZqbMC+0Ozov+z2Vh9Hj6VoZKmyYiOaibPCR4kF+9LPUzSo9eU
	sJlnCKKgtVrCk60sHyujeT6lNSOCdlSQUF0oV/f+mPt9e4S/axXaQougHIP40UF0nptul6a9cke
	m4Q4tBocApnXfqdFuNijScB4kZkqL8IZUsmh28XdfPDNpWBcTa38qGBrnD4JGivdOZgjRheXXdR
	09YHz73YFIw8mQ5bX6WrOPtqXEiJgoppg=
X-Received: by 2002:a17:902:e889:b0:2ae:d09c:5241 with SMTP id d9443c01a7336-2b0cdc0332dmr160886305ad.2.1774938276711;
        Mon, 30 Mar 2026 23:24:36 -0700 (PDT)
Received: from f7eceb44c2db ([115.245.213.202])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242676e13sm103873625ad.28.2026.03.30.23.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 23:24:36 -0700 (PDT)
From: Sanjaikumar V S <sanjaikumarvs@gmail.com>
To: mwalle@kernel.org,
	pratyush@kernel.org
Cc: hd@os-cillation.de,
	linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	sanjaikumar.vs@dicortech.com,
	sanjaikumarvs@gmail.com,
	stable@vger.kernel.org,
	tudor.ambarus@linaro.org,
	vigneshr@ti.com
Subject: Re: [PATCH v4 2/2] mtd: spi-nor: core: Fix AAI mode when dirmap is not available
Date: Tue, 31 Mar 2026 06:24:17 +0000
Message-ID: <20260331062417.26-1-sanjaikumarvs@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <2vxz1ph11jmq.fsf@kernel.org>
References: <2vxz1ph11jmq.fsf@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_232438_003848_1D5A4AD9 
X-CRM114-Status: GOOD (  10.71  )
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

Hi,

> But if the controller does support direct mapping, won't it end up
> using the wrong opcode? Would it be a better idea to update the
> dirmap_info with the right opcodes?

You're right. If the controller supports direct mapping, it would still
use the wrong opcode from the template created at probe time.

Updating dirmap_info at runtime is problematic because SST AAI mode
requires dynamic changes per write:
- cmd.opcode: SPINOR_OP_BP (single byte) vs SPINOR_OP_AAI_WP (word)
- addr.nbytes: must be 0 for subsequent AAI writes

Controllers may also cache the template at dirmap_create time, so
modifying it at runtime could cause issues.

A cleaner approach is to disable dirmap for SST AAI devices by setting
nodirmap=1 in sst_nor_late_init(). This ensures all writes go through
spi_nor_spimem_exec_op() which uses the runtime opcode.

This only affects devices with SST_WRITE flag (sst25wf*, sst25vf016b,
sst25vf032b, sst25vf040b, sst25vf080b). Other SST devices that use
standard page program can still benefit from dirmap.

I'll send a v5 with this change.

Thanks,
Sanjaikumar

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
