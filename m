Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Da9BU-0006Wx-P4
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 05:25:18 -0400
Message-ID: <4291A158.7070606@yandex.ru>
Date: Mon, 23 May 2005 13:24:40 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230933320.25999@kukac.halom.u-szeged.hu>
In-Reply-To: <Pine.LNX.4.61.0505230933320.25999@kukac.halom.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][02/03] nandsim default values in Kconfig
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kluba Patrik wrote:
> +
> + config MTD_NAND_NANDSIM_DELAY
> +        bool "Emulate chip delays"
> +        default y
> +        depends on MTD_NAND_NANDSIM
I presume this should be "no" by default.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
