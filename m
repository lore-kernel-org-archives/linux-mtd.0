Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E47F8FA86
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2026 14:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRZg8QbxJai4PZBUS1PuogDYVYMod+VvN1VPDAge68w=; b=zvs49Td6OgVenc
	/ImgTsNWUR/4XchmQlIaNddkiutBj6Pc0DhRYX7NfprwVkBMQZGHtWJkM8AcR0kOvELDSvmjh77gg
	PccPGDC32W5W/tpb5cqWNtJdeemEF1lcIbaf1KUsxsPvgVZklhEgw/F73yL46Xi3DyAo+c8G/nY+l
	cjVKx6im9VyJH59R5X/cFX0l+MaZSrqskjNIG2tDUG9NDtR2i0cYiTH086MHeL4vfIJQo0BYZCmer
	1CqLV4e3TgPUMEtUyyAF5Oxm+aoluflEkdFIRrIwSPDVUEUZR6lxbWC3NmtOcOYwjHZIoU4B9tS5a
	FCrqxiStsZSXqzpfZeaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCAj-00000008k3c-3m68;
	Tue, 21 Apr 2026 14:33:53 +0000
Received: from smtp9.infineon.com ([217.10.52.204])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCAh-00000008k2X-0C07
	for linux-mtd@lists.infradead.org;
	Tue, 21 Apr 2026 14:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=infineon.com; i=@infineon.com; q=dns/txt; s=IFXMAIL;
  t=1776782031; x=1808318031;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ArMpXotcTeEwyqUdj8I1RO41SIFb1S0fVagj1cHmjlc=;
  b=M0Azxz4ZAVrT1dsnhK6xJLtUUo/mnTDa9y9qx9FHH0ZHkWkBsAtWQhdv
   TgakFr8lK3TvnnZhwZ8T7EEVGpnqa/xfww6mToWxUDjkDdJC9brEmz8+1
   o1PjIJ4P3pJDUunneIdjYg/0doMWjsjpbsYy1WJn1ydhrS+9oSru0+zYT
   0=;
X-CSE-ConnectionGUID: +FeV1V4KQSyIe2LMbQyvdg==
X-CSE-MsgGUID: A+6UxzbISeGE7osJaVQCWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="90661278"
X-IronPort-AV: E=Sophos;i="6.23,191,1770591600"; 
   d="scan'208";a="90661278"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO MUCSE812.infineon.com) ([172.23.29.38])
  by smtp9.infineon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 16:32:46 +0200
Received: from MUCSE820.infineon.com (172.23.29.46) by MUCSE812.infineon.com
 (172.23.29.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Apr
 2026 16:32:46 +0200
Received: from MUCSE815.infineon.com (172.23.29.41) by MUCSE820.infineon.com
 (172.23.29.46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.37; Tue, 21 Apr
 2026 16:32:45 +0200
Received: from MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be]) by
 MUCSE815.infineon.com ([fe80::b54c:c0bd:546c:c9be%12]) with mapi id
 15.02.2562.037; Tue, 21 Apr 2026 16:32:45 +0200
From: <Takahiro.Kuwano@infineon.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <mwalle@kernel.org>,
	<miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>
CC: <p.yadav@ti.com>, <michael@walle.cc>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: RE: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
Thread-Topic: [PATCH] mtd: spi-nor: debugfs: fix out-of-bounds read in
 spi_nor_params_show()
Thread-Index: AQHczn5R2lmDsActuEKo+AhMPfaN4bXpmZig
Date: Tue, 21 Apr 2026 14:32:45 +0000
Message-ID: <308e7510718f46169d9465658f2c385a@infineon.com>
References: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
In-Reply-To: <20260417-fix-oob-read-spi-nor-v1-1-2132e61a684a@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.161.6.196]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_073351_485744_D7143217 
X-CRM114-Status: GOOD (  12.77  )
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

> Sashiko noticed an out-of-bounds read [1].
> 
> In spi_nor_params_show(), the snor_f_names array is passed to
> spi_nor_print_flags() using sizeof(snor_f_names).
> 
> Since snor_f_names is an array of pointers, sizeof() returns the total
> number of bytes occupied by the pointers
>         (element_count * sizeof(void *))
> rather than the element count itself. On 64-bit systems, this makes the
> passed length 8x larger than intended.
> 
> Inside spi_nor_print_flags(), the 'names_len' argument is used to
> bounds-check the 'names' array access. An out-of-bounds read occurs
> if a flag bit is set that exceeds the array's actual element count
> but is within the inflated byte-size count.
> 
> Correct this by using ARRAY_SIZE() to pass the actual number of
> string pointers in the array.
> 
> Cc: stable@vger.kernel.org
> Fixes: 0257be79fc4a ("mtd: spi-nor: expose internal parameters via debugfs")
> Closes: https://sashiko.dev/#/patchset/20260417-die-erase-fix-v2-1-73bb7004ebad%40infineon.com [1]
> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>

Reviewed-by: Takahiro Kuwano <takahiro.kuwano@infineon.com>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
