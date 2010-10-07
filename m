Received: from gw1.transmode.se ([213.115.205.20])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P3tKt-0003V4-IH
	for linux-mtd@lists.infradead.org; Thu, 07 Oct 2010 16:28:52 +0000
In-Reply-To: <AANLkTikGL87-J-EbRiStmRaVN=g-rH7XL6SNB0zYwuaQ@mail.gmail.com>
References: <20101006210036.92C229D401B@zog.reactivated.net>	<OFB9367F81.DD135AF9-ONC12577B5.00550D41-C12577B5.00557990@transmode.se>
	<AANLkTikGL87-J-EbRiStmRaVN=g-rH7XL6SNB0zYwuaQ@mail.gmail.com>
Subject: Re: [doesn't work] JFFS2: Dynamically choose inocache hash size
To: Daniel Drake <dsd@laptop.org>
Message-ID: <OF67B76228.51E20AF7-ONC12577B5.0059D5BD-C12577B5.005A1FBE@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 7 Oct 2010 18:24:23 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: dsd.olpc@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

dsd.olpc@gmail.com wrote on 2010/10/07 18:09:59:
>
> On 7 October 2010 16:33, Joakim Tjernlund <joakim.tjernlund@transmode.se> wrote:
> > Does #define INOCACHE_HASHSIZE <something bigger> work?
>
> Yes. Tested for years as value 1024 in OLPC builds.

OK, Good.

>
> > if so I would guess something is using inocache_hashsize before
> > it is initialized.
>
> Me too. But it's initialized early, at the same time as inocache_list.
> And all users of inocache_hashsize use the list at the same time. So
> if that were as obvious as it sounds, we'd be seeing bigger problems.

Sure, but something might still use it before. Try adding an
assert(inocache_hashsize) wherever you use inocache_hashsize.
