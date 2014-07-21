In-Reply-To: <OF0B0EF31D.2C99A9F3-ONC1257D1C.007625AF-C1257D1C.00767260@transmode.se>
References: <1405975648-25375-1-git-send-email-jogo@openwrt.org>
 <OF0B0EF31D.2C99A9F3-ONC1257D1C.007625AF-C1257D1C.00767260@transmode.se>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] mtd: physmap: actually prevent unaligned accesses
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Message-ID: <OF4119EA24.DF7CEB3D-ONC1257D1C.0077234F-C1257D1C.007733F9@transmode.se>
Date: Mon, 21 Jul 2014 23:42:00 +0200
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd <linux-mtd-bounces@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
 Jonas Gorski <jogo@openwrt.org>, linux-mtd@lists.infradead.org,
 Gregory Fong <gregory.0xf0@gmail.com>, Maxime Bizon <mbizon@freebox.fr>,
 Stefan Roese <sr@denx.de>, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <florian@openwrt.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> They don't just call memcpy, it is memcpy_fromio and I think your(MIPS)
> memcpy_fromio should be fixed to copy with unaligned accesses instead of
s/copy/cope/
