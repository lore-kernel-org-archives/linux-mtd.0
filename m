Received: from e3.ny.us.ibm.com ([32.97.182.103])
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CCLIr-0000sd-3q
	for linux-mtd@lists.infradead.org; Tue, 28 Sep 2004 12:58:16 -0400
From: Josh Boyer <jdub@us.ibm.com>
To: "Artem B. Bityuckiy" <abityuckiy@yandex.ru>
In-Reply-To: <415995EC.8010004@yandex.ru>
References: <41595913.4040007@yandex.ru>
	<1096375038.30942.30.camel@hades.cambridge.redhat.com>
	<41596471.5020108@yandex.ru>
	<1096377761.30942.58.camel@hades.cambridge.redhat.com>
	<41596913.6080207@yandex.ru>
	<1096379132.30942.66.camel@hades.cambridge.redhat.com>
	<41596DDC.3000506@yandex.ru>
	<1096380254.30942.77.camel@hades.cambridge.redhat.com>
	<1096381863.17956.12.camel@weaponx.rchland.ibm.com>
	<41597985.3080803@yandex.ru>
	<1096383492.30942.83.camel@hades.cambridge.redhat.com>
	<415995EC.8010004@yandex.ru>
Content-Type: text/plain
Message-Id: <1096390679.3148.4.camel@weaponx.rchland.ibm.com>
Mime-Version: 1.0
Date: Tue, 28 Sep 2004 11:57:59 -0500
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 an nodes checking
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-09-28 at 11:48, Artem B. Bityuckiy wrote:
> > Yes, he does. The problem is that each time you access a FIFO you update
> > its ctime and mtime on the flash... which leads to a _lot_ of nodes,
> > only one of which is non-obsolete. That's a problem on NAND flash.
> 
> Things are same for regular files. This is from SUSv3 for write() call:
> 
> "Upon successful completion, where nbyte is greater than 0, write() 
> shall mark for update the st_ctime and st_mtime fields of the file"

Yes, but in that case you are writing data anyway.  So updates of
st_ctime and st_mtime are free.

> 
> This is from SUSv3 fore read() call:
> 
> "Upon successful completion, where nbyte is greater than 0, read() shall 
> mark for update the st_atime field of the file, and shall return the 
> number of bytes read."

I think we have the "noatime" mount option to avoid this for JFFS2.  Or
some similar mount flag.  I don't remember offhand.

> 
> What's special with FIFOs ?

Fifos don't really hold data, they are just named pipes.  When you write
to it, it's mostly handled by the VFS.  The actual data isn't written
out by JFFS2.  Except that we have to update st_ctime and st_mtime,
which causes more nodes.

> 
> Why that's a problem on NAND flash especially ?

Because you can't directly obsolete a node on NAND flash (and some weird
versions of NOR flash as well).  So obsolete nodes are actually written
out to flash instead of just flipping a bit in the existing node.

josh
