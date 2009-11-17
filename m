Received: from smtp-vbr7.xs4all.nl ([194.109.24.27])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NALZD-000505-1t
	for linux-mtd@lists.infradead.org; Tue, 17 Nov 2009 10:45:51 +0000
Message-ID: <4B027ED2.6090302@aimvalley.nl>
Date: Tue, 17 Nov 2009 11:45:38 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: a UBIFS image makes task pdflush blocked > 120 seconds
References: <34637.10.10.0.184.1258202287.squirrel@intranet.aimsys.nl>
	<1258359185.21596.1285.camel@localhost>
	<OF4EAF98D9.8FAE2E28-ONC1257670.00302441-C1257670.0030D73E@transmode.se>
	<20091116232228.GI12063@shareable.org>
In-Reply-To: <20091116232228.GI12063@shareable.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: nvbolhuis@aimsys.nl,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Joakim Tjernlund <joakim.tjernlund@transmode.se>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jamie Lokier wrote:

> According to datasheets, the flash I'm using with cmdset_0002 supports
> multi-block erase, although I don't think the driver does at the moment.
> 
> Multi-block erase works by giving the chip a list of blocks to erase,
> or even the whole flash, and then it does them simultaneously.
> 
> Could this solve your problem?
> 
> -- Jamie
> 


I doubt it.

Afaik multi-block erasure doesn't speed up things. So for n blocks you'd still have
to wait n x block-erase-time (in this case erase-suspend whould be even more important).
Besides, currently MTD/CFI do not support this.

thanks,
Norbert.
