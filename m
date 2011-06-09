Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUZfW-0001Vs-HB
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 07:28:43 +0000
Received: by wwb39 with SMTP id 39so1018046wwb.18
	for <linux-mtd@lists.infradead.org>;
	Thu, 09 Jun 2011 00:28:40 -0700 (PDT)
Subject: Re: [PATCH 08/43] mtd: impa7.c: use mtd_device_parse_register
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-9-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
	<1307549152-7085-9-git-send-email-dbaryshkov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 09 Jun 2011 10:24:22 +0300
Message-ID: <1307604262.7374.33.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Russell King <linux@arm.linux.org.uk>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-08 at 20:05 +0400, Dmitry Eremin-Solenikov wrote:
> -			mtd_device_register(impa7_mtd[i],
> -					    mtd_parts[i], mtd_parts_nb[i]);
> +			mtd_device_parse_register(impa7_mtd[i], NULL, 0,
> +					static_partitions,
> +					ARRAY_SIZE(static_partitions));
>  		}

Compare the alignment - original file is aligned with tabs and then few
spaces (the way I prefer), you use only tabs, which is not consistent
with this driver's style. But I'll amend this myself :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
