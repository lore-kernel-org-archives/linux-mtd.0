Received: from mail1.cray.com ([136.162.0.111])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B6ty9-0007dT-KH
	for linux-mtd@lists.infradead.org; Fri, 26 Mar 2004 16:14:05 +0000
Message-ID: <406456BC.1020802@cray.com>
Date: Fri, 26 Mar 2004 10:13:48 -0600
From: David Updegraff <dave@cray.com>
MIME-Version: 1.0
To: llandre <r&d@wawnet.biz>
References: <6.0.1.1.0.20040326125338.01f8bab8@dns.struinfo.it>
In-Reply-To: <6.0.1.1.0.20040326125338.01f8bab8@dns.struinfo.it>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: Large block NANDs - preliminary diff (2)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

llandre.

Thanks for your work and patch.  I may well be deluded, but aside from 
the large-page-inefficiencies vis.a.vis. file system allocations, it 
still seems to me we have some OOB troubles with the existing API.
Because oob layout is exported, whereas I think oob layout should be 
hidden in the driver.

 From what I see, there are three reasons for anyone outside the driver 
to know about oob: ecc, badblock and fs-specific data.

For ecc, they only need to set ON or off for the whole chip, for 
badblock its a boolean per page or block.  And FSDATA is some stuff that 
  the filesystem wants to scribble on its own, that the driver does not 
interpret.

For ecc, there is already an ioctl that can set it generically, if you 
ignore the .eccpos bytes.  And badblock also has a function pointer in 
the driver.

What remains is a way for the filesystem drivers to scribble their own 
bytes of data per page or block.  IMHO they should be able to do this 
independently.  Perhaps that the officially PUBLISHED oobsize and 
oob_buf stuff currently in place should infact refer to those regions of 
the oob that are OUTSIDE of the internal-driver-managed oob regions 
dedicated to badblock marking or ecc tracking. The driver always does 
its own ecc calculations anyway: why even let anyone else see that area?

But yes; I know; references to the oob stuff is sprinkled everywhere, 
and it'll probably be short-term easier to just add another case:
here&there.

-dbu.
