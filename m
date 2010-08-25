Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OoEcd-0006VV-Ia
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2010 11:58:28 +0000
Received: by fxm12 with SMTP id 12so260308fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Aug 2010 04:58:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <OFA98E98D2.70D73DE5-ONC1257789.007F6116-C1257789.008000E9@transmode.se>
References: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>
	<4C607150.6040806@jkmicro.com>
	<AANLkTinL1dqv9LmQ1zTCEJ46pb=jfc3=25cehHFi9wfT@mail.gmail.com>
	<AANLkTinV-YT9ypqY8aXxmP2ZVKVsofzU0Y7PLXH6ac5g@mail.gmail.com>
	<OFA98E98D2.70D73DE5-ONC1257789.007F6116-C1257789.008000E9@transmode.se>
From: Shane Volpe <shanevolpe@gmail.com>
Date: Wed, 25 Aug 2010 07:58:06 -0400
Message-ID: <AANLkTin+Av3=MPjxFX12m9_T5T7fY7o11CmfxACdb_a5@mail.gmail.com>
Subject: Re: buffer write error (status 0x90)
To: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Content-Type: text/plain; charset=ISO-8859-1
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

On Tue, Aug 24, 2010 at 7:18 PM, Joakim Tjernlund
<joakim.tjernlund@transmode.se> wrote:
> It states :
> When customer uses [...] block unlock, the block lock status might be
> altered inadvertently. Lock status might be set to either 01h or 03h
> unexpectedly (00h as expected data), which leads to program/erase failure
> on certain blocks.
>
> Easy to work around.

Joakim,
Do you have a patch or an example on how to work around this?
Regards,
Shane
