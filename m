Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EbFkh-00042j-Jm
	for linux-mtd@lists.infradead.org; Sun, 13 Nov 2005 06:10:32 -0500
Message-ID: <43771EFF.4090407@yandex.ru>
Date: Sun, 13 Nov 2005 14:09:51 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Todd Poynor <tpoynor@mvista.com>
References: <20051112182155.GE28987@flint.arm.linux.org.uk>
	<437646F5.6080803@mvista.com>
In-Reply-To: <437646F5.6080803@mvista.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Linux MTD <linux-mtd@lists.infradead.org>
Subject: Re: fyi: jornada720 build failure in jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Fixed in linux-mtd CVS.  Avoid with CONFIG_JFFS2_FS_DEBUG=0 in the 
> meantime.
> 
> Thomas, please consider for sending upstream, or give me the word and 
> I'll mail it to Andrew, thanks,
> 
I would just remove that D2() printkeys instead of fixing them.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
