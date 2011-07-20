Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Date: Wed, 20 Jul 2011 08:19:34 +0300
In-Reply-To: <1311139000.20738.146.camel@sauron>
References: <20004.12663.29494.339601@ipc1.ka-ro>
	<20110718164354.GA3328@S2100-06.ap.freescale.net>
	<4E24E804.10002@freescale.com> <1311139000.20738.146.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1311139179.20738.149.camel@sauron>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>,
	Lothar =?ISO-8859-1?Q?Wa=DFmann?= <LW@KARO-electronics.de>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-07-20 at 08:16 +0300, Artem Bityutskiy wrote:
> This is a different issue. You refer to the "GPMI-controlled flash has
> no space in OOB for JFFS2". Lothar's issue is about "GPMI-controlled
> flash does not allow writing 0xFFs and then writing something else",
> which is very normal.

Huang, to be more precise, I think Lothar's issue is the same as
described here:
http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

Although the description is about UBI and UBIFS - this is applicable
for JFFS2 as well.

-- 
Best Regards,
Artem Bityutskiy
