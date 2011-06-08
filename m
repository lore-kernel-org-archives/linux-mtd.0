Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUF00-0007Hp-ME
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:24:29 +0000
Received: by fxm14 with SMTP id 14so242526fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:24:27 -0700 (PDT)
Subject: Re: [PATCH 28/44] mtd: edb7312.c: use mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-29-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-29-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 12:20:10 +0300
Message-ID: <1307524810.31223.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-07 at 17:36 +0400, Dmitry Eremin-Solenikov wrote:
> -	mtd_device_register(ep7312_mtd, mtd_parts, mtd_parts_nb);
> +	mtd_device_register(ep7312_mtd, NULL, 0,
> +			partition_info, NUM_PARTITIONS);

And probably here?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
