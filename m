Date: Thu, 28 Jun 2007 17:36:34 +0100 (BST)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Subject: Re: [PATCH -mm] UBI: one less BUG usage
In-Reply-To: <4683437E.50109@oracle.com>
Message-ID: <Pine.LNX.4.64.0706281734470.8495@pentafluge.infradead.org>
References: <20070626153027.cbe757f0.randy.dunlap@oracle.com>
	<Pine.LNX.4.64.0706272244470.22935@pentafluge.infradead.org>
	<4683437E.50109@oracle.com>
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

On Wed, 27 Jun 2007, Randy Dunlap wrote:
> All my patch does is allow and handle error returns from major_to_device()
> in vol_cdev_open().  vol_cdev_open() already handles errors by returning
> the error to its caller.

Yes, I see the inconsistency, I'd prefer to remove that error check 
instead.

Artem.
