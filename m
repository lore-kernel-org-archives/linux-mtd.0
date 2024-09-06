Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1A5CE7B1F
	for <linux-mtd@archiver.kernel.org>; Fri,  6 Sep 2024 15:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQaMwzPb8/Oij8mnAVCYR3fxymVRSVOjf0GNW1BGki4=; b=YQ9xzB3XohTofX
	HVjqQqajNxtA0xgVs7auowM5LmnEl+LxhzQ2B7I2/bLthVsiSIofaAH/EoTe6fGxynZjf6lcSbyvX
	3uZP6gfzWUzUaJmG5/90/u8R2k8+ke3SoCmDxJW0psebycMoga84szLE41JLuPsAa0ThHL7cHZXwR
	3d8Jl7VNEI3RlwGFLHTr4RsMS7294sLxR1woSfbKKRCdqFI651GiTtroFEUcabjk74uUEthZEnk20
	6dpFn72UGaa2h6SK/bVWPb5Gi6imFwqXMXOblgC3HE8YyG7GVjpYtfmzwiFpbAJRCksaYtQt4uvEB
	X5g79nDYILrejuw+jxyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaY3-0000000Cg9t-3MjU;
	Fri, 06 Sep 2024 15:06:55 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smaU4-0000000Cedk-1Y3J
	for linux-mtd@lists.infradead.org;
	Fri, 06 Sep 2024 15:02:50 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC6CB1C0004;
	Fri,  6 Sep 2024 15:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1725634966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KWSwqW61THw7CTT6pIAzF4YzpZhvE+Q8NfgaoPbqJSk=;
	b=pnQLKNAZB6Bc8Bcb7BYCzvXESm+UZ4xF5ly6uY0sWEIYu92MW5dp9cKZltfqDT5P/fmFw7
	giLz6OXgYMWj5V/lDmnU1IMIfLcy4/DoVIfJg7k6u+1DY3lPmR+cml7qAcQagyNlsFxA88
	8OXfh/Y5qXIQTUPejeXg2II9iX3m6609m+/ItndZYwl/vmTHtxPz+BnUF8eF2VM6WlDtIm
	4ij6OsbpZ9sZH+mcqqhBZSk5HD/VnErMFdZUX3WOwlE+Tje5cCN5D06l2RK/ZAbO2w4OoR
	asJzNEsRmrMNjbihHitTNUvIdJ9bpYc2A/eYa3U6aIEMT7ciN6JpwBQArQuWYw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>,
	Alvin Zhou <alvinzhou@mxic.com.tw>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v2 9/9] mtd: spi-nand: macronix: Continuous read support
Date: Fri,  6 Sep 2024 17:02:45 +0200
Message-ID: <20240906150245.734209-1-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240826101412.20644-10-miquel.raynal@bootlin.com>
References: 
MIME-Version: 1.0
X-linux-mtd-patch-notification: thanks
X-linux-mtd-patch-commit: b'11813857864f4326c4f23ea5b2e3f276f83af5f7'
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_080248_727383_2F6DA118 
X-CRM114-Status: GOOD (  22.60  )
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

