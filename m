Received: from smtp106.sbc.mail.gq1.yahoo.com ([67.195.14.109])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MQTsY-0002qq-7n
	for linux-mtd@lists.infradead.org; Mon, 13 Jul 2009 22:20:20 +0000
From: David Brownell <david-b@pacbell.net>
To: Troy Kisky <troy.kisky@boundarydevices.com>
Subject: Re: [PATCH V4 2/3] mtd: nand: Calculate better default ecc layout
Date: Mon, 13 Jul 2009 14:56:19 -0700
References: <1246055086-7357-1-git-send-email-troy.kisky@boundarydevices.com>
	<1246055086-7357-2-git-send-email-troy.kisky@boundarydevices.com>
In-Reply-To: <1246055086-7357-2-git-send-email-troy.kisky@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200907131456.19881.david-b@pacbell.net>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday 26 June 2009, Troy Kisky wrote:
> Looking through the code, I can only see that
> Davinci is effected this way when using 512 bytes
> x 4 steps with hardware ecc.

You mean, with *single-bit* hardware ECC.

Currently each step needs just three bytes,
but it's using the default ECC layout which
allocates six bytes per step.


> It has its ecc 
> bytes moved from oob 40-63 to oob 52-63.

More correctly:  40-42, 46-48, 52-54, 58-60
to 52-63.


> So a Davinci authority will need to ack this,
> or request a change.

Actually I'd just stick with the standard policy
and not make such an incompatible change in the
first place.  You can't guarantee that the change
won't cause regressions...

It would have been nice if the MTD layer were
doing this ECC layout before, but in this specific
case I can't say I think an extra 12 bytes of OOB
data will matter to anyone.

- Dave
