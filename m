Received: from mga02.intel.com ([134.134.136.20])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMQk-0001gX-FW
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:09:55 +0000
Message-ID: <1395734925.1549.51.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Brian Norris
 <computersforpeace@gmail.com>, "dwmw2@infradead.org" <dwmw2@infradead.org>
Date: Tue, 25 Mar 2014 10:08:45 +0200
In-Reply-To: <1395733934.1549.46.camel@sauron.fi.intel.com>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1395733934.1549.46.camel@sauron.fi.intel.com>
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

On Tue, 2014-03-25 at 09:52 +0200, Artem Bityutskiy wrote:
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

Actually, I did not, push fails.

The root-cause, AFAICS, is that when Brian pushes there, files and
directories in .git/objects/ get created without "write" group
permissions. So I cannot create new objects.

I _think_ this is because of Brian's umask. If Brian could set it to
'002', that would not happen.

Brian or David, would you please fix-up the permissions and add g+w? Is
there a way to force g+w, I wonder? I am not aware of such...

-- 
Best Regards,
Artem Bityutskiy
