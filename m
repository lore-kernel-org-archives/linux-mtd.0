Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QRiY5-0003e5-7a
	for linux-mtd@lists.infradead.org; Wed, 01 Jun 2011 10:21:13 +0000
Received: by ewy3 with SMTP id 3so2157787ewy.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 01 Jun 2011 03:21:11 -0700 (PDT)
Subject: Re: [PATCH 3/3] UBIFS: fix-up free space earlier
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ben Gardiner <bengardiner@nanometrics.ca>
In-Reply-To: <546eb16b8aedc7708774ae66bffd6c1175331b49.1306780983.git.bengardiner@nanometrics.ca>
References: <cover.1306780983.git.bengardiner@nanometrics.ca>
	<546eb16b8aedc7708774ae66bffd6c1175331b49.1306780983.git.bengardiner@nanometrics.ca>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 01 Jun 2011 13:16:47 +0300
Message-ID: <1306923407.4405.94.camel@localhost>
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
> The free space fixup is currently initiated during mount after the call to
> ubifs_write_master() which results in a write to PEBs; this has been observed
> with the patch 'assert no fixup when writing a node' applied:
> 
> Move the free space fixup on mount to before the calls to
> ubifs_recover_inl_heads() and ubifs_write_master(). This results in no
> assertions with the previously mentioned patch applied.
> 
> Signed-off-by: Ben Gardiner <bengardiner@nanometrics>
> CC: Matthew L. Creech <mlcreech@gmail.com>
> 
> ---
>  fs/ubifs/super.c |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
> index 89c8d33..531b9b7 100644
> --- a/fs/ubifs/super.c
> +++ b/fs/ubifs/super.c
> @@ -1285,6 +1285,12 @@ static int mount_ubifs(struct ubifs_info *c)
>  	if (err)
>  		goto out_lpt;
>  
> +	if (!c->ro_mount && c->space_fixup) {
> +		err = ubifs_fixup_free_space(c);
> +		if (err)
> +			goto out_infos;
> +	}

Tweaked the patch a bit to make sure 'init_constants_master()' is called
before we start fixing-up - this does not matter now but it is less
error prone. And pushed to the UBIFS git tree, thank you.

But please, do review my tweaks and test them. When you confirm it
works, I'll send a pull request to Linus.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
