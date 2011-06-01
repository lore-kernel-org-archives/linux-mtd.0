Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRiLD-0002DC-Ku
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 10:07:56 +0000
Received: by fxm14 with SMTP id 14so4859682fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 03:07:54 -0700 (PDT)
Subject: Re: [PATCH 1/3] UBIFS: assert no fixup when writing a node
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <4a63933a3365daf8d1ec38d22c9029a949f3eccd.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
	<4a63933a3365daf8d1ec38d22c9029a949f3eccd.1306780983.git.bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 13:03:29 +0300
Message-ID: <1306922609.4405.88.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, "Matthew
	L. Creech" <mlcreech@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-30 at 14:56 -0400, Ben Gardiner wrote:
> The current free space fixup can result in some writing to the UBI volume
> when the space_fixup flag is set.
> 
> To catch instances where UBIFS is writing to the NAND while the space_fixup
> flag is set, add an assert to ubifs_write_node().
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics.ca>
> 
> ---
>  fs/ubifs/io.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/fs/ubifs/io.c b/fs/ubifs/io.c
> index 166951e..db298de 100644
> --- a/fs/ubifs/io.c
> +++ b/fs/ubifs/io.c
> @@ -763,6 +763,8 @@ int ubifs_write_node(struct ubifs_info *c, void *buf, int len, int lnum,
>  	if (c->ro_error)
>  		return -EROFS;
>  
> +	ubifs_assert(!c->space_fixup);
> +

I've moved this assert upper to where all other assertions are placed.

I've also added this assertion to 'ubifs_wbuf_write_nolock()' because it
is the other often used write path.

And pushed to the UBIFS tree, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
