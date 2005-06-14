Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DiAqW-0004gr-Is
	for linux-mtd@lists.infradead.org; Tue, 14 Jun 2005 08:48:49 -0400
Message-ID: <42AED208.70002@yandex.ru>
Date: Tue, 14 Jun 2005 16:48:08 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <004d01c57074$ad3758d0$6702a8c0@niro>
	<loom.20050614T135901-706@post.gmane.org>
In-Reply-To: <loom.20050614T135901-706@post.gmane.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: suggestion on use of linux-mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Sergei Sharonov wrote:
> I am also interested in power fail tolerance of ext3 but could not find
> any test data. People mentioned that it should be better then other 
> journaling filesystem (such as reserfs, jfs, xfs) because of different
> journaling scheme. 
> 
Hi Sergey,

BTW,

I remember you were needing atomicity. Reiser4 supports that.
It supports start transaction/commit semantic, although there is no
such syscall in Linux (yet). Nevertheless, Reiser4 is not stable yet.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
