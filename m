Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E4zio-0006jE-Qe
	for linux-mtd@lists.infradead.org; Tue, 16 Aug 2005 07:35:25 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <430099D1.8000801@inf.u-szeged.hu>
References: <20050801104343.GB32464@wohnheim.fh-wedel.de>
	<42EE2B78.70500@inf.u-szeged.hu>
	<20050801141841.GD32464@wohnheim.fh-wedel.de>
	<42FB68AE.6070805@inf.u-szeged.hu>
	<20050815094816.GA27229@wohnheim.fh-wedel.de>
	<43007773.2070602@yandex.ru> <43008129.2060303@inf.u-szeged.hu>
	<20050815115943.GD27229@wohnheim.fh-wedel.de>
	<43008A7D.2060302@inf.u-szeged.hu> <43008CD5.1000006@yandex.ru>
	<20050815125254.GA32209@wohnheim.fh-wedel.de>
	<430099D1.8000801@inf.u-szeged.hu>
Content-Type: text/plain
Date: Tue, 16 Aug 2005 15:34:35 +0400
Message-Id: <1124192075.6148.31.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH]fs/jffs2/wbuf.c: add compatibility support for OOB data
	block
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

And one more question:

> +    if (je32_to_cpu(summary->hdr_crc) != crc) {
> +        D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node 
> header is corrupt (bad CRC or no summary at all)\n"));
> +        bad_sum = 1;
> +    }
Ok, we have bad CRC, why do we continue checking the other CRCs?

> +
> +    if ((!bad_sum) && (je32_to_cpu(summary->totlen) != sumsize)) {
> +        D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node
is 
> corrupt (wrong erasesize?)\n"));
> +        bad_sum = 1;
> +    }
The same, why do not use goto here?

> +
> +    crc = crc32(0, summary, sizeof(struct jffs2_summary_node)-8);
> +
> +    if ((!bad_sum) && (je32_to_cpu(summary->node_crc) != crc)) {
> +        D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node
is 
> corrupt (bad CRC)\n"));
> +        bad_sum = 1;
> +    }
Here.

> +
> +    crc = crc32(0, summary->sum, sumsize - sizeof(struct 
> jffs2_summary_node));
> +
> +    if ((!bad_sum) && (je32_to_cpu(summary->sum_crc) != crc)) {
> +        D1(printk(KERN_DEBUG "jffs2_scan_eraseblock(): Summary node 
> data is corrupt (bad CRC)\n"));
> +        bad_sum = 1;
> +    }
Here.

> +
> +    if (!bad_sum) {
> +
> +        struct jffs2_sum_unknown_flash *sp;
> +        sp = (struct jffs2_sum_unknown_flash *) summary->sum;
Now we have:

if (!bad_sum) {
    Huge block where we waste one indent! What for ?
}

return 0;


Why not to do like this:

if (1st crc check fails ())
    goto fail;

if (2nd crc check fails ())
    goto fail;

if (3rd crc check fails ())
    goto fail;

process summary with good CRC ();

fail:

return 0;

And we save one indent which is rather expensive in Linux :-)


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
