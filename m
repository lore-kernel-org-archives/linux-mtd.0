Subject: Re: [PATCH 1/3] mxc_nand: set spare size and pages per block
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Ogness <john.ogness@linutronix.de>
In-Reply-To: <80r5i63dn4.fsf@merkur.tec.linutronix.de>
References: <80r5i63dn4.fsf@merkur.tec.linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 29 Aug 2010 15:08:42 +0300
Message-ID: <1283083722.2131.34.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-mtd@lists.infradead.org,
	Baruch Siach <baruch@tkos.co.il>, linux-arm-kernel@lists.infradead.org,
	Ivo Clarysse <ivo.clarysse@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-08-10 at 13:34 +0200, John Ogness wrote:
> This patch sets the NFC registers for spare size and pages per block.
> 
> This patch is against the latest patches from Sascha Hauer.
> 
> Signed-off-by: John Ogness <john.ogness@linutronix.de>
> ---
>  drivers/mtd/nand/mxc_nand.c |   32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)

I'm not picking your patches and assume they'll be sent by Sascha.

-- 
Best Regards,
Artem Bityutskiy (Битюцкий Артём)
