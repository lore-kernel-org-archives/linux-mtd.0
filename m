Received: from mail-vc0-x22c.google.com ([2607:f8b0:400c:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W7rXi-0007Y9-1H
 for linux-mtd@lists.infradead.org; Mon, 27 Jan 2014 19:08:22 +0000
Received: by mail-vc0-f172.google.com with SMTP id lf12so3752121vcb.3
 for <linux-mtd@lists.infradead.org>; Mon, 27 Jan 2014 11:07:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA6B2CC@DBDE04.ent.ti.com>
References: <1386925978-23705-1-git-send-email-pekon@ti.com>
 <20140125085537.GA3162@norris-Latitude-E6410>
 <20980858CB6D3A4BAE95CA194937D5E73EA6B2CC@DBDE04.ent.ti.com>
Date: Mon, 27 Jan 2014 11:07:58 -0800
Message-ID: <CAN8TOE9U4uOM8o_k7r_6bHHEEL28zHf=9RJ6NknoQfgkkQgkUg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] mtd: nand: omap: booting from NAND using u-boot
From: Brian Norris <computersforpeace@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Nikita Kiryanov <nikita@compulab.co.il>, "Woodruff,
 Richard" <r-woodruff2@ti.com>, "u-boot@lists.denx.de" <u-boot@lists.denx.de>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "r.meier@siemens.com" <r.meier@siemens.com>, "Rini, Tom" <trini@ti.com>,
 Enric Balletbo Serra <eballetbo@iseebcn.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Scott Wood <scottwood@freescale.com>,
 Javier Martinez Canillas <javier@dowhile0.org>, Stefan Roese <sr@denx.de>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>, "Balbi,
 Felipe" <balbi@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 27, 2014 at 9:46 AM, Gupta, Pekon <pekon@ti.com> wrote:
>>From: Brian Norris
>>
>>1. This patch series talks extensively about U-Boot. U-Boot is not my
>>   interest, nor should it be the focus of kernel (driver) development.
>>   Any work done here should be framed in the kernel driver context. [1]
>>
> Apologies for cross-posting, I understand that you are already flooded by emails
> from linux-mtd list. But my intention was to keep all users of OMAP3 informed,
> as this regression was Reported-by: Enric Balletbo Serra <eballetbo@iseebcn.com>
> while testing mainline u-boot & kernel on OMAP3 platform.

This last line ("while testing mainline u-boot & kernel on OMAP3
platform") is part of what worries me and requires more explanation.
An upgrade to *either* U-Boot or kernel should not cause regressions
for already-supported platforms (if this is new platform support, then
that's different, and it's not exactly a "regression" in that case;
but I know some of the kernel features are new platform support).

> Thanks for you feedbacks.
> I'll fix the commit messages with proper description of the regression,
> And incorporate other comments when I re-send it.

Can you please respond to a few of the concerns before sending a new
patch set? I'd like to have the proper explanation and discussion up
front here, rather than burying it in your long patch descriptions
with test results. Then the end result can go into a proper commit
message, once we're all happy.

> Also, I'll cut-down the
> CC list, as u-boot mailman blocks emails with long CC list.

Yeah, I noticed that after I sent my replies... IMO, you can drop the
u-boot list if that helps.

Brian
