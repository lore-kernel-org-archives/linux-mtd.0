Return-Path: <SRS0=xpfJ=QA=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8046FC282C3
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:16:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 515B6218A2
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Jan 2019 16:16:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TqR6kxzK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bMM8EP5d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 515B6218A2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3EK+P7TDUP88wbituHNmpS1u4XDxcjyAgKwGNnDM1MM=; b=TqR6kxzK8pX13G
	/c75faTO3+Ko/ey5n0TYMnvTaI8TXU44i1iCGlCIsZ5OiU679CV5fM++WiMLtlrRl5cy6ayAd1ggN
	+QfQB0grsfA2n3Cg+mb5wE6Exz66YW+yPfT+WVsGVbLQxvbu5o85Z1oeAgObxOE2cWLExkYujL5KK
	K7r+dBvVrLvHRehvBGhQLIvX9OeSu0N8oejUNzmmtoGOqZS7PXfyuQYXmsqL94Qa1UfbxuIKpdRDS
	Q43a7ROMpfDRxuJ7pAg3UroH1Ja9lo9+j9j61QXZpmfGckOdkBWill/VLEjPIWv1usAVNrPjI1pWn
	mp0jLcbloFDBg6vjiy4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gmhgS-00062h-Ge; Thu, 24 Jan 2019 16:16:52 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gmhgP-00060r-4X
 for linux-mtd@lists.infradead.org; Thu, 24 Jan 2019 16:16:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id v28so2847138pgk.10
 for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2019 08:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k7x6/dqgqScQ54SdfQAXrlFdP1Rl+IBfow3G+py8N6U=;
 b=bMM8EP5dSxkCEH310juOFdBmj+1h4U/bwKriYKIVCzYMMpxHIT2y5/VxNVBa22ljIY
 2LKj2rCTxkcdbpd3VVLWXsBLLC1EImZWnIeUWLMV0zEd4we5y5/Nrh0h3YeXj5pv+CZi
 ygTkYlmgTjggYPRQu6ctsEYgiObnyEhTk/AZ5TuotUACeyptq0LCRUhG/eewxkdZj0Ez
 ajvE/NvKXJ8PUJ4D9t9PFrIq480KzoXlobq+yA6vK0asXXf6EQMdRd9hFkR9wCXQ0+8z
 0fhDI0HhFVv3HQ1E8pn66orZtHl595HerSaTiE6lM5/O7f2DFFue8B3qfft5MjweTJBI
 eY+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k7x6/dqgqScQ54SdfQAXrlFdP1Rl+IBfow3G+py8N6U=;
 b=W2TL0amU5upxObAdnhopQKFE+GdcBPc/leWsAGgSF9pwwkorq1YK5TaUeb+Ru1NRS1
 QynfzBAEm2NqefxEloKVE5kJBDSzlgX1yKpUadP9ci0bl/6nvA6bepukjxc+wS5xsM6U
 C4PGhwXBcbG/JvYVVCy8lrlmvbbta1audrmGGaDLWB4/HFeMfoOXXKt1p0r623bkJ6Q+
 WokeoE8JDEgMq3yaoL0KDnmBwVZHsvbIuM2XeOBqwQl8MjC41bO72lSiN+07GWuLEj1m
 ovuv1B579/6fawdflzvltwheliQ7VuzAe2zuOrZ8PzdX4GGxWOfKUkFknN3WK7BQVzbQ
 KRBA==
X-Gm-Message-State: AJcUukc6KGjfeXWb5ilmfn8Aum3T3HuKymB5WLgYXniTpjSWyg4SkH2D
 UPDixNE9PEJCokkc+GbA9v7pclhd3rRfDwiwpNE=
X-Google-Smtp-Source: ALg8bN7qACkqvE/O95B3CBN6RbeZiO2qpAMEO4huArTTBa3jrVI07kZGiDquqQeAFiVrxfTIfRHcC//G4cI2KhREpps=
X-Received: by 2002:a63:ac1a:: with SMTP id v26mr6569208pge.293.1548346607627; 
 Thu, 24 Jan 2019 08:16:47 -0800 (PST)
MIME-Version: 1.0
References: <20190124142007.11607-1-bbrezillon@kernel.org>
 <8f80c33f-b236-27e6-3d87-a8362ad41326@denx.de>
In-Reply-To: <8f80c33f-b236-27e6-3d87-a8362ad41326@denx.de>
From: Emil Lenngren <emil.lenngren@gmail.com>
Date: Thu, 24 Jan 2019 17:16:37 +0100
Message-ID: <CAO1O6scZ12d-5rLnakDy0Wefg4fw=dGS3jPoJtqKztsdMrsjhw@mail.gmail.com>
Subject: Re: [PATCH] mtd: spinand: Handle the case where PROGRAM LOAD does not
 reset the cache
To: Stefan Roese <sr@denx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190124_081649_211168_E2DFBDDF 
X-CRM114-Status: GOOD (  14.36  )
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
Cc: Boris Brezillon <bbrezillon@kernel.org>,
 Richard Weinberger <richard@nod.at>, stable@vger.kernel.org,
 Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Hi,

Den tors 24 jan. 2019 kl 16:28 skrev Stefan Roese <sr@denx.de>:
>
> On 24.01.19 15:20, Boris Brezillon wrote:
> > Looks like PROGRAM LOAD (AKA write cache) does not necessarily reset
> > the cache content to 0xFF (depends on vendor implementation), so we
> > must fill the page cache entirely even if we only want to program the
> > data portion of the page, otherwise we might corrupt the BBM or user
> > data previously programmed in OOB area.
> >
> > Fixes: 7529df465248 ("mtd: nand: Add core infrastructure to support SPI NANDs")
> > Reported-by: Stefan Roese <sr@denx.de>
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Boris Brezillon <bbrezillon@kernel.org>
>
> Works fine (limited testing only yet), so:
>
> Tested-by: Stefan Roese <sr@denx.de>
> Reviewed-by: Stefan Roese <sr@denx.de>
>
> Thanks,
> Stefan
>

Can this quirk be made vendor specific? It seems a waste of SPI
transfer cycles to write 0xff to the whole OOB area when we only want
to program the data area if the chip doesn't need this quirk.
For which logic is this needed anyway? According to the GigaDevice
datasheet, if a Program Load is followed by Program Execute,
"uninitialized" bytes will be set to 0xff, which is the flow that is
used by spinand core.

/Emil

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
