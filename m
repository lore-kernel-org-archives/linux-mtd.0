Received: from mail-bn1bon0099.outbound.protection.outlook.com
 ([157.56.111.99] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJPBM-0004ts-QM
 for linux-mtd@lists.infradead.org; Thu, 05 Feb 2015 16:21:33 +0000
Message-ID: <54D397C8.808@opensource.altera.com>
Date: Thu, 5 Feb 2015 10:18:16 -0600
From: Graham Moore <grmoore@opensource.altera.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: denali: Disable sub-page writes in Denali NAND driver
References: <1421249930-21229-1-git-send-email-dinguyen@opensource.altera.com>
 <CADhT+weaYA1cSQCNP98Ta0ChgxymbBbwtRikdUdcbL2pQB-TXQ@mail.gmail.com>
 <CAFLxGvynJFPECTG5f_ZN_VpgkiZE01MUiJh4Yvj-Pf8MuOit7g@mail.gmail.com>
In-Reply-To: <CAFLxGvynJFPECTG5f_ZN_VpgkiZE01MUiJh4Yvj-Pf8MuOit7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Dinh Nguyen <dinh.linux@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Linux List <linux-kernel@vger.kernel.org>, yamada.m@jp.panasonic.com,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Dinh Nguyen <dinguyen@opensource.altera.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 02/03/2015 04:23 PM, Richard Weinberger wrote:
...

>
> So this driver never worked?
> If it worked for some users we have to make sure that your change does not break
> existing setups.
> /me thinks of UBI.
>

Actually, we made this change to make UBIFS work.  So, yes, the driver 
never worked for UBI.  Worked fine for JFFS2, raw data.

A customer reported an issue with ECC errors when using UBIFS on NAND 
flash with Altera SoC.

We debugged it and found the ECC errors occur because the UBI subsystem 
is trying to write sub-pages in the NAND, but neither the NAND chip 
itself nor the Denali NAND controller support sub-page writes.

In more detail, the UBIFS tries to write a sub-page, but the controller 
writes a whole page instead.  The controller's buffer is initialized to 
FF, so all the data outside the subpage is FF.

But in this case, part of the page in the device is already non-FF.  And 
that data does not change when FF is written to it.

The Denali controller calculates ECC on the data written, but that data 
will not match the data in the device, and so the ECC is incorrect.

When a subsequent read occurs, the ECC will not match and an error will 
occur.

Thanks,
Graham Moore
