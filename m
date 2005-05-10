Received: from eos.fwall.u-szeged.hu ([160.114.120.248])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DVVfD-0007DX-3H
	for linux-mtd@lists.infradead.org; Tue, 10 May 2005 10:24:47 -0400
Message-ID: <4280D2B6.20501@inf.u-szeged.hu>
Date: Tue, 10 May 2005 16:26:46 +0100
From: Ferenc Havasi <havasi@inf.u-szeged.hu>
MIME-Version: 1.0
To: Niraj Maheshwari <niraj.maheshwari@gmail.com>
References: <f6d0cd0605051004524bab895b@mail.gmail.com>
In-Reply-To: <f6d0cd0605051004524bab895b@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: SUMMARY patch for JFFS2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Niraj,

> It gets mounted..and then i completely full this partition ( 5.5 MB)
> with data... then i  remove few of the files from this partition..then
> i do a sync.
> In the next reboot, i get to see lot of error while mounting this parition.

Can you send some more information about your flash chip? (erase block 
size, ...)

If you also can send us JFFS2 image before it goes wrong and after that 
also would be very big help for us to investigate what the problem is.

Thanks,
Ferenc
