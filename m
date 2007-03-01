Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HMrxI-0002xV-DH
	for linux-mtd@lists.infradead.org; Thu, 01 Mar 2007 15:32:51 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Max Flash Size?
Date: Fri, 2 Mar 2007 09:37:15 +1300
References: <B1EDF20A6EAAD74EA65E46F774F17845EFDA5B@orsmsx413.amr.corp.intel.com>
In-Reply-To: <B1EDF20A6EAAD74EA65E46F774F17845EFDA5B@orsmsx413.amr.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200703020937.15812.manningc2@actrix.gen.nz>
Cc: "Johnson, Charles F" <charles.f.johnson@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 01 March 2007 10:17, Johnson, Charles F wrote:
> I've heard there is scalability issues with JFFS2 with large flash
> sizes.   So my question on this list is for a NAND flash design, is
> there a maximum size that JFFS2 can handle ??  4GB, 8GB, ????

I don't know where JFFS2 hits the wall, theoretically or practically, but I do 
know that people are using YAFFS on 6GB partitions. 

YAFFS does use u32s internally but only thinks in pages and 32-bits worth of 
pages go a long way.  You'll hit practical limits (like RAM required) long 
before that.

-- Charles
