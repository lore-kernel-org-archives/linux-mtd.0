Received: from e31.co.us.ibm.com ([32.97.110.149])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1IFtln-0003vP-KB
	for linux-mtd@lists.infradead.org; Tue, 31 Jul 2007 11:36:38 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e31.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l6VFaCkL005094
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 11:36:12 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.4) with ESMTP id
	l6VFaB6e257716
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 09:36:11 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l6VFaAmX027038
	for <linux-mtd@lists.infradead.org>; Tue, 31 Jul 2007 09:36:11 -0600
Subject: Re: JFFS2 deadlock with alloc_sem
From: Dave Kleikamp <shaggy@linux.vnet.ibm.com>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1185895406.3083.117.camel@pmac.infradead.org>
References: <af3ea28a0707262032h7ee22775t6ef54e364a9cd704@mail.gmail.com>
	<af3ea28a0707262038i733d0a0rf6fda8e1fc82dd74@mail.gmail.com>
	<1185543729.13873.10.camel@kleikamp.austin.ibm.com>
	<af3ea28a0707270935v3a8191acl5f2dc5780c56a3d9@mail.gmail.com>
	<1185557896.22352.4.camel@kleikamp.austin.ibm.com>
	<1185799508.3083.20.camel@pmac.infradead.org>
	<1185813909.9523.42.camel@kleikamp.austin.ibm.com>
	<1185883827.3083.109.camel@pmac.infradead.org>
	<1185888229.14534.13.camel@kleikamp.austin.ibm.com>
	<1185895406.3083.117.camel@pmac.infradead.org>
Content-Type: text/plain
Date: Tue, 31 Jul 2007 10:36:08 -0500
Message-Id: <1185896168.14534.17.camel@kleikamp.austin.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Roberts Nathan-mcg31137 <Nathan.Roberts@motorola.com>,
	linux-mtd@lists.infradead.org, ye janboe <janboe.ye@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2007-07-31 at 16:23 +0100, David Woodhouse wrote:
> On Tue, 2007-07-31 at 08:23 -0500, Dave Kleikamp wrote:
> > We had tried a similar patch, attached here, but it caused problems.
> > Maybe our patch is missing something.
> > 
> > >From the bug report:
> > -----------------------------
> > Built and ran the 2nd patch (attachment 28493 [edit]).  Results are similar
> > as before, jffs2 runs for a little while, but soon complains there's 
> > already data at the point where it intends to write. 
> > 
> > ARGH. About to write node to 0x00140010 on flash, but there's data already 
> > there:
> > 0x00140010: 19 85 e0 02 00 00 00 ac 0a 3e 48 74 00 00 00 74 
> 
> Hm, I think that's probably a _separate_ problem, which you happened to
> exacerbate. I don't see how it's related to f->sem locking.

Could be.  Remember this was on a 2.4 kernel as well, so mileage may
vary on the latest code.

Shaggy
-- 
David Kleikamp
IBM Linux Technology Center
