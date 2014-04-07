Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX83N-000467-6b
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 11:49:29 +0000
Date: Mon, 7 Apr 2014 08:48:37 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
Message-ID: <20140407114837.GC544@arch.cereza>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140405203347.GA21083@arch.cereza>
 <1396870403.17040.26.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1396870403.17040.26.camel@sauron.fi.intel.com>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Apr 07, Artem Bityutskiy wrote:
> On Sat, 2014-04-05 at 17:33 -0300, Ezequiel Garcia wrote:
> > Hello Artem, Richard:
> > 
> > On Mar 14, Ezequiel Garcia wrote:
> > > With the addition of block device access to UBI volumes, we now
> > > add a simple userspace tool to access the new ioctls.
> > > 
> > > Usage of this tool is as simple as it gets:
> > > 
> > >   $ ubiblock --create /dev/ubi0_0
> > > 
> > > will create a new block device /dev/ubiblock0_0, and
> > > 
> > >   $ ubiblock --remove /dev/ubi0_0
> > > 
> > 
> > After using this for something else than silly tests, I've found this
> > usage is actually a bit braindead :-)
> > 
> > The user will probably want to create a block device based on the volume's
> > name or ID, and not just the node path. In particular, using the name is
> > probably the most useful case, given the atomic ubi volume rename feature.
> > 
> > Therefore, I'd like to see this fixed, but I'm not entirely sure what's the
> > best approach. Here are my ideas so far to identify a volume:
> > 
> >   * Follow the convention of ubirmvol:
> > 
> >     ubiblock --create /dev/ubi0_0 (like we have now)
> >     ubiblock --create <UBI device node file name>
> > 	     [-n <volume id>] [--vol_id=<volume id>]
> >              [-N <volume name>] [--name=<volume name>]
> > 
> >   * Implement something matching the mount command usage. For example,
> > 
> >     ubiblock --create /dev/ubi0_0 (like we have now)
> >     ubiblock --create ubi0:name
> >     ubiblock --create ubi0_0
> > 
> >   * All of them?
> > 
> > To be honest, I don't have any preference.
> 
> Oh, and I released your tool before I read this e-mail.
> 

Oh, no problem. It's my fault for not giving enough thought to this.

> Well, this means that your new changes need to be compatible. Sorry for
> this. Sure, go ahead with the improvements. I also do not have
> preferences. Try to be consistent with other tools, change them too if
> necessary, implement what makes sense and useful.
> 

Right then. I'll cook a patch, hopefully today!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
