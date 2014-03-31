Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUYn0-00036t-Qd
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 09:45:59 +0000
Message-ID: <1396259134.9016.58.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>
Date: Mon, 31 Mar 2014 12:45:34 +0300
In-Reply-To: <20140329202457.GA742@arch.cereza>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395733934.1549.46.camel@sauron.fi.intel.com>
 <20140329202457.GA742@arch.cereza>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-03-29 at 17:24 -0300, Ezequiel Garcia wrote:
> On Mar 25, Artem Bityutskiy wrote:
> > On Fri, 2014-03-14 at 11:25 -0300, Ezequiel Garcia wrote:
> > > With the addition of block device access to UBI volumes, we now
> > > add a simple userspace tool to access the new ioctls.
> > > 
> > > Usage of this tool is as simple as it gets:
> > > 
> > >   $ ubiblock --create /dev/ubi0_0
> > > 
> > > will create a new block device /dev/ubiblock0_0, and
> > 
> > Pushed to mtd-utils, thanks!
> > 
> 
> Thanks! Do you think it would be appropriate to do a new release, so
> the new tool is included?

Yeah, probably. Let's check if Brian has anything in mind and then I can
make a release.

-- 
Best Regards,
Artem Bityutskiy
