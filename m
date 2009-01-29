Received: from mta23.gyao.ne.jp ([125.63.38.249] helo=mx.gate01.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LSN9I-0007iu-7U
	for linux-mtd@lists.infradead.org; Thu, 29 Jan 2009 03:01:03 +0000
Date: Thu, 29 Jan 2009 11:57:54 +0900
From: Paul Mundt <lethal@linux-sh.org>
To: Adrian McMenamin <adrian@newgolddream.dyndns.info>
Subject: Re: [PATCH RFC] sh: maple: Add support for SEGA Dreamcast VMU and
	clean up maple bus driver (3/3)
Message-ID: <20090129025754.GC31096@linux-sh.org>
References: <1233186456.6734.16.camel@localhost.localdomain>
	<1233187069.6734.21.camel@localhost.localdomain>
	<1233187750.6734.27.camel@localhost.localdomain>
	<1233188287.6734.32.camel@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1233188287.6734.32.camel@localhost.localdomain>
Cc: linux-sh <linux-sh@vger.kernel.org>, Greg KH <greg@kroah.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	LKML <linux-kernel@vger.kernel.org>, MTD <linux-mtd@lists.infradead.org>,
	linux-input <linux-input@vger.kernel.org>, dwmw2 <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 29, 2009 at 12:18:07AM +0000, Adrian McMenamin wrote:
> +	if (!(mdev->function & MAPLE_FUNC_KEYBOARD)) {
> +		error = EINVAL;
> +		goto fail;
> +	}
>  
What is this all about? If the function doesn't match, you should never
enter the probe routine in the first place. The bus code should already
get this right.
