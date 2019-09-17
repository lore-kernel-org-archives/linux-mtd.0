Return-Path: <SRS0=V/n1=XM=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D565FC4CEC9
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 18:11:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B250F2171F
	for <linux-mtd@archiver.kernel.org>; Tue, 17 Sep 2019 18:11:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="I8EV63rO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="UiFscZeM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iJHOTWYK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B250F2171F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kroah.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSpqYKbSFsbNRO5vc57DaWFwIiVrR33/bKV1nyFV1JA=; b=I8EV63rOcAGWuX
	ZJyZM/f4jBH6T3GE4yx3nZ7bebs6NMSj7K+cFuc+pCZ4Hs4vujCf5Q55l7NgnjLR+AOv7AfBmu1WL
	g+ACcqUymAL7CyPvbmOspQdT30DS6Ixazr4KKdydsV6juTy5CIkRmzp1xK3t252IA4OSvulGgdDrQ
	J61xD8qfysZZNPRNY5dfarEYu92bYbsPTuYbwbxVcwMd77WG2dhujoyaWZozPtNC3JpaxG9tTUsld
	wsX9/HiBxIaO+cS4820Muu/L+1t/bV1AvCBfOHnM5AQMHqNVkjxJ9I1TcglSvknNAOUb/quD3/xs7
	R8tbUe2ynsIOqli6tO5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1iAHx2-0006nH-Ul; Tue, 17 Sep 2019 18:11:44 +0000
Received: from out4-smtp.messagingengine.com ([66.111.4.28])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAHwz-0006mv-Rg
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2019 18:11:43 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B895A22006;
 Tue, 17 Sep 2019 14:11:30 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Tue, 17 Sep 2019 14:11:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=I/TlEC3jhYvjL1y1geR9IG8Zay1
 GtX68aiiSzlszgro=; b=UiFscZeM8/99BjdUTr4h6bowIAM1Tf4ujZ3TFXW/q0/
 MU0qZvemcI+QcjhXwH5xcGvxxa8CLGvy+lJAk644wXg6ID2wbiVq8XQX/gh7G4Bs
 gI37BPXROpTYEpD2wVu1K0QJOqY6h5rRmE/wBEAUT65jnWgdb4Ow8lMGih5pJcDn
 cFXiiQrT9hAy3xxZb5RduEkoB3fpauJscNzAROE21LzgXGo1jPbmBiqyxo3x0mde
 rKM5WDWwH7TQoGeewtXa49qHTYC/GvIL6/SraIrrI59GLAIzApWJ248Ofjydqgn8
 wXlz2g4ZDMSRoj7119/CchSf7irPyXweFqzZ9WGAJTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=I/TlEC
 3jhYvjL1y1geR9IG8Zay1GtX68aiiSzlszgro=; b=iJHOTWYKD0F9nqPa8x6JcU
 LRou34THpNBhbI8IaMsb/MIM+b9Ddzn3LR79f3zzX6VnOdy++tScNprG4Skqx+w4
 rN6nrYY/kBTlruZn0sCxsdf81cFCQ4VerYmUfyxYKWKMtQOgw1uc/C3RLwRMD6td
 ZckI4+T+uApvivQJT0pVN+YlxmtACnjA4NpmF5cKhlQidNiEMmHNaz9Q8t2m2YwH
 x5pWoXBdVV/87weip6a0CSxj7QEGjcXgdlCC58RwnVIlHcV9ciE4SspvX7cucib1
 V7ONOwpWrLCUSTICyPcxUP3zwokhTSfwNCXU6cwGdZYy9J/aq7pRMRJtQS0Gr6cQ
 ==
X-ME-Sender: <xms:0SGBXTzi09IARfuOigWruwLC3mPXL9PNpKuEbkxwISxap-2K12IO6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeigdelgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehttdertddtredvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucfkphepkeefrdekiedrkeelrddutd
 ejnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:0SGBXQqZ21Ovb2fmcQiFENv6AvFBxh2Q6tcLjGyHUtfLCkM6MMw5aw>
 <xmx:0SGBXZwnW5ShFNKyEvoF2rZMyOnWjITiQc1nrkQZwHHLKLgus7Ys5g>
 <xmx:0SGBXSqXdgD7w77EnwunUTVXukQOacOZa368FMm49xX7fWjGVX-sQg>
 <xmx:0iGBXcMgTU1WaJIMCw5SSiVWdlTEzlfm8SYvMVUQ3hTXwEef7y-x9A>
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 by mail.messagingengine.com (Postfix) with ESMTPA id B524F80064;
 Tue, 17 Sep 2019 14:11:28 -0400 (EDT)
Date: Tue, 17 Sep 2019 20:11:27 +0200
From: Greg KH <greg@kroah.com>
To: Tokunori Ikegami <ikegami.t@gmail.com>
Subject: Re: [PATCH for 5.2.y] mtd: cfi_cmdset_0002: Use chip_good() to retry
 in do_write_oneword()
Message-ID: <20190917181127.GD1570310@kroah.com>
References: <20190917175048.12895-1-ikegami.t@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190917175048.12895-1-ikegami.t@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190917_111142_171961_720BAE6F 
X-CRM114-Status: GOOD (  15.44  )
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
Cc: Sasha Levin <sashal@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, stable@vger.kernel.org,
 Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-mtd@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 18, 2019 at 02:50:48AM +0900, Tokunori Ikegami wrote:
> As reported by the OpenWRT team, write requests sometimes fail on some
> platforms.
> Currently to check the state chip_ready() is used correctly as described by
> the flash memory S29GL256P11TFI01 datasheet.
> Also chip_good() is used to check if the write is succeeded and it was
> implemented by the commit fb4a90bfcd6d8 ("[MTD] CFI-0002 - Improve error
> checking").
> But actually the write failure is caused on some platforms and also it can
> be fixed by using chip_good() to check the state and retry instead.
> Also it seems that it is caused after repeated about 1,000 times to retry
> the write one word with the reset command.
> By using chip_good() to check the state to be done it can be reduced the
> retry with reset.
> It is depended on the actual flash chip behavior so the root cause is
> unknown.
> 
> Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Cc: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: stable@vger.kernel.org
> Reported-by: Fabio Bettoni <fbettoni@gmail.com>
> Signed-off-by: Felix Fietkau <nbd@nbd.name>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
> Signed-off-by: Tokunori Ikegami <ikegami.t@gmail.com>
> [vigneshr@ti.com: Fix a checkpatch warning]
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/mtd/chips/cfi_cmdset_0002.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>  mode change 100644 => 100755 drivers/mtd/chips/cfi_cmdset_0002.c

You changed the file to be executable???  That's not ok :(

Also, what is the git commit id of this patch in Linus's tree?  I can't
seem to find it there.

thanks,

greg k-h

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
