Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17mbXf-0001Xi-00
	for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2002 15:54:03 +0100
Date: Wed, 4 Sep 2002 15:54:03 +0100 (BST)
From: Jasmine Strong <jasmine@hex.linuxgrrls.org>
To: Allen Curtis <acurtis@onz.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	John Hall <John.Hall@optionexist.co.uk>,
	"Linux MTD list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: Stable cvs version for 2.4 
In-Reply-To: <NCBBIINEHIPFGJPLBEIFAEKJDLAA.acurtis@onz.com>
Message-ID: <Pine.LNX.4.33.0209041551460.22265-100000@hex.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Wed, 4 Sep 2002, Allen Curtis wrote:

> How about we add 1 byte which contains up to 8 bit fields?

Adding a byte will destroy the alignment.  you'd have to add a whole word.

We could have a #define to set whether we use the lsb of the address (on
aligned architectures) or an extra byte (on non-aligned architectures,
which won't care about the structure not being an exact multiple of words
anyway).

> Using bits in pointer values sounds a lot like old Mac programming.
> Caution Will Robinson....

I agree.

Jas.
