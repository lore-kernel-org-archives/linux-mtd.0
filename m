Received: from mail.sigma-star.at ([95.130.255.111])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zf3uu-0004p1-0u
 for linux-mtd@lists.infradead.org; Thu, 24 Sep 2015 10:38:20 +0000
Content-Type: text/plain; charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
Subject: Re: [PATCH] UBI: Validate data_size
From: David Gstir <david@sigma-star.at>
In-Reply-To: <1442959087-9820-1-git-send-email-richard@nod.at>
Date: Thu, 24 Sep 2015 12:37:49 +0200
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2909A36F-2B40-424F-9861-BB992DB2B2BF@sigma-star.at>
References: <1442959087-9820-1-git-send-email-richard@nod.at>
To: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On 22.09.2015, at 23:58, Richard Weinberger <richard@nod.at> wrote:
>=20
> Make sure that data_size is less than LEB size.
> Otherwise a handcrafted UBI image is able to trigger
> an out of bounds memory access in ubi_compare_lebs().
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Richard Weinberger <richard@nod.at>
> ---
> drivers/mtd/ubi/io.c | 5 +++++
> 1 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/mtd/ubi/io.c b/drivers/mtd/ubi/io.c
> index 5bbd1f0..1fc23e4 100644
> --- a/drivers/mtd/ubi/io.c
> +++ b/drivers/mtd/ubi/io.c
> @@ -926,6 +926,11 @@ static int validate_vid_hdr(const struct =
ubi_device *ubi,
> 		goto bad;
> 	}
>=20
> +	if (data_size > ubi->leb_size) {
> +		ubi_err(ubi, "bad data_size");
> +		goto bad;
> +	}
> +

Nice catch!

Reviewed-by: David Gstir <david@sigma-star.at>=
