Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dQ8V1-0008Se-RU
 for linux-mtd@lists.infradead.org; Wed, 28 Jun 2017 08:39:01 +0000
Subject: Re: [PATCH] mtd-utils: tests: Fix nandbiterrs Failure Check
To: Harpreet Eli Sangha <harpreet@nestlabs.com>, linux-mtd@lists.infradead.org
References: <CAOMZO5CPDSsG9oe5ZV-VVxp9BVB=WU_i03LYtPe8LWy+d=5uAw@mail.gmail.com>
 <20170627205226.18734-1-harpreet@nestlabs.com>
From: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Message-ID: <4ca3dedd-8a8b-c7d8-f82a-0c1f8de5c64b@sigma-star.at>
Date: Wed, 28 Jun 2017 10:38:38 +0200
MIME-Version: 1.0
In-Reply-To: <20170627205226.18734-1-harpreet@nestlabs.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Applied to mtd-utils.git.

Thanks,

David

On 06/27/2017 10:52 PM, Harpreet Eli Sangha wrote:
> From: "Harpreet \"Eli\" Sangha" <harpreet@nestlabs.com>
> 
> After a page read, the old failure statistics are compared against the
> new failure statistics before the new values are actually read.
> 
> Signed-off-by: Harpreet "Eli" Sangha <harpreet@nestlabs.com>
> ---
>  tests/mtd-tests/nandbiterrs.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/mtd-tests/nandbiterrs.c b/tests/mtd-tests/nandbiterrs.c
> index 6acbfee..de9d0dd 100644
> --- a/tests/mtd-tests/nandbiterrs.c
> +++ b/tests/mtd-tests/nandbiterrs.c
> @@ -268,15 +268,15 @@ static int read_page(void)
>  		return -1;
>  	}
>  
> +	if (ioctl(fd, ECCGETSTATS, &new) != 0)
> +		goto failstats;
> +
>  	if (new.failed > old.failed) {
>  		fprintf(stderr, "Failed to recover %d bitflips\n",
>  				new.failed - old.failed);
>  		return -1;
>  	}
>  
> -	if (ioctl(fd, ECCGETSTATS, &new) != 0)
> -		goto failstats;
> -
>  	return new.corrected - old.corrected;
>  failstats:
>  	perror("ECCGETSTATS");
> 
