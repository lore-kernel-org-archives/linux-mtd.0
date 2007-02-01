Received: from mtagate4.uk.ibm.com ([195.212.29.137])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HCcBN-0000ga-3t
	for linux-mtd@lists.infradead.org; Thu, 01 Feb 2007 13:41:02 +0000
Received: from d06nrmr1407.portsmouth.uk.ibm.com
	(d06nrmr1407.portsmouth.uk.ibm.com [9.149.38.185])
	by mtagate4.uk.ibm.com (8.13.8/8.13.8) with ESMTP id l11DWqPM187472
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 13:32:52 GMT
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by d06nrmr1407.portsmouth.uk.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l11DWpOX1904744
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 13:32:51 GMT
Received: from d06av03.portsmouth.uk.ibm.com (loopback [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l11DWpQ8003525
	for <linux-mtd@lists.infradead.org>; Thu, 1 Feb 2007 13:32:51 GMT
From: Alexander Schmidt <alexs@linux.vnet.ibm.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [RFC] [PATCH 0/1] [MTD] UBI: implement per-volume update
Date: Thu, 1 Feb 2007 14:32:46 +0100
References: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
In-Reply-To: <20070201102105.15629.61206.sendpatchset@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200702011432.46439.alexs@linux.vnet.ibm.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

I have tested and reviewed the patch, it works fine!

Regards,
Alexander Schmidt

On Thursday 01 February 2007, Artem Bityutskiy wrote:
> Hello Alexander,
> 
> I've implemented per-volume update based on your patch. Thank you for
> your work - I have added a credit statement for you in the code.
> 
> In addition to what your patch does, this patch cleans-up and more
> comments and makes them consistent to new update marker stuff. It
> also removes the insane ivol_data from the VID header. It refines
> semantics of 'corrupted' flag better.
> 
> Please, review it and try it.
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
