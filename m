Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pswhz-0003a9-NX
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 12:23:44 +0000
Received: by wyf23 with SMTP id 23so1591383wyf.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 04:23:42 -0800 (PST)
Subject: Re: CONFIG_MTD_NAND_VERIFY_WRITE with Software ECC
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <20110225113609.GB21841@parrot.com>
References: <AANLkTikWMGSCzGdPUBgtZKY2F6=pZ=6X+p7LUUmuKhp+@mail.gmail.com>
	<Pine.LNX.4.64.1102151355160.2784@lnxricardw.se.axis.com>
	<AANLkTimS2Dqn9W+1zMsb=wgQAPKZaPZ+UePUmAGbQLCz@mail.gmail.com>
	<Pine.LNX.4.64.1102151536400.2784@lnxricardw.se.axis.com>
	<AANLkTi=zwmN2T7T=dePB0PJk_+Ahdvzjrn9t-rA7TtVa@mail.gmail.com>
	<Pine.LNX.4.64.1102171013090.2784@lnxricardw.se.axis.com>
	<1298623342.2798.9.camel@localhost>
	<Pine.LNX.4.64.1102250956200.2784@lnxricardw.se.axis.com>
	<1298629762.2798.38.camel@localhost>
	<20110225113609.GB21841@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 14:22:19 +0200
Message-ID: <1298636539.2798.99.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	David Peverley <pev@sketchymonkey.com>,
	Ricard Wanderlof <ricard.wanderlof@axis.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-02-25 at 12:36 +0100, Ivan Djelic wrote:
> Right now, we implement a bitflip threshold, below which we correct ecc errors
> without reporting them. When the bitflip threshold is reached, we report the
> amount of corrected errors, triggering block scrubbing, etc.
> This is not ideal, but it prevents UBI from torturing and marking too many
> blocks as bad.

Hmm, what exactly the threshold you are implementing mean?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
