Received: from softsteprubberfloors.com ([192.220.111.56] helo=rcmenter.iserver.net)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18IvBf-0003bY-00
	for <linux-mtd@lists.infradead.org>; Mon, 02 Dec 2002 18:20:55 +0000
Subject: Re: Newbie question
From: Russ Dill <Russ.Dill@asu.edu>
To: Brian Waite <waite@skycomputers.com>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <200212021323.28860.waite@skycomputers.com>
References: <200212021323.28860.waite@skycomputers.com>
Content-Type: text/plain
Message-Id: <1038855329.13667.0.camel@timmy>
Mime-Version: 1.0
Date: 02 Dec 2002 11:55:29 -0700
Content-Transfer-Encoding: 7bit
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

On Mon, 2002-12-02 at 11:23, Brian Waite wrote:
> Hi, 
> I am very new to the MTD world and I had a quick question that may rank in the 
> RTFM land, but I am doing that and not finding an answer. I have a board that 
> has 2-2x16 128 Mbit Intel StrataFLASHes side by side that I want to run with 
> the MTD layer. It looks like the cfi_cmdset_001.c will work except I have to 
> issue commands to both FLASH chips at the same time. Has anyone implimented 
> something like this? Is there some documentation other than the infradead 
> site? As long as this is up to date I am happy, but I wasn't convinced it is 
> fully up-to-date. I am coming the archives so even a quick subject line 
> pointer would be great. 

something like this just "works" (due to a lot of good programming)
