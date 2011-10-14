Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1REi86-0005Lg-W0
	for linux-mtd@lists.infradead.org; Fri, 14 Oct 2011 13:48:55 +0000
Received: by wyi11 with SMTP id 11so3731585wyi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 14 Oct 2011 06:48:53 -0700 (PDT)
Subject: Re: [PATCHv6] mtd: gpio-nand: add device tree bindings
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
Date: Fri, 14 Oct 2011 16:48:20 +0300
In-Reply-To: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
References: <1318374618-26573-1-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1318600108.12351.130.camel@sauron>
Mime-Version: 1.0
Cc: Grant Likely <grant.likely@secretlab.ca>,
	Scott Wood <scottwood@freescale.com>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-10-12 at 00:10 +0100, Jamie Iles wrote:
> +#ifdef CONFIG_OF
> +static const struct of_device_id gpio_nand_id_table[] = {
> +	{ .compatible = "gpio-control-nand" },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, gpio_nand_id_table);
...
> +#else /* CONFIG_OF */
...
> +#endif /* CONFIG_OF */

I wonder, why it is either OF of platform data? What if I want my kernel
to fall-back to platform data if device tree data is absent? What is the
general policy? Sorry, I am not very well aware of the DT stuff. But off
the top of my head, it is logical when things go like this: I have a
kernel with working platform data, but I can change that dynamically by
feeding it a device tree configuration. Hmm?

-- 
Best Regards,
Artem Bityutskiy
