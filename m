Return-Path: <SRS0=4x2W=P4=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2C90C26640
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 17:37:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99E9820880
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jan 2019 17:37:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LOg0XYQg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fr3Hh2ku"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99E9820880
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eEbGo0PcqHe6aLltJ3SPEoNPlPc8YV1vZdMdQYL5NvU=; b=LOg0XYQgn/+w62
	kr8l0SAZqh6l1BErQrf8yu+hGe7TXnmSklZVoeruxsoD8JBkF4Z4HPWTJ/V7f1pB8h/m65q6Vk7Z9
	0rk8N8oOyAYhe0YB8LIjaI1kNEoRAWBYCkNErPyVg/aL0uNKNqZ5xVZNyq6/ZW55Jf/iJ65XYC+x4
	dyUBsKSgKomFc5FyeYGZ18AtKWxOHJcGheGR8qQzXNzku+VrGjNJmYaYd02Nk2HCGP6qnr9jee9JB
	hy7NWumSkA0rxcHtB6nlkHRPcvUYhLvBoMIfx4YklSOZRMlvjs3wetDCCVy6go0DP2+p2ihdrdE+E
	UAkE7QxXwCFwnYWpwlTw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1glH1y-0007jE-Js; Sun, 20 Jan 2019 17:37:10 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1glH1s-0007in-MX
 for linux-mtd@lists.infradead.org; Sun, 20 Jan 2019 17:37:08 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0935D2085A;
 Sun, 20 Jan 2019 17:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548005823;
 bh=8vaJkLKxcXk53YeE/TP6rSVuEPCaISvl5lMwP0LiF+Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fr3Hh2kurLMYg8LpH57hlr5iWicYNsn2nCL++4yV7IdAi9y6UYx6a4NbZoD8ArKhZ
 /6y+K0QtKlO4Dw4tOCMX4HNFMtaz5UvFgSSDQzopf35mvmuWqI0pTYK7H7amWAXYWP
 djPk9NbcaxAkhvQZtBxaxtx/h7xWckKdLOZAhMNU=
Date: Sun, 20 Jan 2019 18:36:55 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: "Bean Huo (beanhuo)" <beanhuo@micron.com>
Subject: Re: [RESEND PATCH V2 2/2] mtd: core: NAND filling block
Message-ID: <20190120183538.5bd14c84@bbrezillon>
In-Reply-To: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
References: <BYAPR08MB4533401FB969CA9A8D254F34DB9C0@BYAPR08MB4533.namprd08.prod.outlook.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190120_093704_754550_0D37D53C 
X-CRM114-Status: GOOD (  10.66  )
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

> +static int check_page_if_emtpy(struct nand_chip *chip, char *data)
> +{
> +	struct mtd_info *mtd = nand_to_mtd(chip);
> +	int ret, i;
> +	void *databuf, *eccbuf;
> +	int max_bitflips;
> +	struct mtd_oob_region oobregion;
> +
> +	mtd_ooblayout_ecc(mtd, 0, &oobregion);
> +	eccbuf = chip->oob_poi + oobregion.offset;
> +	databuf = data;
> +	max_bitflips = 0;
> +
> +	for (i = 0; i < chip->ecc.steps; i++) {
> +		ret = nand_check_erased_ecc_chunk(data,
> +						  chip->ecc.size,
> +						  eccbuf,
> +						  chip->ecc.bytes,
> +						  NULL, 0,
> +						  chip->ecc.strength);
> +		if (ret >= 0)
> +			max_bitflips = max(ret, max_bitflips);
> +		else
> +			return false;
> +
> +		databuf += chip->ecc.size;
> +		eccbuf += chip->ecc.bytes;
> +
> +	}

You should check the whole page and not only in-band-data+ECC bytes.
Plus, the "overwrite page" trigger is not dependent on the ECC
strength, but more something related to the NAND chip itself so using
ecc->strength as a threshold sounds like a bad idea to me.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
