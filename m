Received: from structure.biochem.nchu.edu.tw ([140.120.131.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GbXr-0002GE-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 08:58:15 +0000
Date: Tue, 26 Nov 2002 05:42:14 +0800 (CST)
From: shadow <saturn@structure.biochem.nchu.edu.tw>
To: John Hall <john.hall@optionexist.co.uk>
cc: linux-mtd@lists.infradead.org, <manningc2@actrix.gen.nz>
Subject: RE: SmartMedia Card need to create fs before mounting it ?
In-Reply-To: <541025071C7AC24C84E9F82296BB9B950807BF@OPTEX1.optex.local>
Message-ID: <Pine.LNX.4.44.0211260527100.20708-100000@structure.biochem.nchu.edu.tw>
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

On Tue, 26 Nov 2002, John Hall wrote:
Thank your advice!

I don't understand what difference between /dev/mtd/x and /dev/mtdblock/x 
?
I just know if I configured "CONFIG_MTD_CHAR=y", will get /dev/mtd/x
and if configured "CONFIG_MTD_BLOCK=y", will get /dev/mtdblock/x.
So I think mtd/x are char devices and mtdblock/x are block devices, but
which one link to SmartMedia card ? Can we both use mtd/x and mtdblock/x 
to accss SmartMedia ?

I used eraseall to erase /dev/mtd/6, it shown following messages..
----
<---------skip above
eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
Erasing 8 Kibyte @ 7f4000 -- 99 % complete.
eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
Erasing 8 Kibyte @ 7f8000 -- 99 % complete.
eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
Erasing 8 Kibyte @ 7fa000 -- 99 % complete.
eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
Erasing 8 Kibyte @ 7fe000 -- 99 % complete.
eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
Erased 8192 Kibyte @ 0 -- 100% complete. 

It indicated I/O error that I don't what's up.

Best regards,
Brian Lee
 

> On 26 November 2002 07:36 Charles Manning <manningc2@actrix.gen.nz>
> wrote:
> 
> > > When I mount a partition on the SmartMedia card, if I must need to
> > > put a jffs2's image on it before mounting it ? Or existed a tool
> > > that can directly make jffs2 on the nand flash ?
> > 
> > I believe you will need to run mkfs.jffs2 to format the nand first.
> > 
> > You will find this in mtd/util in the mtd cvs.
> 
> Or just erase the NAND flash to create an empty JFFS2 partition:
> 
> 	eraseall /dev/mtdx
> 
> eraseall is also in mtd/util.
> 
> cheers,
> John
> 
