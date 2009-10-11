Subject: Re: [PATCH 2/2] Remove now-defunct ts7250 nand driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <BD79186B4FD85F4B8E60E381CAEE190901DB7969@mi8nycmail19.Mi8.com>
References: <BD79186B4FD85F4B8E60E381CAEE190901DB7969@mi8nycmail19.Mi8.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 11 Oct 2009 14:31:18 +0300
Message-Id: <1255260678.16942.39.camel@localhost>
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

On Tue, 2009-10-06 at 18:26 -0400, H Hartley Sweeten wrote:
> The ts72xx platform has been updated to use the generic platform nand
> driver (plat_nand.c).  This removes the now-defunct ts7250.c nand driver.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: Matthieu Crapet <mcrapet@gmail.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: <linux-arm-kernel@lists.infradead.org>
> Cc: <linux-mtd@lists.infradead.org>
> 
> ---

Would be nice to make sure you have diffstat here, to show that you
actually remove files. I thing git-format-patch does this by default.

Anyway, the patch does not apply, please, refresh against current mtd
tree.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
