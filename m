Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1G65mL-0004nq-M1
	for linux-mtd@lists.infradead.org; Thu, 27 Jul 2006 09:20:02 -0400
Message-ID: <44C8BD55.3040604@yandex.ru>
Date: Thu, 27 Jul 2006 17:19:17 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: falls huang <falls.huang@gmail.com>
Subject: Re: question: the performance of jffs2 on UBI
References: <49eab5c80607270530j469f2585w45fbe1d6449c2921@mail.gmail.com>
In-Reply-To: <49eab5c80607270530j469f2585w45fbe1d6449c2921@mail.gmail.com>
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

falls huang wrote:
> The UBI and jffs2  both provide wear leveling. Will the repeated
> wear-leveling reduce the performance of system ?
I guess jffs2 ought to be slower on UBI, but little. My *very* rough 
test on mtdram device showed that JFFS2 over UBI is about 5% slower. But 
more accurate testing should be done.

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
