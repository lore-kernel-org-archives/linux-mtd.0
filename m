Received: from va3ehsobe004.messaging.microsoft.com ([216.32.180.14]
 helo=va3outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TL3P8-0006NM-2o
 for linux-mtd@lists.infradead.org; Mon, 08 Oct 2012 02:49:19 +0000
Message-ID: <50723FCE.4000708@freescale.com>
Date: Mon, 8 Oct 2012 10:51:58 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Vikram Narayanan <vikram186@gmail.com>
Subject: Re: i.MX6S/GPMI-NAND issue on 3.5.4
References: <505CB1ED.8010909@gmail.com>
In-Reply-To: <505CB1ED.8010909@gmail.com>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA09=D4=C222=C8=D5 02:29, Vikram Narayanan =D0=B4=B5=C0:
> Hello,
>
> I'm facing some issue with GPMI-NAND driver on i.MX6 solo.
Does the MX6Q solo support the NAND?
I have the solo board in my hand. But it can not support the NAND.

You make the board yourself?
If so, please check the pinmux for solo.

thanks
Huang Shijie



> I've a TOSHIBA 4KiB page NAND connected to the GPMI.
> (4KiB + 128 bytes OOB)
>
> I tested it using the following,
>
> 1) U-boot v2012.04
> 2) Freescale's U-boot for i.MX6
> 3) Freescale's Kernel 3.0.15
> Result: 0x98 0xAC 0x90 0x26 (Correct)
>
> 4) Linux v3.5.4 stable
> Result: 0x98 0xA8 0x90 0x20 (Incorrect)
>
> When I issue a READID command, 1, 2 & 3 gives me correct results,
> whereas the 3.5.4 version gives me some different result.
>
> Any help would be very much appreciated.
>
> Regards,
> Vikram
>
