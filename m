In-Reply-To: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
References: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
To: Jonas Gorski <jogo@openwrt.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] mtd: physmap: actually prevent unaligned accesses
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OF0B0EF31D.2C99A9F3-ONC1257D1C.007625AF-C1257D1C.00767260@transmode.se>
Date: Mon, 21 Jul 2014 23:33:44 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 linux-mtd@lists.infradead.org, Gregory Fong <gregory.0xf0@gmail.com>,
 Maxime Bizon <mbizon@freebox.fr>, Stefan Roese <sr@denx.de>,
 David Woodhouse <dwmw2@infradead.org>, Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

"linux-mtd" <linux-mtd-bounces@lists.infradead.org> wrote on 2014/07/21 
22:47:25:
> 
> Commit d0788ce4924758249c9552c91cc33024d3434419 ("mtd: physmap_of: Add
> "no-unaligned-direct-access" DT property") intended to prevent
> unaligned accesses to the mapped flash by setting map.virt to NO_XIP.
> 
> But simple mapping's read_from/write_to still just call memcpy, which
> will do unaligned reads/writes at least on mips.

They don't just call memcpy, it is memcpy_fromio and I think your(MIPS)
memcpy_fromio should be fixed to copy with unaligned accesses instead of
here.

> 
> This causes problems on e.g. bcm63xx with smp, as both cores share a
> unaligned load/store unit, and unaligned reads sometimes read garbage.
> 
> This patchset aims at preventing unaligned accesses for good by making
> read_from/write_to check for NO_XIP and do a bytewise copy if one of
> to or from is unaligned.
