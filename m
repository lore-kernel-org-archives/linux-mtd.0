Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CMOfB-0007oa-PW
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2004 06:34:52 -0400
Message-ID: <417E2821.7080305@oktetlabs.ru>
Date: Tue, 26 Oct 2004 14:34:09 +0400
From: Artem Bityuckiy <dedekind@oktetlabs.ru>
MIME-Version: 1.0
To: Jarkko Lavinen <jarkko.lavinen@nokia.com>
References: <41767593.9030004@inf.u-szeged.hu>
	<1098365059.13633.1257.camel@hades.cambridge.redhat.com>
	<41781683.3020602@inf.u-szeged.hu> <4179009D.8010409@oktetlabs.ru>
	<20041026092928.GA23914@angel.research.nokia.com>
In-Reply-To: <20041026092928.GA23914@angel.research.nokia.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
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

Hello Jarkko,

> I tried Ferenc's earlier mount time patch in August and the 52s mount
> time dropped then to 14s. If I understand right, inodes and dentries
> were then mixed in the erase block and the summary was for inodes
> only.  This shows reading dentries from semirandom places is
> expensive.
This is very good that direntries are distributed more or less uniformly 
in average.

> 
> Ferenc's latest patch put dentries on their own erase block in
> consecutive order.  Considering only the read efficiency from the
> media, reading consecutive, uncompressed, and unstripped dentries from
> a summary should cost no more than reading them from dedicated erase
> block.
> 
Definitely true - the second patch must be better than the first one. But
unfortunately, it hard to do this dinamically :-( Ferenc tried...

But in my proposition, we will also refer direntries in the summary - 
this is not the same as to read direntries from where they are placed, 
this is another thing, especially in case of NAND! There is difference 
(if we have NAND) - whether to read one 512 NAND page containing 
compressed information about 20-25 direntries or to read 20-25 
*different* NAND pages.

So, I think, new design will also better than the early Ferenc's patch :-)

-- 
Best regards, Artem B. Bityuckiy
Oktet Labs (St. Petersburg), Software Engineer.
+78124286709 (office) +79112449030 (mobile)
E-mail: dedekind@oktetlabs.ru, web: http://www.oktetlabs.ru
