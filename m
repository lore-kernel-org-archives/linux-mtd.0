Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C341CC433EF
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Jan 2022 06:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wFoPxQPfSOtj68+/yV+zIwutG4jOsp7JB1ybpnttT3g=; b=CN2embE86SqoCg
	I6NVuNiU+5/rgQPYjQlDujaLThnZOdjIR3K+FL5H5yqSZ6LecPZFRvdbueaemxFivjUDmjjyXWcHT
	hSstPg+szrlbkAtIQ+WYZZd7Ce8AhYGv0156pZtgUc6fEklvclfiRn+0uSfXTiBHJosBixHYDhpJp
	xSV8ObUFv/MzOxGs7vYavAra3tse8hFNyu3jMnG3e6Jsa3G40DC5bWToV6Wl2k9zA9xXOpVuAyLPn
	XMIx6R0jmYy+c0gzaQVwU3qfTm4ZJPqhipppxQXeroXfwscyFJJQ6VeoMtbpUWnI+lEv8wlxJu77f
	W6zt4NpMrkOM6UUuM7YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Ayp-00EyZ1-BE; Tue, 11 Jan 2022 06:50:03 +0000
Received: from mga12.intel.com ([192.55.52.136])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7Ayk-00EyWS-LA
 for linux-mtd@lists.infradead.org; Tue, 11 Jan 2022 06:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641883798; x=1673419798;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=biYXURg2KRnUNlO5yn6yZJU2HW5H6DzCM4RRie0avx8=;
 b=kX1AUSfzLmd8rY04FeVa/gGvB1IJ4eUF9sMtzIvzSIODS0Jn/uims1Eu
 SuPja3fwddIWOsnikGtJmwLGsJ2h1drWycYdfpVX1WZM3qZ2SR7SlbPvj
 ehmL3QzgIyhwc9SSP0RMzJQ5ykwRlCkF4+Da3F+ExWDLgbm3CcYc34wrw
 fJw+x/3NVQ3W/67Ug7Z3h7KgjpiHV3udVfm8arTaDs83wbGva2+vpwEBm
 Fb5sflA0oNwiirWlvTMjpZM7n2iNmkiVwHQdinRXS7cma2S8UwqSr4dxx
 qvOe5Coe5FYBsiceRDu3vKxKX4Q6vfj7zMqVrqVD7djNqTD0+uK76A6rE A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="223399252"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="223399252"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 22:49:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="690887314"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2022 22:49:52 -0800
Received: by lahna (sSMTP sendmail emulation); Tue, 11 Jan 2022 08:49:50 +0200
Date: Tue, 11 Jan 2022 08:49:50 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Michael Walle <michael@walle.cc>, Pratyush Yadav <p.yadav@ti.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Jonathan Corbet <corbet@lwn.net>, Mauro Lima <mauro.lima@eclypsium.com>,
 Alexander Sverdlin <alexander.sverdlin@nokia.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
 linux-mtd@lists.infradead.org, linux-spi@vger.kernel.org
Subject: Re: [PATCH v5 0/3] mtd: spi-nor / spi / MFD: Convert intel-spi to
 SPI MEM
Message-ID: <Yd0ojpMnSjlguMi1@lahna>
References: <20211220164625.9400-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211220164625.9400-1-mika.westerberg@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_224958_760395_F2694AB2 
X-CRM114-Status: GOOD (  17.98  )
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

Hi Tudor and Mark,

On Mon, Dec 20, 2021 at 07:46:22PM +0300, Mika Westerberg wrote:
> Hi all,
> 
> Based on discussion on the patch I sent some time ago here:
> 
>   http://lists.infradead.org/pipermail/linux-mtd/2021-June/086867.html
> 
> it turns out that the preferred way to deal with the SPI flash controller
> drivers is through SPI MEM which is part of Linux SPI subsystem.
> 
> This series does that for the intel-spi driver. This also renames the
> driver to follow the convention used in the SPI subsystem. The first patch
> improves the write protection handling to be slightly more safer. The
> following two patches do the conversion itself. Note the Intel SPI flash
> controller only allows commands such as read, write and so on and it
> internally uses whatever addressing etc. it figured from the SFDP on the
> flash device.

Any chance to get this one merged?

Thanks!

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
