Received: from mail-yk0-x229.google.com ([2607:f8b0:4002:c07::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aLddA-0002Kd-Sd
 for linux-mtd@lists.infradead.org; Tue, 19 Jan 2016 21:16:01 +0000
Received: by mail-yk0-x229.google.com with SMTP id v14so570185880ykd.3
 for <linux-mtd@lists.infradead.org>; Tue, 19 Jan 2016 13:15:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <569E8EEA.6060106@free.fr>
References: <569E8EEA.6060106@free.fr>
Date: Tue, 19 Jan 2016 13:15:39 -0800
Message-ID: <CALupW3A8Wz72enL3Gqpx0=HdOQW0DqQtfVLUQmF=NeyoySn_aQ@mail.gmail.com>
Subject: Re: Using a generic upstream driver with a custom NAND controller
From: Steve deRosier <derosier@gmail.com>
To: Mason <slash.tmp@free.fr>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
 Sebastian Frias <sf84@laposte.net>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mason,



On Tue, Jan 19, 2016 at 11:30 AM, Mason <slash.tmp@free.fr> wrote:
> Hello,
>
> Is there some generic driver upstream that I could try to see if
> it works with this controller?
>
> Note: the SoC is using these chips:
> nand: Micron NAND 512MiB 3,3V 8-bit
> nand: 512MiB, SLC, page size: 2048, OOB size: 64
>

That's a common chip configuration. Calling out the chip ID
specifically might also be of some help. What you have to do is enable
the driver for your NAND controller, the NAND chip isn't that
relevant. Nearly every mainline SoC or processor would have a driver.
If it's truly custom, then in my opinion, you're going to need to
write a driver. Though it should be provided to you by your SoC
vendor. Shame on them for not building the driver right and
upstreaming it.

Odds are they didn't create one from scratch however. That would be
truly strange. Likely they took a stock one and made some custom
changes. You might be able to ask what it was based on and make
changes to the base driver.

While ONFI is a standard way for the flash chips to identify
themselves to a controller and get it to auto-configure, my
understanding is you'd still need a driver for the controller itself
and there's no such thing as a generic controller. Then again I'm
hardly an expert on flash controllers specifically, I usually only
work with the Atmel chips which have a well-supported mainline driver.

Good luck!
- Steve
