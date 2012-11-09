Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TWkbe-0002cG-To
 for linux-mtd@lists.infradead.org; Fri, 09 Nov 2012 09:10:35 +0000
Date: Fri, 9 Nov 2012 10:10:24 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Joe <tttechmail@gmail.com>
Subject: Re: Frequent Writes to NAND flash with UBIFS in sychronous mode 
In-Reply-To: <loom.20121108T103932-198@post.gmane.org>
Message-ID: <alpine.DEB.2.00.1211091006110.29771@lnxricardw.se.axis.com>
References: <loom.20121108T103932-198@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"; format=flowed
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


On Thu, 8 Nov 2012, Joe wrote:

> Hi,
> I have the following observation when UBIFS is mounted as synchronous fs. (-o
> sync option from bootargs).
>
> 1. For every file read, there are writes  to nand flash.
> 2. For the execution of every command, there are writes to nand flash.
> For ex. On execution of any command, say 'cd' or 'ls' i observe quiet a few
> writes happening to NAND flash.

I'm no expert but I could imagine two reasons, one, that there are cached 
writes which are being performed shortly after your read operations.

Two, it could be that the UBI scrub functionality is (erroneously) 
detecting that the data needs to be rewritten and consequently does a 
rewrite whenever something is read.

Does this only happen in synchronous mode?

In general reading should not cause anything to be written. In fact, you 
can mount a static UBI volume as a file system (which cannot be rewritten 
on a block basis, only on a volume basis) which wouldn't be possible if 
there were writes being performed. (In all honesty, I haven't tried using 
-o sync when doing this though).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
