Return-Path: <SRS0=KxgV=5I=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0EF8C3F2CD
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 14:09:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 831C120714
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Mar 2020 14:09:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lwjWUBvN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aKV9Jmw4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 831C120714
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jwn5N/goKG8aSOspPZRENrYsrRRcI8XAc7uxBxfftAw=; b=lwjWUBvNeVCvQi
	BtMOHZPtaAkUxXJc4Hu/d9TIMVswyTv6fXyvzxXwNOa8brqR4LZyUUbby89a6m7dpTj2J3whou+dP
	bY6UCTAU0jYgjmD16NUoyzF/TZTeEc0Ji3hRVgiwrk5ONS84GdUXpiAFwDklApdJP6YzavLb1EX9A
	g02JXuOHtbqQ8N+75nRnO8PEVDAeoUIzQH82A7KVAb0kvYmWX+TV5rCjs0Ous8AIP3MmMSfW0Bweo
	VUvBGZ95he4d9EBDqAZHpvldra300LeYIRqKIoM7NM9gsmziU6nx2JUMKbU3c1wIwmn90lyT7b0vf
	ipRDrcQcbwqUQcSIFfEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jGNlC-0002AF-7r; Mon, 23 Mar 2020 14:08:58 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jGNl8-00029a-ES
 for linux-mtd@lists.infradead.org; Mon, 23 Mar 2020 14:08:56 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20200323140850epoutp0491a7e3c132af3804e865f75e1444105c~_9B6QpuLq3168731687epoutp04T
 for <linux-mtd@lists.infradead.org>; Mon, 23 Mar 2020 14:08:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20200323140850epoutp0491a7e3c132af3804e865f75e1444105c~_9B6QpuLq3168731687epoutp04T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1584972531;
 bh=yOVnTD0DwW5jPN2j+zFCLFNNcmn0bwy9Vo47CqX/d6c=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=aKV9Jmw4Crca7OJXVurv3Mv4niChzdzbGHz1zhQ2QLrHv7wQCnXhxlPkMSjgNnD8f
 Eho+AjfMAOq/lzGfUKR9YyRp8lpdaa7K/HyO/SelRvnQUxIVHlJcvmQnWw7aSqUbug
 D2DRARdFy0Zyo9yvP3O8191V5vH7nH0ozfHKn2aQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20200323140850epcas1p43b10e6072c876490c6fd42864970f55f~_9B57_jJw2862728627epcas1p4f;
 Mon, 23 Mar 2020 14:08:50 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.159]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 48mGSx4kMBzMqYkV; Mon, 23 Mar
 2020 14:08:49 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 0D.33.04145.1F2C87E5; Mon, 23 Mar 2020 23:08:49 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTPA id
 20200323140848epcas1p3d1bcec367214ff6642b9d98ad6052eb6~_9B3tul602125421254epcas1p3k;
 Mon, 23 Mar 2020 14:08:48 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200323140848epsmtrp27d0b3131800e4484009303c91f107e05~_9B3tE-cg0229102291epsmtrp2D;
 Mon, 23 Mar 2020 14:08:48 +0000 (GMT)
X-AuditID: b6c32a35-2a5ff70000001031-4f-5e78c2f187a4
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 B4.B6.04024.0F2C87E5; Mon, 23 Mar 2020 23:08:48 +0900 (KST)
Received: from asdf (unknown [10.88.100.192]) by epsmtip1.samsung.com
 (KnoxPortal) with ESMTPA id
 20200323140848epsmtip15d07676cd6f46289e156fc56dad64158~_9B3lUsRJ2992029920epsmtip1j;
 Mon, 23 Mar 2020 14:08:48 +0000 (GMT)
Message-ID: <6c98f1af0135a1762948ab9c1b4d23165e5d68bd.camel@samsung.com>
Subject: Re: [PATCH v3 2/5] mtd: spi-nor: Set all BP bits to one when
 lock_len == mtd->size
