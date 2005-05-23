Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Da8fA-0005wL-Bt
	for linux-mtd@lists.infradead.org; Mon, 23 May 2005 04:51:54 -0400
Message-ID: <4291997E.70306@yandex.ru>
Date: Mon, 23 May 2005 12:51:10 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Kluba Patrik <pajko@kukac.halom.u-szeged.hu>
References: <Pine.LNX.4.61.0505230926540.25999@kukac.halom.u-szeged.hu>
In-Reply-To: <Pine.LNX.4.61.0505230926540.25999@kukac.halom.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH][01/03] nandsim bugfix
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Kluba Patrik wrote:
> 
> Hi!
> 
> There are two bugs in nandsim. The first is in Kconfig. MTD_NAND_NANDSIM 
> is defined as a bool value, so it can have a value of 'y' or be 
> undefined. This way nandsim cannot be compiled as a module, it will 
> directly go into the kernel.
Hi Patrik,

looks OK, thanks.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
