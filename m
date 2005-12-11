Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ElPij-0003DF-Pu
	for linux-mtd@lists.infradead.org; Sun, 11 Dec 2005 06:50:28 -0500
Message-ID: <439C1255.7020809@yandex.ru>
Date: Sun, 11 Dec 2005 14:49:41 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: "Menon, Nishanth" <x0nishan@ti.com>
References: <520AB2AD990DC04082102F77CA17263801F612A9@dlee03.ent.ti.com>
In-Reply-To: <520AB2AD990DC04082102F77CA17263801F612A9@dlee03.ent.ti.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH] MTD + 2.6.13/2.6.14 OOPS in class_device_create() fix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Menon, Nishanth wrote:
> Does the 
> +#if LINUX_VERSION_CODE < KERNEL_VERSION(2,6,15) && \
> +    LINUX_VERSION_CODE > KERNEL_VERSION(2,6,12)
> Belong to include/linux/mtd/compatmac.h ?
No, I don't think it is a good idea to hid this there.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
