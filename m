Received: from mail1.bemta8.messagelabs.com ([216.82.243.194])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIvE0-000238-E0
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 10:31:21 +0000
Subject: Re: [PATCH v1] mtd: nandbiterrs: Have init function return 0 on
 success
From: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Richard Weinberger
 <richard@nod.at>
CC: linux-mtd <linux-mtd@lists.infradead.org>, Iwo Mergler
 <iwo.mergler@netcommwireless.com>, Brian Norris <computersforpeace@gmail.com>
References: <49b7d473-ad61-57fa-dfb0-f0b47ed32f76@sigmadesigns.com>
Message-ID: <5e808670-17e8-a016-28df-603970ce913d@sigmadesigns.com>
Date: Mon, 19 Dec 2016 11:30:54 +0100
MIME-Version: 1.0
In-Reply-To: <49b7d473-ad61-57fa-dfb0-f0b47ed32f76@sigmadesigns.com>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Language: 
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 13/12/2016 15:36, Marc Gonzalez wrote:

> The init function currently returns -EIO on success. This behavior
> was probably chosen in order to avoid a subsequent rmmod, but this
> complicates failure detection from user-space.
> 
> Signed-off-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
> ---
> I'm not sure failures are reported as expected. I would expect
> the test to report a failure if the driver cannot fix less than
> $STRENGTH bit flips, but it doesn't, AFAICT.
> cf. incremental_errors_test which sets err to 0 in the 
> "After %d biterrors per subpage, read reported error %d\n"
> code path.
> ---
>  drivers/mtd/tests/nandbiterrs.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/mtd/tests/nandbiterrs.c b/drivers/mtd/tests/nandbiterrs.c
> index f26dec896afa..41050bcae9f1 100644
> --- a/drivers/mtd/tests/nandbiterrs.c
> +++ b/drivers/mtd/tests/nandbiterrs.c
> @@ -403,7 +403,6 @@ static int __init mtd_nandbiterrs_init(void)
>  	if (err)
>  		goto exit_error;
>  
> -	err = -EIO;
>  	pr_info("finished successfully.\n");
>  	printk(KERN_INFO "==================================================\n");
>  

What are your thoughts on this patch?

Regards.
