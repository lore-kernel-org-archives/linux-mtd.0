Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA00C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Apr 2022 19:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DChQnMHBxeFhXDCdqmdZxFRYJpFAMHAgxcRqV/wb7V8=; b=mQ4hgl0pmpXLS/
	csRm3pPR0BtfHoAgmaZEJDggXwmi4gOzq5cyJBE80/yKk10cOdMLOg2roTRevlsupHOVzC+tgLLCZ
	x9c2UmvgwTHZYWL5HY5diXPKOjqVbTfwPPByVOSfCloshU5CLu+x+3MvUHCzvbXdSxjcaFcF/5FTA
	43kLw2Vj4BT6+CukW6joiYiqfzwHLBOi8WZJUi9/uB/reM7wEKuyGb+orgxiF66wx6tbhmj++kNe2
	4gv5wk5u/kvrC2pr8G0gFCHyiG0MW+TeNJb61zeZJsBYziIe1PknXtAxQpBV3ILdme6BsGkMFa8wa
	vySw82BBkwhoFL0B+q8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ne06H-00AN5a-9e; Mon, 11 Apr 2022 19:53:25 +0000
Received: from mail.fmat.eu ([94.16.121.4])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ne069-00AN24-M3
 for linux-mtd@lists.infradead.org; Mon, 11 Apr 2022 19:53:19 +0000
Received: from authenticated-user (mail.fmat.eu [94.16.121.4])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.fmat.eu (Postfix) with ESMTPSA id BE87BE0187;
 Mon, 11 Apr 2022 21:53:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=matouschek.org;
 s=mail; t=1649706790;
 bh=tkieQwnJBbWS+m8XrBY1j0Cayrl82U/+4NHlOOLpFic=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=blmWWEt0+ErEM1+pRuItXl1QxahKTq7xbiOXeJCQCqzOeOsZjRJ1GqWU9T+SyxbPP
 ySHW+GK3ADydjb4YxGwRWQRY/SUKMcw7fzCLrASvHYsFZ1m/C6A7cIdoZuz0SyJxux
 zYDQTy0LxQaPUnJ+AFL+HrZ+/ZldLyLUo5LfqD/cqJOF8xIUcmounM3HYDTWxZPpAn
 JlzCE5HGWM1TF2TmPZvCo0ca3k+W1cxoMsceTQG3L3Kb4H1oWrGQWodh4q8qvGmcNT
 nFFN/ppO9TUhLWVI1xAkCHoaJGgpZf+A478WIL+Z0BVaQa/qtn+e+vnMuipLubhhex
 N6r3f2WczxkJQ==
Message-ID: <e697bea9-29b6-2f83-7d42-02afd88fa6b1@matouschek.org>
Date: Mon, 11 Apr 2022 21:53:06 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2] mtd: spinand: Add support for XTX XT26G0xA
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>
References: <20220408161904.94383-1-felix@matouschek.org>
 <20220411092311.3f0b97b3@xps13>
From: Felix Matouschek <felix@matouschek.org>
In-Reply-To: <20220411092311.3f0b97b3@xps13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_125318_250856_35B7E45C 
X-CRM114-Status: GOOD (  11.76  )
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

Hi Miquel,

Am 11.04.22 um 09:23 schrieb Miquel Raynal:
>> +static int xt26g0xa_ecc_get_status(struct spinand_device *spinand,
>> +					 u8 status)
>> +{
>> +	switch (status & XT26G0XA_STATUS_ECC_MASK) {
>> +	case XT26G0XA_STATUS_ECC_NO_DETECTED:
>> +		return 0;
>> +	case XT26G0XA_STATUS_ECC_8_CORRECTED:
>> +		return 8;
>> +	case XT26G0XA_STATUS_ECC_UNCOR_ERROR:
>> +		return -EBADMSG;
>> +	default: /* (1 << 2) through (7 << 2) are 1-7 corrected errors */
>> +		return (status & XT26G0XA_STATUS_ECC_MASK) >> 2;
>> +	}
>> +
>> +	return -EINVAL;
> 
> You'll never end here, right? Perhaps there are values that you cannot
> handle correctly in the switch and you should add a bit more logic to
> return -EINVAL if something is wrong? Otherwise you will return 0
> above, which might be correct (I'll let you verify but in this
> case the final "return -EINVAL" seems useless.

According to the data-sheet (section 7, page 27) the switch should be
able to handle all values of the status register. So should I remove the
final "return -EINVAL"?

Thank you,
Felix

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
