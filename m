Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A46C54EE9
	for <linux-mtd@archiver.kernel.org>; Thu, 22 Sep 2022 14:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=68cIdl4IIIS+QvN+6dJIF1XjJRJZzJhNsV6aUP8isxA=; b=1Phy/kuAOIReXq
	bV/cAsGdPKi7MylofE2xyNolqh5ys0d0897AYT32KXaC2Owqi6i81zgQaOZRv++QgREt53XPzjduO
	V7ah6NHJZttqbY5P5cFo2YuEwagwFEspj2fLAcx71Wjje4GOLNvyJGwVh9mopNYu5ylzDkqrUJrJc
	WPR/j1R3Ro5gCV0ZFmd5La2SrcZsVuQiUN6uxExHfKCaEkZYSt7ncjhh6c9dT2cM7NMT6OmGs+W+9
	ltg86ni1Rn3qR7otu6UxEGyJ7yhaqxNKoKduJv0tkJuT3EYx+1DB6G+Qw1dQWznP5fkWPejV+UXpV
	cLM3II972oXvpMhP3QQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMzu-00Fvyn-V2; Thu, 22 Sep 2022 14:16:14 +0000
Received: from mga05.intel.com ([192.55.52.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obMzq-00Fvvm-9i
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2022 14:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1663856170; x=1695392170;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PF+2Lz3LD48OZy6E4Iz7ODPN21r+vaO6YES4mimJEjY=;
  b=SsK9fVlin2mjlkqOiJVrMd7CZYGqi/xKIvXKeJpipeo3GiwA9v2TvRpO
   wgN/YUXYQxhhZTD8Na2C2XwlilxgNxMsZh+Qq/XQX+aYue1mSjnyKY/Pz
   PQ8lLVeyFWS2cBzvT5S2jjKJXNh/FJX2FReG3/xEA1FkTdC5YxFd4Y6S5
   Xd03XiEFOM/IUrTEYqoqnGW3CB/KPaYZKu6WeqdkzyWVw6ykDiK6v4yi+
   gMrZQKzUgXRoYcxALwgjlqKXuZoO/raNZaEaR7pSJSDZrchV5GUBIEOGg
   5a6wEmbeIbrET8Ses8mGqlKplxG2aHBOAFKIwbuihTbp4V3TvVsZDpEHk
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10478"; a="386594162"
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="386594162"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2022 07:15:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,335,1654585200"; 
   d="scan'208";a="864870244"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 22 Sep 2022 07:15:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 0FE37238; Thu, 22 Sep 2022 17:16:12 +0300 (EEST)
Date: Thu, 22 Sep 2022 17:16:12 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Takahiro Kuwano <Takahiro.Kuwano@infineon.com>,
	Hongyu Ning <hongyu.ning@intel.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Revert "mtd: spi-nor: core: Return error code from
 set_4byte_addr_mode()"
Message-ID: <YyxuLAsc7XXo7yOC@black.fi.intel.com>
References: <20220922134824.46758-1-mika.westerberg@linux.intel.com>
 <a383698ae4a8e400f4961da5cc42663c@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a383698ae4a8e400f4961da5cc42663c@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_071610_378075_E4F6975E 
X-CRM114-Status: GOOD (  12.72  )
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

On Thu, Sep 22, 2022 at 04:12:17PM +0200, Michael Walle wrote:
> Am 2022-09-22 15:48, schrieb Mika Westerberg:
> > This reverts commit 08412e72afba3a2daef3e7f3378c3753255a0017.
> > 
> > The Intel SPI-NOR controller does not support this opcode so the driver
> > ends up returning -EOPNOTSUPP and that makes the SPI flash chip probe
> > fail like this:
> > 
> >   [ 12.291082] spi-nor: probe of spi0.0 failed with error -524
> > 
> > Whereas previously it worked just fine (and hence the return value
> > probably was ignored in the first place).
> 
> Can't we just ignore that return code then?

Isn't this revert just doing that? ;-)

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
