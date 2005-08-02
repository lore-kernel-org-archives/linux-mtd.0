From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?ISO-8859-1?Q?Cal=F2?= Massimo <m.calo@ctsgroup.it>
In-Reply-To: <000901c59674$72cdf480$050213ac@MCaloMobile>
References: <000901c59674$72cdf480$050213ac@MCaloMobile>
Content-Type: text/plain; charset=ISO-8859-1
Date: Tue, 02 Aug 2005 12:12:04 +0400
Message-Id: <1122970324.16052.29.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "ucLinux-Mtd@Lists. Infradead. Org" <Linux-Mtd@Lists.Infradead.Org>
Subject: Re: Newly-erased Block...
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2005-08-01 at 10:38 +0200, Calò Massimo wrote:
> Artem,
> 
> 	where is the flash driver? Under
> uClinux-dist/linux-2.4.x/drivers/mtd/chips?
> 
> Is this the low-level driver : cfi_cmdset_0002?
> 
> Under /include/linux/mtd/cfi.h I saw that "cfi_write" calls "map->write16()"
> : where is write16 defined ? 
> 
> ...Or do I have to check blkmem.c : flash_amd16_erase, flash_amd16_write,
> flash_amd16_writeall?

All that you can find in <linux>/drivers/mtd/ may be regarded as driver-
related.

> I'm sorry for these questions but I don't have the possibility to debug the
> kernel.
Well, you're in trouble. I cannot help here, sorry :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
