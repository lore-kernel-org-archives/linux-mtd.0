Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1eOV4j-0002yP-VT
 for linux-mtd@lists.infradead.org; Mon, 11 Dec 2017 20:53:24 +0000
Date: Mon, 11 Dec 2017 21:52:55 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Miquel RAYNAL <miquel.raynal@free-electrons.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Cyrille
 Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org, Thomas
 Petazzoni <thomas.petazzoni@free-electrons.com>, Gregory Clement
 <gregory.clement@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>,
 Ofer Heifetz <oferh@marvell.com>, Hanna Hawa <hannah@marvell.com>
Subject: Re: [PATCH v2] mtd: nand: add ->exec_op() implementation
Message-ID: <20171211215255.16b63eec@bbrezillon>
In-Reply-To: <20171211211750.0e74d951@xps13>
References: <20171207145434.21586-1-miquel.raynal@free-electrons.com>
 <20171208075450.GA4359@kwain> <20171211211750.0e74d951@xps13>
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

Hi Miquel,

On Mon, 11 Dec 2017 21:17:50 +0100
Miquel RAYNAL <miquel.raynal@free-electrons.com> wrote:

> Hello Antoine,
> 
> On Fri, 8 Dec 2017 08:54:50 +0100
> Antoine Tenart <antoine.tenart@free-electrons.com> wrote:
> 
> > Hi Miquel,
> > 
> > Be careful when defining macros: avoid to name your arguments with a
> > value used in the macro that is not meant to be replaced.  
> 
> That is right, it could have failed the macro.

Fixed the macro.
Also reworded a few comments in the code, and the commit log. I also
moved some prototype changes that belong in patch "mtd: nand: provide
several helpers to do common NAND operations".

The resulting patch is applied to the nand/next branch.

Thanks a lot for the effort you've put in this new infrastructure, I
really like the result. It's not perfect and people will probably have
to extend the existing parser to support their controller, but it
clearly goes in the right direction.

I really hope that more controllers will be converted to this new
interface in a near future (you already converted 2 of them).

Regards,

Boris
