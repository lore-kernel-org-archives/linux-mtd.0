Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XG3LC-0006Fn-N2
 for linux-mtd@lists.infradead.org; Sat, 09 Aug 2014 09:53:35 +0000
Received: by mail-pa0-f45.google.com with SMTP id eu11so8554498pac.18
 for <linux-mtd@lists.infradead.org>; Sat, 09 Aug 2014 02:53:13 -0700 (PDT)
Date: Sat, 9 Aug 2014 17:53:03 +0800
From: Huang Shijie <shijie8@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 6/8] mtd: spi-nor: drop replaceable wait-till-ready
 function pointer
Message-ID: <20140809095301.GA1076@localhost.localdomain>
References: <1407374222-8448-1-git-send-email-computersforpeace@gmail.com>
 <1407374222-8448-7-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407374222-8448-7-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 zajec5@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 06, 2014 at 06:17:00PM -0700, Brian Norris wrote:
> We don't need to expose a 'wait-till-ready' interface to drivers. Status
> register polling should be handled by the core spi-nor.c library, and as
> of now, I see no need to provide a special driver-specific hook for it.

Please do not drop this hook, please see why we add this hook:
http://lists.infradead.org/pipermail/linux-mtd/2013-December/050561.html

"
The default implementation would do just as you suggest, and I would
expect most H/W drivers to use the default implementation.  However, some H/W
Controllers can automate the polling of status registers, so having a hook allows
the driver override the default behaviour.
"

The spi-nor framework will used by more drivers besides the m25p80 and
fsl-quadspi. Some NOR flash controller may be very strange.

thanks
Huang Shijie
