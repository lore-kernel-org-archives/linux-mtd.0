Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D9ioL-00067O-0n
	for linux-mtd@lists.infradead.org; Fri, 11 Mar 2005 07:00:10 -0500
Message-ID: <42318828.9030806@yandex.ru>
Date: Fri, 11 Mar 2005 14:59:36 +0300
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Konstantin Kletschke <lists@ku-gbr.de>
References: <20050311104457.GB11203@synertronixx3> <42317DD7.3090205@yandex.ru>
	<20050311112730.GC11203@synertronixx3>
In-Reply-To: <20050311112730.GC11203@synertronixx3>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: jffs2 with sync burst mode
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Konstantin Kletschke wrote:
> But is moving the memcpy function a valid fix? There must be something
> really wrong which should be fixed :/ DCache corruption i.e. missing
> invalidating at the right time?
Err, how can ti be valid? Do you see any problem in JFFS2 itself?

AFAIU, you have problems in layers which are bellow JFFS2. JFFS2 itself 
is correct. Your fix in JFFS2 is not actually fix, you have just hidden 
your problem, right?

Unfortunately, I can't help you with your Dcache problems. In fact, I 
have very limited NOR experience for now, and I might help if you find 
bugs in JFFS2, not in underlying drivers. May be anybody else...


> But if I understood correct the not created-cleanmarkers-by-bootloader
> problem is "solved" on second boot? I see this here also, the 1st mount
> takes ages, the following are fast.
This depends on how long have you used JFFS2 after the first mount. 
Blocks aren't erased immediately on mount. Instead, this work is done 
later. So, *some* blocks *might* stay not re-erased.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
