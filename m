Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMP9q-00082J-Kg
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 07:06:32 -0400
Message-ID: <417E2F8E.7050502@oktetlabs.ru>
Date: Tue, 26 Oct 2004 15:05:50 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
References: <41767593.9030004@inf.u-szeged.hu>	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>	<41781683.3020602@inf.u-szeged.hu>
	<4179009D.8010409@oktetlabs.ru>	<417CC91D.6060002@inf.u-szeged.hu>
	<417CDBDD.1010004@oktetlabs.ru> <417D1C0C.7080709@inf.u-szeged.hu>
	<417E1FFF.7030902@oktetlabs.ru> <417E2518.4010007@inf.u-szeged.hu>
In-Reply-To: <417E2518.4010007@inf.u-szeged.hu>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	jffs-dev@axis.com
Subject: Re: JFFS2 mount time
Reply-To: dedekind@oktetlabs.ru
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ferenc,

> Is it sure than only one non-full erase block is in the filesystem? 
> Non-full means here that there is some nodes already in that, but also 
> there is some free space at the end of it.
I didn't analyse this accurately, but my vision is that there is one 
current block (c->nextblock). Even GC moves nodes to it. This is because 
  the jffs2_do_reserve_space() is always used (even by GC), and the 
jffs2_do_reserve_space() always uses c->nextblock.

> As I see jffs2_do_reserve space is called before inode/... allocation in 
> most cases. So at that time the summary information is not know - but at 
> writing it have to be known certainly.
May be... From another hand you may write summary every time the 
jffs2_reserve_space() fetches new block from the free_list...
Anyway, this is not fundamental...

> You may misunderstood me. In the previous letter I wrote: "So you 
> convinced me. We will change the design of summary. The inodes and 
> dirents will be also in the summary."
> 
> So now we do plan to store dirents in the summary. :)
OK, sorry. :-)

> Let see how it work, and after we can make it more optimal :)
Agree :-)

Also, please, take into account that there may be checkpoint nodes (I'm 
implementing this). So, I think you need to have a generic mechanism to 
add new node types to your summary.

Also, I think it is good to have a generic mechanism to just refer some 
nodes from summaries (for example, direntries with long names or 
something else).

Thank you for conversation too.
:-)

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
