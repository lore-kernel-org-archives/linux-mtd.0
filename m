Received: from moutng.kundenserver.de ([212.227.126.177])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 1915so-0002zc-TA
	for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2003 15:40:02 +0100
Received: from [212.227.126.160] (helo=mrelayng.kundenserver.de)
	by moutng.kundenserver.de with esmtp (Exim 3.35 #1)
	id 1915sp-0007QG-00
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2003 16:40:03 +0200
Received: from [217.227.92.20] (helo=comm.esd-electronics.com)
	by mrelayng.kundenserver.de with asmtp (Exim 3.35 #1)
	id 1915so-0001ME-02
	for linux-mtd@lists.infradead.org; Thu, 03 Apr 2003 16:40:03 +0200
From: "Stefan Roese" <stefan.roese@esd-electronics.com>
To: "Thayne Harbaugh" <tharbaugh@lnxi.com>
Date: Thu, 3 Apr 2003 16:38:01 +0200
Message-ID: <EFEAIMDCOOOHIEPHDNFJKEHJFEAA.stefan.roese@esd-electronics.com>
MIME-Version: 1.0
In-reply-to: <1049217336.25948.101.camel@tubarao>
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Wacky JEDEC probes
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Thayne!

> > I am trying to use "jedec_probe.c" on our ppc based board to support two
> > different flash types (AMD AM29VL160xT and SSTI SST39LF160).
> Both are used
> > in 16bit mode. Since the SST flash is not really CFI compliant,
> I have to
> > use jedec_probe, right?
>
> BTW, it looks like you can simplify switch statement in your patch if
> cfi->device_type is a good way to represent the byte width of a device.
> Then again, the intention of cfi->device_type might be intended to be an
> opaque symbol only and using it as a byte width value might be an abuse.

If cfi->device_type can't be used for bus-width checking, how can we do it?
We have to read the chip id from different addresses for different
bus-widths...

Best regards,
Stefan.
