Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QDBSA-0007kP-UN
	for linux-mtd@lists.infradead.org; Fri, 22 Apr 2011 08:11:03 +0000
Received: by eyh6 with SMTP id 6so139068eyh.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Apr 2011 01:11:01 -0700 (PDT)
Subject: Re: bbt and bitflip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
In-Reply-To: <4DB033E4.6030105@parrot.com>
References: <4DB033E4.6030105@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 22 Apr 2011 11:08:05 +0300
Message-ID: <1303459685.2757.42.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Matthieu,

nice finding.

On Thu, 2011-04-21 at 15:40 +0200, Matthieu CASTET wrote:
> Hi,
> 
> the current bad block table implementation doesn't seem robust against bit flip.
> 
> at boot we call :
> - search_read_bbts which scan for bbt using oob pattern.
> - check_create
> -- read_abs_bbt
> --- read_bbt which ignore ecc bit flip/error
> 
> So if bit flip happen in BBT, we never scrub it.

This should probably be fixed.

> And if bit flip accumulate and we can't correct it anymore, the code will parse
> the corrupted data and our bad block info will be wrong (valid block can be
> marked as bad and we lose bad, bad block can be see as valid).

The bbt should be protected with CRC and if it gets corrupted we should
re-scan the flash and re-create it.

> Also the pattern and version in oob isn't protected by ecc. They can be corrupted.
> 
> Are bbt safe to use ?

It does not look like.

> Are there any plan to make the bbt more robust ?

I would guess no unless you do it :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
