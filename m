Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EKaFW-0003qO-3K
	for linux-mtd@lists.infradead.org; Wed, 28 Sep 2005 07:37:39 -0400
Message-ID: <433A804E.5020900@yandex.ru>
Date: Wed, 28 Sep 2005 15:36:46 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Konstantin Kletschke <lists@ku-gbr.de>
References: <87achx7a0l.wl%kletschke@synertronixx.de>	<433A7568.2010000@yandex.ru>
	<878xxh77zp.wl%kletschke@synertronixx.de>
In-Reply-To: <878xxh77zp.wl%kletschke@synertronixx.de>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Inode #274 was a directory with children - removing those too...
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



Konstantin Kletschke wrote:
> It happens on a virgin created image. After that on every mount.
> The partition is used as /.

Refine "virgin created image" please. If you mean you made it by 
mkfs.jffs2 and mount and see that message - there is a bug I think.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
