Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WOSWm-0003jj-UL
 for linux-mtd@lists.infradead.org; Fri, 14 Mar 2014 13:52:01 +0000
Date: Fri, 14 Mar 2014 10:51:15 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Make UBI_IOCVOLCRBLK take a parameter for future
 usage
Message-ID: <20140314135115.GA5964@arch.cereza>
References: <1394028974-27570-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394100605.6302.63.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394100605.6302.63.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 06, Artem Bityutskiy wrote:
> On Wed, 2014-03-05 at 11:16 -0300, Ezequiel Garcia wrote:
> > In order to allow a future ioctl parameter, such as a creation flag,
> > we change the UBI_IOCVOLCRBLK so it accepts a struct ubi_blkcreate_req.
> > For the time being the structure is not in use, but fully reserved.
> > 
> > This ABI change is still possible and harmless, because the ioctl has just
> > been introduced and there's no userspace program which uses it.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> 
> Pushed to linux-ubifs.git, thank you!
> 

Artem: Would you mind pushing this to the linux-next branch as well?
It's an important ABI change, so I'd rather see it on v3.15.

(you plan to push all this for v3.15, right?)

FWIW, I'm preparing the userspace tool now.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
