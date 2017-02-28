Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cioux-0006Gh-NP
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 21:02:46 +0000
Subject: Re: [PATCH] ubi/upd: always flush after prepared for an update
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Artem Bityutskiy <dedekind1@gmail.com>
References: <20170222161521.4foobhoyelnrad7h@linutronix.de>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <a0902bd5-b4d9-5b2d-c909-115c4523c370@nod.at>
Date: Tue, 28 Feb 2017 22:02:14 +0100
MIME-Version: 1.0
In-Reply-To: <20170222161521.4foobhoyelnrad7h@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sebastian,

Am 22.02.2017 um 17:15 schrieb Sebastian Andrzej Siewior:
> In commit 6afaf8a484cb ("UBI: flush wl before clearing update marker") I
> managed to trigger and fix a similar bug. Now here is another version of
> which I assumed it wouldn't matter back then but it turns out UBI has a
> check for it and will error out like this:
> 
> |ubi0 warning: validate_vid_hdr: inconsistent used_ebs
> |ubi0 error: validate_vid_hdr: inconsistent VID header at PEB 592
> 
> All you need to trigger this is? "ubiupdatevol /dev/ubi0_0 file" + a
> powercut in the middle of the operation.
> ubi_start_update() sets the update-marker and puts all EBs on the erase
> list. After that userland can proceed to write new data while the old EB
> aren't erased completely. A powercut at this point is usually not that
> much of a tragedy. UBI won't give read access to the static volume
> because it has the update marker. It will most likely set the corrupted
> flag because it misses some EBs.
> So we are all good. Unless the size of the image that has been written
> differs from the old image in the magnitude of at least one EB. In that
> case UBI will find two different values for `used_ebs' and refuse to
> attach the image with the error message mentioned above.

Meh... ;-\

> So in order not to get in the situation, the patch will ensure that we
> wait until everything is removed before it tries to write any data.
> The alternative would be to detect such a case and remove all EBs at the
> attached time after we processed the volume-table and see the
> update-marker set. The patch looks bigger and I doubt it is worth it
> since usually the write() will wait from time to time for a new EB since
> usually there not that many spare EB that can be used.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>  drivers/mtd/ubi/upd.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/mtd/ubi/upd.c b/drivers/mtd/ubi/upd.c
> index 0134ba32a057..39712560b4c1 100644
> --- a/drivers/mtd/ubi/upd.c
> +++ b/drivers/mtd/ubi/upd.c
> @@ -148,11 +148,11 @@ int ubi_start_update(struct ubi_device *ubi, struct ubi_volume *vol,
>  			return err;
>  	}
>  
> -	if (bytes == 0) {
> -		err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
> -		if (err)
> -			return err;
> +	err = ubi_wl_flush(ubi, UBI_ALL, UBI_ALL);
> +	if (err)
> +		return err;

Unconditionally calling ubi_wl_flush() will slow down ubiupdatevol.
Wouldn't it make sense to flush only if bytes is 0 or differs from the old value?

Thanks,
//richard
