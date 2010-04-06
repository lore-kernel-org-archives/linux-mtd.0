Subject: Re: [PATCH] mtd: Extend physmap_of to let the device tree specify
	the parition probe
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>
In-Reply-To: <20100309192756.GC30462@obsidianresearch.com>
References: <20100309192756.GC30462@obsidianresearch.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 06 Apr 2010 11:44:38 +0300
Message-ID: <1270543478.6754.10.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-03-09 at 12:27 -0700, Jason Gunthorpe wrote:
> This is to support custom partitioning schemes for embedded PPC. To use
> define your own mtd_part_parser and then add something like:
>    linux,part-probe = "my_probe", "cmdlinepart";
> To the board's dts file.
> 
> If linux,part-probe is not specified then this behaves the same as before.
> 
> Signed-off-by: Jason Gunthorpe <jgunthorpe@obsidianresearch.com>

Taken to my l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
