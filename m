Date: Wed, 12 Jan 2005 09:35:40 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: Steven Scholz <steven.scholz@imc-berlin.de>
In-Reply-To: <41E4D6E5.1090407@imc-berlin.de>
Message-ID: <Pine.LNX.4.58.0501120935250.10617@phoenix.infradead.org>
References: <41E4D6E5.1090407@imc-berlin.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2: checking CRCs twice!?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> IIUC than mounting a JFFS2 root fs takes so long (6 seconds on my 
embedded ARM9)
> cause the CRCs of all blocks/sectors are checked.
Cause:
1. *Some* of CRCs are checked. Nodes has 3 CRCs: (1) Common header CRC, 
(2) Header CRC, (3) Data CRC. On mount, JFFS2 check only common header 
CRCs of inode nodes, and all CRCs of direntries. When checking in 
background, it checks other CRCs.
2. On mount, JFFS2 reads blocks fully. So multiply the number of used 
blocks on the block read time and add this number to your mount time. This 
should be fixed, IMHO, since we do not needed, for example, read inode 
node's data.
3. It builds different data structures - fragtree list, direntries list. 
It counts the inode link numbers. This also takes time, especially if you 
have slow CPU. Here is some room to improvement exist.

Seems that's all major activities.

>
> But then it looks to me that - shortly after boot - the GC thread doing 
the same
> again (in background.c), which takes another 6 scondes and slows down 
the
> application startup...
Not the same, it checks CRCs which were not checked during mount.

> Or am I missing something?

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
