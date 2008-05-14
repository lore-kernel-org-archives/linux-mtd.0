Date: Wed, 14 May 2008 18:13:50 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
Subject: Re: [PATCH][RFC] NAND subpage read feature. Take 2.
In-Reply-To: <20080501044027.GA26541@cloud.net.au>
Message-ID: <Pine.LNX.4.64.0805141808140.5183@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804301301360.6788@pentafluge.infradead.org>
	<20080501044027.GA26541@cloud.net.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, joern@logfs.org, dwmw2@infradead.org,
	tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Hamish,

> On Wed, Apr 30, 2008 at 01:13:24PM +0100, Alexey Korolev wrote:
> > This patch enables NAND subpage read functionality. 
> [..]
> > As I know some of you already use this feature. I would be much
> > appreciate if you give me some performance numbers. It may assist to get this
> > feature included. 
> 
> To attach my 512Mb NAND with UBI, with software NAND controller
> (plat_nand), on a 533MHz IXP4xx, I measure:
> 
> No partial reads: 5.75 seconds
> Previous partial read patch: 2.72 seconds
> New subpage read patch: 2.42 seconds
>
Oh nice digits. Thank you very much for you asistance and for the data. 
I will add it to patch description. 

Alexey
 
