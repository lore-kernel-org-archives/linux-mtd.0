Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDAUV-0005mb-G2
 for linux-mtd@lists.infradead.org; Wed, 06 Mar 2013 09:18:28 +0000
Message-ID: <1362561546.21850.24.camel@sauron>
Subject: Re: [PATCH mtd-utils] flash_otp_write: fix format string warning
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 06 Mar 2013 11:19:06 +0200
In-Reply-To: <1361378469-18631-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1361378469-18631-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-02-20 at 17:41 +0100, Uwe Kleine-König wrote:
> diff --git a/flash_otp_write.c b/flash_otp_write.c
> index d407ebb..41cf1c5 100644
> --- a/flash_otp_write.c
> +++ b/flash_otp_write.c
> @@ -58,7 +58,7 @@ int main(int argc,char *argv[])
>  		return errno;
>  	}
>  
> -	printf("Writing OTP user data on %s at offset 0x%lx\n", argv[2], offset);
> +	printf("Writing OTP user data on %s at offset 0x%lx\n", argv[2], (unsigned long)offset);

Thanks for the clean-up, but I think last time we discussed this we
agreed to use the new C99 "PRIx64" stuff, and introduced a helper
PRIdoff_t helper which we use for 'off_t' printing. See commit
56840a198a70604ece50d9d727cebcc28930ab4c for example.

-- 
Best Regards,
Artem Bityutskiy
