Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WNMPk-0005nH-Fx
 for linux-mtd@lists.infradead.org; Tue, 11 Mar 2014 13:08:13 +0000
Message-ID: <1394543187.2399.11.camel@sauron.fi.intel.com>
Subject: Re: [RFC PATCH] UBIFS: remove check for all(0xff) for empty pages
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Matthieu CASTET <matthieu.castet@parrot.com>
Date: Tue, 11 Mar 2014 15:06:27 +0200
In-Reply-To: <20140311132109.4201b0dd@parrot.com>
References: <1394518992-26969-1-git-send-email-pekon@ti.com>
 <1394523766.6302.216.camel@sauron.fi.intel.com>
 <20140311132109.4201b0dd@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Kent Li <Kent.Li@radisys.com>, Stefan Roese <sr@denx.de>,
 HOUR Frderic <frederic.hour@safran-engineering.com>,
 linux-mtd <linux-mtd@lists.infradead.org>, Pekon Gupta <pekon@ti.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-03-11 at 13:21 +0100, Matthieu CASTET wrote:
> I think this is not true with MLC flash that Pekon want to handle.

Correct. But this is a different issue. Let's not confuse ourselves and
not mix them. Right now we are discussing bit-flips in the empty space.
We are not discussing MLC issues.

> There is the paired page problem [1] and the power cut corruption can
> happen in more than one page.

That's right. But this is another issue: UBIFS was not designed for MLC.
This can also be fixed, but this is a completely separate activity.

-- 
Best Regards,
Artem Bityutskiy
