Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OoEz1-0002xq-1l
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2010 12:21:35 +0000
In-Reply-To: <AANLkTin+Av3=MPjxFX12m9_T5T7fY7o11CmfxACdb_a5@mail.gmail.com>
References: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>
	<4C607150.6040806@jkmicro.com>
	<AANLkTinL1dqv9LmQ1zTCEJ46pb=jfc3=25cehHFi9wfT@mail.gmail.com>
	<AANLkTinV-YT9ypqY8aXxmP2ZVKVsofzU0Y7PLXH6ac5g@mail.gmail.com>
	<OFA98E98D2.70D73DE5-ONC1257789.007F6116-C1257789.008000E9@transmode.se>
	<AANLkTin+Av3=MPjxFX12m9_T5T7fY7o11CmfxACdb_a5@mail.gmail.com>
Subject: Re: buffer write error (status 0x90)
To: Shane Volpe <shanevolpe@gmail.com>
Message-ID: <OF0FF7D4F4.BB0FA8ED-ONC125778A.0043A5C9-C125778A.0043DEAC@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Wed, 25 Aug 2010 14:21:19 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, Adam Yergovich <ayergo@jkmicro.com>,
	Jon Ringle <jon@ringle.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Shane Volpe <shanevolpe@gmail.com> wrote on 2010/08/25 13:58:06:
>
> On Tue, Aug 24, 2010 at 7:18 PM, Joakim Tjernlund
> <joakim.tjernlund@transmode.se> wrote:
> > It states :
> > When customer uses [...] block unlock, the block lock status might be
> > altered inadvertently. Lock status might be set to either 01h or 03h
> > unexpectedly (00h as expected data), which leads to program/erase failure
> > on certain blocks.
> >
> > Easy to work around.
>
> Joakim,
> Do you have a patch or an example on how to work around this?
> Regards,
> Shane

See u-boot:
http://lists.denx.de/pipermail/u-boot/2010-August/075727.html
