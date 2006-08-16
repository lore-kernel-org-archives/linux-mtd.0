Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GDHHu-0007Bp-8c
	for linux-mtd@lists.infradead.org; Wed, 16 Aug 2006 10:02:11 +0100
Message-ID: <44E2D85B.6030303@yandex.ru>
Date: Wed, 16 Aug 2006 12:33:31 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Amit Kumar Sharma <sharma.amit@samsung.com>
Subject: Re: JFFS2 problem(amit Kumar sharma)
References: <003101c6c0ea$80b147e0$3d92340c@dsn.sec.samsung.com>
In-Reply-To: <003101c6c0ea$80b147e0$3d92340c@dsn.sec.samsung.com>
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

Amit Kumar Sharma wrote:
> I have one problem related to JFFS2 partition ,My partition size is  20MB
> but I am able to copy more then 20 MB in this partition and strange is after
> rebooting file exist with out any problem ,Can u tell me ,how JFFS2 maintain
> partition size information during copy or file write command.In which area I
> must check in JFFS2 or mtd.

JFFS2 compresses the data so ir is possible that you fit more then 
20MiB. Try to copy mp3 files - you'll you fit less then 20MiB. WRT to 
your question, I'm not sure what to answer - it's too general.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
