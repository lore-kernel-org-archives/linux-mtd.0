Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q75DM-0003Aq-QP
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 12:18:33 +0000
Received: by ewy3 with SMTP id 3so93032ewy.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 05:18:30 -0700 (PDT)
Subject: Re: [PATCH V6] MIPS: lantiq: add NOR flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
In-Reply-To: <1302005720-8508-1-git-send-email-blogic@openwrt.org>
References: <1302005720-8508-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 15:15:51 +0300
Message-ID: <1302005751.2760.116.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
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

On Tue, 2011-04-05 at 14:15 +0200, John Crispin wrote:
> +int __init
> +init_ltq_mtd(void)
> +{
> +	int ret = platform_driver_probe(&ltq_mtd_driver, ltq_mtd_probe);
> +
> +	if (ret)
> +		pr_err(KERN_INFO "ltq_nor: error registering platfom driver");

Sorry, but pr_err is defined as follows:

#define pr_err(fmt, ...) \
        printk(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)

You should not add KERN_INFO.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
