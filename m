Return-Path: <SRS0=iVWO=M6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E0BC4338F
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 07:33:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33BFD610E7
	for <linux-mtd@archiver.kernel.org>; Sat,  7 Aug 2021 07:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33BFD610E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=biot.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7ualrxygQv/0hASE02nwAvPJDGYfoBmkFaFArTZh0eE=; b=aSVtW1pyGVqBVnDIijkUZbtPWg
	KiOuv8925DSelmndoqQSu8ij1aIsiLuRoP7DOBqOJyelw0cRUfOy3nwMjQdMoUeTwOa9MqhP9jkB7
	2eSHSIAcpd/Xoc8eRuA5c/M1V2p3hE5F35s8ibc24aWALbnR/LPIzYtZXPg2EJhSOaw0HOS55Hzk8
	3TR4B2zyxlfsnf3M3tl5FFmZ+Okl1Eob8nWtdcvjaEl8MU49CEejSrruChvaD3n6GRJDzyg2+d4wI
	I9rYtC5S4R/KGD8R1V0Emap183rVzF6CX39goG32DgK5JbGRWA9sIFAPVZMi7tL4MCPVGN4rY3jpg
	DqO6JQMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCGoq-00EJX3-KC; Sat, 07 Aug 2021 07:32:32 +0000
Received: from yawp.biot.com ([2a01:4f8:10a:8e::fce2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCGon-00EJWU-5n
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 07:32:30 +0000
Received: from debian-spamd by yawp.biot.com with sa-checked (Exim 4.93)
 (envelope-from <bert@biot.com>) id 1mCGoj-007a19-01
 for linux-mtd@lists.infradead.org; Sat, 07 Aug 2021 09:32:25 +0200
Received: from [2a02:578:460c:1:3d42:42b0:d03:8f97]
 by yawp.biot.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.93)
 (envelope-from <bert@biot.com>)
 id 1mCGoG-007Zyn-6F; Sat, 07 Aug 2021 09:31:56 +0200
Subject: Re: [V2] mtd: spinand: Add support for Etron EM73D044VCx
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christophe Kerello <christophe.kerello@foss.st.com>,
 Mark Brown <broonie@kernel.org>, Alexander Lobakin <alobakin@pm.me>
References: <20210729151829.703892-1-bert@biot.com>
 <20210806213410.7b1f74bd@xps13>
From: Bert Vermeulen <bert@biot.com>
Message-ID: <ba6637f8-6ed0-262e-0229-1b449334cdd2@biot.com>
Date: Sat, 7 Aug 2021 09:31:55 +0200
MIME-Version: 1.0
In-Reply-To: <20210806213410.7b1f74bd@xps13>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_003229_268445_782B5418 
X-CRM114-Status: GOOD (  12.44  )
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

On 8/6/21 9:34 PM, Miquel Raynal wrote:

Hi Miquel,

Thanks for reviewing. I'll send in a v2 with fixes. However...

> Bert Vermeulen <bert@biot.com> wrote on Thu, 29 Jul 2021 17:18:23 +0200:
>> +static int etron_ooblayout_ecc(struct mtd_info *mtd, int section,
>> +					struct mtd_oob_region *oobregion)
>> +{
>> +	if (section)
>> +		return -ERANGE;
>> +
>> +	oobregion->offset = 72;
>> +	oobregion->length = 56;
> 
> This looks highly dependent on a single chip, could you make these
> values (at least the offset) dependent on the MTD device?
> 
>> +
>> +	return 0;
>> +}
>> +
>> +static int etron_ooblayout_free(struct mtd_info *mtd, int section,
>> +			   struct mtd_oob_region *oobregion)
>> +{
>> +	if (section)
>> +		return -ERANGE;
>> +
>> +	oobregion->offset = 1;
>> +	oobregion->length = 71;
> 
> Same here.

I was rather hoping for some guidance on the _ecc and _free
offset/length numbers. There's not much info around on what's best
practice here, and I haven't played with NAND chips enough to actually
test the in-kernel ECC stuff.

The _free offset of 1 is for the bad block byte, which I saw in another
NAND chip driver, but I don't remember where I got the other numbers
from, and really need somebody to double-check that.

thanks,


-- 
Bert Vermeulen
bert@biot.com

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
