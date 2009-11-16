Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NAAu3-0006Vp-OG
	for linux-mtd@lists.infradead.org; Mon, 16 Nov 2009 23:22:40 +0000
Date: Mon, 16 Nov 2009 23:22:28 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
Message-ID: <20091116232228.GI12063@shareable.org>
References: <34637.10.10.0.184.1258202287.squirrel@intranet.aimsys.nl>
	<1258359185.21596.1285.camel@localhost>
	<OF4EAF98D9.8FAE2E28-ONC1257670.00302441-C1257670.0030D73E@transmode.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF4EAF98D9.8FAE2E28-ONC1257670.00302441-C1257670.0030D73E@transmode.se>
Cc: nvbolhuis@aimsys.nl,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joakim Tjernlund wrote:
> I only noticed a problem with deleting big files and then a reboot.
> if you don't reboot, the system will work. Perhaps this is due
> to the actual CFI driver? I am using cmdset_0001 and it is a bit more
> evolved than the others. My NOR flash also supports erase suspend.
> If you are using cmdset_0002 you should consider fixing it.
> As I recall, erase suspend is disabled. There was a thread about it
> a while ago were I noticed a bug in the driver which may be the reason
> for erase suspend being disabled. I even posted some
> fixes for this but I don't think anyone bothered to test them.

According to datasheets, the flash I'm using with cmdset_0002 supports
multi-block erase, although I don't think the driver does at the moment.

Multi-block erase works by giving the chip a list of blocks to erase,
or even the whole flash, and then it does them simultaneously.

Could this solve your problem?

-- Jamie
