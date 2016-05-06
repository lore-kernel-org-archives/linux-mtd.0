Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aykO8-0002lO-Jz
 for linux-mtd@lists.infradead.org; Fri, 06 May 2016 18:22:09 +0000
Received: by mail-wm0-x235.google.com with SMTP id g17so90556878wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 06 May 2016 11:21:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160506005617.GB89390@google.com>
References: <1461762862-8090-1-git-send-email-ricardo.ribalda@gmail.com>
 <20160506005617.GB89390@google.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Fri, 6 May 2016 20:21:26 +0200
Message-ID: <CAPybu_3jwwMaNePk6_BNf2ENQaXA9EimHagKDTiu27kq0XaN1Q@mail.gmail.com>
Subject: Re: [PATCH RESEND] mtd: spi-nor: Add support for S3AN spi-nor devices
To: Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Javier Martinez Canillas <javier@osg.samsung.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Jagan Teki <jteki@openedev.com>,
 Marek Vasut <marex@denx.de>, "Andrew F. Davis" <afd@ti.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 =?UTF-8?Q?Ezequiel_Garc=C3=ADa?= <ezequiel@vanguardiasur.com.ar>,
 Furquan Shaikh <furquan@google.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian

Thanks for your comments, and sorry for sending v2 off list and also
not commenting directly to this mail. See my comments bellow

On Fri, May 6, 2016 at 2:56 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Wed, Apr 27, 2016 at 03:14:22PM +0200, Ricardo Ribalda Delgado wrote:

>
> Whoa this is fugly. Why does this mode exist? Can we ignore it and just
> use the poewr-of-two mode? If not, I think we need a bit more verbose of
> comments in the code to explain what/why we are doing.

Indeed it is :). This driver is for a device that is a bit special.

 FPGAs need to read the configuration from somewhere. Traditionally
this is done from a parallel flash, serial flash or another MCU that
bitbangs the configuration. The Spartan 3AN is a family of FPGA with a
serial flash embeeded in the chip:
http://www.xilinx.com/support/documentation/user_guides/ug333.pdf
This family allows you to remove one chip from your BOM.

This flash is mainly written by the FPGA tools, but it can also be
accessed by the FPGA fabric via an internal spi port,  and this is why
I have developed this driver.

The flash is almost a standard spi nor, but with some differences. The
major one being the addressing mode.

By default the flash is accessed using the Default Addressing Mode.
This mode provides an extra 3% space and the FPGA tools expect the
device to be in these mode.

The big disadvantage of this mode is that the 3 byte address is
calculated a bit differently. And therefore we need this nasty convert
function.

The FPGA can also be configured to use Power-of-two mode (standard
mode), but you lose 3% of space (a lot, considering the reduced
resources), it is an irreversible operation and this mode will corrupt
the original data. By default I believe that it is safer to keep the
initial mode. (Check from page 19 of the provided UG).


>

>
> Maybe instead of this flag, you can just use the mfr ID? So:
>
>         if (JEDEC_MFR(info) == SNOR_MFR_...) { // what would you call the "manfacturer" here anyway?
>

The MFR corresponds to Atmel, therefore we cannot use it :(. We need
to probe th whole ID, and I think this is more clean than:


if (id== ID1 || id==ID2...... || id=ID1000){
}

But if you think otherwise I do not have a strong objection to change it.

>
> Brian

Thanks for your review, if you think that there is something else
missing I will fwd v2 to the list, otherwise I will prepare a v2 with
your comments.


-- 
Ricardo Ribalda
