Received: from mail-wg0-f46.google.com ([74.125.82.46])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZ0Y6-0001Rn-8v
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 15:40:43 +0000
Received: by mail-wg0-f46.google.com with SMTP id m15so1003088wgh.25
 for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2013 08:40:17 -0700 (PDT)
Message-ID: <1382542808.8882.0.camel@karhu.quadriga.com>
Subject: Re: [PATCH] UBI: optimize erase-header IO read checks
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Gupta, Pekon" <pekon@ti.com>
Date: Wed, 23 Oct 2013 16:40:08 +0100
In-Reply-To: <1367212058-10429-1-git-send-email-pekon@ti.com>
References: <1367212058-10429-1-git-send-email-pekon@ti.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 2013-04-29 at 10:37 +0530, Gupta, Pekon wrote:
...
> Signed-off-by: Gupta, Pekon <pekon@ti.com>

I do generally understand what you are trying to do in this patch, but I
cannot carefully review it, because it is too big, just like the second
patch.

It really should be split. I think you should start with a preparation
patch which does not change the current logic, but just transforms the
code to using a switch statement.

Then you should start modifying the big switch statement, preferably one
step per patch, explaining each step. I guess the first step would be
removing the magic numbers check. Another step would be removing the
0xFF comparison. Etc.

Then your work could be reviewed, and we could be somewhat confident
that it does not break anything.

> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index bf79def..624365b 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -537,7 +537,7 @@ static int nor_erase_prepare(struct ubi_device *ubi, int pnum)
>  
>  		err1 = ubi_io_read_ec_hdr(ubi, pnum, &ec_hdr, 0);
>  		if (err1 == UBI_IO_BAD_HDR_EBADMSG || err1 == UBI_IO_BAD_HDR ||
> -		    err1 == UBI_IO_FF)
> +		    err1 == UBI_IO_FF || err1 == UBI_IO_FF_BITFLIPS)

Let's check this change, for example.

The comments in this function say that it is important to have both EC
and VID headers invalid. But here it looks like you allow the EC header
to be valid, but just have a bitflip. But in this function we do want to
make sure both headers are invalid...

This looks incorrect. But may be I just did not understand you changes
in the 'ubi_io_read_ec_hdr()' function.

Anyway, we really need to do everything in a more controllable and
reviewable manner.

-- 
Best Regards,
Artem Bityutskiy

-- 
Best Regards,
Artem Bityutskiy
