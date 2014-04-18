Received: from plane.gmane.org ([80.91.229.3])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WbCqs-0002Bv-TV
 for linux-mtd@lists.infradead.org; Fri, 18 Apr 2014 17:45:27 +0000
Received: from list by plane.gmane.org with local (Exim 4.69)
 (envelope-from <gldm-linux-mtd-36@m.gmane.org>) id 1WbCqV-0005oo-1v
 for linux-mtd@lists.infradead.org; Fri, 18 Apr 2014 19:45:03 +0200
Received: from d5152CEBB.static.telenet.be ([81.82.206.187])
 by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
 id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2014 19:45:03 +0200
Received: from yves.deweerdt.linux by d5152CEBB.static.telenet.be with local
 (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
 for <linux-mtd@lists.infradead.org>; Fri, 18 Apr 2014 19:45:03 +0200
To: linux-mtd@lists.infradead.org
From: Yves Deweerdt <yves.deweerdt.linux@gmail.com>
Subject: Re: [PATCH] Check flag status register for Micron n25q512a
Date: Fri, 18 Apr 2014 15:07:30 +0000 (UTC)
Message-ID: <loom.20140418T165944-129@post.gmane.org>
References: <6bf927e513554e628fe15d309aac698e@BLUPR07MB002.namprd07.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Insop Song,

In the datasheet of the N25Q512A it is mentioning at different places that 
the Flag Status Register should be polled twice in different spi accesses, 
once for each die in the chip. However, I don't see this happening in your 
patch.

- Didn't you have any problems using your patch?
- Is there some git repo having a patch to support the N25Q512A yet?

Kind regards,

Yves
