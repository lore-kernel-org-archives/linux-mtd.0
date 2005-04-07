Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DJU33-0008Bn-VK
	for linux-mtd@lists.infradead.org; Thu, 07 Apr 2005 06:15:42 -0400
Date: Thu, 7 Apr 2005 11:15:31 +0100 (BST)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050406T200915-152@post.gmane.org>
Message-ID: <Pine.LNX.4.58.0504071055520.20339@phoenix.infradead.org>
References: <loom.20050406T200915-152@post.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: long umount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 6 Apr 2005, Sergei Sharonov wrote:

> Hi,
> I sometimes see excessively long umount times (40-60 s) with jffs2/nand. 
> The platform is a custom at91rm9200 board running linux 2.6.10 with 
> mtd snapshot from 3/28/2005. Umount is from busybox. The umount time varies
> but the system is mostly idle during it unlike during mount. After a few
> operations with filesystem it goes away until sometime later. Has anybody 
> seen that?
>
I see 2 reasons why umounts can be slow:
1. The GC thread receives several SIGHUP signals and JFFS2 waits for 
the GC thread has processed them all and has reached the SIGKILL signal.

2. The final wbuf synchronization founds that there is no space and 
performs GC to free some room. We may imagine scenarios when this may take 
considerable time.

Please, look at jffs2_gcd_mtd thread - does it eat a lot of CPU cycles 
during these long unmounts ?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
