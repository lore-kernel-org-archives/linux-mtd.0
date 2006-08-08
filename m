Received: from [82.179.117.26] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GALou-0007Si-W6
	for linux-mtd@lists.infradead.org; Tue, 08 Aug 2006 03:16:15 -0400
Message-ID: <44D83A09.6020200@yandex.ru>
Date: Tue, 08 Aug 2006 11:15:21 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Richard Purdie <rpurdie@rpsys.net>
Subject: Re: 2.6.18-rc4 jffs2 problems
References: <1154976111.17725.8.camel@localhost.localdomain>
In-Reply-To: <1154976111.17725.8.camel@localhost.localdomain>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Richard Purdie wrote:
> JFFS2 error: (472) jffs2_get_inode_nodes: short read at 0x074e84: 68 instead of 380.
> JFFS2 error: (472) jffs2_do_read_inode_internal: cannot read nodes for ino 153, returned error is -5
> 
This looks like an MTD problem, not JFFS2.

Try to reproduce this on the mtdram flash emulator. Also, please, check 
if mtd->writesize is correct at your setup (I suppose your flash is NOR 
and it has to be 1).

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
