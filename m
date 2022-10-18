Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB04BC433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jESTHwgR7otku1xgPdFPSBdYT0hd49ldS1Rp7jal4Eg=; b=jMNu5O1mbRNbw+
	FPGZncS78h2gmBRt3EvXAC+yIq01Y+tn2VQ5lZgQfXK0l3KjJqvJk/57ADOPMHjeOwoG/EY9VxYNl
	pXuEKJaLwQIrRFhbBKl9kn851G9jNrZS5ZeRRFGetAye+5yM8UqzD5s4ZelAO57GD+bgFWkKFNQOW
	k8+3L9Kn9buNyHw9ua6bwGUSHuM9HTCW5ZAH5j3Y+DCjVOl1FgForz5a0FNmbax4WNH5x98Id97KM
	zgfI2mk8l74iE1P2h/4r1j02HpmIH40/HRO5KJojM4XJgX2+w9x/URq3CymwanZvmrnSukoAlkoTs
	FP134NWQF8s/MbhpOK3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okicz-004lKd-Vq; Tue, 18 Oct 2022 09:11:14 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okicw-004lIU-Rk
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:11:12 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id F32743200684;
	Tue, 18 Oct 2022 05:11:05 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 18 Oct 2022 05:11:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666084265; x=1666170665; bh=zEHChB0LmL
	MBPn9S9m0u8nEOfYBoIQc5093f5offAtU=; b=LxshcGnGzz8JMETOIsDyMJHJyy
	k0uAz4qi+TZNo1ZnCl4EvTN5M38Cj+uQYD2sjcQ1OFxE6hiAQw7zNAxL1UXQxH9R
	Uj4nfMV+RYs6ktbugsHd77DMwLAH1BG7G6Wt34FZ3tHWvg5aZYPtIZWxJRM+lUwR
	dt+Rm3v6NJU/dgqorSVhH92Wl9z+3zYWZFZOtp9vRQ1ZM+uBIvAx0Xf/39tH0cCM
	vNxpjLG97U7y7euhIQS9+RjeVUPSt/74/fch6q3tMQnpwMahsE2935fBIV5AliYd
	bBFYcCujwBwVQVOI77SN5nLpAfEFKlUe/abDZl7zaQpXL6qCyJMNVLzjPUpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666084265; x=1666170665; bh=zEHChB0LmLMBPn9S9m0u8nEOfYBo
	IQc5093f5offAtU=; b=TWXjbifFcKUpRIUcgUekeVUWtAY1W8Jrxu9LrEKv5JCr
	H9yIILLVIesSj2u/vrN79F61aS6pRfQuuF+H+0CO35EMFNw1rUWEtGTZae8J3y+M
	bXXEUjt2BP6vKuXtTXd+oxF2DOWSKrm/ZXuERVVOmbOPbbdo3BN/VGlS82VFp3ir
	jh7F7+wJqt3p6J92Ma1BwpgFkKpQMCaneCxr0zOmNcGKEaE4Wy8FoZ3sqtUXouq9
	nu9WruBr07Bszw4J0jWhwSWerlBmM1qG2EerzMWmI/9N/tawUeTW70+dHG6bmhP1
	1SfwQL7ToPBS33kZS6mm2+u8jhlayuvOmXp/Yd07GA==
X-ME-Sender: <xms:qW1OYxq_R03eesfng05qOfUMfHEoqM_UmpIvcb7ClJp_5lr8Ly6HRQ>
    <xme:qW1OYzrWK1252kkEl5Bp3lGZCdqzAOEhi3z8g84-_isdrt8iZXhaKrfJeOU68ay4U
    TAht9gL7W6riaLfJyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeluddgudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepfefhtdegvdfhudetgedvkefgfeeftedvgfelgfeugeeluddvheeiveeiieeh
    udejnecuffhomhgrihhnpedtuddrohhrghenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:qW1OY-Oq-s6-WGoYFE2X1704Mr-AHIxrM3FKAIRsnHgiSXIETlPIzQ>
    <xmx:qW1OY84gav5new15YKUf1h2pCv4KEPWltYJlugJLRXcJdFm_IfIvPg>
    <xmx:qW1OYw7Q1Mo4QjWYQ2AFpjqfxN1j2szcEh6zCu1bUohw8FucsrrZaQ>
    <xmx:qW1OY-Q3K4GkmliNo7I3khyynRXEA7x9KPaSFBGYiT5iM9hvhJIctA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5358FB60086; Tue, 18 Oct 2022 05:11:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <8e87cd6d-fc3c-4edf-ae6e-3edc50dbd6cb@app.fastmail.com>
In-Reply-To: <20221018090045.10268-1-vkorenblit@sequans.com>
References: <20221018090045.10268-1-vkorenblit@sequans.com>
Date: Tue, 18 Oct 2022 11:10:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Valentin Korenblit" <vkorenblit@sequans.com>,
 linux-mtd@lists.infradead.org
Cc: "Miquel Raynal" <miquel.raynal@bootlin.com>, ye.xingchen@zte.com.cn
Subject: Re: [PATCH v3] mtd: rawnand: cadence: support 64-bit slave dma interface
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_021111_408993_B52E70C2 
X-CRM114-Status: UNSURE (   6.77  )
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

On Tue, Oct 18, 2022, at 11:00 AM, Valentin Korenblit wrote:
> 32-bit accesses on 64-bit sdma trigger sdma_err in intr_status register.
>
> Check dma capabilities before reading/writing from/to sdma interface.
>
> Link to discussion:
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/3NMACGIM5NDUBPXRT5RTBZON6LQE5A3B/

Maybe make this

Link: https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/3NMACGIM5NDUBPXRT5RTBZON6LQE5A3B/

> Signed-off-by: Valentin Korenblit <vkorenblit@sequans.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
