Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLpD7-0002Qf-42
 for linux-mtd@lists.infradead.org; Fri, 07 Mar 2014 07:28:49 +0000
Received: by mail-pd0-f174.google.com with SMTP id y13so3658194pdi.19
 for <linux-mtd@lists.infradead.org>; Thu, 06 Mar 2014 23:28:27 -0800 (PST)
Date: Thu, 6 Mar 2014 23:28:24 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Philippe De Muyter <phdm@macqel.be>
Subject: Re: [PATCH RESEND] mtd: allow CONFIG_MTD_PHYSMAP_OF also for
 CONFIG_MTD_RAM
Message-ID: <20140307072824.GD13420@norris-Latitude-E6410>
References: <1392223785-21067-1-git-send-email-phdm@macqel.be>
 <1394060400-25149-1-git-send-email-phdm@macqel.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1394060400-25149-1-git-send-email-phdm@macqel.be>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 06, 2014 at 12:00:00AM +0100, Philippe De Muyter wrote:
> Up to now mtd-ram devices described in device trees were only accessible
> if mtd-flash or mtd-rom were also configured at linux configuration
> time, because MTD_PHYSMAP_OF was only available if (MTD_CFI ||
> MTD_JEDECPROBE || MTD_ROM).  Allow MTD_PHYSMAP_OF selection also
> when only MTD_RAM is set.
> 
> Signed-off-by: Philippe De Muyter <phdm@macqel.be>

Pushed to l2-mtd.git. Thanks!

Brian
