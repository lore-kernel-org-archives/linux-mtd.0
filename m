Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TYuox-0001YA-Bg
 for linux-mtd@lists.infradead.org; Thu, 15 Nov 2012 08:29:12 +0000
Received: by mail-bk0-f49.google.com with SMTP id j4so547358bkw.36
 for <linux-mtd@lists.infradead.org>; Thu, 15 Nov 2012 00:29:07 -0800 (PST)
Message-ID: <50A4A7D0.3060400@gmail.com>
Date: Thu, 15 Nov 2012 09:29:04 +0100
From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH for 3.7] mtd: nand: fix Samsung SLC detection regression
References: <1352958390-15553-1-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1352958390-15553-1-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/15/2012 06:46 AM, Brian Norris wrote:
> This patch fixes errors seen in identifying old Samsung SLC, due to the
> following commits:
>
>      commit e2d3a35ee427aaba99b6c68a56609ce276c51270
>      mtd: nand: detect Samsung K9GBG08U0A, K9GAG08U0F ID
>
>      commit e3b88bd604283ef83ae6e8f53622d5b1ffe9d43a
>      mtd: nand: add generic READ ID length calculation functions
>
> Some Samsung NAND with "5-byte" ID really appear to have 6-byte IDs, with
> wraparound like:
>
>    Samsung K9K8G08U0D
>    ec d3 51 95 58 ec ec d3
>
>    Samsung K9F1G08U0C
>    ec f1 00 95 40 ec ec f1
>
>    Samsung K9F2G08U0B
>    ec da 10 95 44 00 ec da
>
> This bad wraparound makes it hard to reliably detect the difference
> between Samsung SLC with 5-byte ID and Samsung SLC with 6-byte ID.
>
> The fix is to, for now, only use the new Samsung table for MLC. We
> cannot support the new SLC (K9FAG08U0M) until Samsung gives better ID
> decode information.
>
> Note that this applies in addition to the previous regression fix:
>
>      commit bc86cf7af2ebda88056538e8edff852ee627f76a
>      mtd: nand: fix Samsung SLC NAND identification regression
>
> Together, these patches completely restore the previous detection
> behavior so that we cannot see any more regressions in Samsung SLC NAND
> (finger crossed). With luck, I can get a hold of a Samsung
> representative and stop having to cross my fingers eventually.
>
> Reported-by: Sylwester Nawrocki<sylvester.nawrocki@gmail.com>
> Signed-off-by: Brian Norris<computersforpeace@gmail.com>

Together with patch
mtd: nand: fix Samsung SLC NAND identification regression

this fixes K9F1G08U0C Flash detection regression for me.

Tested-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

Thanks!
Sylwester

> ---
>
> David: please note that this (and the aforementioned commit bc86cf7a) are
> urgently in need of a pull request for the 3.7 cycle. I have received several
> regression reports now, which I have addressed. I would greatly appreciate your
> attention here!
>
>   drivers/mtd/nand/nand_base.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index d5ece6e..1a03b7f 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2990,6 +2990,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
>   	 * ID to decide what to do.
>   	 */
>   	if (id_len == 6&&  id_data[0] == NAND_MFR_SAMSUNG&&
> +			(chip->cellinfo&  NAND_CI_CELLTYPE_MSK)&&
>   			id_data[5] != 0x00) {
>   		/* Calc pagesize */
>   		mtd->writesize = 2048<<  (extid&  0x03);
