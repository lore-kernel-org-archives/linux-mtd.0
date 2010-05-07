Subject: RE: [PATCH 2/2] Remove now-defunct ts7250 nand driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <0D753D10438DA54287A00B0270842697636ECB4D36@AUSP01VMBX24.collaborationhost.net>
References: <201001051459.58621.hartleys@visionengravers.com>
	<1262784693.3181.8034.camel@macbook.infradead.org>
	<BD79186B4FD85F4B8E60E381CAEE1909020893C9@mi8nycmail19.Mi8.com>
	<1262799737.3181.8388.camel@macbook.infradead.org>
	<BD79186B4FD85F4B8E60E381CAEE1909020893D4@mi8nycmail19.Mi8.com>
	<0D753D10438DA54287A00B0270842697636ECB4D36@AUSP01VMBX24.collaborationhost.net>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 07 May 2010 09:01:09 +0300
Message-ID: <1273212069.2178.9.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "joff@embeddedarm.com" <joff@embeddedarm.com>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	"mcrapet@gmail.com" <mcrapet@gmail.com>,
	ARM Kernel <linux-arm-kernel@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-06 at 11:47 -0500, H Hartley Sweeten wrote:
> Hello David,
> 
> Do you know the status of these two patches in linux-next:

I'm not David, but I think I know the answer. Last merge window was
missed and the mtd tree was not merged, so the patches are waiting for
the next merge window and will be merged.

[snip]

> I have some pending patches for arch/arm/mach-ep93xx/ts72xx.c that
> depend on these.

Just send your depending patches.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
