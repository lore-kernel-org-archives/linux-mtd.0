Received: from phoenix.infradead.org ([2001:8b0:10b:1:2c0:f0ff:fe31:e18])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DEOU5-0001nV-F1
	for linux-mtd@lists.infradead.org; Thu, 24 Mar 2005 04:18:34 -0500
Date: Thu, 24 Mar 2005 09:18:22 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Jared Hulbert <jaredeh@gmail.com>
In-Reply-To: <6934efce0503231727f7234f6@mail.gmail.com>
Message-ID: <Pine.LNX.4.58.0503240918120.15561@phoenix.infradead.org>
References: <Pine.LNX.4.58.0503221406120.5581@phoenix.infradead.org>
	<6934efce0503231727f7234f6@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & deletion dirents RFC
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jared Hulbert wrote:
> Forgive me if my ignorance is obvious...
> Are there any implications to non-dirent nodes?
No, in data nodes versions play another and very important role. 
Basically, they help to distinguish between valid and obsolete data when 
the data nodes' data ranges overlap.

> Shouldn't this speed
> up the GC, mount time for any node?  If not then the version field for
> non-dirent nodes is utterly wasted, right?  If the version field is
> wasted for all non-dirent nodes (in other words, most nodes) then it
> seems like a bad idea to add a WORD or DWORD to each node. If there is
> a way to make version field only apply to dirent nodes then it would
> be much better, of course that sounds ugly without even thinking it
> through too far.

We can't get rid of version in data nodes.

Example:

data node A has data that covers file's range 0-100
data node B has data that covers file's range 10-110

How can we detect from which node should we fetch data of the 10-100 
range? JFFS2 uses version for this reason.

Dirents' versions play another role.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
