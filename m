Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1ORDFR-0005CM-Hc
	for linux-mtd@lists.infradead.org; Tue, 22 Jun 2010 23:51:22 +0000
Received: by pvc7 with SMTP id 7so1298461pvc.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 22 Jun 2010 16:51:19 -0700 (PDT)
Message-ID: <4C214C73.7000709@taitradio.com>
Date: Wed, 23 Jun 2010 11:51:15 +1200
From: Robin Gilks <robin.gilks@taitradio.com>
MIME-Version: 1.0
To: linux-mtd <linux-mtd@lists.infradead.org>
Subject: Updating kernel after 5 year gap!!
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Oh dear - I'm going to get some stick from the list for this one...

I've just come back to a project after a gap of 5 years and wish to 
update it from 2.4.22 to 2.4.37.9 (latest 2.4) but the functionality 
contained in maps/physmap seems to have moved on somewhat. How do I 
invoke the cmdlineparts parser these days - there used to be a 
part_probes array that defined what probes to do but I can't work out 
where that functionality has gone.

Also, the chips/cfi_cmdset_0001 used to have a fixup list for those 
chips that didn't quite comply with the CFI spec - eg. the ST chip I'm 
using doesn't support block write correctly. Has this gone entirely or 
has it moved to the platform stuff like a lot of other things did in 2.6

Some pointers to sample code would be the best pointer by far (being a 
master of the cut-n-paste) but just telling me would work as well :-)

Cheers

-- 
Robin Gilks
Senior Design Engineer
Tait Radio Communications
DDI: 64 3 3571569
www.taitradio.com
robin.gilks@tait.co.nz
TAIT: THE RIGHT FIT
