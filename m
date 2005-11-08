Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EZUDw-0003HO-QI
	for linux-mtd@lists.infradead.org; Tue, 08 Nov 2005 09:13:30 -0500
Message-ID: <4370B25F.4040108@yandex.ru>
Date: Tue, 08 Nov 2005 17:12:47 +0300
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Vahid Fereydunkolahi <fereydunk@yahoo.com>
References: <20051108014506.77991.qmail@web51011.mail.yahoo.com>
In-Reply-To: <20051108014506.77991.qmail@web51011.mail.yahoo.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Two Issues with JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Vahid Fereydunkolahi wrote:
> Hi,
>  We are using the JFFS2 and we have noticed two
> issues:
>    1) In some cases the Linux is non-responsive and it
> takes some times for the Linux to start processing
> other applications running in the system(I beleieve
> the GC is running and is taking all the CPU time).
What's the size/type of your flash?

> 
>   2) In rare cases the JFFS2 uses the obsolete version
> of the pages stored on the flash.
Really? Try to reproduce and send a bug reporte please.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
