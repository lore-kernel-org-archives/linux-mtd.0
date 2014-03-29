Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WTzpH-0005yz-9i
 for linux-mtd@lists.infradead.org; Sat, 29 Mar 2014 20:25:59 +0000
Date: Sat, 29 Mar 2014 17:24:57 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
Message-ID: <20140329202457.GA742@arch.cereza>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395733934.1549.46.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1395733934.1549.46.camel@sauron.fi.intel.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mar 25, Artem Bityutskiy wrote:
> On Fri, 2014-03-14 at 11:25 -0300, Ezequiel Garcia wrote:
> > With the addition of block device access to UBI volumes, we now
> > add a simple userspace tool to access the new ioctls.
> > 
> > Usage of this tool is as simple as it gets:
> > 
> >   $ ubiblock --create /dev/ubi0_0
> > 
> > will create a new block device /dev/ubiblock0_0, and
> 
> Pushed to mtd-utils, thanks!
> 

Thanks! Do you think it would be appropriate to do a new release, so
the new tool is included?
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
