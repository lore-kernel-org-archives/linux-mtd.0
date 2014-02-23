Date: Sat, 22 Feb 2014 18:37:07 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [patch] mtd: nuc900_nand: NULL dereference in nuc900_nand_enable()
Message-ID: <20140223023707.GA16834@norris-Latitude-E6410>
References: <20140217200308.GA9845@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140217200308.GA9845@elgon.mountain>
Cc: linux-mtd@lists.infradead.org, kernel-janitors@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Wan ZongShun <mcuos.com@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 17, 2014 at 11:03:08PM +0300, Dan Carpenter wrote:
> Instead of writing to "nand->reg + REG_FMICSR" we write to "REG_FMICSR"
> which is NULL and not a valid register.
> 
> Fixes: 8bff82cbc308 ('mtd: add nand support for w90p910 (v2)')
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> Static checker stuff.

Pushed to l2-mtd.git. Thanks!

Brian
