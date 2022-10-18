Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD70C433FE
	for <linux-mtd@archiver.kernel.org>; Tue, 18 Oct 2022 09:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31kebphvJ0rvf7IY5mOBETx9LuQIkJ/lcSiWMFyOM14=; b=LSL5GVVFoHmmd2
	yZ6o2wdtglmNRtBAesAEtbZ96uwXzFKOydS2YoMnMjIVir8VDxRHYFnOLMiaTVl5g5+nge5mUGVAW
	Fcbq8xWezNZ/6Eu/ZDhRxg4UxvBnh1Yja9CI7rXsNFv+MCJXUGmY40iBTmC7QHmpAAzAPHjcMDXkM
	icDoPmJiCvc+zGcKC4fqWXVf3VqSmotOvk8GhV78/+tMSySq1oDYZxRkwpNEnFNgIfRDEKfl9bkWy
	2/h82PRxUAW8w66wQ3jnJLZpuHLVTGCDGU06lWEfCU6ZRLX/gkmnnj+wfF6RHFO1erfSVE0GhzoFK
	clyBs75b/lkmZJwI6WFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okiot-004vxl-ER; Tue, 18 Oct 2022 09:23:31 +0000
Received: from wout4-smtp.messagingengine.com ([64.147.123.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okioq-004vsA-3k
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2022 09:23:29 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id AFA673200952;
	Tue, 18 Oct 2022 05:23:26 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 18 Oct 2022 05:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1666085006; x=1666171406; bh=SHnE5jT6e9
	4A1sDRVJs2zPstbZIrsLgpF3qXOg4T2dA=; b=iBZGTnKGSqiewhGDFQdKdCPdX2
	NTAK17aa8Bf+vmECK3M2ZS5Cpu5eIg0ICfpRddL5jldu1FsA8r4oVBfGTTAvJOun
	HMGpZsOK/SnxYcDB8x7pqdGXap4y5vL10/UACYLPDH0wWdMvRUS2dFx5gM+htrYH
	3AneN3Ny7Mz39b8oISSnTtD4umKDzUPEv0301W5f4Ie3wFuDUijgVxVRVZc8oPBK
	KwZ1J/LRDMWrmviyZGLRjgH9hPwdh5DvT7Ar7dEgsBBG0SuehqXIBC8BlGXW0x0j
	JAo0jAk9+/VM2r5SUOyCAXTyVz+1S31gzLxXRSF7BurzOm1BIwrsmPOu+psQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666085006; x=1666171406; bh=SHnE5jT6e94A1sDRVJs2zPstbZIr
	sLgpF3qXOg4T2dA=; b=N9FPQrpYdmIbWh4am0bn7X98GAbvxROdxZZ39nWCyuFm
	REnv39ITQRHvlZ/rG1MdibHcdg26EB7+Hy82WUnOVhe3brwKWok2nwA6vV/VnWGG
	dTgZy0krCFSyf2VJQI22W3bwbrl/h1VnhBIbdTvkaQUnR/kkSAnFVetxnVEkGZmr
	66w8U+kFAu3sWBRrX/W3sRAWRWgukesNeu+52EsQdjwX37SVzZPrK2vZsgGUBYbu
	2SuhPSPyC0ROz7FW9KTYYCzUukyyrXKx3xFXR5RXDrswh9UBxexV+XQudCnkREnC
	efuT94OWQfdr6tcILKSCZPcTC0k/mHV561X+Uha5NA==
X-ME-Sender: <xms:jXBOY5BWJ5Xg7-WfLEIMVtV8mZu91tDMMOHvefDOTPC6b-RuUpMD5Q>
    <xme:jXBOY3hXO865ErDHA7kgpxYq6VJGSH09WRz3jLuMZtS0D7xFvOsFNq8XDf4XKI56t
    t4yj9i_4D5cZjB2IrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeluddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhephffhgfetiedvhefffeekhfefteelkedvkeefvddtveeihfegueehgfejhedv
    geelnecuffhomhgrihhnpedtuddrohhrghdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggs
    rdguvg
X-ME-Proxy: <xmx:jXBOY0lm2snP2VmJcqGdDKrqVwlocQO3gLf5eBXdjKusZGoHm4GEAA>
    <xmx:jXBOYzyPEgiG2mH30LCpD8hsP1EbWT9JHOFQ4tL_Ype6TdVZuk3ySQ>
    <xmx:jXBOY-SoKmyuCuAqWsdeffRm1CHfvOnRjvq8qNp8scq7jkdJ_j55LQ>
    <xmx:jnBOYxLGXaSsTdRH-spZ52UA1V65wVupOrvTS5NszaRLCA3hJByyeA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9C03BB60089; Tue, 18 Oct 2022 05:23:25 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1047-g9e4af4ada4-fm-20221005.001-g9e4af4ad
Mime-Version: 1.0
Message-Id: <b222053a-9c76-4fdd-9c68-0b04eeb7168a@app.fastmail.com>
In-Reply-To: <e7a29d7c-dac5-8203-bd2d-9ab6d34c4500@sequans.com>
References: <20221018091631.11264-1-vkorenblit@sequans.com>
 <20221018111747.071aca83@xps-13>
 <e7a29d7c-dac5-8203-bd2d-9ab6d34c4500@sequans.com>
Date: Tue, 18 Oct 2022 11:23:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Valentin Korenblit" <vkorenblit@sequans.com>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, ye.xingchen@zte.com.cn
Subject: Re: [PATCH v4] mtd: rawnand: cadence: support 64-bit slave dma interface
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221018_022328_202436_B13F4031 
X-CRM114-Status: UNSURE (   9.40  )
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

On Tue, Oct 18, 2022, at 11:20 AM, Valentin Korenblit wrote:
>
> I copy/pasted the link that I received in Arnd's email.
>
> Maybe this is better:
>
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org/thread/3NMACGIM5NDUBPXRT5RTBZON6LQE5A3B/

To clarify: my point was about using the official 'Link:' tag
in the changelog text rather than having a free-form link.

When linking to a mailing list post, the best option
is usually one from lore.kernel.org. the lists.01.org
link is probably fine if the thread is not archived on lore.

     Arnd

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
