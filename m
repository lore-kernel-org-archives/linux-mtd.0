Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16oifC-0001UC-00
	for <linux-mtd@lists.infradead.org>; Sat, 23 Mar 2002 10:22:18 +0000
Date: Sat, 23 Mar 2002 11:22:15 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: Andrew Dixon <andrew.dixon@seranoa.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: CVS tags?
Message-ID: <20020323112215.B13151@wohnheim.fh-wedel.de>
References: <3C9BA0DD.B3827964@seranoa.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3C9BA0DD.B3827964@seranoa.com>; from andrew.dixon@seranoa.com on Fri, Mar 22, 2002 at 04:23:41PM -0500
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hi!

> I wanted to grab a stable version of the mtd stuff and I was wondering
> which cvs tag I should use.  I'm building for a linux 2.4.16 kernel.  It
> looks like maybe "core_patch_applied" is a good one to go with.  Any
> thoughts?

Whow, someone noticed!

That tag belongs to the mtd-2_5-newpartcode-branch, which should get
included into 2.5 as soon as David has actually read and approved the
code. It is working stable for me, on four different platforms with up
to 10 mtd devices, each one being partitioned. But noone else uses the
code, as far as I know of, so the decision is yours. :-)

You should use it if you
- have more than one device that can be partitioned or
- want to get used to the new code from the beginning.

Jörn

-- 
Public Domain  - Free as in Beer
General Public - Free as in Speech
BSD License    - Free as in Enterprise
Shared Source  - Free as in "Work will make you..."
