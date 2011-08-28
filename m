Received: from tango.tkos.co.il ([62.219.50.35])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QxXpt-0008J6-3t
	for linux-mtd@lists.infradead.org; Sun, 28 Aug 2011 05:23:10 +0000
Date: Sun, 28 Aug 2011 08:22:15 +0300
From: Baruch Siach <baruch@tkos.co.il>
To: Stanimir Varbanov <svarbanov@mm-sol.com>
Subject: Re: [PATCH/RFC 2/2] mtd: m25p80: Call a platform power method in the
	driver
Message-ID: <20110828052215.GA7033@sapphire.tkos.co.il>
References: <cover.1314278151.git.svarbanov@mm-sol.com>
	<b7d4ea5c5ca058568f4d561914fa8becfa9324e1.1314278151.git.svarbanov@mm-sol.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7d4ea5c5ca058568f4d561914fa8becfa9324e1.1314278151.git.svarbanov@mm-sol.com>
Cc: spi-devel-general@lists.sourceforge.net, artem.bityutskiy@intel.com,
	linux-mtd@lists.infradead.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stanimir,

On Thu, Aug 25, 2011 at 04:29:12PM +0300, Stanimir Varbanov wrote:
> On some devices the flash chip could be powered off when m25p driver
> is probed. To avoid erroneous detection the power of the chip must be
> turn on, add a power function in m25p_probe to switch on the power by
> platform data. The power will be turned off at the probe end.

[snip]

> +	/* power on device while probing */
> +	m25p_power(data, 1);

[snip]

> +out:
> +	m25p_power(data, 0);

Shouldn't you power off in m25p_remove() as well?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
