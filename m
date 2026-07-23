Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F4BC4453E
	for <linux-mtd@archiver.kernel.org>; Thu, 23 Jul 2026 06:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:MIME-Version:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3WUX9Pt2nOq+A/hXzJPyiZurS8tNyK2QwBiYxltazZE=; b=loTzhny9YKgBYImY9ZysvLtl5o
	jRz0pd1903OJ2VyEeR7m/oEmbFl78KIjI3Tuu+VQ2E9PdzjYWnQheBiCGhH7iV4Xp84W2hp4zzk7L
	iDb397Apm3XrJtcp2Hzr1Yo6M+THLpwuYBAn1emlNlhZZ4CcBLvWDS8HxS6chKU0IO8/nzdahH6w0
	Pz6Sqc+f6XvBMYfjuyiepdoch2xdXHAews3ZRfhq5gS9Ru2UNCZVc5B+DOq/Sw3UxHiV2vDkAlwkz
	Ad14/no5/tPnjb9mgtS1ip96vgjch0sTfvc+bK13oocb/pBnfcNNs6hiLDlqFbaFc29uMHTnMtj11
	GopXg22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmxt-0000000DY1H-3dH7;
	Thu, 23 Jul 2026 06:31:29 +0000
Received: from fhigh-a7-smtp.messagingengine.com ([103.168.172.158])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmmxq-0000000DY0p-29hX
	for linux-mtd@lists.infradead.org;
	Thu, 23 Jul 2026 06:31:28 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 0A661140005A;
	Thu, 23 Jul 2026 02:31:25 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 23 Jul 2026 02:31:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784788285;
	 x=1784874685; bh=+Tyyk6wZkkn5XeAQSb15AWSXSrRXsXr4FgJ3e9kkydM=; b=
	qDcHXomoW6GxXwPCwSaZ7mslvrnPi+d9Vnt1oXpJZPuNO1Zgpi2cr3zTcp3Aw7My
	yz6j/uisfBuqby7Te3rJyRkHyJQj7/PF4C/4plXi0tYzbztfYK/JJdBraxQwSCeA
	ENTB3ut6JBce680V2RJhfjZmzbtpWB6yw7dS8dlwoCjnh7RKOHAalbJHXJDcHvol
	L9N3RGdI7T+OiiJCwcFbkKul0QzyIigwdM/pd2OvWF3R9RijLRFZYJXHCw/99xcG
	kb7hOlPNV3H9+5XFEg1kDa8/LUX1FYLsOH2nRU19SkHbB7V2pIFpRK6yKMO+rAzj
	G96IMyQD5fdYuvtpxNGPaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784788285; x=
	1784874685; bh=+Tyyk6wZkkn5XeAQSb15AWSXSrRXsXr4FgJ3e9kkydM=; b=R
	dWCX38394DE6ny7V//05q1OR2sDOj/ZgRjW72rg07wSTiu4bC90tknkx7Nn4HL/R
	Xx0+nzJHxDYjAI46Pcoe5CrKUSMPHDZQRDTYaoUbQqzWRP52pZuHgqoNubrJw6mb
	u4hDs8ZulcqfcaRM26zsvQZYSqDS7OMyLT0jFl2Jr7fBL7/B06PZr1FuyWIctlge
	EafIOAj6adarprBHz+OsIVNAzTl5T0beI/B+w5AgJldHnls6OOnmE6J1sN1b1AK/
	YZuOvFgeULacqQYsomMpUxNhTzGUfk5iX5kYyiEErNsQgKPbFfKjGdvU+qbi3k09
	STfnga5Xs9uNqu69ZJX0A==
X-ME-Sender: <xms:PLVhatnOehgH41mYJlH8dqcEvM3tZkFjj9x33WwNIFSFl08LFzJLlA>
    <xme:PLVhajrcu3s4BxiKFMdlnN83NvXYIScGFt4xUcNSY4RpBAV3ac0KQ-wVbV6BQNIvP
    47wAITB7lxfRWbBkDR9rEutn-gsoq2obsvhZB5axgqp-ZoF-1K4lV4>
