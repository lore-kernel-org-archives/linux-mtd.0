Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1M5xrD-0003PV-4l
	for linux-mtd@lists.infradead.org; Mon, 18 May 2009 08:06:06 +0000
Subject: Re: [PATCH] [UBI] [1/3] ubi notifications API
From: Artem Bityutskiy <dedekind@infradead.org>
To: dpervushin@embeddedalley.com
In-Reply-To: <1241018978.20184.33.camel@hp.diimka.lan>
References: <1241018978.20184.33.camel@hp.diimka.lan>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 18 May 2009 11:05:29 +0300
Message-Id: <1242633929.27996.271.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2009-04-29 at 19:29 +0400, dmitry pervushin wrote:
> +/**
> + * ubi_register_volume_notifier - register the volume notification function.
> + * @nb: pointer to the filled struct &notifier_block
> + * @ignore_existing: boolean flag; if set to 1, UBI will not send notifications
> + * 		     about ADDing existing volumes
> + *
> + * The function @nb.notifier_call will be called when volume is added,
> + * removed, resized or renamed. Its first parameter is &enum
> + * ubi_volume_notification_type, and the second points to the structure
> + * that contains information about "changed" volume - ubi_num and
> + * volume_id. When the notifier is called, it is safe to use all UBI API.
> + *
> + * Returns %0 on success, error code otherwise.
> + */
> +int ubi_register_volume_notifier(struct notifier_block *nb,
> +				 int ignore_existing)
> +{
> +	int err;
> +
> +	err = blocking_notifier_chain_register(&ubi_notifiers, nb);
> +	if (err != 0)
> +		return err;
> +	if (ignore_existing)
> +		return err;
> +	down_read(&ubi_notifiers.rwsem);
> +
> +	ubi_enum_all_volumes(UBI_VOLUME_ADDED, nb);
> +	up_read(&ubi_notifiers.rwsem);
> +	return err;
> +}

You take the rwsem here. Then:
'ubi_enum_all_volumes()' ->
'ubi_enum_volumes()' ->
'blocking_notifier_call_chain()' ->
'blocking_notifier_call_chain()'

and down_read(&nh->rwsem);

Deadlock. Have you tested your code?

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
