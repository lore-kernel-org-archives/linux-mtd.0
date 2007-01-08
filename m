Received: from e6.ny.us.ibm.com ([32.97.182.146])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1H3uBP-00045o-TS
	for linux-mtd@lists.infradead.org; Mon, 08 Jan 2007 13:05:04 +0000
Received: from d01relay04.pok.ibm.com (d01relay04.pok.ibm.com [9.56.227.236])
	by e6.ny.us.ibm.com (8.13.8/8.12.11) with ESMTP id l08D3fDc025464
	for <linux-mtd@lists.infradead.org>; Mon, 8 Jan 2007 08:03:41 -0500
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay04.pok.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	l08D38ud276022
	for <linux-mtd@lists.infradead.org>; Mon, 8 Jan 2007 08:03:08 -0500
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l08D38oe014135
	for <linux-mtd@lists.infradead.org>; Mon, 8 Jan 2007 08:03:08 -0500
Subject: RE: max size of MTD?
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Vinit Agnihotri <vinit.agnihotri@calsoftinc.com>
In-Reply-To: <200701081149.l08BnQn5001183@mail.calsofthq.com>
References: <200701081149.l08BnQn5001183@mail.calsofthq.com>
Content-Type: text/plain
Date: Mon, 08 Jan 2007 07:03:28 -0600
Message-Id: <1168261409.4001.0.camel@zod.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, 'Seongsu Lee' <senux@senux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2007-01-08 at 17:19 +0530, Vinit Agnihotri wrote:
> U have mentioned of creating 1 MTD device of 6GB by mtdconcat. However I am
> curious to know how many mtd devices u've concatenated to make 6GB
> possible??? I am using mtdramm as test device but I am not able to allocate
> memory over 1GB. So no question of having even more devices to make it above
> 5GB. Can you focus on the same question & help me. How can I allocate more
> memory than 4GB??? Or how can I create 6GB MTD device.
> My current test machine is AMD 64bit opteron with 1GB memory.

He has 6GiB of real flash memory, not DRAM.  Allocating more than 1GiB
of DRAM for mtdram will likely take more work.

josh
