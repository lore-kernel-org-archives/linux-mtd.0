Received: from co202.xi-lite.net ([149.6.83.202] helo=toronto.xi-lite.net)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ICzTS-0000gt-MB
	for linux-mtd@lists.infradead.org; Mon, 23 Jul 2007 11:05:29 -0400
Message-ID: <46A4C2BE.3050108@parrot.com>
Date: Mon, 23 Jul 2007 17:01:18 +0200
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: Ben Dooks <ben@fluff.org>
Subject: Re: [PATCH] S3C24XX large page NAND support
References: <20070709231147.GA30072@fluff.org.uk> <4695FC93.7040800@parrot.com>
	<20070723134617.GA19071@fluff.org.uk>
In-Reply-To: <20070723134617.GA19071@fluff.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

Hi Ben,

Ben Dooks wrote:
> On Thu, Jul 12, 2007 at 12:04:03PM +0200, Matthieu CASTET wrote:
> [snip]
>>>  
>>> -		nmtd->scan_res = nand_scan(&nmtd->mtd, (sets) ? sets->nr_chips : 1);
>>> +		nmtd->scan_res = nand_scan_ident(&nmtd->mtd,
>>> +						 (sets) ? sets->nr_chips : 1);
>>>  
>>>  		if (nmtd->scan_res == 0) {
>>> +			s3c2410_nand_update_chip(info, nmtd);
>>> +			nand_scan_tail(&nmtd->mtd);
>>>  			s3c2410_nand_add_partition(info, nmtd, sets);
>>>  		}
>> Shouldn't nand_scan_ident and nand_scan_tail be used here ?
> 
> Sorry, do you mean that they should be used here (and they are
> being used in this code) or do you mean that you do not think
> that these two are to be used here?
> 
Sorry for the noise, I misread the patch and was thinking nand_scan was 
still used.

Again sorry.


Matthieu
