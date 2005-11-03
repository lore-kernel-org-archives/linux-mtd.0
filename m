Received: from e2.ny.us.ibm.com ([32.97.182.142])
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EXgcr-0004w6-Q5
	for linux-mtd@lists.infradead.org; Thu, 03 Nov 2005 10:03:39 -0500
Received: from d01relay02.pok.ibm.com (d01relay02.pok.ibm.com [9.56.227.234])
	by e2.ny.us.ibm.com (8.12.11/8.12.11) with ESMTP id jA3F3Zq9007590
	for <linux-mtd@lists.infradead.org>; Thu, 3 Nov 2005 10:03:35 -0500
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by d01relay02.pok.ibm.com (8.12.10/NCO/VERS6.7) with ESMTP id
	jA3F3V87117322
	for <linux-mtd@lists.infradead.org>; Thu, 3 Nov 2005 10:03:34 -0500
Received: from d01av04.pok.ibm.com (loopback [127.0.0.1])
	by d01av04.pok.ibm.com (8.12.11/8.13.3) with ESMTP id jA3F3V4V021695
	for <linux-mtd@lists.infradead.org>; Thu, 3 Nov 2005 10:03:31 -0500
From: Josh Boyer <jdub@us.ibm.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <Pine.LNX.4.64.0511021116090.12873@localhost.localdomain>
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
	<1130536220.3901.5.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
	<1130946658.4348.26.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0511021116090.12873@localhost.localdomain>
Content-Type: text/plain
Date: Thu, 03 Nov 2005 09:03:26 -0600
Message-Id: <1131030206.3435.1.camel@windu.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Write performance issue with cfi_cmdset_0001.c
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2005-11-02 at 11:17 -0500, Nicolas Pitre wrote:
> On Wed, 2 Nov 2005, Josh Boyer wrote:
> 
> > On Fri, 2005-10-28 at 18:04 -0400, Nicolas Pitre wrote:
> > > 
> > > But current code has almost same behavior:
> > 
> > > And therefore I wonder if what you saw could occur with that version as 
> > > well.
> > 
> > Ok, here is a pseduo-description of the problem.  Sorry for the delay in
> > my reply, I've been trying to verify that it still exists in 2.6.  The
> > answer is "I think so" ;).
> 
> Your explanation makes sense.
> 
> Could you prepare a patch with it and a signed-off line?

I have no problems doing this (obviously I have the patch already :) ),
but I need to clear it with my employer for legal reasons.  I'll see if
I can expedite the process some.

josh
