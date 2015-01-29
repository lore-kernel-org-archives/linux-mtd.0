Date: Thu, 29 Jan 2015 10:46:08 -0600 (CST)
From: Aaron Sierra <asierra@xes-inc.com>
To: Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Message-ID: <391096737.68264.1422549968500.JavaMail.zimbra@xes-inc.com>
In-Reply-To: <1048272995.147101.1421278891164.JavaMail.zimbra@xes-inc.com>
References: <1048272995.147101.1421278891164.JavaMail.zimbra@xes-inc.com>
Subject: Re: [PATCH 1/2 v2] nand_base: SOFT_BCH: Request strength over bytes
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

----- Original Message -----
> From: "Aaron Sierra" <asierra@xes-inc.com>
> Sent: Wednesday, January 14, 2015 5:41:31 PM
> 
> Previously, we requested that drivers pass ecc.size and ecc.bytes when
> using NAND_ECC_SOFT_BCH. However, a driver is likely to only know the ECC
> strength required for its NAND, so each driver would need to perform a
> strength-to-bytes calculation.
> 
> Avoid duplicating this calculation in each driver by asking drivers to
> pass ecc.size and ecc.strength so that the strength-to-bytes calculation
> need only be implemented once.
> 
> This reverts/generalizes this commit:
>     mtd: nand: Base BCH ECC bytes on required strength
> 
> Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> v2:
>     * nandsim: Set ECC strength to chip->ecc.strength
>     * nand_base: Don't provide ECC bytes-to-strength backward compat
> 
>  drivers/mtd/nand/nand_base.c  | 14 ++++++++------
>  drivers/mtd/nand/nandsim.c    |  1 +
>  drivers/mtd/nand/sunxi_nand.c |  2 --
>  3 files changed, 9 insertions(+), 8 deletions(-)
> 

Is this patch still being considered despite the changes requested for
the 2nd patch in this series?

-Aaron
