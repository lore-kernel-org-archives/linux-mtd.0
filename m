Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF66C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 15:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+B6ECKNJHMy1tMjFVjw4MGhGDUcKl0Xi92tNeqXrfY=; b=1Xm7WDHMU8rLcO
	7TOAVIMlw+YrEuWSdScj94XwAo0UkM/eMotUzkZEo1s7Q7Qf4/4KnKiLdPRmoPz8gDgO1eidw8cFp
	qSnPXZ3hg0xu8QV4GccbKgM2k9vhvLKo6TEz+2/Z3Fdq0D4rlWQQfLabqO0cDIoppeEUCg/fzR3m0
	+qlaXZ56bmyqw524ySRUzkYLyxLOm2HPBFjXrpq7PosJij+aF6+odFOH2FrqGCKnpCX7VWPk2AUm2
	1VwKY3wVujMVVGoSjEozNQpjwQSR1XfCeea+oi4yF44uhclIQRzfQlbzi9h47IKzJdHenLWMAwqtg
	vbBLZZbxNYFxBw8Chpng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3fJt-008zqN-PM; Fri, 09 Dec 2022 15:29:50 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3fG4-008yFN-MY; Fri, 09 Dec 2022 15:25:54 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 0748932005CA;
	Fri,  9 Dec 2022 10:25:50 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 09 Dec 2022 10:25:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1670599550; x=1670685950; bh=QcJkwn62sj
	SUOtcXIxjSe2Ij1zsJVgf9eHa19mY4Xuw=; b=ZB0g3ByITNvp2JclQkUUMmnurx
	Hw2WKBVfiaeUCZ0qkCu9CRcQgNAwifkRRYdK7ZU8BL1HNSEZql+6qI+ejbR/wtd4
	UBNYooBMpsy3RNzOL1i6l3/TbJzC9LcQyXQur9VKfLIJ7g75jFon3BvKxiPSbhs6
	upsDTYn3ACM3rzRkTofG4GygGDeolY0ZU7T5X5UoGGimvp8QdKSSIiKHysaxudPZ
	Udv1FFwXV5FHRi8JBeuMIkYMSDjh7P7gBF+zkcxtpi83RoQKrXSP9vDyzLgR0HFi
	ZF7vn8yx7AmqdiopZMryYsbbcvPSY2OTOeLLQ12h60moZ9ZBC8HE6/8F0qFw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1670599550; x=1670685950; bh=QcJkwn62sjSUOtcXIxjSe2Ij1zsJ
	Vgf9eHa19mY4Xuw=; b=i7ItSB9QnsGmP0r+/l9chqlgI1OKe+6eE94cI8W6tBST
	wseD/DOIwI/Dtku3VN0v9G8eW4AyMB/lNSoA4bQrzrr7SVM5LCj4ngB209QNH6Aa
	KfD/ng6CJYxSQuUmF2uxO++u91vDF2DJW8fUaXPEqojMdM3WbhoLKTdT5v7635/j
	hb22dGebTe4uqIRZulWLTov7xQBztX0KYc0WqzYRS/T97uePJo3a+b9UspTVviZj
	RoM8j8mWKJmwG0MFQ0Xt/091QcHk35mfITgvzM6pJyAEPwRm9eVtCuSUcY7TYU2S
	XlZLKPs7OdqanPE8g3/7t3+r13LrZZoHl08CrTlHbQ==
X-ME-Sender: <xms:flOTY9DYlF9uHVO2E_p0tTIH8xukhAMSrSGtR5rOSR5sQ4LC6IPutQ>
    <xme:flOTY7hM4fQNhf59GrRArIKcU6ljgLqjEswtVAMmoas8qxsRNCIviBOWsFRkDXQb-
    RIVMyplMOkDJlp36vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddvgdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:flOTY4lS2-8bcwz2yQ0AM3mN5WRChiyoqOiuCVkiYATp1cRQ_SYh3w>
    <xmx:flOTY3ymuFViJsl0X-CpNhDE_pCNwlBzFGhRJ9xkkbMmjQKWrICTOA>
    <xmx:flOTYyQPxqPc3FX8fGIZbXFi9IvbrC6vkSMTSeld3_0chzIVqTX9iA>
    <xmx:flOTY8BYXfPjSXzLHDTx5_aPnNHRuMmtpp2aiHwYWLgD98nPRDhICQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 21CA5B60086; Fri,  9 Dec 2022 10:25:50 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <dbdb4417-a1cf-4613-8f7a-98b524bfdedc@app.fastmail.com>
In-Reply-To: <bb4e185a-c4db-428b-a1ee-ee1ba767fffb@leemhuis.info>
References: <20221205152327.26881-1-francesco@dolcini.it>
 <0aa2d48b-35a0-1781-f265-0387d213bdd6@denx.de>
 <20221208115124.6cc7a8bf@xps-13>
 <Y5ITkZtKWHzWaLS4@francesco-nb.int.toradex.com>
 <bb4e185a-c4db-428b-a1ee-ee1ba767fffb@leemhuis.info>
Date: Fri, 09 Dec 2022 16:25:28 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thorsten Leemhuis" <regressions@leemhuis.info>
Cc: "Marek Vasut" <marex@denx.de>, "Shawn Guo" <shawnguo@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "Francesco Dolcini" <francesco.dolcini@toradex.com>,
 "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
 "Sascha Hauer" <s.hauer@pengutronix.de>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>,
 "Fabio Estevam" <festevam@gmail.com>, "NXP Linux Team" <linux-imx@nxp.com>,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org,
 stable@vger.kernel.org, "Francesco Dolcini" <francesco@dolcini.it>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Subject: Re: [PATCH v1] Revert "ARM: dts: imx7: Fix NAND controller size-cells"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_072552_897793_3F2275DF 
X-CRM114-Status: GOOD (  10.38  )
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

On Fri, Dec 9, 2022, at 14:30, Thorsten Leemhuis wrote:
> On 08.12.22 17:40, Francesco Dolcini wrote:
>> + Arnd
>
> Arnd, have you seen this? We haven't heard anything from Shawn afaics,
> who normally would take care of a patch like this. Hence could you
> consider picking up the patch at the start of this thread (e.g.
> https://lore.kernel.org/all/20221205152327.26881-1-francesco@dolcini.it/
> ) and send it to Linus in the next 48 hours? It seems low-risk and fixes
> a regression introduced this cycle various people care about. That's why
> I'll likely ask Linus to consider picking this up directly before
> releasing 6.1, if I don't hear anything from you soon. But I'd prefer if
> the patch would go through at least somewhat the proper channels;
> alternatively a ACK from you to signal Linus "yeah, pick this up" would
> help as well.

Done now.

   Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
