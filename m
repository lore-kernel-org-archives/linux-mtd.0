Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkqdW-0005hv-4h
 for linux-mtd@lists.infradead.org; Fri, 16 Sep 2016 10:44:52 +0000
Subject: Re: [PATCH v2 16/17] UBI: hide EBA internals
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <1473087908-27862-1-git-send-email-boris.brezillon@free-electrons.com>
 <1473087908-27862-17-git-send-email-boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <646e09d9-d148-b21b-d411-75ebb05dd121@nod.at>
Date: Fri, 16 Sep 2016 12:43:48 +0200
MIME-Version: 1.0
In-Reply-To: <1473087908-27862-17-git-send-email-boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris,

On 05.09.2016 17:05, Boris Brezillon wrote:
> Create a private ubi_eba_table struct to hide EBA internals and provide
> helpers to allocate, destroy, copy and assing an EBA table to a volume.
> 
> Now that external EBA users are using helpers to query/modify the EBA
> state we can safely change the internal representation, which will be
> needed to support the LEB consolidation concept.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
>  drivers/mtd/ubi/build.c |   2 +-
>  drivers/mtd/ubi/eba.c   | 166 ++++++++++++++++++++++++++++++++++++++++--------
>  drivers/mtd/ubi/ubi.h   |   8 ++-
>  drivers/mtd/ubi/vmt.c   |  40 +++++-------
>  4 files changed, 165 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/build.c b/drivers/mtd/ubi/build.c
> index 0680516bb472..45ea1ddebc5c 100644
> --- a/drivers/mtd/ubi/build.c
> +++ b/drivers/mtd/ubi/build.c
> @@ -574,7 +574,7 @@ void ubi_free_internal_volumes(struct ubi_device *ubi)
>  
>  	for (i = ubi->vtbl_slots;
>  	     i < ubi->vtbl_slots + UBI_INT_VOL_COUNT; i++) {
> -		kfree(ubi->volumes[i]->eba_tbl);
> +		ubi_eba_set_table(ubi->volumes[i], NULL);

Why not ubi_eba_destroy_table()? We don't have to reset the pointer to NULL
here.
I'm also not really happy with the name ubi_eba_set_table() because it does
more the setting the table. It destroys also the old one.

What I'm trying to say is, when we bite the bullet and introduce lots of new wrapper
functions to hide internals I want very clear and describing names for them.
I agree that this is a matter of taste but I had a few "Oh this looks wrong" moments
while reviewing this patch just because the naming confused me. After looking
up the code behind the wrapper it was clear.

Thanks,
//richard
