Received: from ernst.netinsight.se ([194.16.221.21])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MtjJX-0002bn-2w
	for linux-mtd@lists.infradead.org; Fri, 02 Oct 2009 14:40:59 +0000
Date: Fri, 2 Oct 2009 16:40:49 +0200
From: Simon Kagstrom <simon.kagstrom@netinsight.net>
To: Aaro Koskinen <aaro.koskinen@nokia.com>
Subject: Re: [PATCH 1/2] mtdoops: do not schedule work if we are going to die
Message-ID: <20091002164049.3ef46131@marrow.netinsight.se>
In-Reply-To: <4AC60E9B.8060704@nokia.com>
References: <1254410216-24444-1-git-send-email-aaro.koskinen@nokia.com>
	<20091002161837.18a5ac94@marrow.netinsight.se>
	<4AC60E9B.8060704@nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: "Bityutskiy Artem \(Nokia-D/Helsinki\)" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 02 Oct 2009 17:30:51 +0300
Aaro Koskinen <aaro.koskinen@nokia.com> wrote:

> > I also get problems when mtd->read is called from mtdoops_inc_counter,
> > so my patch also skips this if we have panic_on_oops set (there is also
> > no point since the board will hang / be restarted after that).
> 
> I think you need to call it, otherwise the ready flag does not get set and
> you may loose some messages? Which driver you are using? The second patch
> I sent for OMAP addressed this problem, basically the driver should know we
> are in oops and rely on very minimal functionality in read/write.

Well, the counter will be updated on the next boot anyway by
find_next_position. mtdoops_inc_counter just positions it at the next
block and (if needed) erases that. So not calling it will just delay
the initialization to the next boot.

I did consider putting mtdoops_inc_counter on a work queue, but I think
it's overkill in this case (since it probably won't get called anyway
by the panic).


I'm using it on an OpenRD base board, with a NAND flash (using the
functions in nand_base.c). I've patched the NAND driver with Edgars
implementation of panic_write from here:

   http://lists.infradead.org/pipermail/linux-mtd/2009-October/027447.html

I think your second patch is good to have anyway.

// Simon
