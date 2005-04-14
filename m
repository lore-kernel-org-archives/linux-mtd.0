Received: from fobos.marketsite.ru ([62.152.84.30] helo=relay1.dataart.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DM66Z-0005js-MD
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 11:18:08 -0400
Message-ID: <425E89AB.9030307@yandex.ru>
Date: Thu, 14 Apr 2005 19:18:03 +0400
From: "Artem B. Bityuckiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
References: <loom.20050413T142519-107@post.gmane.org>	<1113400225.23175.9.camel@sauron.oktetlabs.ru>	<loom.20050413T160136-559@post.gmane.org>	<1113404557.23175.23.camel@sauron.oktetlabs.ru>	<loom.20050413T193912-984@post.gmane.org>	<Pine.LNX.4.58.0504140941040.3328@phoenix.infradead.org>	<loom.20050414T140640-566@post.gmane.org>	<Pine.LNX.4.58.0504141409200.3328@phoenix.infradead.org>
	<loom.20050414T151238-645@post.gmane.org>
In-Reply-To: <loom.20050414T151238-645@post.gmane.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mounting jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Sergei Sharonov wrote:
> Sorry, I meant two partitions. (blocks is sense of /dev/mtdblock ;)
It's hard to answer, I don't know your task and requirements.

> I'll run a test with 10x20 MByte files and post results.
It would be nice. If you provide mount time speeds with depending on how 
many data is placed on flash, it would be nice. I then add these numbers 
to the JFFS3 document for reference (the brief description of your 
system would be useful as well).

> What would be a time frame for a stable JFFS3 solution assuming there is a 
> support?
Design is even not ready yet. But I'd say it could take 4-6 months
depending on requirements, fetures to implement, people involved, etc.

> Got 32 MB, can probably go to 64 MB. Will that be sufficient to support 
> 256 MB NAND assuming 1 kB writes? BTW, does it make sense to increase write 
> size above 1 page (2 kB). I understood from previous discussions that jffs2 
> will split it on a page boundary anyway?
No. JFFS (even not JFFS2, but the Linux Page Cache) split on *RAM* page 
boundary which is PAGE_SIZE bytes big and is, as a rule, 4KiB. And 4KiB 
is a JFFS2's lovely size :-)

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
