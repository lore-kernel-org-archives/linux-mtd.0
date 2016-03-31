Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1alZFP-000339-Kb
 for linux-mtd@lists.infradead.org; Thu, 31 Mar 2016 09:50:40 +0000
Message-ID: <1459417815.6224.11.camel@gmail.com>
Subject: Re: Question: background GC on UBIFS
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Wang Fangpeng
 <wangfangpeng1@huawei.com>, linux-mtd@lists.infradead.org
Date: Thu, 31 Mar 2016 12:50:15 +0300
In-Reply-To: <56FCE58E.3060200@nod.at>
References: <56FCC2E6.5020206@huawei.com> <56FCE58E.3060200@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-03-31 at 10:53 +0200, Richard Weinberger wrote:
> Doing it periodically is doable but how often and when? Only when the
> system
> is completely idle?

I would say - we should give a knob (mechanism) and let the userland
decide when and how much to run it (policy).

> But you can give it a try. Add a new debugfs file to trigger an
> aggressive GC run.

I'd say the trigger should be - GC one eraseblock. Or better, clean
some dirt, or make some free space. Internally this will be GC one
eraseblock, but later on this may change. UBIFS will pick the best
eraseblock to GC automatically. Userland just triggers it at the right
poing. I guess this should be a blocking API - userland blocks until GC
is done. Then it can force more GC.

You can play with this knob, see if it helps.

However, fundamentally, UBIFS will always get slower when the space is
short, by its design. You can make it a bit faster when you have little
space, but you can't make it as fast as when there is more space,
unfortunately. Not easily, at least.

Artem.
