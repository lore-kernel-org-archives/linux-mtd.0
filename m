Received: from mail-wi0-x232.google.com ([2a00:1450:400c:c05::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoVWv-0004It-89
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 09:47:34 +0000
Received: by mail-wi0-f178.google.com with SMTP id ca18so9500513wib.17
 for <linux-mtd@lists.infradead.org>; Thu, 05 Dec 2013 01:47:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
References: <alpine.DEB.2.01.1312051000270.17561@pmeerw.net>
Date: Thu, 5 Dec 2013 10:47:10 +0100
Message-ID: <CAFqH_50vhgJ=ktqmYRo+ZO1bbRmiME+kXVt6sLJL91q9A2S7TA@mail.gmail.com>
Subject: Re: OMAP3 NAND ECC selection
From: Enric Balletbo Serra <eballetbo@gmail.com>
To: Peter Meerwald <pmeerw@pmeerw.net>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Peter,

2013/12/5 Peter Meerwald <pmeerw@pmeerw.net>:
> Hello,
>
> on OMAP3, the NAND area holding MLO and u-boot need a different ECC scheme
> (hw) than the rootfs (sw)
>

There is some discussion around this, please take a look at this thread,

http://www.mail-archive.com/linux-omap@vger.kernel.org/msg98969.html

> is there a way to tell the kernel which ECC scheme to use on a
> per-partition basis?
>

At this moment this is not possible.

> I'd like to be able to update MLO and u-boot from within a booted Linux
> system on the device (I have to resort to u-boot for that where I can
> control the ECC scheme used)
>

Meanwhile, to do this we use a small userspace program created by
Javier Martinez in order to flash the MLO in our OMAP3 boards. See

http://git.isee.biz/?p=pub/scm/writeloader.git;a=summary

Hope it helps you. Regards,
   Enric

> thanks, regards, p.
>
> --
>
> Peter Meerwald
> +43-664-2444418 (mobile)
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
