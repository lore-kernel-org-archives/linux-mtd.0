Received: from smtp3.newsguy.com ([74.209.136.66] helo=smtp.newsguy.com)
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnWt7-0005Dw-Md
 for linux-mtd@lists.infradead.org; Wed, 18 Jan 2012 14:53:22 +0000
Received: from [192.168.12.102] (30.sub-166-250-10.myvzw.com [166.250.10.30])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id q0IErF4r011153
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jan 2012 06:53:16 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4F16DCC3.9040803@newsguy.com>
Date: Wed, 18 Jan 2012 06:52:51 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: identifying a flash file system
References: <CACJFQ2X831y+Kr2==4NS+Jz8wtOn+k5WMuidepjOQuRQ-SKO9Q@mail.gmail.com>
In-Reply-To: <CACJFQ2X831y+Kr2==4NS+Jz8wtOn+k5WMuidepjOQuRQ-SKO9Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/17/2012 07:12 PM, Ballymunboy wrote:
> Hello,
>
> We have extracted the NAND flash contents from the TriMedia-based
> routers from 2Wire.


This is a Diskonchip flash?  Which variant?  What did you use to dump the
contents?  A couple of us have developed drivers for some of these. 
Specifically, the G3 (which will probably work on the P3 with slight
modification) and the G4.


>
> We would like to re-build the router's firmware. But, as yet, the
> flash file system to those devices cannot be identified.
>
> There is a header found in the first half of page zero of the flash
> device.  Fields in that header appear to reference two partitions - a
> boot partition and a file system partition.  [1]
>
> There is a hunch that the devices are using the flash translation
> layer from m-Systems TrueFFS  (now part of Sandisk). [2]


The latest TrueFFS implementation uses the M-Sys proprietary "saftl"
formatting.  Look for ASCII 'CNAND" at the start of the first page of an erase
block.  The page that starts with this magic string contains the TrueFFS/saftl
media header, which has partitioning info, etc.  On my Palm Treo 680 with the
diskonchip G4, it's on erase block 5.  The size of an erase block varies among
the diskonchip variants.


>
> The 2Wires are running an in-house flavour of BSD  (rtBSD/tm) so maybe
> the file system itself is ported from elsewhere in the *BSD platform.


Not likely.  If it's TrueFFS, it's M-Sys proprietary. 


>
> Has anyone here worked with TrueFFS?  What would be the best method
> for mounting the volume on a Linux PC for examination?


Write an saftl implementation for linux mtd :)  I think this was done to some
degree for ntfl and inftl, the predecessors of saftl.  Header files describing
the data in the aforementioned media header were provided to developers under
NDA, and they're floating around out there.  But I don't think a full-blown
saftl filesystem is worth it unless there's a need to examine the existing
filesystem contents.  Ubifs has been working well on my diskonchip.  What would
be useful is an mtd partition parser for saftl, though.

Looks like a neat effort.  I don't recognize the data you dumped from page 0. 
I'll compare it with what is on my device when I get a chance.  From perusing
your blog, it appears you boot from a separate flash device, so the BOOTboot
string doesn't really make sense.

Thanks,
Mike
