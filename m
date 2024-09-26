Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3948ECCF9E9
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 07:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ztmpvsRHJiYqCgX6nZVSbaWUsjsZthJIk0VnlY5n1I=; b=bdueOe8OrjXsbi
	qqZW5TfxMOliSU5XQpUDlQUBanA6Owj6MQH1Pp7/P/kRAef7skM8IqlTRK+a9ketf6nlHPwZlTGO9
	Jwd7s3mEE2o0YOQObpfSH2RIGYqhlY4NzFdNnRM9CSMl7DcLli9PPtWsMrTV9GfJRbnnduBNjB0MC
	jBwKJG6+Cjp3Ak2SaFBIeoAQI5I89h0QJ4b3fEF3Fhca5SBSU0+7I7hH+hpR1jWruZrWRCPijSXSW
	r3YwOP/unBP6dBlVBytXOYX9ryREkNly8J0bxYrHXHUu7QBuA1PR8+T6Juae0IJIR5lGkMmg0M2xt
	6hMt3V/XJa0cFJEf+QLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stjOa-00000007c2n-0lIG;
	Thu, 26 Sep 2024 07:58:40 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stjMi-00000007bek-0Bj7;
	Thu, 26 Sep 2024 07:56:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=6R/Ua2GrAH615KyDfF7MwLoRuy3a4TAVfGfL7whhFyg=; b=MnkqGAyuZlHNMUlIqkgnqBiJtG
	yZW1ZzdcumkCvskeg/4C1dXQHkE5C/KV6LQfkP1ZE4QuT5/0bpCNgDUu9OH4ACw2vt1xbXsraDl38
	vDPX8/vxhbmFYGjoz5YkkRxR/B9+EhGArLBY4PNNcFuAr+aZ3W+Vn3RDFnPnDSIxVQULQeYWQ+EN/
	xE74VNtlLzuXG886XZd0c8mjhykb0gaEWFoG9tCgvvCfCqdYRhZSZo08vYfyboDTUeDhGbFtM2Lx7
	zlpjPMXDGSaoBbj4nfgDQJbASLJ6kPInXaGlCILvC/M9kZMVdsWXIaKO52Px8rkZLuBNsrUsAWOp1
	kAo0HSlg==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1stjMf-000MkB-63; Thu, 26 Sep 2024 09:56:41 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1stjMe-000MMl-0M;
	Thu, 26 Sep 2024 09:56:40 +0200
From: Esben Haabendal <esben@geanix.com>
To: "Michael Walle" <mwalle@kernel.org>
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>,  "Pratyush Yadav"
 <pratyush@kernel.org>,  "Miquel Raynal" <miquel.raynal@bootlin.com>,
  "Richard Weinberger" <richard@nod.at>,  "Vignesh Raghavendra"
 <vigneshr@ti.com>,  "Nicolas Ferre" <nicolas.ferre@microchip.com>,
  "Alexandre Belloni" <alexandre.belloni@bootlin.com>,  "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>,  <linux-mtd@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>,  "Rasmus Villemoes"
 <rasmus.villemoes@prevas.dk>,  <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device
 id re-use
In-Reply-To: <D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org> (Michael Walle's message
	of "Fri, 12 Jul 2024 11:55:08 +0200")
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
	<D2NGXHZ2VTK0.M0AOB4CM7MHM@kernel.org>
Date: Thu, 26 Sep 2024 09:56:39 +0200
Message-ID: <87tte2hmq0.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27409/Wed Sep 25 11:17:07 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_005644_108785_84B7F791 
X-CRM114-Status: GOOD (  27.49  )
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

"Michael Walle" <mwalle@kernel.org> writes:

> Hi,
>
> On Thu Jul 11, 2024 at 3:00 PM CEST, Esben Haabendal wrote:
>> As a consequence, the SPI_NOR_SKIP_SFDP flag is no more, and all
>> drivers that have been doing optional SFDP is now marked explicitly to
>> do that using the SPI_NOR_TRY_SFDP.
>
> First, I haven't looked at your patchset at the moment. But I'd like
> to take the opportunity to discuss the following (and excuse me that
> I didn't had this idea before all your work on this).
>
> First, I'd like to see it the other way around, that is, doing SFDP
> by default and let the driver opt-out instead of opt-in. This will
> also align with the current "SFDP only driver", i.e. if a flash is
> not known we try SFDP anyway. Going forward, I'd say this is also
> the sane behavior and we don't have to add any flags if someone want
> to add support for an (older) flash with the same ID but without
> SFDP. With the current approach, we'd have to add the TRY_SFDP flag.
>
> Now we might play it safe and add that SPI_NOR_SKIP_SFDP to any
> flash which doesn't do the SFDP parsing (because it has size != 0
> and not any of the magic flags set) - or we might just go ahead and
> do the probing first for *any* flashes. Yes we might issue an
> unsupported opcode, but we already do that with the generic SFDP
> flash driver. So no big deal maybe (?). Vendors where we know for a
> fact that they don't have any SFDP (Everspin I'm looking at you),
> would of course set the SKIP_SFDP flag.

I like your idea.

Did you discuss this with Tudor?

On 9/23/24 7:04 PM, Tudor Ambarus wrote:
>>> * Always read Macronix chips SFDP, as Macronix replaced all old chips
>>> in the Manufacture table.
>>
>> I'll NACK it unless you prove that the old flavors of flashes are not
>> used anymore in the kernel.
>
> Even if you can prove that the older flashes are not used in the kernel
> anymore, we can't just switch to parsing SFDP, because we have seen in
> the past flashes with wrong SFDP data that made the flashes misbehave.
> The recommended way is to update just the flashes that you can test.

Does it make sense if I work on a patch implementing the proposal you
put forward, or is it possible to discuss it further before doing that
work?

If it will certainly be NACK'ed, I might as well try to find a different
approach.

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
