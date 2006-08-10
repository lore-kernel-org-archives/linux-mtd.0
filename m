Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GB6ud-0008CF-3G
	for linux-mtd@lists.infradead.org; Thu, 10 Aug 2006 05:33:38 -0400
Message-ID: <44DAFD33.4060104@yandex.ru>
Date: Thu, 10 Aug 2006 13:32:35 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: Re: JFFS2 problem
References: <003d01c6bc57$29ba2700$3d92340c@dsn.sec.samsung.com>
In-Reply-To: <003d01c6bc57$29ba2700$3d92340c@dsn.sec.samsung.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Amit,

Amit Kumar Sharma wrote:
> I am looking for JFFS2 stable version for kernel 2.4, Can u help me because
> I am facing strange problem. My device size is 187M and JFFS2 creating 2G
> file on my device. But when I checked same device partition on 2.6 kernel it
> also show file size 2G "it can not be possible because MTD partition is 187M
> " SO I run same test program on 2.6 kernel. it stops after creating 187M
> file size. SO I wonder may it is a problem of JFFS2 version I am using with
> mvl 2.4.20 kernel.

I'd suggest you to contact MV instead. MTD community is mostly not 
interested in 2.4, so you probably won't get any help here.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
