Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Nt08J-0003jG-4z
	for linux-mtd@lists.infradead.org; Sat, 20 Mar 2010 14:58:35 +0000
Date: Sat, 20 Mar 2010 14:57:30 +0000
From: Russell King <rmk+lkml@arm.linux.org.uk>
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH 01/24] mtd/maps/pismo: remove dangling pointer and a leak
Message-ID: <20100320145729.GA5399@flint.arm.linux.org.uk>
References: <1269094385-16114-1-git-send-email-w.sang@pengutronix.de>
	<1269094385-16114-2-git-send-email-w.sang@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1269094385-16114-2-git-send-email-w.sang@pengutronix.de>
Sender: Russell King <rmk@arm.linux.org.uk>
Cc: David Woodhouse <David.Woodhouse@intel.com>, linux-mtd@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Mar 20, 2010 at 03:12:42PM +0100, Wolfram Sang wrote:
> + exit_free:
> +	i2c_set_clientdata(client, NULL);
> +	kfree(prismo);

And this is a compile error...

-- 
Russell King
 Linux kernel    2.6 ARM Linux   - http://www.arm.linux.org.uk/
 maintainer of:
