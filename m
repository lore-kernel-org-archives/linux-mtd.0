Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBZmr-0005Av-DC
	for linux-mtd@lists.infradead.org; Tue, 02 Jun 2009 19:36:48 +0000
Received: by fxm8 with SMTP id 8so10041433fxm.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 02 Jun 2009 12:36:39 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
To: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [MTD] [NAND] S3C2410: Added a kerneldoc for s3c2410_nand_set
References: <1243705298-21814-1-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-2-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-3-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-4-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-5-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-6-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-7-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-8-git-send-email-ben-linux@fluff.org>
	<1243705298-21814-9-git-send-email-ben-linux@fluff.org>
From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 02 Jun 2009 21:36:35 +0200
In-Reply-To: <1243705298-21814-9-git-send-email-ben-linux@fluff.org> (Ben
	Dooks's message of "Sat\, 30 May 2009 18\:41\:35 +0100")
Message-ID: <87ws7u2zss.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org, Michel Pollet <buserror@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Ben" == Ben Dooks <ben-linux@fluff.org> writes:

Hi,

 Ben> diff --git a/arch/arm/plat-s3c/include/plat/nand.h b/arch/arm/plat-s3c/include/plat/nand.h
 Ben> index 9855467..350ec95 100644
 Ben> --- a/arch/arm/plat-s3c/include/plat/nand.h
 Ben> +++ b/arch/arm/plat-s3c/include/plat/nand.h
 Ben> @@ -10,17 +10,19 @@
 Ben>   * published by the Free Software Foundation.
 Ben>  */
 
 Ben> -/* struct s3c2410_nand_set
 Ben> +/**
 Ben> + * struct s3c2410_nand_set - define a set of one or more nand chips
 Ben> + * @disable_ecc:	Entirely disable ECC - Dangerous
 Ben> + * @nr_chips:		Number of chips in this set
 Ben> + * @nr_partitions:	Number of partitions pointed to be partitoons (or zero)

s/partitoons/partitions/ - And the text sounds pretty confusing to
me. What about

Number of struct mtd_partitions pointed to by partitions (or zero)

Yes, I know it won't fit in 80 chars.

-- 
Bye, Peter Korsgaard
