Received: from e33.co.us.ibm.com ([32.97.110.151])
	by canuck.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1GiUya-0004Nx-6l
	for linux-mtd@lists.infradead.org; Fri, 10 Nov 2006 06:55:23 -0500
Received: from d03relay04.boulder.ibm.com (d03relay04.boulder.ibm.com
	[9.17.195.106])
	by e33.co.us.ibm.com (8.13.8/8.12.11) with ESMTP id kAABt9DT025044
	for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2006 06:55:09 -0500
Received: from d03av03.boulder.ibm.com (d03av03.boulder.ibm.com [9.17.195.169])
	by d03relay04.boulder.ibm.com (8.13.6/8.13.6/NCO v8.1.1) with ESMTP id
	kAABt8RG253576
	for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2006 04:55:08 -0700
Received: from d03av03.boulder.ibm.com (loopback [127.0.0.1])
	by d03av03.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	kAABt8sv028351
	for <linux-mtd@lists.infradead.org>; Fri, 10 Nov 2006 04:55:08 -0700
Subject: Re: mount costs too long
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Aubrey <aubreylee@gmail.com>
In-Reply-To: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
References: <6d6a94c50611092305v6f52b9b0hfd254e10a2992d44@mail.gmail.com>
Content-Type: text/plain
Date: Fri, 10 Nov 2006 05:56:21 -0600
Message-Id: <1163159781.19697.24.camel@crusty.rchland.ibm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-11-10 at 15:05 +0800, Aubrey wrote:
> Hi all,
> 
> I wrote a mtd-nand driver and enabled it with YAFFS on 2.6.18.
> When I mount the mtd partition of a large page nand chip, everything works fine.
> But When I replace the large page nand chip with a small page nand
> chip,everything works ok except mount costs about 8 seconds. It's too
> long, I think.

You might try asking on the YAFFS mailing list.  I'm not sure why
changing to a smaller chip would vary the mount time.

josh
