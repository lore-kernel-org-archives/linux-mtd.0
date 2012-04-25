Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SN6r4-0001NW-Js
 for linux-mtd@lists.infradead.org; Wed, 25 Apr 2012 18:22:19 +0000
Received: by yhjj52 with SMTP id j52so445068yhj.36
 for <linux-mtd@lists.infradead.org>; Wed, 25 Apr 2012 11:22:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1335368299.2094.5.camel@golum>
References: <1335212069-7450-1-git-send-email-computersforpeace@gmail.com>
 <1335368299.2094.5.camel@golum>
Date: Wed, 25 Apr 2012 11:22:17 -0700
Message-ID: <CAN8TOE9T8bUuF5Myyw3zv9C7=h4A0Z1sJPX8dABiB4xe82ihdA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: rework nand_ecc_ctrl interface for OOB
From: Brian Norris <computersforpeace@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: Viresh Kumar <viresh.kumar@st.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Vipin Kumar <vipin.kumar@st.com>, linux-mtd@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Florian Fainelli <ffainelli@freebox.fr>, Lei Wen <leiwen@marvell.com>,
 Jamie Iles <jamie@jamieiles.com>, prabhakar@freescale.com,
 Mike Dunn <mikedunn@newsguy.com>,
 Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>,
 Kevin Cernekee <cernekee@gmail.com>, Bastian Hecht <hechtb@gmail.com>,
 Axel Lin <axel.lin@gmail.com>, Li Yang <leoli@freescale.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>,
 Armando Visconti <armando.visconti@st.com>,
 Thomas Gleixner <tglx@linutronix.de>, Scott Branden <sbranden@broadcom.com>,
 Wolfram Sang <w.sang@pengutronix.de>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Huang Shijie <b32955@freescale.com>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Wed, Apr 25, 2012 at 8:38 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2012-04-23 at 13:14 -0700, Brian Norris wrote:
>> Artem: can you perform your regular compile tests? I compile-tested as many as
>> I could.
>
> Here is what Aiaiai says when I test your patch-set. Note, the mackrell
> failure is not your fault - is does not compile anymore and I did not
> have time to look at it. But you broke the mxs build.

Thanks for the compile test!

> --------------------------------------------------------------------------------
> Failed to build the following commit for configuration "l2_mxs_defconfig" (architecture arm)":
>
> d8d1be5 mtd: nand: nand_base - pass proper 'use_oob' parameter
>
...
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c: In function 'mx23_write_transcription_stamp':
> drivers/mtd/nand/gpmi-nand/gpmi-nand.c:1311:3: error: too few arguments to function 'chip->ecc.write_page_raw'

Shmulik caught this one for me. It's now fixed in my tree and will be
included in my next - and hopefully last - revision, v3.

Thanks again.

Brian

P.S. It seems like you have sent out 2 almost identical copies of this
email. I don't believe this is the first time, so I thought I'd let
you know.
