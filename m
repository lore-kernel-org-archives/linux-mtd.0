Received: from e35.co.us.ibm.com ([32.97.110.153])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hl5Ct-0004kb-Ew
	for linux-mtd@lists.infradead.org; Mon, 07 May 2007 11:34:10 -0400
Received: from d03relay02.boulder.ibm.com (d03relay02.boulder.ibm.com
	[9.17.195.227])
	by e35.co.us.ibm.com (8.13.8/8.13.8) with ESMTP id l47FWoNE010945
	for <linux-mtd@lists.infradead.org>; Mon, 7 May 2007 11:32:50 -0400
Received: from d03av01.boulder.ibm.com (d03av01.boulder.ibm.com [9.17.195.167])
	by d03relay02.boulder.ibm.com (8.13.8/8.13.8/NCO v8.3) with ESMTP id
	l47FWoA6142942
	for <linux-mtd@lists.infradead.org>; Mon, 7 May 2007 09:32:50 -0600
Received: from d03av01.boulder.ibm.com (loopback [127.0.0.1])
	by d03av01.boulder.ibm.com (8.12.11.20060308/8.13.3) with ESMTP id
	l47FWoIa024361
	for <linux-mtd@lists.infradead.org>; Mon, 7 May 2007 09:32:50 -0600
Subject: Re: yaffs2 image
From: Josh Boyer <jwboyer@linux.vnet.ibm.com>
To: Mete Kart <mete.kart@avrupayazilim.com>
In-Reply-To: <463F41C2.6060108@avrupayazilim.com>
References: <463F41C2.6060108@avrupayazilim.com>
Content-Type: text/plain
Date: Mon, 07 May 2007 10:27:18 -0500
Message-Id: <1178551638.2990.78.camel@zod.rchland.ibm.com>
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

On Mon, 2007-05-07 at 18:12 +0300, Mete Kart wrote:
> Hi,
> 
> I have a problem with creating YAFFS2 image on linux system.
> On my debian-linux with kernel 2.6.11.7 I have the following tool: 
> "mkyaffs2image"
> I use this tool and create an image but this tool does not get any 
> variable such as page size or erase size.
> Anyway I have a large page size NAND flash and after creating the image, 
> "nandwrite" gives an error: "wrong page size".
> How can I create an YAFFS2 image according to my desired (large page) 
> conditions?

You should ask on the YAFFS mailing list.  Someone on this list might
know, but you'll have much better luck on the YAFFS list I think.

josh
