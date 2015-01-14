Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YBIgQ-0004Tl-6Z
 for linux-mtd@lists.infradead.org; Wed, 14 Jan 2015 07:48:06 +0000
Date: Wed, 14 Jan 2015 08:47:37 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Dan Ehrenberg <dehrenberg@chromium.org>
Subject: Re: [PATCH] mtd: Add config option to skip scanning bad blocks in
 partitions
In-Reply-To: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
Message-ID: <alpine.DEB.2.02.1501140846310.27318@lnxricardw1.se.axis.com>
References: <1421206498-28826-1-git-send-email-dehrenberg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "grundler@chromium.org" <grundler@chromium.org>,
 "gwendal@chromium.org" <gwendal@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 14 Jan 2015, Dan Ehrenberg wrote:

> Each partition on a device with bad blocks iterates over its erase
> blocks to find an accurate count of bad blocks. The iteration can take
> some time, especially on devices with many erase blocks which are
> configured to use the OOB area to detect if the block is bad. This
> patch makes a config option, MTD_PART_BAD_BLOCK_COUNT, which can
> be turned off to skip the initial scan and forgo an accurate count.

How much time would you actually save? Sure, there number of blocks in a 
modern flash is in the thousands, but one only has to read the OOB of the 
first page to find the bad block marker, so scanning through the whole 
flash does not take long.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
