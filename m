Subject: Re: [PATCH] mtd/mxc_nand: add support for multiple chips on V21
	devices
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Baruch Siach <baruch@tkos.co.il>
In-Reply-To: <2731521d2fd2224b7b28cc9ced044fc026d4fdb7.1300085993.git.baruch@tkos.co.il>
References: <2731521d2fd2224b7b28cc9ced044fc026d4fdb7.1300085993.git.baruch@tkos.co.il>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 31 Mar 2011 15:09:53 +0300
Message-ID: <1301573393.2828.51.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Sascha Hauer <kernel@pengutronix.de>,
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

On Mon, 2011-03-14 at 09:01 +0200, Baruch Siach wrote:
> Do the following to add support for up to 4 chips on V21 devices (i.MX25 and
> i.MX35):
> 
> * implement .select_chip for V21
> * adjust existing NFC_V1_V2_BUF_ADDR writes to take chip select into account
> * unlock all chip selects at preset_v1_v2()
> * scan up to 4 devices at .probe
> 
> This has been tested on i.MX25 with two attached NAND chip (on one die).
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Pushed to l2-mtd-2.6.git, thank you.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
