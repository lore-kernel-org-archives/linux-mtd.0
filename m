Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19199105F793
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Mar 2026 10:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXuexonMP7H5hs3DnfkMTwkRnQb8MbHT1t4Z0Ynv7yQ=; b=AgAxwfuHutf1pG
	/cyAl6Hi8AECcqKRi7eTZe6jtl66bbo56OWQZ8UTB0Eij2BrRCqBiKLzJy/lP/Fgbm3tISu3cBdmj
	l8cemKkRMahw+v8soLRgghzBwlnQYPKPhM8vC2vrRU2VY7+kbSkLpDbobp16lodrqfnYJtIcPWVaV
	KCxCD+2meYQ836ma47H7YvA17KCIHm0o5FUlGBNzIp76sSnipWgks8Fkt4+KbcLr3d2nJXmC7FWqp
	+zk/RgX72vl6XtvODZsLBsEwmcFI3qwHXDBkKpIzdiTj2Gjv0ict4QpF9tYqFtZKHIgB6pai7WQP1
	q10ehAcK7xM5qR+IzhJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w104y-0000000HY8w-2IZU;
	Fri, 13 Mar 2026 10:49:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w104x-0000000HY8P-16rr
	for linux-mtd@lists.infradead.org;
	Fri, 13 Mar 2026 10:49:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 76EEA443ED;
	Fri, 13 Mar 2026 10:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45977C19421;
	Fri, 13 Mar 2026 10:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773398954;
	bh=SIRX2VAbyszZT8dyxKn5uiaulqEQjP4wQ4JAnSh08yc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kDmAz1bi1F4qMhCyDwPJIKevcwUAPiPk5tGiOGoqVCzL9uHdUR3WljVlXJC8qJu9g
	 GAEJ6uA42MdQ4eeB6RDnqTedeVXWFPfA00iJlviH7d+NI6b71KnejipH6aZgsqZgYC
	 vRm514O/HnmL98qMur2eBRSn8z9vxC6o6HIJFQmD+A9iuMufa7YHJ8M/XEZtolt/36
	 ilHP/L+qCHzzFYQnUWFEIl0Q/ktKmVxklvuTvFkczCe6sMRYgKfHKTsJj4AbhuJXky
	 cl1gGhrwDnnxERE7rN0qBTZiqgCPfJ8nzO+0zb/8wwh3Q4Qc0n0A8vVXsvXNulgv1I
	 neS/x2grlDMdQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Jonas Gorski <jonas.gorski@gmail.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,  Pratyush Yadav
 <pratyush@kernel.org>,  Michael Walle <mwalle@kernel.org>,  Miquel Raynal
 <miquel.raynal@bootlin.com>,  Richard Weinberger <richard@nod.at>,
  Vignesh Raghavendra <vigneshr@ti.com>,  Pratyush Yadav <p.yadav@ti.com>,
  linux-mtd@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: update spi_nor_fixups::post_sfdp()
 documentation
In-Reply-To: <20251218095430.30103-1-jonas.gorski@gmail.com> (Jonas Gorski's
	message of "Thu, 18 Dec 2025 10:54:30 +0100")
References: <20251218095430.30103-1-jonas.gorski@gmail.com>
Date: Fri, 13 Mar 2026 10:49:10 +0000
Message-ID: <2vxzcy18f1i1.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_034915_318983_CD1CABB1 
X-CRM114-Status: UNSURE (   7.26  )
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

On Thu, Dec 18 2025, Jonas Gorski wrote:

> After commit 5273cc6df984 ("mtd: spi-nor: core: Call
> spi_nor_post_sfdp_fixups() only when SFDP is defined")
> spi_nor_post_sfdp_fixups() isn't called anymore if no SFDP is detected.
>
> Update the documentation accordingly.
>
> Fixes: 5273cc6df984 ("mtd: spi-nor: core: Call spi_nor_post_sfdp_fixups() only when SFDP is defined")
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>

Applied to spi-nor/next. Thanks!

[...]

-- 
Regards,
Pratyush Yadav

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
