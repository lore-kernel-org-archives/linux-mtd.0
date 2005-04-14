Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DM47x-000529-I1
	for linux-mtd@lists.infradead.org; Thu, 14 Apr 2005 09:11:26 -0400
Date: Thu, 14 Apr 2005 14:11:10 +0100 (BST)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Sergei Sharonov <sergei.sharonov@halliburton.com>
In-Reply-To: <loom.20050414T140640-566@post.gmane.org>
Message-ID: <Pine.LNX.4.58.0504141409200.3328@phoenix.infradead.org>
References: <loom.20050413T142519-107@post.gmane.org>
	<1113400225.23175.9.camel@sauron.oktetlabs.ru>
	<loom.20050413T160136-559@post.gmane.org>
	<1113404557.23175.23.camel@sauron.oktetlabs.ru>
	<loom.20050413T193912-984@post.gmane.org>
	<Pine.LNX.4.58.0504140941040.3328@phoenix.infradead.org>
	<loom.20050414T140640-566@post.gmane.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
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
> Hi,
Hello :-)

> That's what I was afraid of. Looks like JFFS2 is not very usable on 
large
> NAND chips. Will the situation improve if the 200 MByte file
> is split into, say, multiple 20 MByte files? I guess not..
Yes, it is an option. Some thing will be much better. If you formulate 
specific questions, I may try do get concrete answers.

> Other possibilities that I would like to investigate:
> 1. Partition NAND into two blocks.
We usually call flash sector "block", so I am confused what do you mean. 
Just split your flash on 2 partitions?

> 2. Try YAFFS. Can anybody offer an opinion ;) ? 
> JFFS2 is well supported, every resonable question or problem is followed 
> up within hours. What about YAFFS? I also have a feeling that jffs2 has 
had 
> a bit more testing and larger user base. How mature is YAFFS?
I have no Idea. And I'd like to know this too :-)

> 3. Try summary patch. How stable is it with jffs2? Is anybody using it
> in production or is it still pretty much experimental?
AFAIK, it is quite good.

> I recall that
> initially summary was not created/updated dynamically, e.g. it was not 
> usefull for log data. Is it still the case?
No, it isn't.

> 4. Combine (1) with (3). (1) will give fast write access, (3) hopefuly 
will
> give fast read access????
You'll end up with quick mount, but the "touch your_200mb_file" command 
(just after mount) should be still be slow. touch your_20mb_file will be 
~10 times faster.

> 5. Look for a commercial solution. I recall somebody was talking at 
> Embedded Conference about porting their filesystem to linux.
May be. The other case is just to start developing JFFS3. We have some 
ideas.

> What's the point in having a big NAND if you cannot fill it ;) ?
JFFS2 wasn't designed for such large flashes/files. It has scalability 
problems. And you can fill it if you're ready to spend a lot of RAM/time.


--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
