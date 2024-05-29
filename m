Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13D9C27C43
	for <linux-mtd@archiver.kernel.org>; Wed, 29 May 2024 12:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/PzvU5KcvL6NHDorpxM3xFeO7XcuZ/dXJmIu5rvhhk=; b=VtcMdFcEYgy4oT
	zx52Ie60oR65m63zy5C54uluzX5BwJQ1BQiQhCwYIodGZSi3hEB7Gd0lWjhG6x92G9gXjjOV+1uW4
	sR4uwAiqFIgf9P7Tm1Us+g/6425KOBqJ9YfOx5wrz5WegkBxjBmGVQb6sb97N/4cRWxrDEySeyh6B
	V+4qW+vJ+Sg+GXQopVFfFK4tOOHYopvT5GwSj8lvphF5CHbEJkXg0gjSf9wnmok5Qtg5HZcFqT1gG
	kHcdZH9YB40DdtwFrTkVUaCC4ugYsM7+x7dHTrzCxX0YDlnZ5VfnSjboJaTgrHfRe/1fqx3yB5CH2
	XFXm4x4RlqsF36WMcDbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIYO-000000048Bd-1xFi;
	Wed, 29 May 2024 12:37:16 +0000
Received: from wfhigh6-smtp.messagingengine.com ([64.147.123.157])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCIYL-000000048AU-0PMJ
	for linux-mtd@lists.infradead.org;
	Wed, 29 May 2024 12:37:14 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 3D7921800128;
	Wed, 29 May 2024 08:37:10 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 May 2024 08:37:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1716986229; x=1717072629; bh=olMpVwRAcy
	cNTnwZOlUv/a3tq9UZFjzc3lJy/rkEFNM=; b=ayX9n/3ubzMeXnq46yh8XGVksw
	sPMw41hfHrkbbn4xrSl/LoJfgU5Cd/AmJvF7tq+0sGVkir0t5aqcwRAd7sEzdvLr
	08WQy/fslLuMIK/WctgiI5dFuJ1XVloYXBIhTmh2nP2evm1WM0opXEB643m8PO0K
	EV/mTcTyiCw0nqaAafmvfoZmgdViFe5Iteo8el1kbbdmcssGfILeYACnuajEukO7
	R0EAprGE1CYmMF2ku7OmY05fB/xIj98u+gpyyIsnhnca0I3v4HUMA0nUYpUJ4je4
	mRJarSYQt3uCeShPXThkZb/dBIRR5F8Rb83D0LwSsQtHTeK3LevygWMySjjg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1716986229; x=1717072629; bh=olMpVwRAcycNTnwZOlUv/a3tq9UZ
	Fjzc3lJy/rkEFNM=; b=kFMiFhMND79jsStvXwmRXofFKdbfI9Lyl7HMYO53TlWq
	QoLe9Z5DVeyyWSasvshKsGpc0zZQpPMg9APu2boobiuk+b7e9Rib+ShH04q3D1KL
	QJHKaaPBl+PkZjzyyyRbyhPdUfgWCbXgdQqYigQ6gJXnHzPkVdEnJx3IM9Vdw0jn
	3919rmb0S5BGafYfoL5TkyZPnvuj/bL5vh+p4BJZYOX0DbX5v9xYtU0VE1p+VIqj
	CHlPf/ppnEiNiZQnhsYQDSGJiIBDxRF9/IpmLBE3v4cOfpLY1O5znro54NhJYYfZ
	jkGjgGc1I6QCKz+NKt/vbeLDWbH3nXkOMcLmWNKAvA==
X-ME-Sender: <xms:dSFXZgsPcq67EZq1snwZAmm1jG6DaeWDimFDCF-jMHUzJugskL9-_w>
    <xme:dSFXZtdlLnA8vREuisBdgDQGPDKko4fgLCVQ73P9q7BJJzMCWQLYfARbdJjBaJYgy
    ugbMqReAzBi1PgnQ6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekuddgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dSFXZrze1L7G-gWEdit6BY7oZHIiRPmOlYMujt-Nbr-coZMImyKoVw>
    <xmx:dSFXZjMq8yL3GKP-Tup0ssiJ_oBw99uH4TDF43lkgrZCYFuKmvendg>
    <xmx:dSFXZg-OurZhWXMM8HqmQ3_OWs--CZJ3povMN39eOuN2KcvlHah60A>
    <xmx:dSFXZrWSyuFXLC2KNUG-RhPidBly9DzIfecDDAuJ6SOWYCdD_ssc8g>
    <xmx:dSFXZkTuqMKxabg6wlIb-tNzWcsw_E42enT-gCnizjENuBgmxgbzsdMU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5736DB6008D; Wed, 29 May 2024 08:37:09 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-491-g033e30d24-fm-20240520.001-g033e30d2
MIME-Version: 1.0
Message-Id: <48738af1-545e-4261-a8b7-fe224071910f@app.fastmail.com>
In-Reply-To: <20240529141323.7015f3d9@xps-13>
References: <20240529095049.1915393-1-arnd@kernel.org>
 <20240529141323.7015f3d9@xps-13>
Date: Wed, 29 May 2024 14:36:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Arnd Bergmann" <arnd@kernel.org>
Cc: "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "David Woodhouse" <David.Woodhouse@intel.com>,
 "Akinobu Mita" <akinobu.mita@gmail.com>,
 "Artem Bityutskiy" <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: make mtd_test.c a separate module
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_053713_256850_4A324AA2 
X-CRM114-Status: GOOD (  16.86  )
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

On Wed, May 29, 2024, at 14:13, Miquel Raynal wrote:
> Hi Arnd,
>
> arnd@kernel.org wrote on Wed, 29 May 2024 11:50:39 +0200:
>
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> This file gets linked into nine different modules, which causes a warning:
>> 
>> scripts/Makefile.build:236: drivers/mtd/tests/Makefile: mtd_test.o is added to multiple modules: mtd_nandbiterrs mtd_oobtest mtd_pagetest mtd_readtest mtd_speedtest mtd_stresstest mtd_subpagetest mtd_torturetest
>
> I've never experienced this warning myself, how did you produce it?

This warning is currently enabled when building with 'make W=1',
but there are only a handful of drivers that run into it, so
I have sent patches for each one, with the plan to enable it
by default in the future.

>> Make it a separate module instead.
>
> I'm not a total fan of this just because it now requires an additional
> step to insert these test modules (they are likely used for
> debugging/development purposes, so not properly installed in the
> rootfs). Is there any chance we can find another way?

This should only be a problem when using plain 'insmod' instead
of 'modprobe' for loading the modules. Do you think this is
commonly used here?

Another option would be to turn all the helper functions into
static inline versions and just include the header, but
that does not avoid the duplication then.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