On Mon, 2024-08-26 at 10:14:12 UTC, Miquel Raynal wrote:
> Enabling continuous read support implies several changes which must be
> done atomically in order to keep the code base consistent and
> bisectable.
> 
> 1/ Retrieving bitflips differently
> 
> Improve the helper retrieving the number of bitflips to support the case
> where many pages have been read instead of just one. In this case, if
> there is one page with bitflips, we cannot know the detail and just get
> the information of the maximum number of bitflips corrected in the most
> corrupted chunk. Compatible Macronix flashes return:
> - the ECC status for the last page read (bits 0-3),
> - the amount of bitflips for the whole read operation (bits 4-7).
> Hence, when reading two consecutive pages, if there was 2 bits corrected
> at most in one chunk, we return this amount times (arbitrary) the number
> read pages. It is probably a very pessimistic calculation in most cases,
> but still less pessimistic than if we multiplied this amount by the
> number of chunks. Anyway, this is just for statistics, the important
> data is the maximum amount of bitflips, which leads to wear leveling.
> 
> 2/ Configuring, enabling and disabling the feature
> 
> Create an init function for allocating a vendor structure. Use this
> vendor structure to cache the internal continuous read state. The state
> is being used to discriminate between the two bitflips retrieval
> methods. Finally, helpers for enabling and disabling sequential reads
> are also created.
> 
> 3/ Fill the chips table
> 
> Flag all the chips supporting the feature with the ->set_cont_read()
> helper.
> 
> In order to validate the changes, I modified the mtd-utils test suite
> with extended versions of nandbiterrs, nanddump and flash_speed in order
> to support, test and benchmark continuous reads. I also ran all the UBI
> tests successfully.
> 
> The nandbiterrs tool allows to track the ECC efficiency and
> feedback. Here is its default output (stripped):
> 
> Successfully corrected 0 bit errors per subpage
> Read reported 1 corrected bit errors
> Successfully corrected 1 bit errors per subpage
> Read reported 2 corrected bit errors
> Successfully corrected 2 bit errors per subpage
> Read reported 3 corrected bit errors
> Successfully corrected 3 bit errors per subpage
> Read reported 4 corrected bit errors
> Successfully corrected 4 bit errors per subpage
> Read reported 5 corrected bit errors
> Successfully corrected 5 bit errors per subpage
> Read reported 6 corrected bit errors
> Successfully corrected 6 bit errors per subpage
> Read reported 7 corrected bit errors
> Successfully corrected 7 bit errors per subpage
> Read reported 8 corrected bit errors
> Successfully corrected 8 bit errors per subpage
> Failed to recover 1 bitflips
> Read error after 9 bit errors per page
> 
> The output using the continuous option over two pages (the second page
> is kept intact):
> 
> Successfully corrected 0 bit errors per subpage
> Read reported 2 corrected bit errors
> Successfully corrected 1 bit errors per subpage
> Read reported 4 corrected bit errors
> Successfully corrected 2 bit errors per subpage
> Read reported 6 corrected bit errors
> Successfully corrected 3 bit errors per subpage
> Read reported 8 corrected bit errors
> Successfully corrected 4 bit errors per subpage
> Read reported 10 corrected bit errors
> Successfully corrected 5 bit errors per subpage
> Read reported 12 corrected bit errors
> Successfully corrected 6 bit errors per subpage
> Read reported 14 corrected bit errors
> Successfully corrected 7 bit errors per subpage
> Read reported 16 corrected bit errors
> Successfully corrected 8 bit errors per subpage
> Failed to recover 1 bitflips
> Read error after 9 bit errors per page
> 
> Regarding the throughput improvements, tests have been conducted in
> 1-1-1 and 1-1-4 modes, reading a full block X pages at a
> time, X ranging from 1 to 64 (size of a block with the tested device).
> The percent value on the right is the comparison of the same test
> conducted without the continuous read feature, ie. reading X pages in
> one single user request, which got naturally split by the core whit the
> continuous read optimization disabled into single-page reads.
> 
> * 1-1-1 result:
> 1 page read speed is 2634 KiB/s
> 2 page read speed is 2704 KiB/s (+3%)
> 3 page read speed is 2747 KiB/s (+5%)
> 4 page read speed is 2804 KiB/s (+7%)
> 5 page read speed is 2782 KiB/s
> 6 page read speed is 2826 KiB/s
> 7 page read speed is 2834 KiB/s
> 8 page read speed is 2821 KiB/s
> 9 page read speed is 2846 KiB/s
> 10 page read speed is 2819 KiB/s
> 11 page read speed is 2871 KiB/s (+10%)
> 12 page read speed is 2823 KiB/s
> 13 page read speed is 2880 KiB/s
> 14 page read speed is 2842 KiB/s
> 15 page read speed is 2862 KiB/s
> 16 page read speed is 2837 KiB/s
> 32 page read speed is 2879 KiB/s
> 64 page read speed is 2842 KiB/s
> 
> * 1-1-4 result:
> 1 page read speed is 7562 KiB/s
> 2 page read speed is 8904 KiB/s (+15%)
> 3 page read speed is 9655 KiB/s (+25%)
> 4 page read speed is 10118 KiB/s (+30%)
> 5 page read speed is 10084 KiB/s
> 6 page read speed is 10300 KiB/s
> 7 page read speed is 10434 KiB/s (+35%)
> 8 page read speed is 10406 KiB/s
> 9 page read speed is 10769 KiB/s (+40%)
> 10 page read speed is 10666 KiB/s
> 11 page read speed is 10757 KiB/s
> 12 page read speed is 10835 KiB/s
> 13 page read speed is 10976 KiB/s
> 14 page read speed is 11200 KiB/s
> 15 page read speed is 11009 KiB/s
> 16 page read speed is 11082 KiB/s
> 32 page read speed is 11352 KiB/s (+45%)
> 64 page read speed is 11403 KiB/s
> 
> This work has received support and could be achieved thanks to
> Alvin Zhou <alvinzhou@mxic.com.tw>.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>

Applied to https://git.kernel.org/pub/scm/linux/kernel/git/mtd/linux.git nand/next.

Miquel

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
