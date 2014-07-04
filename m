Received: from 71-19-161-253.dedicated.allstream.net ([71.19.161.253]
 helo=nsa.nbspaymentsolutions.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X34ss-0006km-9L
 for linux-mtd@lists.infradead.org; Fri, 04 Jul 2014 14:54:43 +0000
From: Bill Pringlemeir <bpringlemeir@nbsps.com>
To: andrea.adami@gmail.com (Andrea Adami)
Subject: Re: [RFC] ubi-utils: improve compatibility with klibc
References: <CAAQYJAs6ky1CvZWoh9NjPLYbUVcjQCh7SW3NrFUzLcXvcHLZRw@mail.gmail.com>
Date: Fri, 04 Jul 2014 10:42:03 -0400
In-Reply-To: <CAAQYJAs6ky1CvZWoh9NjPLYbUVcjQCh7SW3NrFUzLcXvcHLZRw@mail.gmail.com>
 (Andrea Adami's message of "Thu, 3 Jul 2014 09:59:44 +0200")
Message-ID: <87egy189tw.fsf@nbsps.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On  3 Jul 2014, andrea.adami at gmail.com wrote:

> I have put together a patchset allowing to compile the ubi utils
> statically against klibc.

> The patches are based on today's mtd-utils master, please have a
> preview here:

> https://github.com/andrea-adami/meta-openembedded/tree/master/meta-initramfs/recipes-devtools/mtd/ubi-utils-klibc

> Please let me know if there is something to change before sending them
> to the mailing list.

I am no authority, but I appreciate your work.  I have tried to get the
ubi tools working with klibc and I think these patches have been around
for some time; I seem to remember seeing them.

I would suggest to modify '0001-Makefile-only-build-ubi-utils.patch' to
use the over-ride.  So we could have,

  UBI_ONLY ?= 0

And then modify the make rules on this conditional.  That way, people
using a default commandline/environment will get the full tools suite as
per normal.  It may even be best to split the functionality.  There is
'ftl', 'nand', 'jffs2' and 'ubi' and maybe the 'otp'.  So, someway to
pass a make variable through the environment or command line to change
what is built is probably better? (lacking 'configure' or 'menuconfig').

For '0003-libubi.c-add-klibc-specific-fixes.patch', why can't 'klibc'
fix the 'ioctl' definition?  I think that updating 'common.h' to handle
the peculiarities of 'klibc' and redefine the 'ioctl()' would be better,
if 'klibc' can't change.

I don't see issues with the other patches.

Fwiw,
Bill Pringlemeir.
