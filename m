Received: from marasystems.com ([213.150.153.194] helo=filer.marasystems.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18KEgp-0003yT-00
	for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2002 09:22:31 +0000
Date: Fri, 6 Dec 2002 10:52:59 +0100 (CET)
From: Henrik Nordstrom <hno@marasystems.com>
To: shadow <saturn@structure.biochem.nchu.edu.tw>
cc: linux-mtd@lists.infradead.org
Subject: Re: Some problem with patchin.sh !
In-Reply-To: <Pine.LNX.4.44.0212060012580.9062-100000@structure.biochem.nchu.edu.tw>
Message-ID: <Pine.LNX.4.44.0212061051210.3166-100000@filer.marasystems.com>
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

You should be able to make the following change:

from:
  grep -m X ...
to:

  grep ... | head -X

where X is the number after -m

Regards
Henrik


On Fri, 6 Dec 2002, shadow wrote:

> Hi Thomas,
> It said "grep: invalid option -- m" After I executed 
> mtd/patches/patchin.sh. My grep does not support this option at my linux. 
> Because of this error, patchin.sh can't get correct VSERION, PATCHLEVEL, 
> SUBLEVEL number ? How to fix it?
> 
> Thanks in advance,
> 
> Brian
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
