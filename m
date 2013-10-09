Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTvyS-0008Hk-Le
 for linux-mtd@lists.infradead.org; Wed, 09 Oct 2013 15:46:57 +0000
Date: Wed, 9 Oct 2013 17:45:57 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Wolfgang Denk <wd@denx.de>
Subject: Re: Grow UBI device?
In-Reply-To: <20131009150538.BAD57380432@gemini.denx.de>
Message-ID: <alpine.DEB.2.00.1310091725590.28562@lnxricardw.se.axis.com>
References: <20131008192846.A25E7380A65@gemini.denx.de>
 <alpine.DEB.2.00.1310091038110.28562@lnxricardw.se.axis.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA20350@DBDE04.ent.ti.com>
 <20131009150538.BAD57380432@gemini.denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: MTD Maling List <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 9 Oct 2013, Wolfgang Denk wrote:

>>> Come to think of it, I'm not sure that would work anyway, as the
>>> resulting, new, enlarged partition would partly contain UBI data and
>>> partly old jffs2 data. I'm not sure what UBI does when it encounters
>>> incorrect data, if it just erases the relevant blocks and formats them for
>>> its own use, or if it barfs completely and just bails out complaining that
>>> the partition does not contain UBI data. If the relevant blocks were
>>> erased, then I think UBI would simply concede that the a previous erase
>>> attempt had been prematurely aborted, and re-erase the blocks and write
>>> its headers, so perhaps that is something to try. At any rate it involves
>>> at least some mild trickery (erase the blocks that previously contained
>>> jffs2 data).
>>>
>> Yes, during mounting of UBIFS volumes, UBI checks for erase-header
>> on first-page of every block.
>
> Mounting UBIFS volumes should not be a problem - the existing ones are
> not located in the newly added area of the NAND.  The question however
> is what the UBI layer itself does, if I for example try to create a
> new volume which then would allocate blocks from the newly added
> space.

UBI scans the whole partition when the attachement is made to the mtd 
partition. So if you'd get any error message regarding blocks that lack 
UBI headers it would be then, not when you subsequently try to create a 
volume in the partition. By that time the volume should be "formatted" 
with valid UBI headers.

>> So, effectively you don't even need to erase the partition to convert
>> it into UBI volume, you just try attaching it as UBI volume and UBI
>> should erase it for you. (though flagging some warnings on the way).
>
> Are you sure about that?
>
> Well, I guess I'll have to try it out in the end...

I just tested it since I have a UBI system just beside me, by erasing and 
then writing zeros to a block (just to put non-UBI data in it) and 
restarting the system (the partition in question contains the volume with 
the root file system in it, so it is attached by the kernel during its 
boot). The result was that UBI didn't give any error or warning messages 
during boot, but a subsequent nanddump after boot revealed that the 
zeroed blocks now contained valid UBI headers, so, without looking at the 
source, it seems that UBI really does manage this fairly silently.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
