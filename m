Subject: Re: physmap and pointless shutdown() function ?
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
In-Reply-To: <8bd0f97a0905061941s6055c6dfrf467a6b2b837c8f8@mail.gmail.com>
References: <8bd0f97a0905061941s6055c6dfrf467a6b2b837c8f8@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 05 Jun 2009 18:51:52 +0100
Message-Id: <1244224312.3751.187.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-05-06 at 22:41 -0400, Mike Frysinger wrote:
> waaaay back when power management support was added to the physmap.c
> driver, it added the standard suspend/resume functions.  no problem
> there.  but it also added a shutdown function which causes the flash
> to suspend/resume when rebooting:
> static void physmap_flash_shutdown(struct platform_device *dev)
> {
>     struct physmap_flash_info *info = platform_get_drvdata(dev);
>     int i;
>     for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
>         if (info->mtd[i]->suspend && info->mtd[i]->resume)
>             if (info->mtd[i]->suspend(info->mtd[i]) == 0)
>                 info->mtd[i]->resume(info->mtd[i]);
> }
> 
> i cant see any point in doing this.  it isnt like the flash has
> buffers that need flushing, and if they did, using suspend/resume as a
> hack for flushing sounds pretty broken to me.
> 
> seems to me the function should just be dropped completely.
> -mike

Wasn't that just to put it into read mode in case the bootloader is
running from the same chip? Reboot doesn't work very well if all you
have is flash status bits at your reset vector, because you didn't
bother to wire up a hardware reset line to the flash.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
