Subject: Re: linux-2.6.19-rc6-g1275361c build #142 failed
From: David Woodhouse <dwmw2@infradead.org>
To: Toralf =?ISO-8859-1?Q?F=F6rster?= <toralf.foerster@gmx.de>
In-Reply-To: <200611291547.21354.toralf.foerster@gmx.de>
References: <200611291547.21354.toralf.foerster@gmx.de>
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Nov 2006 14:55:11 +0000
Message-Id: <1164812111.14595.71.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2006-11-29 at 15:47 +0100, Toralf Förster wrote:
> WARNING: "cfi_cmdset_0002" [drivers/mtd/chips/gen_probe.ko]
> undefined! 

I don't understand -- isn't cfi_cmdset_0002 in your kernel and exported?
It should be, if CONFIG_MTD_CFI_AMDSTD is set.

-- 
dwmw2
