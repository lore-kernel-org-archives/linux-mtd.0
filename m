Subject: Re: [PATCH] sst25l.c: simplify reading the device ManID/DevID
From: Artem Bityutskiy <dedekind1@gmail.com>
To: H Hartley Sweeten <hartleys@visionengravers.com>
In-Reply-To: <0D753D10438DA54287A00B0270842697636D85BD7C@AUSP01VMBX24.collaborationhost.net>
References: <0D753D10438DA54287A00B0270842697636D85BD7C@AUSP01VMBX24.collaborationhost.net>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 29 Apr 2010 08:36:38 +0300
Message-ID: <1272519398.7750.67.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"ryan@bluewatersys.com" <ryan@bluewatersys.com>,
	"andre@bluewatersys.com" <andre@bluewatersys.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-04-20 at 18:17 -0500, H Hartley Sweeten wrote:
> The Read-ID command will continuously output the Manufacture ID and Device ID
> until the command is terminated by a low to high transition on the CE# pin.
> We can take advantage of this in the sst25l_match_device routine by reading
> both bytes in one spi_write_then_read transaction.
> 
> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Andre Renaud <andre@bluewatersys.com>
> Cc: Ryan Mallon <ryan@bluewatersys.com>

Pushed to l2-mtd-2.6.git / dunno.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