From: Jungseung Lee <js07.lee@samsung.com>
To: Tudor.Ambarus@microchip.com, michael@walle.cc, vigneshr@ti.com
Date: Mon, 23 Mar 2020 23:08:47 +0900
In-Reply-To: <20200323092430.1466234-3-tudor.ambarus@microchip.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01SbUgUURTtzYy7o7U2rZYXIVqH/JH5Meu26xZuSUosaCRYPyrTBn2otF/t
 7JpKkYlEmIqCFW2ZfZhiEEWWroVQKhlaWfjRQoZp0A9r1ywLwaxmGqX+nXveOe/ce9+jSfUp
 RSRdZHNhp423sIoQqqN3Exc321OSw/VXssZHFS1Ko3/wrtI425xi/P3iizKFMrc3nzSPz99E
 5n5fJ2F+3F2pyKQOWJILMZ+PnRpsy7PnF9kKTGx6Vm5qrt7AaeO0W41JrMbGW7GJTcvIjNtV
 ZBETWU0xb3GLVCYvCGzC9mSn3e3CmkK74DKx2JFvcWg5R7zAWwW3rSA+z27dpuW4RL2oPGwp
 nGqcJRwPVpdUP3qlKEfVq6pQMA3MFmjxNqEqFEKrGS+CD88aKbn4iuBb38RS8QPBk7rrxLLF
 9y6glA+6EXSOXlvyTyGY9swpJJWKMcNw3wyScBhzCHo9PkrCCiYGfAv3giQczuyE8xOj4q00
 TTJR0NWRLEGKiQb//C4JBjOpcLY1WY6NBf9ALSXRKmYNLHrDJJpkNkCn/zIpNQDMfQVMNnUg
 SQNMGrRXJ8rWMJjuv6+UcSR8C3QrZCxAV1u9UvZWIphqbV4S6SDgv03KjW2COw8TZFrscaER
 ybmhEPheHSRHqeDMabUsYeHz+0pKxgCvPtQEydgM/U8GCXlPQ+KemyrIOqTx/JvG8980nn/B
 VxF5C63DDsFagAWtQ/v/695Df79fjN6LGl5m9CCGRuwq1d3zJTnqIL5YKLX2IKBJNlzVjkVK
 lc+XlmGnPdfptmChB+nFTdeTkWvz7OJntrlytfpEnU5n3GJIMuh1bITq3BtLjpop4F34CMYO
 7Fz2EXRwZDnak96ZTczEz6QUm7pjy0f23RjOLmo9PjV0ojzKdGrkLXheZ13wNSRccn9cOUp4
 XcMHnCvm+aPcwfG1G8dip5/j1z/biu3c74j9eyvmiGBisubY5nZN1Y7F8DMDT3/Vc/Wfdgdw
 7OTc5H7vFUNUaKkhuvfCWNhFYn1SiLn2Els2w1JCIa+NIZ0C/wf5Zq17lAMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrILMWRmVeSWpSXmKPExsWy7bCSnO6HQxVxBpt/cVvsblrGbvH29AZ2
 i49LHCz+n/3A7sDisXlJvcedH0sZPY7f2M7kcWBvC1sASxSXTUpqTmZZapG+XQJXxqO5H5kK
 tvJX9Oy+wNbA2MPTxcjJISFgInHj7jv2LkYuDiGB3YwS57sfM0EkJCQe7fzC0sXIAWQLSxw+
 XAxR84BR4k3jcnaQGl4BD4nLR94zgtjCArESh2fdYAGx2QS0JG783sQKYosIOElMu3+VCWQO
 s4CixM5tNiAmi4CqxNsfbiAmp4CzRPdyG5BiIYGLjBI7VoENZBbQlGjd/psd4hgdiben+sCO
 4RUQlPi7QxiiRF5i+9s5zBMYBWch6ZiFUDULSdUCRuZVjJKpBcW56bnFhgWGeanlesWJucWl
 eel6yfm5mxjBAa2luYPx8pL4Q4wCHIxKPLwcMyvihFgTy4orcw8xSnAwK4nwbk4FCvGmJFZW
 pRblxxeV5qQWH2KU5mBREud9mncsUkggPbEkNTs1tSC1CCbLxMEp1cDIl+Fvtjd1I9+XI+Ub
 yza0de/XEOKtXP+Z1/fjpMcWXxPkr/19ItYal+U3a06Q2A3fpdU/7UxuWLGElzWcZhZ3iU6e
 XM1Z+P7Xyty1ix/oK1YxOH9/3X42PGvzrBk3lmxaY173/dEMzmNL7EoeaJxUtZmlcCX3r2wL
 +8vd1mcefHnUovOB88dCJZbijERDLeai4kQAxf4jOWQCAAA=
X-CMS-MailID: 20200323140848epcas1p3d1bcec367214ff6642b9d98ad6052eb6
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20200323092441epcas1p373eee0a7cc060997e244d62afaf5c1db
References: <20200323092430.1466234-1-tudor.ambarus@microchip.com>
 <CGME20200323092441epcas1p373eee0a7cc060997e244d62afaf5c1db@epcas1p3.samsung.com>
 <20200323092430.1466234-3-tudor.ambarus@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200323_070854_847166_BF1174AE 
X-CRM114-Status: GOOD (  21.65  )
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
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Mon, 2020-03-23 at 09:24 +0000, Tudor.Ambarus@microchip.com wrote:
> From: Tudor Ambarus <tudor.ambarus@microchip.com>
> 
> When there are more BP settings than needed for defining the
> protected
> areas of the flash memory, most flashes will define the remaining
> settings as "protect all", i.e. the equivalent of having all the BP
> bits
> set to one. But there are flashes where the in-between BP values
> are undefined (not mentioned), and only the "all bits set" is
> protecting
> the entire memory. One such example is w25q80, where BP[2:0]=0b101
> and
> 0b110 are not defined.
> 
> Set all the BP bits to one when lock_len == mtd->size, to treat this
> special case.
> 
> Suggested-by: Michael Walle <michael@walle.cc>
> Signed-off-by: Tudor Ambarus <tudor.ambarus@microchip.com>
> ---
>  drivers/mtd/spi-nor/core.c | 20 +++++++++++++-------
>  1 file changed, 13 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 36660068bc04..3788a95c0a47 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -1660,13 +1660,19 @@ static int spi_nor_sr_lock(struct spi_nor
> *nor, loff_t ofs, uint64_t len)
>  	 *
>  	 *   pow = ceil(log2(size / len)) = log2(size) -
> floor(log2(len)) + 1
>  	 */
> -	pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
> -	val = mask - (pow << SR_BP_SHIFT);
> -	if (val & ~mask)
> -		return -EINVAL;
> -	/* Don't "lock" with no region! */
> -	if (!(val & mask))
> -		return -EINVAL;
> +	if (lock_len == mtd->size) {
> +		val = mask;
> +	} else {
> +		pow = ilog2(mtd->size) - ilog2(lock_len) + 1;
> +		val = mask - (pow << SR_BP_SHIFT);
> +
> +		if (val & ~mask)
> +			return -EINVAL;
> +
> +		/* Don't "lock" with no region! */
> +		if (!(val & mask))
> +			return -EINVAL;
> +	}
>  
>  	status_new = (status_old & ~mask & ~tb_mask) | val;
>  

Reviewed-by: Jungseung Lee <js07.lee@samsung.com>


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
