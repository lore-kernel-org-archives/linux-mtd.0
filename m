From: "Sudhakar Rajashekhara" <sudhakar.raj@ti.com>
To: "'Mike Frysinger'" <vapier.adi@gmail.com>
References: <1281422578-20461-1-git-send-email-sudhakar.raj@ti.com>
	<AANLkTimJAiUfyAYd6aoftbexKaBOz5A8BjX-fgumkWU9@mail.gmail.com>
In-Reply-To: <AANLkTimJAiUfyAYd6aoftbexKaBOz5A8BjX-fgumkWU9@mail.gmail.com>
Subject: RE: [PATCH] m25p80: add support for a callback to platform code on
	successful device probe
Date: Tue, 10 Aug 2010 14:56:39 +0530
Message-ID: <016d01cb386e$22e28660$68a79320$@raj@ti.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us
Cc: david-b@pacbell.net, linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Tue, Aug 10, 2010 at 12:47:05, Mike Frysinger wrote:
> On Tue, Aug 10, 2010 at 02:42, Sudhakar Rajashekhara wrote:
> > On some platforms, MTD device can hold MAC address, calibration
> > data, serial numbers etc.
> 
> pretty standard behavior ...
> 
> > On TI's DA850/OMAP-L138/AM18xx EVM, MAC address is stored on
> > the last sector of the SPI flash, which is exported as an MTD
> > device.
> 
> again, nothing unique here ...
> 
> > This patch adds two new members to the 'flash_platform_data'
> > structure, a function handler which will be called after
> > add_mtd_device() and an argument to be passed to this function,
> > for example: offset to read from.
> 
> ... and your changelog falls apart.  the intro gives no basis that i
> can see as to why you need these hooks.
> 
> please give examples of what you're actually trying to accomplish and
> how these hooks help you accomplish said goal and why it is necessary
> that you do these things from kernel space instead of standard
> userspace.

I have submitted an updated version of this patch in which I have
addressed your concerns.

Regards,
Sudhakar
