Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZlFE-00067W-4W
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 14:51:01 +0000
Received: by pvg20 with SMTP id 20so1288378pvg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 07:50:52 -0700 (PDT)
Subject: Re: [PATCHv2] UBI: clarify the volume notification types' doc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: David Wagner <david.wagner@free-electrons.com>
Date: Thu, 23 Jun 2011 17:51:36 +0300
In-Reply-To: <4DFF687B.6070806@free-electrons.com>
References: <4DFF129E.6070808@free-electrons.com>
	<4DFF687B.6070806@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308840701.23597.8.camel@sauron>
Mime-Version: 1.0
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

On Mon, 2011-06-20 at 17:34 +0200, David Wagner wrote:
> I realized the new descriptions of ADDED and REMOVED could also be
> misleading: they can also be triggered after using a userland util
> (ubi{mk,rm}vol).
> 
> (the indentation looks odd but is fine once the patch has been applied)
> 
> Signed-off-by David Wagner <david.wagner@free-electrons.com>
> ---
>  include/linux/mtd/ubi.h |   12 +++++++-----
>  1 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/mtd/ubi.h b/include/linux/mtd/ubi.h
> index b31bd9e..b79e741 100644
> --- a/include/linux/mtd/ubi.h
> +++ b/include/linux/mtd/ubi.h
> @@ -134,11 +134,13 @@ struct ubi_device_info {
> 
>  /*
>   * enum - volume notification types.
> - * @UBI_VOLUME_ADDED: volume has been added
> - * @UBI_VOLUME_REMOVED: start volume volume
> - * @UBI_VOLUME_RESIZED: volume size has been re-sized
> - * @UBI_VOLUME_RENAMED: volume name has been re-named
> - * @UBI_VOLUME_UPDATED: volume name has been updated
> + * @UBI_VOLUME_ADDED: a volume has been added (containing device attached
> + *		      or volume created from a userland util)
> + * @UBI_VOLUME_REMOVED: a volume has been removed (containing device
> detached

The patch is corrupted because of line-wrapping, but I fixed it and
amended the comments a bit (did not like the "userland util" phrase),
and pushed to ubi-2.6.git tree, thanks.

-- 
Best Regards,
Artem Bityutskiy
