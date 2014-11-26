Received: from mail-pd0-x232.google.com ([2607:f8b0:400e:c02::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtYrX-0000cQ-2P
 for linux-mtd@lists.infradead.org; Wed, 26 Nov 2014 09:26:15 +0000
Received: by mail-pd0-f178.google.com with SMTP id g10so2484159pdj.9
 for <linux-mtd@lists.infradead.org>; Wed, 26 Nov 2014 01:25:53 -0800 (PST)
Date: Wed, 26 Nov 2014 01:25:50 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: suspect UBIFS async operations causing issues during reboot
Message-ID: <20141126092550.GS3212@norris-Latitude-E6410>
References: <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com> <545BEEA5.7020609@broadcom.com>
 <545C8697.3080403@nod.at> <545D01F4.9050005@broadcom.com>
 <545F3FD8.6010001@nod.at> <546048AB.6040602@broadcom.com>
 <20141126081732.GQ3212@norris-Latitude-E6410>
 <54758F99.6010502@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <54758F99.6010502@nod.at>
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 26, 2014 at 09:30:17AM +0100, Richard Weinberger wrote:
> If there is a solution which makes Artem and David happy, I'm perfectly fine. :)

Artem already commented [1]:

"And generally, I am not opposed to this solution in
upstream too, if it works for everyone."

And he seemed agreeable to handling it in MTD (not UBI) on the thread
from a few years ago too.

David hasn't been too vocal recently, so I wouldn't bet on getting a
comment out of him. I'd be happy to proven wrong.

Brian

[1] http://lists.infradead.org/pipermail/linux-mtd/2014-November/056500.html
