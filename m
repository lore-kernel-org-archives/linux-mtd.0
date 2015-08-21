Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSiSq-0007gE-FQ
 for linux-mtd@lists.infradead.org; Fri, 21 Aug 2015 09:18:21 +0000
Subject: Re: [PATCH] ubi: do not re-read the data already read out in retry
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
References: <1440143981-20826-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D6ECC4.5070503@nod.at>
Date: Fri, 21 Aug 2015 11:17:56 +0200
MIME-Version: 1.0
In-Reply-To: <1440143981-20826-1-git-send-email-yangds.fnst@cn.fujitsu.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 21.08.2015 um 09:59 schrieb Dongsheng Yang:
> In ubi_io_read(), we will retry if current reading failed
> to read all data we wanted. But we are doing a full re-do
> in the re-try path. Actually, we can skip the data which
> we have already read out in the last reading.
> 
> Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> ---
>  drivers/mtd/ubi/io.c | 19 +++++++++++++------
>  1 file changed, 13 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 5bbd1f0..a3ac643 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -127,7 +127,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
>  		int len)
>  {
>  	int err, retries = 0;
> -	size_t read;
> +	size_t read, already_read = 0;
>  	loff_t addr;
>  
>  	dbg_io("read %d bytes from PEB %d:%d", len, pnum, offset);
> @@ -165,6 +165,7 @@ int ubi_io_read(const struct ubi_device *ubi, void *buf, int pnum, int offset,
>  	addr = (loff_t)pnum * ubi->peb_size + offset;
>  retry:
>  	err = mtd_read(ubi->mtd, addr, len, &read, buf);
> +	already_read += read;

Hmm, this change makes me nervous.

Brian, does MTD core guarantee that upon an erroneous mtd_read() the number of "read" bytes
in "buf" are valid?

So, my fear is that this change will introduce new regressions (due faulty MTD drivers, etc..)
without a real gain.

Thanks,
//richard
