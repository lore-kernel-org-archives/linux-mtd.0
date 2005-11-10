Received: from webapps.arcom.com ([194.200.159.168])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EaC4a-0007FB-Ul
	for linux-mtd@lists.infradead.org; Thu, 10 Nov 2005 08:02:45 -0500
Message-ID: <437344E0.9040502@cantab.net>
Date: Thu, 10 Nov 2005 13:02:24 +0000
From: David Vrabel <dvrabel@cantab.net>
MIME-Version: 1.0
To: Pavel Machek <pavel@ucw.cz>
References: <20051109221712.GA28385@elf.ucw.cz> <4372B7A8.5060904@mvista.com>
	<20051110095050.GC2021@elf.ucw.cz>
	<1131616948.27347.174.camel@baythorne.infradead.org>
	<20051110103823.GB2401@elf.ucw.cz>
	<1131619903.27347.177.camel@baythorne.infradead.org>
	<20051110105954.GE2401@elf.ucw.cz>
	<1131621090.27347.184.camel@baythorne.infradead.org>
	<20051110120708.GG2401@elf.ucw.cz>
In-Reply-To: <20051110120708.GG2401@elf.ucw.cz>
Content-Type: text/plain; charset=ISO-8859-1
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
> Ok, I got a little bit more forward.
> 
> I created entry like this:
>         {
>                 .mfr_id         = 0x00b0,
>                 .dev_id         = 0x00b0,
>                 .name           = "Collie hack",
>                 .uaddr          = {
>                         [0] = MTD_UADDR_UNNECESSARY,    /* x8 */
>                 },
>                 .DevSize        = SIZE_4MiB,
>                 .CmdSet         = P_ID_INTEL_EXT,
>                 .NumEraseRegions= 1,
>                 .regions        = {
>                         ERASEINFO(0x10000,8),
>                 }
> }
> 
> (Which is probably wrong, I just made up the data)

Shouldn't you get hold of the datasheet for the flash chips and fill in
this information correctly?

David Vrabel
