Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Ebasj-0006ba-Pg
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2005 04:44:11 -0500
Message-ID: <43785C48.1010202@yandex.ru>
Date: Mon, 14 Nov 2005 12:43:36 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: =?UTF-8?B?IumZs+e+v+mAniBcXChDaHVja1xcKSI=?= <ycchen@realtek.com.tw>
References: <010201c5e43f$796bd5f0$135415ac@realtek.com.tw>
	<1131887362.3479.29.camel@sauron.oktetlabs.ru>
	<007e01c5e8e4$5fb80490$135415ac@realtek.com.tw>
In-Reply-To: <007e01c5e8e4$5fb80490$135415ac@realtek.com.tw>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CRC error of jffs2_get_inode_nodes() for JFFS2 on NAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>  Thanks for your information.
>  Dose it to say that is there a possibility to make data missing if we
> interrupt the GC operation just like shutdowm the system before a wbuf flush
> ?
>  In my system, the JFFS2 CRC error of inode always happens after a reboot.

Yes, in case of unclean reboots you loose the write-buffer's contents. 
It contains the most recently data only. To force sync-ing you may do 
fsync() in your applications.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
