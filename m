Received: from lazybastard.de ([212.112.238.170] helo=longford.lazybastard.org)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HOuRa-0004N0-4B
	for linux-mtd@lists.infradead.org; Wed, 07 Mar 2007 06:36:32 -0500
Date: Wed, 7 Mar 2007 12:04:15 +0100
From: =?utf-8?B?SsO2cm4=?= Engel <joern@lazybastard.org>
To: "Johnson, Charles F" <charles.f.johnson@intel.com>
Subject: Re: JFFS2 Support for Large Flash Designs
Message-ID: <20070307110414.GB15583@lazybastard.org>
References: <625fc13d0703061736t1a2fbddel7a80d04314136c1d@mail.gmail.com>
	<B1EDF20A6EAAD74EA65E46F774F17845FD6247@orsmsx413.amr.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F17845FD6247@orsmsx413.amr.corp.intel.com>
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Disclaimer: I am the LogFS developer.  Everything below is my personal
opinion based on possibly outdated information.  Apply a grain of salt.

On Tue, 6 March 2007 17:38:04 -0800, Johnson, Charles F wrote:
> 
> What is this list's opinion of YAFFS ? 

Advantages:
o It exists and is working.
o From what I heard it is faster than JFFS2.
o Has a relatively simple design.

Disadvantages:
o Code is not in mainline Linux kernel.  I generally distrust such code;
  apart from the support question, it is an indication of other problems.
o Only works on raw NAND flash.
o Has O(n) properties, just like JFFS2.  It will hit the same
  scalability problem at some time in the future.
o No compression support.

Likely the best solution for your problem at the moment.

>> LogFS.

Advantages:
o Code exists.
o Fast mount time (~60ms).
o Has O(1) mount time and memory overhead, O(log(n)) for most other
  things, O(sqrt(n)) for GC.

Disadvantages:
o Still under development.  Medium format is constantly changing.
o Still has known bugs, see http://lazybastard.org/logfs/BUGS
o Currently needs to write more data to flash than JFFS2/YAFFS.

>> JFFS3

Advantages:
???

Disadvantages:
o To my knowledge, code does not exist (in public) yet.
o Garbage collection was an open issue, last time I looked.

Jörn

-- 
Invincibility is in oneself, vulnerability is in the opponent.
-- Sun Tzu
