Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MfeXv-0001Jj-O6
	for linux-mtd@lists.infradead.org; Mon, 24 Aug 2009 18:45:40 +0000
In-Reply-To: <4A8FAEFA.6070304@gmail.com>
References: <OF10187A22.DA46F228-ONC125761A.002E1EB3-C125761A.002EB9BA@transmode.se>
	<4A8FAEFA.6070304@gmail.com>
Subject: Re: Ideal NAND flashes for JFFS2 or YAFFS
To: Artem Bityutskiy <dedekind1@gmail.com>
Message-ID: <OF11C243C2.270CA549-ONC125761C.00667367-C125761C.0066E7FE@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Mon, 24 Aug 2009 20:44:00 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> wrote on 22/08/2009 10:40:26:
>
> On 08/22/2009 11:30 AM, Joakim Tjernlund wrote:
> >
> > We are looking into using NAND flash instead of NOR flashes in our design and I am
> > trying to find out how the ideal NAND flash should look like to be used as a
> JFFS2 or YAFFS
> > file system. We are mainly looking for speed and reliability. Power cuts are common
> > for our boards.
>
> Not sure about the FSes, but we are happy with speed and reliability
> of OneNAND from Samsung.

Looking briefly at OneNAND is seems to be a somewhat complicated device with
builtin SRAM and a emulated NOR interface.

Is this really a good fit for FS:es like JFFS2 or YAFFS?

hmm, maybe I should look at UBIFS too :)

 Jocke
