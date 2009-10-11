Subject: Re: [PATCH 1/2] Update ts72xx to use generic platform nand driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901DB7967@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901DB7967@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 14:30:21 +0300
Message-Id: <1255260621.16942.38.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Matthieu Crapet <mcrapet@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-10-06 at 18:19 -0400, H Hartley Sweeten wrote:
> Update the ts72xx platform's nand driver support.
> 
> This changes the ts72xx platform from using a custom nand driver
> (ts7250.c) to the generic platform nand driver (plat_nand.c).
> 
> Tested on TS-7250 with 32MB NAND.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Tested-by: Matthieu Crapet <mcrapet@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: <linux-mtd@lists.infradead.org>

Patches do not apply cleanly to current mtd tree. Please, refresh
and resend.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
