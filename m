Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919C2C38A24
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 05:28:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 631212064A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 05:28:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FKZPVj1o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 631212064A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x5A9fR+eOWyKhM4+oDshd9K0F2RWN761pZZKHKyv6pU=; b=FKZPVj1oC6FPDg
	ms5FbxxjjuIDuZ7ULLMou6xw/vsP2Z8EnilgaPxrgrH9RlSNRy3LGx0EpsqJyjLwnZ+LjWVCFoF+e
	qtGTmQctnlmDtz4lmfAPIGVojpfI/FB9ZIzu2BVrODqaF4VPno3tglTS1j1+JQ7zjZCxH8MRKHhuC
	rzeHZu85shUeBsOCzVKuElWXr/6+S3gEw2i5JgBeIo06z2XtsYBwsXu7NPkwhRjrsVLrAYxY94ii1
	5RgHTon8rkALqQqrC9OPvBMsoyoyA60Sg57h/jmszSi7eNjt4B2FNYBPIjgeDFSG82N7+9Kp9e729
	eZ7eOdNExbH+Xy/d9CDg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWZ5N-00035V-A4; Thu, 07 May 2020 05:28:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWZ5J-00034l-Mq
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 05:28:39 +0000
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 633A92A242A;
 Thu,  7 May 2020 06:28:34 +0100 (BST)
Date: Thu, 7 May 2020 07:28:31 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Ramuthevar,Vadivel MuruganX" <vadivel.muruganx.ramuthevar@linux.intel.com>
Subject: Re: [PATCH v5 2/2] mtd: rawnand: Add NAND controller support on
 Intel LGM SoC
Message-ID: <20200507072831.1bf7f784@collabora.com>
In-Reply-To: <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
References: <20200507001537.4034-1-vadivel.muruganx.ramuthevar@linux.intel.com>
 <20200507001537.4034-3-vadivel.muruganx.ramuthevar@linux.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_222837_874870_66B7BDD3 
X-CRM114-Status: UNSURE (   8.73  )
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
Cc: cheol.yong.kim@intel.com, devicetree@vger.kernel.org, qi-ming.wu@intel.com,
 anders.roxell@linaro.org, vigneshr@ti.com, arnd@arndb.de,
 hauke.mehrtens@intel.com, richard@nod.at, brendanhiggins@google.com,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, tglx@linutronix.de,
 masonccyang@mxic.com.tw, andriy.shevchenko@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Thu,  7 May 2020 08:15:37 +0800
"Ramuthevar,Vadivel MuruganX"
<vadivel.muruganx.ramuthevar@linux.intel.com> wrote:

> +	reg = readl(ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));
> +	writel(reg | EBU_ADDR_MASK(5) | EBU_ADDR_SEL_REGEN,
> +	       ebu_host->ebu + EBU_ADDR_SEL(ebu_host->cs_num));

Seriously, did you really think I would not notice what you're doing
here? You're reading the previous value which either contains a default
mapping or has the mapping set by the bootloader, and write it back to
the register along with a new mask and the REGEN bit set (which
BTW is wrong since you don't mask out other fields before updating
them). This confirms that this Core -> FPI address translation exists
and has to be set properly, so please stop lying about that.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
