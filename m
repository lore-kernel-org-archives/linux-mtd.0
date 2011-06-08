Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUEhn-0006xm-TR
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 09:05:40 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so222929wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 02:05:39 -0700 (PDT)
Subject: Re: [PATCH 05/44] mtd: bfin-async-flash.c: use
	mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-6-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
	<1307453803-31950-6-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 08 Jun 2011 12:01:22 +0300
Message-ID: <1307523682.31223.32.camel@localhost>
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
> +       mtd_device_parse_register(state->mtd, part_probe_types, 0,
> +                       pdata->parts, pdata->nr_parts);

How about checking the return code? :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
