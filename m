Received: from mail.utfors.se ([195.58.103.125])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Aq7i-0007d2-00
	for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2001 10:14:54 +0000
Reply-To: <joakim.tjernlund@lumentis.se>
From: "Joakim Tjernlund" <joakim.tjernlund@lumentis.se>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Fwd: Cache mappings and invalidate 
Date: Mon, 3 Dec 2001 11:24:26 +0100
Message-ID: <IGEFJKJNHJDCBKALBJLLAEDIFAAA.joakim.tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <15684.1007199371@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

> joakim.tjernlund@lumentis.se said:
> > Can it be the MV kernel?
> 
> I don't see why.
I don't think so either, it was just a wild guess.

> 
> > I am trying to get 2.4.16-pre1 from ppclinux running but I get a lot
> > of oops messages( see below). Its very easy to generate this opps,
> > just mount JFFS2 and copy a file a few times. 
> 
> It's dying in lumentis_write - that's your map driver, isn't it? Check the 
> code at 0xc00b12e8, compare the register it's dereferencing with the 
> address it's _supposed_ to be using, etc.

The same code works fine in MV's kernel and there is not much to debug,
lumentis_write32() looks the same as rpx_write32(). Anyhow, I have
received one report that indicates that the latest kernels from
linuxppc_2_4 are broken w.r.t mpc_860 
 
> 
> Check bus timings, etc.
I have, over and over again. I also lowered my bus speed to make sure it's not
a timing issue.

> 
> --
> dwmw2
> 
> 
