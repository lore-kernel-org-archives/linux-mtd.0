Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.49] helo=albatross.wise.edt.ericsson.se)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17ttkM-0001OG-00
	for <linux-mtd@lists.infradead.org>; Tue, 24 Sep 2002 18:45:18 +0100
Subject: Re: Interest in DOC and YAFFS? --> YAFFS bootloading
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: Marc Singer <elf@buici.com>
Cc: Russ Dill <Russ.Dill@asu.edu>, Charles Manning <manningc2@actrix.gen.nz>,
   Mtd <linux-mtd@lists.infradead.org>, yaffs@toby-churchill.org
In-Reply-To: <20020924171419.GA2733@buici.com>
References: <200209231220.12682.ayalon@tadlys.com>
	<20020924014556.6EC8B43F2@tiger.actrix.co.nz>
	<20020924034410.GA18915@buici.com>
	<20020924040150.A1499145FF@dragon.actrix.co.nz>
	<20020924044434.GA23917@buici.com> <1032854017.13283.3.camel@russ>
	<20020924165351.GA2533@buici.com> <1032886743.13283.6.camel@russ>
	<20020924171419.GA2733@buici.com>
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 24 Sep 2002 19:44:58 +0200
Message-Id: <1032889498.1600.22.camel@spawn>
Mime-Version: 1.0
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

On Tue, 2002-09-24 at 19:14, Marc Singer wrote:
> That's what isn't clear.  I made two filesystems with the same
> contents.  One cramfs and the other ext2.  The ext2 filesystem
> compressed was smaller than the cramfs.  My understanding is that both
> must be uncompressed into a ramfs to be used.  If this is correct,
> then the only comparable consideration is the size of the compressed
> data.

cramfs is a read only filesystem not an archive format like zip or tar
so you do not have to copy the data into another filesystem to use it.
You use cramfs instead of initrd+filesystem.

-- 
Kenneth Johansson	
Ericsson AB                       Tel: +46 8 404 71 83
Borgafjordsgatan 9                Fax: +46 8 404 72 72
164 80 Stockholm                  kenneth.johansson@etx.ericsson.se
