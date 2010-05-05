Subject: Re: [patch 1/2] kirkwood: allow machines to register RnB line with
	mtd driver
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Dooks <ben@simtec.co.uk>
In-Reply-To: <20100429231313.519744154@fluff.org.uk>
References: <20100429231253.465019575@fluff.org.uk>
	<20100429231313.519744154@fluff.org.uk>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 05 May 2010 08:55:48 +0300
Message-ID: <1273038948.3702.56.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: nico@marvell.com, Linux MTD <linux-mtd@lists.infradead.org>,
	buytenh@marvell.com, linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2010-04-30 at 00:12 +0100, Ben Dooks wrote:
> plain text document attachment (slinux)
> Add a kirkwood_nand_init_rnb() call to allow boards which
> have RnB line detection to register this instead of a
> static delay.
> 
> Signed-off-by: Ben Dooks <ben@simtec.co.uk>
> Cc: Linux MTD <linux-mtd@lists.infradead.org>

I have this patch in l2-mtd-2.6 / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
