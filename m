Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aMY27-0005E0-Em
 for linux-mtd@lists.infradead.org; Fri, 22 Jan 2016 09:29:32 +0000
Date: Fri, 22 Jan 2016 10:29:05 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Mason <slash.tmp@free.fr>
CC: Steve deRosier <derosier@gmail.com>, Sebastian Frias <sf84@laposte.net>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, linux-mtd <linux-mtd@lists.infradead.org>
Subject: Re: Using a generic upstream driver with a custom NAND controller
In-Reply-To: <56A0E59F.4090602@free.fr>
Message-ID: <alpine.DEB.2.02.1601221023220.4042@lnxricardw1.se.axis.com>
References: <569E8EEA.6060106@free.fr>
 <CALupW3A8Wz72enL3Gqpx0=HdOQW0DqQtfVLUQmF=NeyoySn_aQ@mail.gmail.com>
 <56A0E59F.4090602@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 21 Jan 2016, Mason wrote:

> (Maybe you can help me find convincing arguments why upstreaming is 
> good. The logic around here is "the hardware is custom, no one will 
> benefit from having the driver, no point in sharing".)

One way to look at is in terms of maintenance. If you do a quick and dirty 
hack, it must be maintained when new kernel versions are released, i.e. 
someone has to spend company time to keep the quick and dirty hack 
working in the next product, and the next and the next. Since it's a hack 
to start with, it's hard to predict how much time is needed.

If the driver is upstreamed and uses well-known API:s, oftentimes it can 
be maintained in the ordinary course of kernel maintenence, and the impact 
on company time is minimal, not to mention more predictable. True, some 
changes in the framework might necessitate driver changes, but these will 
mostly be much smaller than in the first case, and there will be other 
drivers which have gone through the same change so you can get inspiration 
from others.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
