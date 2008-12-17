Received: from yx-out-1718.google.com ([74.125.44.154])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1LCuft-0000JU-SG
	for linux-mtd@lists.infradead.org; Wed, 17 Dec 2008 11:34:46 +0000
Received: by yx-out-1718.google.com with SMTP id 3so1722744yxi.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Dec 2008 03:34:44 -0800 (PST)
Date: Wed, 17 Dec 2008 06:34:31 -0500
From: Josh Boyer <jwboyer@gmail.com>
To: Sean MacLennan <smaclennan@pikatech.com>
Subject: Re: [PATCH] ndfc driver
Message-ID: <20081217113431.GA31349@zod.rchland.ibm.com>
References: <20081203222832.3fc77d28@lappy.seanm.ca>
	<20081204090107.20269571@zod.rchland.ibm.com>
	<20081208193446.37e27e26@lappy.seanm.ca>
	<200812090710.27781.sr@denx.de>
	<20081210181634.2aac2023@lappy.seanm.ca>
	<20081216231400.5ba6afa1@lappy.seanm.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081216231400.5ba6afa1@lappy.seanm.ca>
Cc: devicetree-discuss@ozlabs.org, Arnd Bergmann <arnd@arndb.de>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	Stefan Roese <sr@denx.de>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 16, 2008 at 11:14:00PM -0500, Sean MacLennan wrote:
>On Wed, 10 Dec 2008 18:16:34 -0500
>"Sean MacLennan" <sean.maclennan@ottawa.kanatek.ca> wrote:
>
>> Here is an updated patch. Doc has been moved to 4xx and amcc changed
>> to ibm.
>
>Anybody? Even if it is not perfect, it would be better to have
>a driver that at least compiles ;)

Reviewing it today.  Looked pretty good at first glance.  It would be
nice to get David or Thomas to Ack it.

josh
