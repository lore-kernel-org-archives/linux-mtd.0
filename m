Return-Path: <SRS0=6Wn1=P7=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E5DC282C0
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:35:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1836021019
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Jan 2019 09:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iqpP/ZA9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy20WmOm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1836021019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPPssHM1fpthJ0di0GSDTfzN43vwOGN5PZ/mib5/hUk=; b=iqpP/ZA9nPpx8d
	llcs3KgNJSdxHsvmD7Bh3FeXrE7P1EBrnDSkGy93zxtLUjieNpR6yKlxMl1+73emQRAZ9opN+hson
	lXr4euenwqyi3/amwwbVRMgpO1QlfE2jrKN7w+jD5UCjD6cN6UrfNAVols+TfwxH2He/l4H0nZ6aY
	AArqbsryjt0RUGkcPtSoRwTnGaNSUXVxTTQy/Pk9viZqbl9rRALOqgIXk7etaYF2ryRpOIFO9H82e
	QE2GOnBIAcr1L1r5kTrXJrUhQJeg9UZD0Hr9B3/5W6gENjI7ZvVYgUQ5nc/JmtJMWH6uOgrWn1yUi
	Z8Osw+66E5B1jZDzVf7A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmEwO-0002Re-5D; Wed, 23 Jan 2019 09:35:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmEwL-0002RJ-Pc
 for linux-mtd@lists.infradead.org; Wed, 23 Jan 2019 09:35:23 +0000
Received: from bbrezillon (unknown [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DAB221019;
 Wed, 23 Jan 2019 09:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548236121;
 bh=1k8Ct7Gt6fdSWfNoe6koBozddllg4ccDneAiz++4mA4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fy20WmOmRvYZXiJZVHTkSwdN3OVw4B0e35KU5j+km8q90ebNHDmONjBS7y/R26Q6U
 K+PXTJitx93ZfWr/ZoWZlA53q2PjuM4063R7wOahshpSDRA4U/mzI3AjNmeRLTWs32
 aTagS/UnTBnkxs3qNRSW21gH+04YjQSerMsUtgRs=
Date: Wed, 23 Jan 2019 10:35:12 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH] mtd: spinand: Add support for GigaDevice GD5F1GQ4UC
Message-ID: <20190123103512.722095cd@bbrezillon>
In-Reply-To: <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
References: <20190122145632.17547-1-sr@denx.de>
 <20190122175346.602894e4@bbrezillon>
 <263cbd32-b7d4-e440-c92d-4f24f5af27a0@denx.de>
 <20190123085202.0db528ac@bbrezillon>
 <870af691-e8d3-cd91-5a55-6478ef885446@denx.de>
 <20190123095504.7857ca34@bbrezillon>
 <a350a884-f531-353d-31bc-d51be8f6eb83@denx.de>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190123_013521_851646_5EF83CBA 
X-CRM114-Status: GOOD (  14.57  )
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
Cc: linux-mtd@lists.infradead.org, Chuanhong Guo <gch981213@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On Wed, 23 Jan 2019 10:06:59 +0100
Stefan Roese <sr@denx.de> wrote:

> On 23.01.19 09:55, Boris Brezillon wrote:
> > On Wed, 23 Jan 2019 09:23:47 +0100
> > Stefan Roese <sr@denx.de> wrote:
> >   
> >>> This one doesn't, incremental mode (-i) should.  
> >>
> >> Here you go:
> >>
> >> # ./nandbiterrs /dev/mtd5 -k -i
> >> incremental biterrors test
> >> Failed to recover 1 bitflips
> >> Read error after 0 bit errors per page
> >>
> >> I'm still unsure how this helps here.  
> > 
> > It helps, it tells us the ECC doesn't work properly (fails to recover
> > one bitflip), or maybe it's the raw accessors that don't don't work.
> >   
> >> Is there anything else I should test?  
> > 
> > Add traces to the get_ecc_status() func and print the status value.  
> 
> # ./nandbiterrs /dev/mtd5 -k -i
> [   22.098436] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
> [   22.117184] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
> 
> <snip many identical lines>
> 
> [   23.085412] gd5f1gq4u_ecc_get_status (124): status=0x00 status2=0x00
> incremental biterrors test
> [   23.102973] gd5f1gq4u_ecc_get_status (124): status=0x20 status2=0x00
> Failed to recover 1 bitflips

Hm, looks like the ECC reports error as soon as you start writing to
the NAND. Maybe we have a problem in the write path...

> Read error after 0 bit errors per page
> 
> Strange, this does not seem to match what the datasheet tells us. Any
> further ideas what I should test?

Erase a block (save data before if you need to), write random data with
the ECC enabled and dump it back (once in raw mode, once with ECC
enabled):

# flash_erase /dev/mtdX 0 1
# nandwrite --input-size=<pagesize> /dev/mtdX /dev/urandom
# nanddump -f /tmp/dump-ecc -l <pagesize> -o /dev/mtdX
# nanddump -f /tmp/dump-raw -l <pagesize> -o -n /dev/mtdX

Send me both dumps (plus the console output), and we'll see how it
looks.

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
