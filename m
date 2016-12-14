Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGyDG-0007kM-AV
 for linux-mtd@lists.infradead.org; Wed, 14 Dec 2016 01:18:31 +0000
Subject: Re: [PATCH] mtd: mtd-utils: Correct casting for final status report
 in flashcp
To: Jon Fether <jonf@mds.com>, linux-mtd@lists.infradead.org
References: <CAGKNqbE+bWgfe60nh5LpjWcu8t5J66Fx7tpjw7FYrCqw_3Wu_Q@mail.gmail.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <237b25c5-6f20-70ce-c96e-b1e617e4396b@sigma-star.at>
Date: Wed, 14 Dec 2016 02:16:51 +0100
MIME-Version: 1.0
In-Reply-To: <CAGKNqbE+bWgfe60nh5LpjWcu8t5J66Fx7tpjw7FYrCqw_3Wu_Q@mail.gmail.com>
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

On 12/14/2016 12:59 AM, Jon Fether wrote:
> Add correct casting for filestat.st_size in flashcp.c. While the
> interim status updates had correct casting from commit 08b243, the
> final update was not.
> 
> Signed-off-by: Jonathan Fether <jonf@mds.com>
> ---
> diff --git a/misc-utils/flashcp.c b/misc-utils/flashcp.c
> index 6594a45..af3c88d 100644
> --- a/misc-utils/flashcp.c
> +++ b/misc-utils/flashcp.c
> @@ -386,8 +386,8 @@ int main (int argc,char *argv[])
>   if (flags & FLAG_VERBOSE)
>   log_printf (LOG_NORMAL,
>   "\rVerifying data: %lluk/%lluk (100%%)\n",
> - KB (filestat.st_size),
> - KB (filestat.st_size));
> + KB ((unsigned long long)filestat.st_size),
> + KB ((unsigned long long)filestat.st_size));
>   DEBUG("Verified %d / %lluk bytes\n",written,(unsigned long
> long)filestat.st_size);

Good catch! The cast used everywhere else in the file is indeed
missing there.

Unfortunately however, the format of your patch seems to be broken.


Thanks,

David
