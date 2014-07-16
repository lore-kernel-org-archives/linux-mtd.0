Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7Kah-0004mJ-J9
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 08:29:31 +0000
Message-ID: <1405499347.1906.2.camel@sauron.fi.intel.com>
Subject: Re: ubifs error at boot "bad node type"
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Genoud <richard.genoud@gmail.com>
Date: Wed, 16 Jul 2014 11:29:07 +0300
In-Reply-To: <53BBC39F.7010307@gmail.com>
References: <53BBC39F.7010307@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-07-08 at 12:10 +0200, Richard Genoud wrote:
> ubiattach is ok:
> # ubiattach -m 3
> [   50.164062] UBI: default fastmap pool size: 95
> [   50.164062] UBI: default fastmap WL pool size: 25

I do not know why this happened, I never saw reports like this before.
Most probably this is because of fastmap. I did not hear any report that
it was extensively verified WRT power cuts, and my theory is that there
is a bug in fastmap which causes this, and this may be related to power
cuts. I do not have proves, but suggest you to dig in this direction.
E.g., setup power-cut testing.

-- 
Best Regards,
Artem Bityutskiy
