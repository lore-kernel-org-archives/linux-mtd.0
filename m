Received: from mx02.posteo.de ([89.146.194.165])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZNQ91-0000aV-7u
 for linux-mtd@lists.infradead.org; Thu, 06 Aug 2015 18:44:00 +0000
Message-ID: <1438886613.32524.28.camel@embedded.rocks>
Subject: Re: ubi_wl_get_peb: Unable to get a free PEB from user WL pool
From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
To: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Date: Thu, 06 Aug 2015 20:43:33 +0200
In-Reply-To: <55C3A465.5070504@nod.at>
References: <1438809724.6328.18.camel@embedded.rocks>
 <55C28070.2000804@nod.at> <1438810690.6328.26.camel@embedded.rocks>
 <55C2840B.5000709@nod.at> <1438811611.6328.32.camel@embedded.rocks>
 <55C287A9.8000006@nod.at> <1438813074.6328.35.camel@embedded.rocks>
 <55C30D24.1010504@nod.at> <1438848603.32524.6.camel@embedded.rocks>
 <55C3A465.5070504@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Do, 2015-08-06 at 20:16 +0200, Richard Weinberger wrote:
> Am 06.08.2015 um 10:10 schrieb Jörg Krause:
> > I will turn fastmap off for now, but feel free to send more patches 
> > to
> > try.
> 
> Can you please give the attached patch a try?
> 

Congratulations! That fix it :-)

Here is the corresponding snap from the kernel log:

    [    3.175194] ubi1: default fastmap pool size: 10
    [    3.179937] ubi1: default fastmap WL pool size: 5
    [    3.184713] ubi1: attaching mtd7
    [    3.539869] ubi1: scanning is finished
    [    3.623707] ubi1: volume 0 ("user") re-sized from 13 to 262 LEBs
    [    3.634937] ubi1: attached mtd7 (name "data", size 36 MiB)
    [    3.640722] ubi1: PEB size: 131072 bytes (128 KiB), LEB size:
    126976 bytes
    [    3.647772] ubi1: min./max. I/O unit sizes: 2048/2048, sub-page
    size 2048
    [    3.654611] ubi1: VID header offset: 2048 (aligned 2048), data
    offset: 4096
    [    3.661714] ubi1: good PEBs: 288, bad PEBs: 0, corrupted PEBs: 0
    [    3.667890] ubi1: user volume: 1, internal volumes: 1, max.
    volumes count: 128
    [    3.675168] ubi1: max/mean erase counter: 1/0, WL threshold:
    4096, image sequence number: 1059544151
    [    3.684448] ubi1: available PEBs: 0, total reserved PEBs: 288,
    PEBs reserved for bad PEB handling: 20
    [    3.693923] ubi1: background thread "ubi_bgt1d" started, PID 42

Many thanks for this!

Jörg
