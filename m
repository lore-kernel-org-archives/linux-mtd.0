Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NAJXH-0005PV-9J
	for linux-mtd@lists.infradead.org; Tue, 17 Nov 2009 08:35:44 +0000
In-Reply-To: <20091116232228.GI12063@shareable.org>
References: <34637.10.10.0.184.1258202287.squirrel@intranet.aimsys.nl>
	<1258359185.21596.1285.camel@localhost>
	<OF4EAF98D9.8FAE2E28-ONC1257670.00302441-C1257670.0030D73E@transmode.se>
	<20091116232228.GI12063@shareable.org>
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
To: Jamie Lokier <jamie@shareable.org>
Message-ID: <OF0986E0B8.EBF79B15-ONC1257671.002E8C98-C1257671.002EDECF@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Tue, 17 Nov 2009 09:31:56 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
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

Jamie Lokier <jamie@shareable.org> wrote on 17/11/2009 00:22:28:
>
> Joakim Tjernlund wrote:
> > I only noticed a problem with deleting big files and then a reboot.
> > if you don't reboot, the system will work. Perhaps this is due
> > to the actual CFI driver? I am using cmdset_0001 and it is a bit more
> > evolved than the others. My NOR flash also supports erase suspend.
> > If you are using cmdset_0002 you should consider fixing it.
> > As I recall, erase suspend is disabled. There was a thread about it
> > a while ago were I noticed a bug in the driver which may be the reason
> > for erase suspend being disabled. I even posted some
> > fixes for this but I don't think anyone bothered to test them.
>
> According to datasheets, the flash I'm using with cmdset_0002 supports
> multi-block erase, although I don't think the driver does at the moment.
>
> Multi-block erase works by giving the chip a list of blocks to erase,
> or even the whole flash, and then it does them simultaneously.
>
> Could this solve your problem?

That is for Norbert to say, but I think the main feature that is needed
is the possibility to suspend an erase to do a write.

   Jocke
