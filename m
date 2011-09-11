Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1R2kUl-0007G8-Pd
	for linux-mtd@lists.infradead.org; Sun, 11 Sep 2011 13:54:52 +0000
Received: by yic13 with SMTP id 13so2102939yic.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 11 Sep 2011 06:54:50 -0700 (PDT)
Subject: Re: [PATCH 03/14] mtd: define `is_ecc_error()' macros
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sun, 11 Sep 2011 16:57:15 +0300
In-Reply-To: <1315426421-16243-4-git-send-email-computersforpeace@gmail.com>
References: <1315426421-16243-1-git-send-email-computersforpeace@gmail.com>
	<1315426421-16243-4-git-send-email-computersforpeace@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1315749440.18731.65.camel@sauron>
Mime-Version: 1.0
Cc: Kevin Cernekee <cernekee@gmail.com>,
	Matthieu Castet <matthieu.castet@parrot.com>,
	Jim Quinlan <jim2101024@gmail.com>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Matthew Creech <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-09-07 at 13:13 -0700, Brian Norris wrote:
> These macros can be used instead of including -EUCLEAN and -EBADMSG all
> over the place. They should help make code a little bit more readable.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> ---
>  include/linux/mtd/mtd.h |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
> index ead70ed..1dd74f4 100644
> --- a/include/linux/mtd/mtd.h
> +++ b/include/linux/mtd/mtd.h
> @@ -348,4 +348,9 @@ void *mtd_kmalloc_up_to(const struct mtd_info *mtd, size_t *size);
>  
>  void mtd_erase_callback(struct erase_info *instr);
>  
> +#define is_corrected_ecc_error(error) (error == -EUCLEAN)

This is not really an error...

> +#define is_uncorrected_ecc_error(error) (error == -EBADMSG)
> +#define is_ecc_error(error) ((is_corrected_ecc_error(error) || \
> +			      is_uncorrected_ecc_error(error)))

Could we please have static inline functions instead of macros?

I think it is nicer to have mtd_ prefixes, how about these names
instead:

mtd_is_bitflip()
mtd_is_eccerr()
mtd_is_bitflip_or_eccerr()

-- 
Best Regards,
Artem Bityutskiy
