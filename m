Received: from e31.co.us.ibm.com ([32.97.110.129])
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1E7N4M-0006uQ-9d
	for linux-mtd@lists.infradead.org; Mon, 22 Aug 2005 20:55:20 -0400
Received: from westrelay02.boulder.ibm.com (westrelay02.boulder.ibm.com
	[9.17.195.11])
	by e31.co.us.ibm.com (8.12.10/8.12.9) with ESMTP id j7N0t6F3081866
	for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2005 20:55:06 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by westrelay02.boulder.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	j7N0sacX537622
	for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2005 18:54:36 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	j7N0t5pg017197
	for <linux-mtd@lists.infradead.org>; Mon, 22 Aug 2005 18:55:06 -0600
From: Josh Boyer <jdub@us.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1124613404.3407.31.camel@localhost.localdomain>
References: <0ILH00A5RUY3DW@mmp1.samsung.com>
	<1124613404.3407.31.camel@localhost.localdomain>
Content-Type: text/plain
Date: Mon, 22 Aug 2005 19:54:33 -0500
Message-Id: <1124758473.29360.0.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: LTP fs test results on OneNAND
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-08-21 at 09:36 +0100, David Woodhouse wrote:
> On Sat, 2005-08-20 at 09:06 +0900, Kyungmin Park wrote:
> > rwtest01                       FAIL       2
> > rwtest02                       FAIL       2
> > rwtest03                       FAIL       2
> > rwtest04                       FAIL       2
> > rwtest05                       FAIL       2
> 
> > Total Failures: 5
> 
> These are solely due to the lack of shared writable mappings, yes?
> 
> LTP tests correctness -- I like to do JFFS2 runs with some stress
> testing, like fsx-linux (and another tool called 'holey' which stresses
> the extent mapping stuff -- http://david.woodhou.se/holey.c).

Isn't fsx-linux part of the LTP now?

http://cvs.sourceforge.net/viewcvs.py/ltp/ltp/testcases/kernel/fs/fsx-linux/

Or is there some other version of it?

josh
