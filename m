Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bBzhL-0007oq-41
 for linux-mtd@lists.infradead.org; Sun, 12 Jun 2016 07:20:44 +0000
Date: Sun, 12 Jun 2016 09:20:19 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: "George Spelvin" <linux@sciencehorizons.net>
Cc: linux-kernel@vger.kernel.org, richard@nod.at,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Brian
 Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 2/4] mtd: nand: implement two pairing scheme
Message-ID: <20160612092019.79b57b7f@bbrezillon>
In-Reply-To: <20160611223004.20916.qmail@ns.sciencehorizons.net>
References: <20160611223004.20916.qmail@ns.sciencehorizons.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Brian and the MTD ML

Hi George,

On 11 Jun 2016 18:30:04 -0400
"George Spelvin" <linux@sciencehorizons.net> wrote:

> I was just browsing LKML history and wanted to understand this
> concept, but while reading I think I spotted an error.
> 
> 
> +static void nand_pairing_dist3_get_info(struct mtd_info *mtd, int page,
> +					struct mtd_pairing_info *info)
> +{
> +	int lastpage = (mtd->erasesize / mtd->writesize) - 1;
> +	int dist = 3;
> +
> +	if (page == lastpage)
> +		dist = 2;
> +
> +	if (!page || (page & 1)) {
> +		info->group = 0;
> +		info->pair = (page + 1) / 2;
> +	} else {
> +		info->group = 1;
> +		info->pair = (page + 1 - dist) / 2;
> +	}
> +}
> 
> As I understand this, the general rule is that odd pages i are paired with
> even pages i+3, and group = !(i & 1).
> 
> If there are N pages total (numbered 0..N-1), this leaves four exceptions
> to deal with:
> 
> -3 would be apired with 0
> -1 would be paired with 2
> N-3 would be paired with N
> N-1 would be paired with N+2
> 
> This is solved by pairing 0 with 2, and N-1 with N-3.
> 
> In terms of group addresses, there are only two exceptions:
> * 0 is pair 0, group 0 (not pair -1, group 1)
> * N-1 is pair N/2/-1, group 1 (not pair N/2, group 0)
> 
> You have the first exception correct, but not the second; the condition
> detects it, but the change to "dist" doesn't matter since the first half
> of the second if() will be taken.

Indeed. Nice catch!

> 
> 
> I think the easiest way to get this right is the following:
> 
> 	page = page + (page != 0) + (page == lastpage);
> 
> 	info->group = page & 1;
> 	if (page & 1)
> 		page -= dist;
> 	info->pair = page >> 1;
> 
> Rather than make up too many rules, this just maps 0 -> -1 and N-1 -> N,
> then applies the general rule.
> 
> It also applies an offset of +1, to avoid negative numbers and the
> problems of signed divides.

It seems to cover all cases.

> 
> 
> Also, a very minor note: divides are expensive.
> A cheaper way to evaluate the "page == lastpage" condition is
> 
> 	if ((page + 1) * mtd->writesize == mtd->erasesize)
> 
> (or you could add an mtd->write_per_erase field).

Okay. Actually I'd like to avoid adding new 'conversion' fields to the
mtd_info struct. Not sure we are really improving perfs when doing that,
since what takes long is the I/O ops between the flash and the
controller not the conversion operations.

> 
> 
> Applying all of this, the corrected code looks like the following:
> 
> (Note the addition of "const" and "__pure" annotations, which should
> get copied to the "struct mtd_pairing_scheme" declaration.)

I didn't know about the __pure attribute, thanks for mentioning it.
I agree on the const specifier.

> 
> Signed-off-by: George Spelvin <linux@sciencehorizons.net>
> 
> /*
>  * In distance-3 pairing, odd pages i are group 0, and are paired
>  * with even pages i+3.  The exceptions are the first page (page 0)
>  * and last page (page N-1) in an erase group.  These pair as if
>  * they were pages -1 and N, respectively.
>  */
> static void nand_pairing_dist3_get_info(const struct mtd_info *mtd, int page,
> 					struct mtd_pairing_info *info)
> {
> 	page += (page != 0) + ((page + 1) * mtd->writesize == mtd->erasesize);

Can we have a boolean to make it clearer?

	bool lastpage = ((page + 1) * mtd->writesize) == mtd->erasesize;

Also, the page update is quite obscure for people that did not have the
explanation you gave above. Can we make it

	/*
	 * The first and last pages are not surrounded by other pages,
	 * and are thus less sensitive to read/write disturbance.
	 * That's why NAND vendors decided to use a different distance
	 * for these 2 specific case, which complicates a bit the
	 * pairing scheme logic.
	 *
	 * To simplify the code, and keep the same distance for
	 * everyone, we'll increment all pages by 1 except the first
	 * one (page 0).
	 * The last page receives an extra +1 for the same reason.
	 */
	page += (page != 0) + lastpage;

> 

	/*
	 * The datasheets state that odd pages should be part of group
	 * 0 and even ones part of group 1 (except for the last and
	 * first pages) but this has changed when we added + 1 to the
	 * page variable.
	 */
> 	info->group = page & 1;

	/*
	 * We're trying to extract the pair id, which is always equal
	 * to first_page_of_a_pair / 2. Subtract the distance to the
	 * page if it's not part of group 0.
	 */
> 	if (page & 1)
> 		page -= 3;
> 	info->pair = page >> 1;
> }
> 
> static int __pure nand_pairing_dist3_get_wunit(const struct mtd_info *mtd,
> 					const struct mtd_pairing_info *info)
> {

I'll add the same kind of comment here.

> 	int page = 2 * info->pair + 3 * info->group;
> 
> 	page -= (page != 0) + (page * mtd->writesize > mtd->erasesize);
> 	return page;
> }
> 
> const struct mtd_pairing_scheme dist3_pairing_scheme = {
> 	.ngroups = 2,
> 	.get_info = nand_pairing_dist3_get_info,
> 	.get_wunit = nand_pairing_dist3_get_wunit,
> };
> EXPORT_SYMBOL_GPL(dist3_pairing_scheme);
> 
> /*
>  * Distance-6 pairing works like distance-3 pairing, except that pages
>  * are taken two at a time.  The lsbit of the page number is chopped off
>  * and later re-added as the lsbit of the pair number.
>  */
> static void nand_pairing_dist6_get_info(const struct mtd_info *mtd, int page,
> 					struct mtd_pairing_info *info)
> {
> 	bool lsbit = page & 1;
> 
> 	page >>= 1;
> 	page += (page != 0) + ((page+1) * 2*mtd->writesize == mtd->erasesize);
> 
> 	info->group = page & 1;
> 	if (page & 1)
> 		page -= 3;
> 	info->pair = page | lsbit;
> }
> 
> static int __pure nand_pairing_dist6_get_wunit(const struct mtd_info *mtd,
> 				       const struct mtd_pairing_info *info)
> {
> 	int page = (info->pair & ~1) + 3 * info->group;
> 
> 	page -= (page != 0) + (page * 2 * mtd->writesize > mtd->erasesize);
> 	return 2 * page + (info->pair & 1);
> }
> 
> const struct mtd_pairing_scheme dist6_pairing_scheme = {
> 	.ngroups = 2,
> 	.get_info = nand_pairing_dist6_get_info,
> 	.get_wunit = nand_pairing_dist6_get_wunit,
> };
> EXPORT_SYMBOL_GPL(dist6_pairing_scheme);
> 
> 

Thanks for your valuable review/suggestions.

Just out of curiosity, why are you interested in the pairing scheme
concept? Are you working with NANDs?

Best Regards,

Boris

-- 
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
