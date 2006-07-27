Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G65zP-00056z-Of
	for linux-mtd@lists.infradead.org; Thu, 27 Jul 2006 09:33:27 -0400
Message-ID: <44C8C07D.2050909@yandex.ru>
Date: Thu, 27 Jul 2006 17:32:45 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: falls huang <falls.huang@gmail.com>
Subject: Re: question: the performance of jffs2 on UBI
References: <49eab5c80607270530j469f2585w45fbe1d6449c2921@mail.gmail.com>
	<44C8BD55.3040604@yandex.ru>
In-Reply-To: <44C8BD55.3040604@yandex.ru>
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

Artem B. Bityutskiy wrote:
> falls huang wrote:
> 
>> The UBI and jffs2  both provide wear leveling. Will the repeated
>> wear-leveling reduce the performance of system ?
> 
> I guess jffs2 ought to be slower on UBI, but little. My *very* rough 
> test on mtdram device showed that JFFS2 over UBI is about 5% slower. But 
> more accurate testing should be done.

And note: of course, JFFS2 was not designed for UBI, so it does not use 
UBI advantages. But still, it makes a lot of sense to use JFFS2 over UBI 
because in this case you have much freedom in partitioning your flash as 
you like.

I'm planning to return to JFFS3 research/development some day and design 
JFFS2 to work on top of UBI devices.

The alternative way to is to create a good block device layer over UBI, 
and then use conventional file systems (N.B. the mtdblock driver is 
*not* a good block device layer).

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
