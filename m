Received: from over.ny.us.ibm.com ([32.97.182.150] helo=pokfb.esmtp.ibm.com)
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EjHth-0005x9-Lt
	for linux-mtd@lists.infradead.org; Mon, 05 Dec 2005 15:04:59 +0000
Received: from e33.co.us.ibm.com (e33.boulder.ibm.com [9.17.249.43])
	by pokfb.esmtp.ibm.com (8.12.11/8.12.11) with ESMTP id jB5F4f1o024841
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-mtd@lists.infradead.org>; Mon, 5 Dec 2005 10:04:42 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.12.11/8.12.11) with ESMTP id jB5F4JKY027604
	for <linux-mtd@lists.infradead.org>; Mon, 5 Dec 2005 10:04:19 -0500
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay04.boulder.ibm.com (8.12.10/NCO/VERS6.8) with ESMTP id
	jB5F5pIt096486
	for <linux-mtd@lists.infradead.org>; Mon, 5 Dec 2005 08:05:51 -0700
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11/8.13.3) with ESMTP id
	jB5F4I1m011203
	for <linux-mtd@lists.infradead.org>; Mon, 5 Dec 2005 08:04:18 -0700
From: Josh Boyer <jdub@us.ibm.com>
To: Nicolas Pitre <nico@cam.org>
In-Reply-To: <1131030206.3435.1.camel@windu.rchland.ibm.com>
References: <1130524729.3775.39.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281717020.5288@localhost.localdomain>
	<1130536220.3901.5.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0510281800220.5288@localhost.localdomain>
	<1130946658.4348.26.camel@windu.rchland.ibm.com>
	<Pine.LNX.4.64.0511021116090.12873@localhost.localdomain>
	<1131030206.3435.1.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Mon, 05 Dec 2005 09:04:21 -0600
Message-Id: <1133795061.5082.1.camel@windu.rchland.ibm.com>
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

On Thu, 2005-11-03 at 09:03 -0600, Josh Boyer wrote:
> On Wed, 2005-11-02 at 11:17 -0500, Nicolas Pitre wrote:
> > On Wed, 2 Nov 2005, Josh Boyer wrote:
> > 
> > > On Fri, 2005-10-28 at 18:04 -0400, Nicolas Pitre wrote:
> > > > 
> > > > But current code has almost same behavior:
> > > 
> > > > And therefore I wonder if what you saw could occur with that version as 
> > > > well.
> > > 
> > > Ok, here is a pseduo-description of the problem.  Sorry for the delay in
> > > my reply, I've been trying to verify that it still exists in 2.6.  The
> > > answer is "I think so" ;).
> > 
> > Your explanation makes sense.
> > 
> > Could you prepare a patch with it and a signed-off line?
> 
> I have no problems doing this (obviously I have the patch already :) ),
> but I need to clear it with my employer for legal reasons.  I'll see if
> I can expedite the process some.

Expediting takes a long time it seems.  Here's the patch:

http://marc.theaimsgroup.com/?l=linux-kernel&m=113355738408676&w=2

josh
