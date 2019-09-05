Return-Path: <SRS0=xEIb=XA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11815C3A5A5
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 05:00:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1E15206DF
	for <linux-mtd@archiver.kernel.org>; Thu,  5 Sep 2019 05:00:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dXwvtnes"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1E15206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.intel.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xr3P6zNJ3NtOm5LxAm6+FrJJ2IHx23wveRrwVS31WFk=; b=dXwvtnesV9sbCm
	SfpnT3qOjB4bu2w4Q1voJqKuxsOD5dKPgt2ZdAN8aQeH6l8i5gwPF1Ix1BofChsZyxIF8HQJ5Wp6E
	th7hrNb1hdWmQcNziNscWdt7Ymu+JADVdtBBePdUP4dDuMkyqKE9XisiYoj6QLOiHcO4r5s6zmzZv
	uPY9VizEUEOF00FtgpfqOYBx5x1eCtGIvTQdJPYNgynCCiUqD9It6EqQWZx+DVc2YaIk/LxlexykE
	Um8+vhhq4Rq5VG2m8KJJp/7npi7Lq66s/AEUR6iO3KbJ9LktiQc+f61Vy7NihpolGRjunZ+hB9tjz
	vA4wIoqrHayXkXPvF3dQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i5jry-0000p1-TU; Thu, 05 Sep 2019 04:59:43 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5jrv-0000Sx-N5
 for linux-mtd@lists.infradead.org; Thu, 05 Sep 2019 04:59:41 +0000
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Sep 2019 21:55:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,469,1559545200"; d="scan'208";a="199194458"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
 by fmsmga001.fm.intel.com with SMTP; 04 Sep 2019 21:55:34 -0700
Received: by lahna (sSMTP sendmail emulation); Thu, 05 Sep 2019 07:55:33 +0300
Date: Thu, 5 Sep 2019 07:55:33 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jethro Beekman <jethro@fortanix.com>
Subject: Re: [PATCH v2 2/2] mtd: spi-nor: intel-spi: add support for Intel
 Cannon Lake SPI flash
Message-ID: <20190905045533.GS18521@lahna.fi.intel.com>
References: <d62dec18-fed4-7ac5-35c8-25f1be2201a9@fortanix.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d62dec18-fed4-7ac5-35c8-25f1be2201a9@fortanix.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.12.1 (2019-06-15)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190904_215939_794288_D8018055 
X-CRM114-Status: GOOD (  11.53  )
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
Cc: Enrico Weigelt <info@metux.net>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, Sep 04, 2019 at 01:15:24AM +0000, Jethro Beekman wrote:
> Now that SPI flash controllers without a software sequencer are
> supported, it's trivial to add support for CNL and its PCI ID.
> 
> Values from https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/300-series-chipset-pch-datasheet-vol-2.pdf
> 
> Signed-off-by: Jethro Beekman <jethro@fortanix.com>

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