X-ME-Proxy-Cause: dmFkZTGTxVBehZ+5Ixq/zxpufnulYumW8nhs1iqx7HrBkvvHTjjTGCnqbS0ggF+hvKzzZX
    rTblhUfdUJ3DBLyS9LCfDzvj/OEe5IiudoTlQehP/SeePu89Mzfka3blCmWu2FQSSkXeSC
    MGcVs8rbg540NAjZFM+twqem7RZA8dMoWtjzkHjhb6XhA1EmdeISOUo/eUEXuR1olaaTp2
    ARHsZHO9rzF9daSvl4KrUH+pRrnl0MQRcyeuz+2UchsBuvysFNSt+HcUbxXt9yzm9fD/xH
    jWArH1vL3EWyp4Av4mTFGF0VsaDS0U1eeevxor32EgJik+rInyJ3bOEHlC0X/0oF5NLGkR
    Hn5s2u6PTPwR6Ar0TE9AknBNUxl/dyHeaVjuUG8XnGxNaHHnA0JQjjayVq1ypGzBNmqqCJ
    8Vj7mg4g5WLaOpXnZieeLWD3SferAfwsbjGtxYENpHJak3Bp8p0lEsfzokw6sDMXVmFaG0
    i981Iv8nYTR92rVmtBt6GNf+krxygWc0ITy2ZdlnTv2cT89qw5q7DzQ6ycMvfpDbM25skK
    5eijTJaBdHj24JlgGaAmvyx0FVnaMVzcco57LQaztsA8CA8AiEnD3ZbAai3Roe/X6Wyc9t
    lOrvVXK/5VRYnAkV1xT+VlicFvUwiQTfnlnW2Pj6U1Mk8ZZgfEVeUkOuxB+g
X-ME-Proxy: <xmx:PLVhamljw6eq7EWVz_HQh54_ab1InYbX-6ErOUq-okphJR478D-gnw>
    <xmx:PLVhaqaQGSQrr3JOGiewepvzEnRcjtAzVaN38Uy7_SzSa5qF3WQ7DA>
    <xmx:PLVhapHzhRdLw6GJUexWN83GHwnJnC2zocvj8oAj_yn7V13SNAkJ3Q>
    <xmx:PLVhahb8_dR_H6RMuD_ifZAvhN_YiVcr-dzBflZ0OVPMFLsT724tqw>
    <xmx:PbVharp6QjVFwONkPNKA3AuvIiB1e6KMIp5tc-yDezKy5Uv5cmqMMeGi>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 089DA182007E; Thu, 23 Jul 2026 02:31:23 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A7pgEavHG_z3
Date: Thu, 23 Jul 2026 08:31:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Braha" <julianbraha@gmail.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Sean Young" <sean@mess.org>,
 "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>,
 "Randy Dunlap" <rdunlap@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Message-Id: <93d93d97-f1ed-4b85-8360-ee4f4a656ee7@app.fastmail.com>
In-Reply-To: <20260722220618.198164-1-julianbraha@gmail.com>
References: <20260722220618.198164-1-julianbraha@gmail.com>
Subject: Re: [PATCH v2] mtd: maps: remove dead select of MTD_CFI_BE_BYTE_SWAP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_233127_111386_F94EF234 
X-CRM114-Status: UNSURE (   9.05  )
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

On Thu, Jul 23, 2026, at 00:06, Julian Braha wrote:
> 'select' does not work on config options in a 'choice', so currently it is
> possible to enable MTD_PHYSMAP_IXP4XX without MTD_CFI_BE_BYTE_SWAP.
>
> From a previous conversation, it was decided to remove the select 
> entirely:
> https://lore.kernel.org/all/c6268184-4904-49d9-b14f-0e11dce8bdad@app.fastmail.com/
>
> This dead select was found by kconfirm, a static analysis tool for Kconfig.
>
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---

Acked-by: Arnd Bergmann <arnd@arndb.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
