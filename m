Received: from mail.bugwerft.de ([46.23.86.59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fbgdQ-0004LW-Kz
 for linux-mtd@lists.infradead.org; Sat, 07 Jul 2018 06:23:58 +0000
Subject: Re: [PATCH 3/3] mtd: rawnand: marvell: add suspend and resume hooks
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: miquel.raynal@bootlin.com, robert.jarzmik@free.fr, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org
References: <20180706201415.1930-1-daniel@zonque.org>
 <20180706201415.1930-3-daniel@zonque.org>
 <20180706232239.269a8d61@bbrezillon>
 <c7a90dd5-e474-bca4-cd35-c8ccce05edcc@zonque.org>
 <82165d1d-7cfd-28b0-89d6-dbaa24a658d5@zonque.org>
 <20180707080713.4ec570df@bbrezillon>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <f64976c2-2243-1315-bd7e-8ec55e4a6ebb@zonque.org>
Date: Sat, 7 Jul 2018 08:23:43 +0200
MIME-Version: 1.0
In-Reply-To: <20180707080713.4ec570df@bbrezillon>
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

Hi Boris,

On Saturday, July 07, 2018 08:07 AM, Boris Brezillon wrote:
> On Sat, 7 Jul 2018 00:26:22 +0200
> Daniel Mack <daniel@zonque.org> wrote:

>> Ah, I only see this now, but patch 2 also fixes a problem with the
>> .remove() callback of this driver which also blindly grabs ->reg_clk
>> without further checks.
> 
> Nope, because the clk framework checks for both ERR and NULL (see
> [1]). I'm definitely not arguing that patch 2 is not needed (actually I
> pushed for this solution when Greg initially added these new clks [2]),
> just that it should not be flagged as stable.

Ah, I missed that! Sorry.

>> Hence the entire series actually qualifies for stable@ I figure?
> 
> I'd really prefer to have a single patch go into stable. Patch 1 is
> clearly not a bug fix, and patch 2 is just a dependency of patch 3, so
> let's remove this dependency by either squashing both patches into a
> single one or by reordering the changes.

Okay then. Hang on, I'll send a v2.


Thanks,
Daniel
