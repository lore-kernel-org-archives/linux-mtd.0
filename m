Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E868BE7717D
	for <linux-mtd@archiver.kernel.org>; Fri, 13 Dec 2024 12:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qTbNQBPEQXOTcPR/NGXFj9U6WyVSmNA4Hf7Geo3ma1M=; b=NiDxYBSDEJe7TP
	cZEFkzmdJAubSd/xS7MPEigFVfCEIWUpaHaeA4xJgU7pHN7xc1esOKpd4tZcCjTIk+ws+drpoijqu
	YPaXPxlaqntysaKINmk2ZjQtPL/Xd46QWHsTjoakoJdWq4J9KfrwWDh0lQOzSIM7xiup2hosteqj3
	Rvrz5IyPJJsrv1eQI7XQuzDYG9+UzZtKFWcm1boUFmAtIz4OtQOwYMDBQl7o5iGlUQh3ZKD99ZFmB
	VxNxW+dpZHia9Esbx292nVUWklkam3S184btirmX9qSDvx+xuQDYi22jJ4THUd+ykWBmjcz6V2wLH
	hHVgRA6YZvqOFqvYNU0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4Qn-00000003f0M-2RYx;
	Fri, 13 Dec 2024 12:06:05 +0000
Received: from relay6-d.mail.gandi.net ([2001:4b98:dc4:8::226])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM4Qi-00000003eyr-30Yy
	for linux-mtd@lists.infradead.org;
	Fri, 13 Dec 2024 12:06:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 761CAC0002;
	Fri, 13 Dec 2024 12:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734091557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Q07hAkDq3YBTICoUg/PyYGARG9zUOS05b+cgj9MMFrA=;
	b=otai4DWajRI4i/NYyp88WU/zXYTboiWvXXNaQIogvMyWjQYCGTURwGlxUFjkRSKqpe4poH
	YEWihwdelPzf4RpF4JbbMuqPTacQDQqVRT2EgXLXm6blKvbY4A2C9FmppM1IALhu3DcX2J
	1TSigIT5RnmZz0oAvQ+rLpgrgrXsiCQzh5/WGVwFQe+xE1/i+aIqp2cTs5mI4gx7t0/8aJ
	CDN1Hy8Wq01UScsFOJVbzO73dfFtPGsYgXPWWfqA+3TsDjLuDXKzPU0ZSZmJKij9KQep9b
	mXQvbwOqvmLjClMEyOSz2J4Xtey+HBLdlvOJj6EMcCKF3dBWIXvddPr0BYDVkQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  Pratyush Yadav <pratyush@kernel.org>,  Michael Walle
 <michael@walle.cc>,  linux-mtd@lists.infradead.org,  Mark Brown
 <broonie@kernel.org>,  linux-spi@vger.kernel.org,  Steam Lin
 <stlin2@winbond.com>,  Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
  Sanjay R Mehta <sanju.mehta@amd.com>,  Han Xu <han.xu@nxp.com>,  Conor
 Dooley <conor.dooley@microchip.com>,  Daire McNamara
 <daire.mcnamara@microchip.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Haibo Chen
 <haibo.chen@nxp.com>,  Yogesh Gaur <yogeshgaur.83@gmail.com>,  Heiko
 Stuebner <heiko@sntech.de>,  Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH 20/24] spi: spi-mem: Reorder SPI_MEM_OP_CMD internals
In-Reply-To: <7871b283-7623-4a21-ab75-42359a7c29ae@linaro.org> (Tudor
	Ambarus's message of "Mon, 11 Nov 2024 14:32:27 +0000")
References: <20241025161501.485684-1-miquel.raynal@bootlin.com>
	<20241025161501.485684-21-miquel.raynal@bootlin.com>
	<7871b283-7623-4a21-ab75-42359a7c29ae@linaro.org>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 13 Dec 2024 13:05:55 +0100
Message-ID: <87y10jlrdo.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_040600_922493_6E5776C2 
X-CRM114-Status: UNSURE (   7.86  )
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

>>  #define SPI_MEM_OP_CMD(__opcode, __buswidth)			\
>>  	{							\
>> -		.buswidth = __buswidth,				\
>> -		.opcode = __opcode,				\
>>  		.nbytes = 1,					\
>> +		.opcode = __opcode,				\
>> +		.buswidth = __buswidth,				\
>>  	}
>>  
>
> I don't mind, but shouldn't we follow the order used at struct declaration?
>
> struct spi_mem_op {
> 	struct {
> 		u8 nbytes;
> 		u8 buswidth;
> 		u8 dtr : 1;
> 		u8 __pad : 7;
> 		u16 opcode;
> 	} cmd;

Sure, let's do that. I also corrected the other macros at the same time (v2).

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
