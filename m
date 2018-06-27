Received: from smtp07.smtpout.orange.fr ([80.12.242.129]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fYC70-0003XF-Td
 for linux-mtd@lists.infradead.org; Wed, 27 Jun 2018 15:12:08 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>
Cc: Boris Brezillon <boris.brezillon@bootlin.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 00/14] ARM: pxa: switch to DMA slave maps
References: <20180617170217.24177-1-robert.jarzmik@free.fr>
 <20180618104159.24b9fffb@bbrezillon> <87d0wnrhqz.fsf@belgarion.home>
 <20180625130704.GQ9413@sirena.org.uk>
Date: Wed, 27 Jun 2018 17:11:49 +0200
In-Reply-To: <20180625130704.GQ9413@sirena.org.uk> (Mark Brown's message of
 "Mon, 25 Jun 2018 14:07:04 +0100")
Message-ID: <87r2ksl0wa.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mark Brown <broonie@kernel.org> writes:

> On Mon, Jun 18, 2018 at 09:56:20PM +0200, Robert Jarzmik wrote:
>
>> I must insist on "Wednesday", as I need to have one last pass from 0-day kernel
>> checker to be fully covered, and I'd like as well to know which tree the ASoC
>> patch will take, ie. if Mark commits to take it, or rather wants to pull from
>> the imutable branch.
>
> I'll pull the branch in (a signed tag would've been nicer but it's not
> the end of the world).
Yeah, I realised that too ... late.

Anyways, the immutable branch doesn't contain the specific ASoC patch "ASoC:
pxa: remove the dmaengine compat need", and up to my better understanding
neither does your for-next branch.

So until I see it in your branch it will dwelve happily in pxa/for-next. If it
has to be routed through your tree, so that Daniel can work on ASoC pxa, I'd
like to know at -rc4 time so that I drop it from my pxa/for-next branch.

Cheers.

-- 
Robert
