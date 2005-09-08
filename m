Received: from [84.204.75.148] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EDNcs-0005gN-Fc
	for linux-mtd@lists.infradead.org; Thu, 08 Sep 2005 10:43:51 -0400
Message-ID: <43204DFD.7050805@yandex.ru>
Date: Thu, 08 Sep 2005 18:43:09 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: ahgu <ahgu@ahgu.homeunix.com>
References: <023a01c5b483$acdc2070$1f1a12ac@atitech.com>
In-Reply-To: <023a01c5b483$acdc2070$1f1a12ac@atitech.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: How many consecutive write failure can JFFS2 handle?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ahgu wrote:
> 
> I notice in the code that write failure during recover from write error 
> will
> call BUG_ON. halts the kernel.
> Is it true that JFFS2 can only handle one write failure, not consecutive
> write failure.
> 
Please, point file/line number.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
