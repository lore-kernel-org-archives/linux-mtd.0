Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOWwY-0006Z4-9D
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 15:21:19 +0000
Received: by eyh6 with SMTP id 6so2131599eyh.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 08:21:17 -0700 (PDT)
Subject: Re: [PATCH 02/62] mtd: introduce mtd_device_(un)register()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Jamie Iles <jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-3-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
	<1306142623-24952-3-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 23 May 2011 18:17:03 +0300
Message-ID: <1306163824.2785.39.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-05-23 at 10:22 +0100, Jamie Iles wrote:
> +/**
> + * mtd_device_register() - register an MTD device
> + *
> + * Register an MTD device with the system and optionally, a number of
> + * partitions.  If nr_parts is 0 then the whole device is registered,
> + * otherwise only the partitions are registered.  To register both the full
> + * device *and* the partitions, call mtd_device_register() twice, once with
> + * nr_parts == 0 and once equal to the number of partitions.
> + *
> + * @master	The MTD device to register.
> + * @parts	The partitions to register - only valid if nr_parts > 0.
> + * @nr_parts	The number of partitions in parts.  If zero then the full
> + *		MTD device is registered.
> + */
> +extern int mtd_device_register(struct mtd_info *master,
> +			       const struct mtd_partition *parts,
> +			       int nr_parts);

It does make sense to describe the function in the "interface" file, but
in the kernel we add the kernel-doc comments above the function
implementation, this is just the established practice. You may find some
examples where the description is in the .h file, but this is rare (yes,
the kernel is fare from being consistent).

So please, move the descriptive comments to mtdcore.c.

Also, please, check the kernel-doc comments buy feeding your file to
scripts kernel-doc and make sure it does not generate errors or
warnings. 

Please, do not re-send all patches, just this one, if possible. Note, if
something requires a minor conflict resolution - I can do this.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
