Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MlHCs-0007rl-KV
	for linux-mtd@lists.infradead.org; Wed, 09 Sep 2009 07:03:11 +0000
Message-ID: <4AA7530F.3080401@gmail.com>
Date: Wed, 09 Sep 2009 10:02:39 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Subject: Re: mismatch in MTD Kconfig variables
References: <alpine.LFD.2.00.0909081448280.11685@localhost>
In-Reply-To: <alpine.LFD.2.00.0909081448280.11685@localhost>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/08/2009 09:49 PM, Robert P. J. Day wrote:
>
>    result of latest kernel tree scan:
>
> $ grep -r MTD_DATAFLASH.*VERIFY  drivers
> drivers/mtd/devices/mtd_dataflash.c:#ifdef CONFIG_MTD_DATAFLASH_VERIFY_WRITE
> drivers/mtd/devices/mtd_dataflash.c:#endif	/* CONFIG_MTD_DATAFLASH_VERIFY_WRITE */
> drivers/mtd/devices/Kconfig:config MTD_DATAFLASH_WRITE_VERIFY
> $

So you have a patch to fix this?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
