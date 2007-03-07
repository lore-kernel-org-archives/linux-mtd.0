Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HP0bj-0000a7-KI
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 13:11:31 -0500
Date: Wed, 7 Mar 2007 19:07:47 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: ian@brightstareng.com
Subject: Re: JFFS2 Support for Large Flash Designs
Message-ID: <20070307180743.GC16439@lazybastard.org>
References: <mailman.311.1173272465.2275.linux-mtd@lists.infradead.org>
	<200703071223.07485.ian@brightstareng.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <200703071223.07485.ian@brightstareng.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Please keep me on the Cc: list.

On Wed, 7 March 2007 12:23:07 -0500, ian@brightstareng.com wrote:
> 
> There are some positives of having components maintained outside 
> the context of "linux".

Can you name those?

> Yaffs actually has a life outside linux.  Using "outside the 
> mainline" as an argument is weak at best. The 2.6 kernel 
> makefile makes building a module outside the tree trivial -- so 
> lots of the older build hassles and arguments no longer exist.

If building it were our only problem...

Problems that cause much more trouble are:
o Following the changing in-kernel APIs.  I maintain several
  out-of-tree projects myself and can tell you it is a pain.  At times I
  don't update my kernel for month because I lack the time to update the
  cowlink patches.
o Problem support.  Unless the code is in mainline, the only person that
  will be willing to assist a user is the one responsible for the
  out-of-tree project.  Such support can be good, on average it tends to
  be somewhat worse.
o Code maturity.  Face it, there is often a reason why the code is not
  in mainline.

How much of the above applies to YAFFS is a seperate question I don't
want to answer.  But in general, being wary of out-of-tree code is a
good thing.

Jörn

-- 
"Error protection by error detection and correction."
-- from a university class
