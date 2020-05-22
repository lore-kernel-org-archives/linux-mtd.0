Return-Path: <SRS0=/JSY=7E=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D00C433DF
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 00:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD984206BE
	for <linux-mtd@archiver.kernel.org>; Fri, 22 May 2020 00:14:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aR+JTZkp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1ByJaNvN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD984206BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:
	References:In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=A+UT80o5XfJwjh7kvcPVnaawEgMhfC+2ubBSbYJvsAI=; b=aR+JTZkpPO2u5cv4IUlgkbDT8q
	y8CVcgvWoUheo2IXbjwvBoP016EAMp5F4q5Py9Ky818aMd8YU1dW6Yzb1mDzFG44TjGky0oFpP0Oe
	ML/WKCEcNc4qw2Z15RxbPu789D5uAznF85lRyZ21n/hTrBRDie+7YrfN6JoQBImUa6lYs6d7s/Z1j
	DFGergiZF9Tgl3hLixRca9RNwhK7gt5K8/lIr1+Z9s1XORy1/s/TnkOXXsxTUSBBaQp/7ybgz7YlC
	MvSIWwx8BE/9kSg6Tvh6MrlzV8sIERXldZSD4RVgO8bGAIaUmkZqtGrMdhWYFC7bwlf4Oq05supgr
	PqKq/ZwQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbvKg-0001b4-Iw; Fri, 22 May 2020 00:14:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbvIh-0007uT-Ti
 for linux-mtd@lists.infradead.org; Fri, 22 May 2020 00:12:37 +0000
Received: from localhost (unknown [137.135.114.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6231F2078B;
 Fri, 22 May 2020 00:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590106355;
 bh=ZWMGGzyk42CdbQ1SRAFobbeWXiMO+xzwOTC2QljBBmA=;
 h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
 b=1ByJaNvNHuz81sYM6n6QAXcPkLp2RwedUt8japNZwYxZnloI5YcTViD3vwwioQkR5
 1D3iq4oDQFPGcygdogQKSO22nZHDxn9Co476nnTww+wgS+2eS6XnbnF5FREWttfH1C
 mudQ0dq4L1SOySA5Wo4gBvOkweuwIbrFCWdNy14w=
Date: Fri, 22 May 2020 00:12:34 +0000
From: Sasha Levin <sashal@kernel.org>
To: Sasha Levin <sashal@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
To: <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v2 53/62] mtd: rawnand: sunxi: Fix the probe error path
In-Reply-To: <20200519130035.1883-54-miquel.raynal@bootlin.com>
References: <20200519130035.1883-54-miquel.raynal@bootlin.com>
Message-Id: <20200522001235.6231F2078B@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200521_171236_030954_E0A01139 
X-CRM114-Status: UNSURE (   7.37  )
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
Cc: stable@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag
fixing commit: 1fef62c1423b ("mtd: nand: add sunxi NAND flash controller support").

The bot has tested the following trees: v5.6.13, v5.4.41, v4.19.123, v4.14.180, v4.9.223, v4.4.223.

v5.6.13: Build OK!
v5.4.41: Build OK!
v4.19.123: Failed to apply! Possible dependencies:
    59ac276f2227 ("mtd: rawnand: Pass a nand_chip object to nand_release()")

v4.14.180: Failed to apply! Possible dependencies:
    02f26ecf8c77 ("mtd: nand: add reworked Marvell NAND controller driver")
    256c4fc76a80 ("mtd: rawnand: add a way to pass an ID table with nand_scan()")
    39b77c586e17 ("mtd: rawnand: fsl_elbc: fix probe function error path")
    59ac276f2227 ("mtd: rawnand: Pass a nand_chip object to nand_release()")
    63fa37f0c512 ("mtd: rawnand: Replace printk() with appropriate pr_*() macro")
    97d90da8a886 ("mtd: nand: provide several helpers to do common NAND operations")
    98732da1a08e ("mtd: rawnand: do not export nand_scan_[ident|tail]() anymore")
    acfc33091f7a ("mtd: rawnand: fsl_ifc: fix probe function error path")

v4.9.223: Failed to apply! Possible dependencies:
    24755a55b01f ("Documentation/00-index: update for new core-api folder")
    4ad4b21b1b81 ("docs-rst: convert usb docbooks to ReST")
    59ac276f2227 ("mtd: rawnand: Pass a nand_chip object to nand_release()")
    609f212f6a12 ("docs-rst: convert mtdnand book to ReST")
    66115335fbb4 ("docs: Fix build failure")
    7ddedebb03b7 ("ALSA: doc: ReSTize writing-an-alsa-driver document")
    8551914a5e19 ("ALSA: doc: ReSTize alsa-driver-api document")
    90f9f118b75c ("docs-rst: convert filesystems book to ReST")
    93dc3a112bf8 ("doc: Convert the debugobjects DocBook template to sphinx")
    c441a4781ff1 ("crypto: doc - remove crypto API DocBook")
    d6ba7a9c8b5a ("doc: Sphinxify the tracepoint docbook")
    e7f08ffb1855 ("Documentation/workqueue.txt: convert to ReST markup")
    f3fc83e55533 ("docs: Fix htmldocs build failure")

v4.4.223: Failed to apply! Possible dependencies:
    2cca45574007 ("Merge tag 'topic/drm-misc-2016-06-07' of git://anongit.freedesktop.org/drm-intel into drm-next")
    47cb398dd75a ("Docs: sphinxify device-drivers.tmpl")
    4ad4b21b1b81 ("docs-rst: convert usb docbooks to ReST")
    59ac276f2227 ("mtd: rawnand: Pass a nand_chip object to nand_release()")
    5b996e93aac3 ("Documentation: include sync_file into DocBook")
    609f212f6a12 ("docs-rst: convert mtdnand book to ReST")
    90f9f118b75c ("docs-rst: convert filesystems book to ReST")
    eae1760fc838 ("doc: update/fixup dma-buf related DocBook")
    f3fc83e55533 ("docs: Fix htmldocs build failure")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks
Sasha

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
