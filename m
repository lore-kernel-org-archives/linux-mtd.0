Received: from gateway-1237.mvista.com ([12.44.186.158] helo=hermes.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EaMIv-0007Ni-2h
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2005 18:58:09 -0500
Message-ID: <4373DEB4.5070406@mvista.com>
Date: Thu, 10 Nov 2005 15:58:44 -0800
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: Pavel Machek <pavel@suse.cz>
References: <20051109221712.GA28385@elf.ucw.cz>
	<4372B7A8.5060904@mvista.com>	<20051110095050.GC2021@elf.ucw.cz>	<1131616948.27347.174.camel@baythorne.infradead.org>	<20051110103823.GB2401@elf.ucw.cz>	<1131619903.27347.177.camel@baythorne.infradead.org>	<20051110105954.GE2401@elf.ucw.cz>	<1131621090.27347.184.camel@baythorne.infradead.org>
	<20051110224158.GC9905@elf.ucw.cz>
In-Reply-To: <20051110224158.GC9905@elf.ucw.cz>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	kernel list <linux-kernel@vger.kernel.org>
Subject: Re: latest mtd changes broke collie
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Pavel Machek wrote:
> 
> With these hacks, I'm able to mount flash at least read-only. On
> attempt to remount read-write, I get 
> 
> "Write error in obliterating obsoleted node at 0x00bc0000: -30
> ...
> Erase at 0x00c00000 failed immediately: -EROFS. Is the sector locked?"
> 
> Is it good news?

I see the old sharp driver has a normally-not-defined AUTOUNLOCK symbol 
that would enable some code to unlock blocks before writing/erasing 
(which isn't recommended since the code doesn't know the policy on 
whether the block is supposed to be locked).  The tree previously in use 
may have had something similar setup.  It seems these flashes have all 
blocks locked by default at power up.

Try flash_unlock /dev/mtdX before remounting.  More automatic means of 
handling this are still under debate, I need to try another stab at 
resolving that soon.

Looks like you're close to obsoleting the pre-CFI Sharp flash driver, 
it's good news...

-- 
Todd
