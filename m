Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A394ACCFA13
	for <linux-mtd@archiver.kernel.org>; Thu, 26 Sep 2024 11:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E4gLxba78oNhb47Fz8IvxVA7H1DYc/LMIKta7O/Ott8=; b=WzmquqfvgfL68I
	6onyDz64puHetd4PGa1TXRQLRyiSeWPzSX+KHBn6Ki1n5EitwRtAGnUOWy0nRWAff8Oa7tXVM5Xo8
	8o2Ghwqq9tCaqTJ/v9KKsahI58b1ec3zNC0M5j7fue6YQCrSd8YMTj8qXgFSMjk9mOJIxLUoBMM0g
	dxDxh5eZ4P7LLMUlrcNYN4kjg6SJgSxTqQnacmouukels72+u0bxSky3gDQTdgISQJjBoUeGxteHD
	wJNXRt2tvkVpUY/S3T9u3oOa+EU3ISnXlJBpsMHx+dMs92pmAIfl4te71d8xuA3SdbeliwOSd0TDU
	FqTaasMRsS3Ngzdgbtfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stmHD-00000008A3C-1Ewf;
	Thu, 26 Sep 2024 11:03:15 +0000
Received: from www530.your-server.de ([188.40.30.78])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stmFz-000000089n5-0lgg;
	Thu, 26 Sep 2024 11:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
	s=default2211; h=Content-Type:MIME-Version:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZZ4U8PS+xvbWV05UkMujhA5g6+5WcpBTCI2eB50r8G0=; b=FyLb3Azm0dgfcSW0RJ6Ti7wC2a
	+sf6mTQnXWGlCKPRmEuiL5Zn5EXFLmmEhdl9x7t6enLLV1AiAq8e3O1nQHJU6j0jJuLCE5mcUPP7U
	1BFSeN3KIiCYc6mjNQWwGQhCb3+x12OxEuO7kdQmMEM/LcIk/ROMnyeN//ErV85iXY3UAx2XAa0TP
	G53SGLk7HLVdHcf40blFas38xW3rYSDLJnw5o+/R89kWDY9biMHHnRq0YN1TNB0dT75V8kEKfFqm+
	76noulpzjPL7U5aLRt3ighOmNz5YgxwDmV6/x5a2dtLt9DONyIJklCH+rP4jSN4Xb2nJh+UP+gXGL
	kXKh34aQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <esben@geanix.com>)
	id 1stmFu-0003tV-St; Thu, 26 Sep 2024 13:01:54 +0200
Received: from [185.17.218.86] (helo=localhost)
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <esben@geanix.com>)
	id 1stmFt-000Ghc-2Y;
	Thu, 26 Sep 2024 13:01:54 +0200
From: Esben Haabendal <esben@geanix.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <mwalle@kernel.org>,  Miquel Raynal <miquel.raynal@bootlin.com>,  Richard
 Weinberger <richard@nod.at>,  Vignesh Raghavendra <vigneshr@ti.com>,
  Nicolas Ferre <nicolas.ferre@microchip.com>,  Alexandre Belloni
 <alexandre.belloni@bootlin.com>,  Claudiu Beznea
 <claudiu.beznea@tuxon.dev>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org,  Rasmus Villemoes
 <rasmus.villemoes@prevas.dk>,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/15] mtd: spi-nor: macronix: workaround for device
 id re-use
In-Reply-To: <e079751d-e775-4dec-9959-c9c3fdcc8ecf@linaro.org> (Tudor
	Ambarus's message of "Thu, 26 Sep 2024 11:08:25 +0100")
References: <20240711-macronix-mx25l3205d-fixups-v3-0-99353461dd2d@geanix.com>
	<e079751d-e775-4dec-9959-c9c3fdcc8ecf@linaro.org>
Date: Thu, 26 Sep 2024 13:01:53 +0200
Message-ID: <87bk0ahe5a.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.10/27410/Thu Sep 26 11:30:46 2024)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_040159_563362_FF4B83A1 
X-CRM114-Status: UNSURE (   5.59  )
X-CRM114-Notice: Please train this message.
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

Tudor Ambarus <tudor.ambarus@linaro.org> writes:

> Your patches do not apply on latest SPI NOR, I tried locally. Can you
> point me to a branch of yours where I can see them? No need to resend.

Sure. I have rebased to spi-nor/next and pushed the b4:
https://github.com/esben/linux/tree/b4/macronix-mx25l3205d-fixups

/Esben

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
