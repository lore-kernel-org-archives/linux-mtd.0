From: David Woodhouse <dwmw2@infradead.org>
To: Shreekanth Hiremath <hiremath@procsys.com>
In-Reply-To: <3FBC3FBB.AEDF510C@procsys.com>
References: <3FBC3FBB.AEDF510C@procsys.com>
Content-Type: text/plain
Message-Id: <1069317397.31205.37.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Thu, 20 Nov 2003 08:36:38 +0000
Content-Transfer-Encoding: 7bit
cc: 'Infradead Org' <linux-mtd@lists.infradead.org>
Subject: Re: MTD Flash low voltage error
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2003-11-20 at 09:44 +0530, Shreekanth Hiremath wrote:
> Two 16MB flash are connected to  CS0 EMIFS  interface of OMAP.
> And the VPP for both the flash is controlled by the OMAP.

> And if I issue copy & delete continuously on these partitions
> I am getting "Chip reports voltage low on erase: status 0xa8" error
> message.

Sounds like a bug in your set_vpp() function. If called to set Vpp
twice, then to clear it only once, what state does it leave the GPIO pin
in?

-- 
dwmw2
