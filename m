Received: from aeryn.fluff.org.uk ([87.194.8.8] helo=kira.home.fluff.org)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MBctV-0006Mt-BE
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 22:55:51 +0000
Date: Tue, 2 Jun 2009 23:55:34 +0100
From: Ben Dooks <ben-linux@fluff.org>
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [MTD] [NAND] S3C2410: Added a kerneldoc for s3c2410_nand_set
Message-ID: <20090602225534.GB26220@fluff.org.uk>
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-7-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-8-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-9-git-send-email-ben-linux@fluff.org>
	<87ws7u2zss.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ws7u2zss.fsf@macbook.be.48ers.dk>
Cc: linux-mtd@lists.infradead.org, Michel Pollet <buserror@gmail.com>,
	Ben Dooks <ben-linux@fluff.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 02, 2009 at 09:36:35PM +0200, Peter Korsgaard wrote:
> >>>>> "Ben" == Ben Dooks <ben-linux@fluff.org> writes:
> 
> Hi,
> 
>  Ben> diff --git a/arch/arm/plat-s3c/include/plat/nand.h b/arch/arm/plat-s3c/include/plat/nand.h
>  Ben> index 9855467..350ec95 100644
>  Ben> --- a/arch/arm/plat-s3c/include/plat/nand.h
>  Ben> +++ b/arch/arm/plat-s3c/include/plat/nand.h
>  Ben> @@ -10,17 +10,19 @@
>  Ben>   * published by the Free Software Foundation.
>  Ben>  */
>  
>  Ben> -/* struct s3c2410_nand_set
>  Ben> +/**
>  Ben> + * struct s3c2410_nand_set - define a set of one or more nand chips
>  Ben> + * @disable_ecc:	Entirely disable ECC - Dangerous
>  Ben> + * @nr_chips:		Number of chips in this set
>  Ben> + * @nr_partitions:	Number of partitions pointed to be partitoons (or zero)
> 
> s/partitoons/partitions/ - And the text sounds pretty confusing to
> me. What about
> 
> Number of struct mtd_partitions pointed to by partitions (or zero)
> 
> Yes, I know it won't fit in 80 chars.

bah, merged the wrong patch. will fix.
 
> -- 
> Bye, Peter Korsgaard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Ben (ben@fluff.org, http://www.fluff.org/)

  'a smiley only costs 4 bytes'
