Received: from code-monsters.com ([65.67.50.169] helo=smash.codemonsters.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16gtJj-0002z2-00
	for <linux-mtd@lists.infradead.org>; Fri, 01 Mar 2002 20:07:47 +0000
Received: from ba.devicemonsters.com (adsl-65-70-211-41.dsl.austtx.swbell.net [65.70.211.41])
	by smash.codemonsters.net (8.9.3/8.8.7) with ESMTP id OAA16891
	for <linux-mtd@lists.infradead.org>; Fri, 1 Mar 2002 14:19:07 -0600
Date: Fri, 1 Mar 2002 15:27:12 -0600 (CST)
From: "Brian P. Austin" <baustin@codemonsters.net>
To: linux-mtd@lists.infradead.org
Subject: Re: Reproduction of NFTL Bug with DOC 2000 288MB FULL DEBUG
Message-ID: <Pine.LNX.4.21.0203011524580.842-100000@ba.devicemonsters.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

OK.

re-did everything from scratch.  Dformat doc42.exb and loaded modules

modprobe -a doc2000 nftl mtdchar mtdcore
modprobe -a docprobe

the end of the output is.
--------------------------------------------------------------------------
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait

-- A whole lot of this --

_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
 nftla:<6>NFTL_request
NFTL Read  request, from sector 0x0000 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 0 (req->nr_sectors == 8)
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0002 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 2 (req->nr_sectors == 6)
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0004 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 4 (req->nr_sectors == 4)
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
NFTL read request completed OK
end_request(1)
NFTL_request
NFTL Read  request, from sector 0x0006 for 0x0002 sectors
Waiting for mutex
Got mutex
NFTL read request of 0x2 sectors @ 6 (req->nr_sectors == 2)
_DoC_WaitReady called for out-of-line wait
_DoC_WaitReady called for out-of-line wait
NFTL read request completed OK
end_request(1)
 nftla1

.

Is this correct?

Brian Austin
