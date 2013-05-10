Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UaoLA-0007g1-6t
 for linux-mtd@lists.infradead.org; Fri, 10 May 2013 14:30:32 +0000
Message-ID: <1368196362.26780.170.camel@sauron.fi.intel.com>
Subject: Re: UBI, udev and systemd
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Date: Fri, 10 May 2013 17:32:42 +0300
In-Reply-To: <alpine.DEB.2.00.1304081509460.10377@lnxricardw.se.axis.com>
References: <alpine.DEB.2.00.1304081509460.10377@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-04-08 at 15:17 +0200, Ricard Wanderlof wrote:
> I know this might be a more systemd-related issue, however, it seems
> that 
> there might be something about the way UBI reports device state
> changes to 
> udev etc, or that just someone using UBI and systemd on their system
> has 
> had a similar problem and solved it.

I do not think UBI is doing anything special, it uses standard Linux
infrastructure API for creating the devices, and deleting them.

-- 
Best Regards,
Artem Bityutskiy
