From: David Woodhouse <dwmw2@infradead.org>
To: Pavel Machek <pavel@ucw.cz>
In-Reply-To: <20051110105954.GE2401@elf.ucw.cz>
References: <20051109221712.GA28385@elf.ucw.cz>
	<4372B7A8.5060904@mvista.com> <20051110095050.GC2021@elf.ucw.cz>
	<1131616948.27347.174.camel@baythorne.infradead.org>
	<20051110103823.GB2401@elf.ucw.cz>
	<1131619903.27347.177.camel@baythorne.infradead.org>
	<20051110105954.GE2401@elf.ucw.cz>
Content-Type: text/plain
Date: Thu, 10 Nov 2005 11:11:30 +0000
Message-Id: <1131621090.27347.184.camel@baythorne.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kernel list <linux-kernel@vger.kernel.org>
Subject: Re: latest mtd changes broke collie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-11-10 at 11:59 +0100, Pavel Machek wrote:
> Well, how do I found out? I tried switching to CFI, and it will not
> boot (unable to mount root...). No mtd-related messages as far as I
> can see. There's quite a lot of mtd-related config options, I set them
> like this:

If the old sharp driver had even a _chance_ of working, then you
presumably have four 8-bit flash chips laid out on a 32-bit bus, and
those chips are compatible with the Intel command set.

You can CONFIG_MTD_JEDECPROBE, and you want CONFIG_MTD_MAP_BANK_WIDTH=4,
CONFIG_MTD_CFI_I4, CONFIG_MTD_CFI_INTELEXT.

Check that your chips are listed in the table in jedec_probe.c and turn
on all the debugging in jedec_probe.c 

-- 
dwmw2
