Received: from fmr17.intel.com ([134.134.136.16] helo=orsfmr002.jf.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EgYiw-0001k8-M4
	for linux-mtd@lists.infradead.org; Sun, 27 Nov 2005 21:26:40 -0500
From: "zhao, forrest" <forrest.zhao@intel.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <4386FC5F.9050305@yandex.ru>
References: <8126E4F969BA254AB43EA03C59F44E840C3738@pdsmsx404>
	<4386FC5F.9050305@yandex.ru>
Content-Type: text/plain
Date: Mon, 28 Nov 2005 10:20:58 +0800
Message-Id: <1133144458.3156.15.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: The problem that I didn't think out
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> > If we store the erase block usage information in a file on flash,
> > we need to sort it in RAM in order to find the dirtiest one.
> > Then this sort operation is O(N), N is the number of erase blocks.
> > Also the memory consumed by this sorted data structure is O(N).
> We may devide this file on constant-size chunks, and search only one 
> chunk at a time. And we may have a list of 10 most worn out eraseblocks 
> and keep it in the superblock. So the scalability will be O(1) IMO.
> 
I think keeping track of a list of 10 most worn out eraseblocks
is hard to be O(1) since this list is changed dynamically.
In particular, we need to recalculate the list after every update
operation; in order to recalculate the list we need to keep the usage
information of all erase blocks in RAM in sorted manner. So if this is
the case, the RAM occupation is O(N).


> > I used to think that we could put the sorted data structure on flash,
> > but this will incur enormous update operations.
> Enormous? This needs measuring and evaluating. Let's create a user-level 
> prototype and see.

Agree. We need to do much measuring, evaluating and comparing work
before achieving the final design decision.
Do you have a time table for the user-level prototype? I think I can
give my contribution to it.


Thanks,
Forrest
