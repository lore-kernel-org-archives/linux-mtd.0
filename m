Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEkJa-0000bW-7K
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 03:37:11 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce050324140163fbe8d4@mail.gmail.com>
References: <Pine.LNX.4.58.0503221406120.5581@phoenix.infradead.org>
	<6934efce0503231727f7234f6@mail.gmail.com>
	<Pine.LNX.4.58.0503240918120.15561@phoenix.infradead.org>
	<6934efce050324140163fbe8d4@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 25 Mar 2005 11:36:39 +0300
Message-Id: <1111739799.1978.5.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & deletion dirents RFC
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2005-03-24 at 14:01 -0800, Jared Hulbert wrote:
> > We can't get rid of version in data nodes.
> 
> I'm not suggesting we get rid of 'version' in the actual nodes.
> 
> As I understand this adding 'version' to struct jffs2_raw_node_ref
> increases the RAM usage by N*(X+Y) where:
>   N is the size of the version field
>   X is the number of direnties
>   Y is the number of data nodes
> 
> It seems there "ought" to be a way to only increase RAM size by N*X. 
> I'm assuming Y>>X so this could be a big factor for RAM usage.
> 
> Am I missing something?
> 
>  ,Jared
Ok, now I understand you. Yes, good point, thanks. Frankly, I bear in
mind 2 more things which I didn't publish:

1. We will have some memory "reap" or "shrink" mechanism in JFFS3
(possibly with the ICP help), this is why I so bravely increase the
node_ref's size.
2. I strongly suspect that the version field well be very useful for
other purposes as well, even in the inode node (AKA data node)
node_refs. This is why I don't afraid to add version to node_refs of all
node types.

So, I still need to design more precisely that "shrink" mechanism and to
prove other usage of (node_ref)->version.
