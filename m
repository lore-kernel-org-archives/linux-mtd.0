Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fcG45-0005CC-PW
 for linux-mtd@lists.infradead.org; Sun, 08 Jul 2018 20:13:51 +0000
Subject: Re: [PATCH v3 1/3] mtd: rawnand: marvell: add suspend and resume hooks
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: robert.jarzmik@free.fr, boris.brezillon@bootlin.com, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, stable@vger.kernel.org
References: <20180707064631.799-1-daniel@zonque.org>
 <20180708140439.75170f37@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <4a3d847e-16c4-f53a-1e36-7f891823a0ba@zonque.org>
Date: Sun, 8 Jul 2018 22:13:36 +0200
MIME-Version: 1.0
In-Reply-To: <20180708140439.75170f37@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sunday, July 08, 2018 02:04 PM, Miquel Raynal wrote:
> Do you mind if I apply all the patches to nand/next? This fix will only
> appear in mainline after the merge window (in a few weeks). Otherwise
> I'll have to apply patches 2 and 3 for the next-next-release
> (supposedly 4.20).

I don't quite understand the options, but the thing that's important for 
me is that 1/3 lands for 4.19. I don't care for the other two really, as 
they have no functional impact.


Thanks,
Daniel
