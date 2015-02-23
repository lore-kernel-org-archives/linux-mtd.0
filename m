Received: from bastet.se.axis.com ([195.60.68.11])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YPo9s-0006R6-PA
 for linux-mtd@lists.infradead.org; Mon, 23 Feb 2015 08:14:30 +0000
Date: Mon, 23 Feb 2015 09:14:02 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Alexander Aronsky <alexander_ar@rad.com>
Subject: Re: Resizing mtd partition
In-Reply-To: <DBXPR03MB4327478CB0DB83D82615D9DE2280@DBXPR03MB432.eurprd03.prod.outlook.com>
Message-ID: <alpine.DEB.2.02.1502230907230.17631@lnxricardw1.se.axis.com>
References: <DBXPR03MB4327478CB0DB83D82615D9DE2280@DBXPR03MB432.eurprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sun, 22 Feb 2015, Alexander Aronsky wrote:

> Hi everyone,
> 
> I have to resize an existing mtd partition on a NOR flash of an embedded
> device (PPC architecture) without losing the data on this partition.
> 
> To be more specific, I have /dev/mtd0 and /dev/mtd1 devices on my flash,
> and I want to increase the size of the file system mounted on /dev/mtdblock0
> at the expense of the one on /dev/mtdblock1. For example, eliminate the
> /dev/mtd1 altogether and give the /dev/mtd0 all the available space on the
> flash.
> 
> What is the proper way to do it?

I don't think there is a 'proper' way, i.e. a resize application.

However, if the file system on the partition is jffs2, then I believe one 
could do the following:

- Unmount /dev/mtd0 (and /dev/mtd1)
- Erase /dev/mtd1
- Rewrite the partitioning info so that /dev/mtd0 now includes both
  partitions.
- Mount /dev/mtd0 .

When /dev/mtd0 is mounted, jffs2 will now see that the size is 
larger. Since there is no global file system information within a jffs2 
file system, it will see the newly erased space as unused when scanning 
the partition during the mount operation.

If you can't unmount /dev/mtd0 because it is the root file system, 
you could do most operations with /dev/mtd0 mounted, and a reboot in 
between:

- Unmount /dev/mtd1.
- Erase /dev/mtd1.
- Rewrite partitioning info so that /dev/mtd0 new includes both old 
  partitions.
- Reboot the system, when it starts it will use the new larger 
  /dev/mtd0 .

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
