Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1DupvZ-00063o-TA
	for linux-mtd@lists.infradead.org; Tue, 19 Jul 2005 07:06:42 -0400
Message-ID: <42DCDE8C.702@yandex.ru>
Date: Tue, 19 Jul 2005 15:05:48 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
References: <42DCD1D3.8070303@cetrtapot.si> <42DCD6C1.6010509@yandex.ru>
	<42DCDCDA.2090909@cetrtapot.si>
In-Reply-To: <42DCDCDA.2090909@cetrtapot.si>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Flash is NOR Intel E28F128J3A150.
> 
> I'm booting with NFS enabled kernel and rootfs over NFS, then erasing 
> mtd partition that holds rootfs and then copying rootfs.jffs2 to mtd 
> partition like this:

Could you please enable JFFS2 debugging and post its output?

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
