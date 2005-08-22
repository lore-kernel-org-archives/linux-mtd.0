Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E77nC-0004aK-Ae
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 04:36:35 -0400
Message-ID: <43098E60.7020502@yandex.ru>
Date: Mon, 22 Aug 2005 12:35:44 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Komal Shah <komal_shah802003@yahoo.com>
References: <20050821085340.52982.qmail@web53606.mail.yahoo.com>
In-Reply-To: <20050821085340.52982.qmail@web53606.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [omap2420 NOR] mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Komal Shah wrote:
> Hi All,
> 
> I have added the nor flash support for omap2420. I am using the
> omap_nor.c as mapping driver. [note: disabled set_vpp function..as it
> too specifc to omap1].
> 
> o Flash is getting detected, but unable to mount the jffs2 filesystem.
> o Right now I am flashing it through u-boot. [Will try flashing from
> ramdisk..as my jffs2 fs size is ~1.9M]

Which MTD snapshot do you use? Please, try the latest. If you still see 
JFFS2 bugs, enable JFFS2 debugging, gather its output, and send it.

And write about how did you create your JFFS2 image, how did you flash 
it? Try to mount empty flash, create files, remount and see if it is OK.

Thanks.

To MTD developers:

* we probably should add this to the MTD FAQ.
* we probably want to print JFFS2 snapshot version, in order not to 
constantly re-ask people to provide the information about JFFS2 version.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
