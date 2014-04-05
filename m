Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WWXId-0001c5-14
 for linux-mtd@lists.infradead.org; Sat, 05 Apr 2014 20:34:47 +0000
Date: Sat, 5 Apr 2014 17:33:48 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2] ubi-utils: Add ubiblock tool
Message-ID: <20140405203347.GA21083@arch.cereza>
References: <1394806381-25458-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1394807124-25916-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Richard Weinberger <richard@nod.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Artem, Richard:

On Mar 14, Ezequiel Garcia wrote:
> With the addition of block device access to UBI volumes, we now
> add a simple userspace tool to access the new ioctls.
> 
> Usage of this tool is as simple as it gets:
> 
>   $ ubiblock --create /dev/ubi0_0
> 
> will create a new block device /dev/ubiblock0_0, and
> 
>   $ ubiblock --remove /dev/ubi0_0
> 

After using this for something else than silly tests, I've found this
usage is actually a bit braindead :-)

The user will probably want to create a block device based on the volume's
name or ID, and not just the node path. In particular, using the name is
probably the most useful case, given the atomic ubi volume rename feature.

Therefore, I'd like to see this fixed, but I'm not entirely sure what's the
best approach. Here are my ideas so far to identify a volume:

  * Follow the convention of ubirmvol:

    ubiblock --create /dev/ubi0_0 (like we have now)
    ubiblock --create <UBI device node file name>
	     [-n <volume id>] [--vol_id=<volume id>]
             [-N <volume name>] [--name=<volume name>]

  * Implement something matching the mount command usage. For example,

    ubiblock --create /dev/ubi0_0 (like we have now)
    ubiblock --create ubi0:name
    ubiblock --create ubi0_0

  * All of them?

To be honest, I don't have any preference.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
