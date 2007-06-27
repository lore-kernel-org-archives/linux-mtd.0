Date: Wed, 27 Jun 2007 22:47:10 +0100 (BST)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -mm] UBI: one less BUG usage
In-Reply-To: <20070626153027.cbe757f0.randy.dunlap@oracle.com>
Message-ID: <Pine.LNX.4.64.0706272244470.22935@pentafluge.infradead.org>
References: <20070626153027.cbe757f0.randy.dunlap@oracle.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: akpm <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 Jun 2007, Randy Dunlap wrote:

> From: Randy Dunlap <randy.dunlap@oracle.com>
>
> Eliminate one BUG() usage.  The callers of major_to_device() already
> handle and report errors.  This is just another error to return.

Why is this just an error? It must never happen unles there is a bug in 
the code. Or is there a campaign against BUG() calls?

Artem.
