Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEGDF-00055y-CZ
 for linux-mtd@lists.infradead.org; Fri, 14 Feb 2014 10:41:42 +0000
Date: Fri, 14 Feb 2014 07:41:17 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v5] ubi: Introduce block devices for UBI volumes
Message-ID: <20140214104116.GB19307@localhost>
References: <1392321486-18332-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1392366441.12215.52.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1392366441.12215.52.camel@sauron.fi.intel.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>, richard.weinberger@gmail.com,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 14, 2014 at 10:27:21AM +0200, Artem Bityutskiy wrote:
> On Thu, 2014-02-13 at 16:58 -0300, Ezequiel Garcia wrote:
[..]
> > + *
> > + * For runtime block attaching/detaching, see mtd-utils' ubiblkvol tool.
> > + */
> 
> Good comments is a great thing, very appreciated. However, you already
> put a similar piece of documentation to "MODULE_PARM_DESC()", which is a
> good place, because it is visible to the end-user via 'modinfo'.
> 
> Do you think it will make users of this driver understand the the usage
> model better if you duplicate the documentation here? May be, not sure.
> 
> I'd say the risk is that people modifying this driver may change this
> comment, but forget to change the modinfo output, or vice-versa.
> 

Hm, right.

> I'd refactor this comment to make it look more like a piese of doc for
> the developer, explaining how this module is related to the ubi module.
> Rather than being a duplicate piece of doc for the end user explaining
> how to use this module...
> 

Agreed. No problem.

> > +/* Linked list of all ubiblock instances */
> > +static LIST_HEAD(ubiblock_devices);
> > +static DEFINE_MUTEX(devices_mutex);
> > +static int ubiblock_major;
> > +
> > +/* Ugh! this parameter parsing code is awful */
> 
> If it is awful, would you also expand the comment and explain why it is
> awful,

It's probably just a silly comment. I guess it just looked a bit hard to
follow.

> and what should be done to make it nice. Or better just do it! I
> mean, generally, when criticizing something it is better to explain why
> and point to the alternatives, no?
> 

Hm... dunno. I tried real hard to get it as nice as possible, when I
wrote this (although it seems I started with some other UBI parsing snippet).
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
