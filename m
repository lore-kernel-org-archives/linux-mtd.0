Received: from mail2.shareable.org ([80.68.89.115])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LLT0y-0003E3-02
	for linux-mtd@lists.infradead.org; Sat, 10 Jan 2009 01:51:53 +0000
Date: Sat, 10 Jan 2009 01:51:50 +0000
From: Jamie Lokier <jamie@shareable.org>
To: Adam Yergovich <ayergo@jkmicro.com>
Subject: Re: Access entire device with mtdblock0
Message-ID: <20090110015150.GH1972@shareable.org>
References: <4967F2B2.4060405@jkmicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4967F2B2.4060405@jkmicro.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Adam Yergovich wrote:
> There was a grand feature in the 2.4 flavor of MTD that i used wherein 
> mtdblock0 was assigned the entirety of the device.  This made updating 
> the flash image very easy.
> 
> I've since started messing around with 2.6 flavors, and while i have a 
> working map that gives the partitions i can no longer access the entire 
> device.  I've tried a few things without success to get it to work.
> 
> Any recommendations on a simple way to create a partition using the 
> entirety of flash?

Hey, I use that feature with 2.4 too, and I'm looking at porting a
device to 2.6.  I'll be interested in the answer.

-- Jamie
