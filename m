Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MfX4J-0001Kd-TV
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 10:46:36 +0000
Message-ID: <4A926F79.4030700@users.sourceforge.net>
Date: Mon, 24 Aug 2009 12:46:17 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: linux newbie <linux.newbie79@gmail.com>
Subject: Re: JFFS2 crash in linux-2.6.30
References: <a64f67eb0908202331q73230351pe27f1434470707ae@mail.gmail.com>	<1c3f4270908211108w416019deh9aa4b2575d6a1b82@mail.gmail.com>
	<a64f67eb0908231707k80cf8c9m11e9074c11c48abe@mail.gmail.com>
In-Reply-To: <a64f67eb0908231707k80cf8c9m11e9074c11c48abe@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Manoj <manoj23@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

linux newbie wrote:
> I tried this patch, after which I am not getting crash, but instead it shows
> cp: input/output error. and this is not consistent. somtimes, file
> copying is perfect and some times its not.

You get this when you write to a dnode whose previous data resides
in a NAND block that has gone bad.

Have you set CONFIG_JFFS2_FS_WBUF_VERIFY?
