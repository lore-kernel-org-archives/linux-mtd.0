Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DTFRS-0000ze-FP
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 04:41:16 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: "Ryan B. Lynch" <rlynch@bway.net>
In-Reply-To: <42780E0E.9090005@bway.net>
References: <42780E0E.9090005@bway.net>
Content-Type: text/plain
Date: Wed, 04 May 2005 12:37:35 +0400
Message-Id: <1115195855.8559.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Speed of JFFS2 on compact flash
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-05-03 at 23:49 +0000, Ryan B. Lynch wrote:
> I'm testing a JFFS2 filesystem on a compact flash card.  The filesystem 
> is almost 1GB in size, nearly the entire flash card.
> 
> 'mount' works normally, but it takes a while to finish mounting the 
> device.  Some write operations, especially right after mounting, also 
> take a long time.

The answer is - JFFS2 is very bad solution in such a large flashes. And
it is normal it is slow on them. Please, read http://www.linux-
mtd.infradead.org/tech/JFFS3design/node3.html for more info.
