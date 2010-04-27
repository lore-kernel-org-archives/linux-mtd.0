Subject: Re: [PATCH v3 0/2] ARM: MXC: mxc_nand: support i.MX21
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivo Clarysse <ivo.clarysse@gmail.com>
In-Reply-To: <o2qba216b431004080713n9a264511qc4066544cdac10aa@mail.gmail.com>
References: <q2tba216b431004060652jeb9df33eqd141836e46980f00@mail.gmail.com>
	<20100407134039.GE3688@pengutronix.de>
	<o2oba216b431004080520u924ffafby3a88e18471b560b@mail.gmail.com>
	<20100408133303.GK3688@pengutronix.de>
	<o2qba216b431004080713n9a264511qc4066544cdac10aa@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 27 Apr 2010 10:29:36 +0300
Message-ID: <1272353376.26036.2.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-04-08 at 16:13 +0200, Ivo Clarysse wrote:
> Allow mxc_nand.c to function on i.MX21 SoCs, since:
> 
> 1) On i.MX21, if the NFC_INT_MASK bit in NFC_CONFIG1 is set, the NFC_INT
>  bit of NFC_CONFIG2 always reads out zero, even if an operation is
>  completed.
> 
> 2) On i.MX21, sending a RESET command to the NAND flash controller does
>  not trigger an interrupt, nor does it cause the NFC_INT bit of
>  NFC_CONFIG2 to get set.
> 
> 3) After reset is performed, NFC registers are again in their
>  default values.
> 
> This patch series:
> 
> - (Re-)sets all NFC registers after reset
> 
> - Uses enable_irq / disable_irq_nosync instead of NFC_INT_MASK
>   to mask NFC interrupts (allowing NFC_CONFIG2:NFC_INT to used on i.MX21)

Pushed both patches to l2-mtd-2.6.git / dunno with

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

See
http://git.infradead.org/users/dedekind/l2-mtd-2.6.git/shortlog/refs/heads/dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
