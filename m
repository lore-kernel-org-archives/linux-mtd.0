Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WLBMv-0000R5-GJ
 for linux-mtd@lists.infradead.org; Wed, 05 Mar 2014 12:56:18 +0000
Message-ID: <1394024109.6302.57.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v7 1/3] ubi: Introduce read-only block devices on top of
 UBI volumes
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Wed, 05 Mar 2014 14:55:09 +0200
In-Reply-To: <20140305125229.GA776@arch.cereza>
References: <1393245564-23947-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1393245564-23947-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394017054.6302.46.camel@sauron.fi.intel.com>
 <20140305125229.GA776@arch.cereza>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Mike Frysinger <vapier@gentoo.org>,
 Richard Weinberger <richard.weinberger@gmail.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-03-05 at 09:52 -0300, Ezequiel Garcia wrote:
> Sure, that sounds great. And I'll change this ioctl names:
> 
> UBI_IOCBLKCR and UBI_IOCBLKRM ?

I actually did this, let me send the patch.

-- 
Best Regards,
Artem Bityutskiy
