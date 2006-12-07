Subject: Re: linux-2.6.19-g620034c8 build #163 failed
From: David Woodhouse <dwmw2@infradead.org>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
In-Reply-To: <1165503148.24220.10.camel@zod.rchland.ibm.com>
References: <200612071141.35086.toralf.foerster@gmx.de>
	<1165503148.24220.10.camel@zod.rchland.ibm.com>
Content-Type: text/plain
Date: Thu, 07 Dec 2006 14:56:27 +0000
Message-Id: <1165503387.5253.358.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-12-07 at 08:52 -0600, Josh Boyer wrote:
> You have genprobe as a module (as well as core MTD), but AMDSTD
> compiled in.  That seems very odd.  Try setting
> CONFIG_MTD_CFI_AMDSTD=m 

Particularly odd, considering that MTD_CFI_AMDSTD depends on
MTD_GEN_PROBE.

-- 
dwmw2
