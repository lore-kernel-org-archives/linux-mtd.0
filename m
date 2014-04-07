Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WX7oX-0003ld-Ai
 for linux-mtd@lists.infradead.org; Mon, 07 Apr 2014 11:34:09 +0000
Message-ID: <1396870403.17040.26.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Date: Mon, 07 Apr 2014 14:33:23 +0300
In-Reply-To: <20140405203347.GA21083@arch.cereza>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <20140405203347.GA21083@arch.cereza>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-04-05 at 17:33 -0300, Ezequiel Garcia wrote:
> Hello Artem, Richard:
> 
> On Mar 14, Ezequiel Garcia wrote:
> > With the addition of block device access to UBI volumes, we now
> > add a simple userspace tool to access the new ioctls.
> > 
> > Usage of this tool is as simple as it gets:
> > 
> >   $ ubiblock --create /dev/ubi0_0
> > 
> > will create a new block device /dev/ubiblock0_0, and
> > 
> >   $ ubiblock --remove /dev/ubi0_0
> > 
> 
> After using this for something else than silly tests, I've found this
> usage is actually a bit braindead :-)
> 
> The user will probably want to create a block device based on the volume's
> name or ID, and not just the node path. In particular, using the name is
> probably the most useful case, given the atomic ubi volume rename feature.
> 
> Therefore, I'd like to see this fixed, but I'm not entirely sure what's the
> best approach. Here are my ideas so far to identify a volume:
> 
>   * Follow the convention of ubirmvol:
> 
>     ubiblock --create /dev/ubi0_0 (like we have now)
>     ubiblock --create <UBI device node file name>
> 	     [-n <volume id>] [--vol_id=<volume id>]
>              [-N <volume name>] [--name=<volume name>]
> 
>   * Implement something matching the mount command usage. For example,
> 
>     ubiblock --create /dev/ubi0_0 (like we have now)
>     ubiblock --create ubi0:name
>     ubiblock --create ubi0_0
> 
>   * All of them?
> 
> To be honest, I don't have any preference.

Oh, and I released your tool before I read this e-mail.

Well, this means that your new changes need to be compatible. Sorry for
this. Sure, go ahead with the improvements. I also do not have
preferences. Try to be consistent with other tools, change them too if
necessary, implement what makes sense and useful.

-- 
Best Regards,
Artem Bityutskiy
