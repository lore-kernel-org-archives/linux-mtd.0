Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PjYeW-0001Ds-EA
	for linux-mtd@lists.infradead.org; Sun, 30 Jan 2011 14:53:21 +0000
Received: by fxm19 with SMTP id 19so5496858fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 30 Jan 2011 06:53:18 -0800 (PST)
Subject: Re: [PATCH] mtd: fix memory leak
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mathias Krause <minipli@googlemail.com>
In-Reply-To: <1296379908-10150-1-git-send-email-minipli@googlemail.com>
References: <1296379908-10150-1-git-send-email-minipli@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 30 Jan 2011 16:52:33 +0200
Message-ID: <1296399153.2388.57.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Joern Engel <joern@lazybastard.org>, David Woodhouse <dwmw2@infradead.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Sun, 2011-01-30 at 10:31 +0100, Mathias Krause wrote:
> diff --git a/drivers/mtd/devices/phram.c b/drivers/mtd/devices/phram.c
> index 5239328..8d28fa0 100644
> --- a/drivers/mtd/devices/phram.c
> +++ b/drivers/mtd/devices/phram.c
> @@ -117,6 +117,7 @@ static void unregister_devices(void)
>  	list_for_each_entry_safe(this, safe, &phram_list, list) {
>  		del_mtd_device(&this->mtd);
>  		iounmap(this->mtd.priv);
> +		kfree(this->mtd.name);
>  		kfree(this);
>  	}

Since register_device() did not allocate it, unregister_devices() should
not free it. Hence, I think it is better to free(name) just after
calling unregister_devices().

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
