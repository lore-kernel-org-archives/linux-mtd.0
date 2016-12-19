Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cIww7-0003BH-Ao
 for linux-mtd@lists.infradead.org; Mon, 19 Dec 2016 12:21:00 +0000
Date: Mon, 19 Dec 2016 13:20:35 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>, Iwo Mergler
 <iwo.mergler@netcommwireless.com>, Brian Norris
 <computersforpeace@gmail.com>
Subject: Re: [PATCH v1] mtd: nandbiterrs: Have init function return 0 on
 success
Message-ID: <20161219132035.08da2a93@bbrezillon>
In-Reply-To: <49b7d473-ad61-57fa-dfb0-f0b47ed32f76@sigmadesigns.com>
References: <49b7d473-ad61-57fa-dfb0-f0b47ed32f76@sigmadesigns.com>
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

Hi Marc,

On Tue, 13 Dec 2016 15:36:07 +0100
Marc Gonzalez <marc_gonzalez@sigmadesigns.com> wrote:

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

I'm not strongly opposed to this change, but please note that it's
changing the module behavior, and some people might depend on this
rather unusual 'module probe never succeeds' thing.

If all maintainers are okay with that, then I'll ack the patch, but I'd
still prefer if you could switch to the userspace equivalent (recently
added in mtd-utils) to do your regression tests.

One last thing: I'd really like to remove the in-kernel MTD tests at
some point (assuming all the tests have been ported to mtd-utils, or
kselftest), so it's probably not a good idea to design something that
is based on it.

Regards,

Boris
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
