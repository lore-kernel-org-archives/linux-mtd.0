Received: from relais.videotron.ca ([24.201.245.36])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO6Yv-0007ne-Gs
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 16:33:50 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: text/plain; CHARSET=US-ASCII
Received: from yoda.home ([96.23.157.65]) by VL-VM-MR003.ip.videotron.ca
 (Oracle Communications Messaging Exchange Server 7u4-22.01 64bit (built Apr 21
 2011)) with ESMTP id <0O1K00K3CJBJ3A20@VL-VM-MR003.ip.videotron.ca> for
 linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 11:33:19 -0500 (EST)
Date: Tue, 26 Jan 2016 11:33:18 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
To: "Wilcox, Matthew R" <matthew.r.wilcox@intel.com>
Cc: Jared Hulbert <jaredeh@gmail.com>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "ross.zwisler@linux.intel.com" <ross.zwisler@linux.intel.com>,
 Chris Brandt <Chris.Brandt@renesas.com>
Subject: RE: PMEM, DAX, MTD, and the quest for the Theory of Everything
In-reply-to: <100D68C7BA14664A8938383216E40DE04217A0C1@FMSMSX114.amr.corp.intel.com>
Message-id: <alpine.LFD.2.20.1601261129540.19789@knanqh.ubzr>
References: <CA+ZsKJ53E33rWmwv-v=_b8OjHT_20UW7WqD9XhhHJ0aYxJc=cA@mail.gmail.com>
 <100D68C7BA14664A8938383216E40DE04217A0C1@FMSMSX114.amr.corp.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 26 Jan 2016, Wilcox, Matthew R wrote:

> No, we haven't been considering the MTD code at all with DAX.  We leapt onto the S/390 filemap_xip code, and took it for a wild ride.  I did look at the MTD code a bit, but that was two or more years ago.  I vaguely remember thinking that it could be made to support DAX, but it really wasn't (and isn't) my focus.
> 
> I don't think I'd be terribly upset by the appearance of patches which 
> made DAX sit on top of an MTD device instead of a block device, but I 
> don't have a good feel for where embedded systems are these days.  Is 
> it still worth configuring out the block subsystem?

Where cost saving is the ultimate goal and consequently memory footprint 
reduction is a requirement then yes configuring out the block layer is a 
popular option.


Nicolas
