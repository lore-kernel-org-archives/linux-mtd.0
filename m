Received: from smtp06.smtpout.orange.fr ([80.12.242.128]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fVgaa-000065-OQ
 for linux-mtd@lists.infradead.org; Wed, 20 Jun 2018 17:08:14 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Mark Brown <broonie@kernel.org>, Daniel Mack <daniel@zonque.org>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 00/14] ARM: pxa: switch to DMA slave maps
References: <20180617170217.24177-1-robert.jarzmik@free.fr>
 <20180618104159.24b9fffb@bbrezillon> <87d0wnrhqz.fsf@belgarion.home>
 <20180618220455.1810f2a5@bbrezillon>
Date: Wed, 20 Jun 2018 19:07:53 +0200
In-Reply-To: <20180618220455.1810f2a5@bbrezillon> (Boris Brezillon's message
 of "Mon, 18 Jun 2018 22:04:55 +0200")
Message-ID: <87tvpxpes6.fsf@belgarion.home>
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

Boris Brezillon <boris.brezillon@bootlin.com> writes:

> Don't worry, we're not planning to merge it unless it happens to be
> required (Stephen Rothwell reporting a merge conflict in next), and we
> don't have conflicting changes in the pipeline so far.
Ok, great.

We're good to go, no screaming from 0-day, my internal testbench is happy,
everything looks fine, the tag is unmutable until v4.19.

Cheers.

-- 
Robert
