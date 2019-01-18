Return-Path: <SRS0=FXe4=P2=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E11C5AE5E
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 23:02:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE9212084C
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Jan 2019 23:02:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZlBBkz0R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CLbR+fsE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE9212084C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BCNsygRunk9g6Wb4vzWrYROLhQimuCuGPdrQR1kUNNc=; b=ZlBBkz0RuUxgOy
	3HiBB89FL10CPpqze0YpPS9UBeVP9X+7kNds+9OEDX+/U7hJgLqTFTGyvK65wU98Sz7op5JDjlrgC
	0FMYKw/GFyCP5VrwQfibTZ9rOpxnnLFjq16XHADHEbaGCGGDNn5iG74nZxsHGZjNtX88ZQkxKWPg1
	m9x+r4pMxLlrYHqNF8gglXk07B0TRg9hJq4HA+dbX25kAFhQwR8YIXq9lj9BW1Lr8UhaEQtaNnHh9
	gOEInZ+jHUB2kp4shywOlko3TWy5MbDlNwlOq2GvWKgXx0EU3qMj9+ZznhUyOW+rJBmKMsZAbrOAy
	bT/9tClGBZD203lf8j8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gkd9D-0006KZ-F5; Fri, 18 Jan 2019 23:01:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gkd9A-0006KD-TU
 for linux-mtd@lists.infradead.org; Fri, 18 Jan 2019 23:01:58 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CFFD20652;
 Fri, 18 Jan 2019 23:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1547852516;
 bh=+61Y1qnv7fIkRBuT8UOJtmj6okbFG7i8DYdleMVdZbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CLbR+fsE43+EEsPAniWLmA0p+v/5m+k0qSi0zqNItZqIQp6Gd37t5IV/cOPfP/ID9
 3+aSkhIyPRXjMVZ2AI/HRfWVPcVIH8h7o5UCsbejpA8cFJ3er+l1DRsob0nzBxlRAR
 eEXdWVHKJtxifvl79E3OUnFQdSFymkyH3fpNwfQ0=
Date: Sat, 19 Jan 2019 00:01:47 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190119000135.0064da24@bbrezillon>
In-Reply-To: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190118_150156_973303_AEEB23F9 
X-CRM114-Status: UNSURE (   7.51  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: "boris.brezillon@bootlin.com" <boris.brezillon@bootlin.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "richard@nod.at" <richard@nod.at>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Fri, 18 Jan 2019 22:12:04 +0000
"Bean Huo (beanhuo)" <beanhuo@micron.com> wrote:

> +	/* Corrupt page0 and page1, in order to simulate an
> +	 * uncompleted eraseing scenario. Just for case of
> +	 * power loss hits while below programming. in this
> +	 * way, the PEB will be re-erased again.
> +	 */
> +	empty_page_mask |= 0x3;
> +	memset(data_buf, 0xAA,  mtd->writesize);

Why do you use the 0xaa pattern BTW?

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
