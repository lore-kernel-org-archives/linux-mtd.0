Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEcK-0006nX-H3
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:00:01 +0000
Received: by fxm14 with SMTP id 14so226924fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 01:59:58 -0700 (PDT)
Subject: Re: [PATCH 01/44] mtd: add new API for handling MTD registration
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307461738-16811-1-git-send-email-dbaryshkov@gmail.com>
References: <20110607134429.GE21174@pulham.picochip.com>
	<1307461738-16811-1-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 11:55:40 +0300
Message-ID: <1307523340.31223.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Jamie Iles <jamie@jamieiles.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I agree we need a good comment, but I find this one difficult to follow.

On Tue, 2011-06-07 at 19:48 +0400, Dmitry Eremin-Solenikov wrote:
>  /**
> + * mtd_device_parse_register - register an MTD device.

Not just register, it also contains parsing functionality.

> + *
> + * @mtd: the MTD device to register
> + * @part_probe_types: the list of MTD partition probes to try

Please, name it 'types' to be consistent with 'parse_mtd_partitions()'.
Also, you do not say that this can be %NULL. With my patch, you can
refer the reader like "see 'parse_mtd_partitions()' for more
information'.

> + * @origin: start address of MTD device. =0 unless you are sure you need this.

Try to avoid using dots. Also, constants should be prefixed with %,
i.e., use %0.

> + * @defparts: default partition information to register. Only valid if
> + *		defnr_parts > 0

Ditto about a dot, prefix variables with @, i.e., in this case:
@defnr_parts > %0.

Also about naming: why "default"? What is default there? This is more
like "alternative, or fall-back" - you first try to detect partition
specified in @part_probe_types, if if you fail - you use "alternative"
partitions.

Please, rename it.

> + * @defnr_parts: the number of partitions in defparts.  If zero then the full
> + *		MTD device is registered if no partition info is found

Ditto.

> + *
> + * Extract partition info and register MTD device (partitions or a whole device)
> + * It calls parse_mtd_partitions(), checks the result. If there were no
> + * partitions found, it uses default info specified (via defparts/defnr_parts)
> + * and then registers either partitions, or (if no partitions were
> + * found/specified) the whow MTD.
> + */

Sorry, I find this unreadable.

I suggest something like this.

This function aggregates MTD partitions parsing (done by
'parse_mtd_partitions()') and MTD device and partitions registering. It
basically follows the most common pattern found in many MTD drivers:

o It first tries to probe partitions on MTD device @mtd using parsers
  specified in @types (if @types is %NULL, then the default list of
  parsers is used, see 'parse_mtd_partitions()' for more information).
o If this succeeds, this function registers the found partitions, as
  well as the whole MTD device @mtd.
o If no partitions were found this function just registers the MTD
  device @mtd and exits.

Returns zero in case of success and a negative error code in case of
failure.

Would you please amend the patch and re-send?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
