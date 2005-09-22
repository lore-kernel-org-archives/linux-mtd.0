Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EIKvC-0006p8-08
	for linux-mtd@lists.infradead.org; Thu, 22 Sep 2005 02:51:18 -0400
Message-ID: <43325439.1060307@yandex.ru>
Date: Thu, 22 Sep 2005 10:50:33 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Andrew Lunn <andrew@lunn.ch>
References: <20050921211326.GK8421@lunn.ch> <43324D42.5060407@yandex.ru>
	<20050922064104.GM8421@lunn.ch>
In-Reply-To: <20050922064104.GM8421@lunn.ch>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: Another compiler error: sumtool.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Andrew Lunn wrote:
> Could you define small.
No, I cannot. This must be found out experimentally. I just warned you 
about possible EBS effect.

> I will be checking this anyway. I need to improve the mount time
> performance of eCos's version of JFFS2. For the system i'm working on
> now the eCos redboot loader has JFFS2 from CVS from a year or so
> ago. It takes four or five times longer to mount the filesystem than
> the JFFS2 code in the Linux 2.4.x version of the kernel redboot is
> booting. For the particular application this device is being used in i
> need very fast boot times and currently the RedBoot JFFS2 mount is the
> bottleneck. So i was hopeing that bringing JFFS2 up to date in eCos's
> Redboot and adding EBS might match the performance of the old 2.4.x
> code. Testing will soon tell.

EBS makes mount really faster. But then the JFFS2 checker is working, 
and in case of NOR+EBS it will work longer and eat more CPU. JFFS2 
writers are blocked while the checker is working, so it may slow down 
the boot process. That's the theory, experiments are needed.


-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
