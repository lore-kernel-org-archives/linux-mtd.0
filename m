Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CKXTt-0004Cf-23
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2004 03:35:31 -0400
Message-ID: <41776794.90101@inf.u-szeged.hu>
Date: Thu, 21 Oct 2004 09:39:00 +0200
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
References: <41767593.9030004@inf.u-szeged.hu> <41776351.4040204@yandex.ru>
In-Reply-To: <41776351.4040204@yandex.ru>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org, jffs-dev@axis.com
Subject: Re: JFFS2 mount time - 3 more questions
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

> 1. How large are your summary nodes (in average) for blocks full of 
> dirents/nodes ?

It heavily depends on
- the size of the earase block
- the sizes of the nodes
It is 4 words for every jffs2_raw_inode. Dirents are stored separatedly 
  without summary.

> 2. Why do not you use compression for them?

To make boot time as fast as possible :) But not a bad idea. If someone 
needs it we can make a new option.

> 3. Why did you introduce new tool instead of just adding new options to 
> the mkfs.jffs2 ?

I think it is "nicer", cleaner design, and uing this separation the 
reordering of the nodes is much more easier.

Bye,
Ferenc
