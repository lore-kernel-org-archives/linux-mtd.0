Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZJok-0001F1-Cp
 for linux-mtd@lists.infradead.org; Mon, 15 Aug 2016 15:28:52 +0000
Date: Mon, 15 Aug 2016 17:28:24 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Kyle Roeschley <kyle.roeschley@ni.com>
Cc: <richard@nod.at>, <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <beanhuo@micron.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <nathan.sullivan@ni.com>,
 <xander.huff@ni.com>, <peterpansjtu@gmail.com>
Subject: Re: [PATCH v7 1/2] mtd: nand_bbt: Move BBT block selection logic
 out of write_bbt()
Message-ID: <20160815172824.684a0c71@bbrezillon>
In-Reply-To: <20160815144740.GA7067@senary>
References: <1471039103-6745-1-git-send-email-kyle.roeschley@ni.com>
 <20160813003703.4e86c042@bbrezillon> <20160815144740.GA7067@senary>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 15 Aug 2016 09:47:40 -0500
Kyle Roeschley <kyle.roeschley@ni.com> wrote:

> On Sat, Aug 13, 2016 at 12:37:03AM +0200, Boris Brezillon wrote:
> > On Fri, 12 Aug 2016 16:58:22 -0500
> > Kyle Roeschley <kyle.roeschley@ni.com> wrote:
> >   
> [...]
> > > +	while (chip < nrchips) {  
> > 
> > I'm probably missing something, but why are you turning the for loop
> > into a while loop in this patch? The commit message does not mention
> > that, and I don't see why you need it before you actually start
> > reworking the code to recover from BBT write failures (which is done in
> > patch 2).
> >   
> 
> You had changed it in patch 2 (http://code.bulix.org/e16nvo-104988) and I just
> shuffled it to the first patch since it seemed to make sense as additional code
> cleanup.

Well, this is not exactly a cleanup, it's needed because of the
rework done in patch 2: we no longer want the for loop to automatically
increment the chip variable (if we fail to write the BBT on a specific
die, we retry until we succeed or run out of free valid erase blocks).

Now, if you really want to make it part of patch 1, at least explain
why you're doing that (in preparation of BBT write failure handling).

> I'll go ahead and drop it though if you don't want it in.
> 

Note that I don't want you to completely drop this change, just put it
back in patch 2 or explain why you're doing it in patch 1 in your commit
message.
