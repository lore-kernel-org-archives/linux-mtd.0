Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SQDxz-0001yk-Jw
 for linux-mtd@lists.infradead.org; Fri, 04 May 2012 08:34:20 +0000
Date: Fri, 4 May 2012 10:34:11 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thilo Fromm <fromm@dresearch-fe.de>
Subject: Re: State of read-only filesystems in NAND / MTD bad blocks handling
 when reading
In-Reply-To: <CADZ6=avNF9e5-bG0O=jOm0kjV8XpgcY_JA1DV1RnvhQndN+Hcg@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1205041027360.27120@lnxricardw.se.axis.com>
References: <CADZ6=aumk74QxF3kjenFYqQUZ-OaPT8gmrN-xUGE6NPPyq87NQ@mail.gmail.com>
 <CADZ6=asURkKX6VB_UsmtcMnU5N8Xq_Lv7uRpkvYmQ3YBU7tvhQ@mail.gmail.com>
 <Pine.LNX.4.64.1205020933520.20592@lnxricardw.se.axis.com>
 <CADZ6=asdcCJOnPJfkV67wNHu2CX16NTzmN5z14nDhqGVvHdo4g@mail.gmail.com>
 <Pine.LNX.4.64.1205021047010.20592@lnxricardw.se.axis.com>
 <CADZ6=at5axiWkNF5CiqjqJmzsQdrKiVoPJh27ehy0fGsgLdSjw@mail.gmail.com>
 <Pine.LNX.4.64.1205030855540.8107@lnxricardw.se.axis.com>
 <CADZ6=avNF9e5-bG0O=jOm0kjV8XpgcY_JA1DV1RnvhQndN+Hcg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 4 May 2012, Thilo Fromm wrote:

>> With a root file system in ubifs, you can boot directly with a root
>> filesystem in UBI, with a kernel command line such as
>>
>> ubi.mtd=3D2 root=3Dubi0:rootfs rootfstype=3Dubifs
>>
>> I don't know how far back that was possible, you were using 2.6.27 were =
you
>> not (in my case I'm using 2.6.35)?
>
> This would work for me (since I'm on 2.6.37) but I deeply eschew the
> complexity this approach would bring to our system. Don't get me wrong
> - I really like UBIFS; we use it for application partitions. I just
> don't think it's the right thing to use for a RO rootfs. I want
> simple.

If you are using ubifs already on your system then you have all the=20
required parts at hand. From a use point of view ubifs as a rootfs is=20
simple; create a volume for your rootfs, write your data, specify=20
appropriate parameters on the command line. So in that sense it is simple,=
=20
even if a lot goes on 'under the hood'.

In a comparison I did a while ago, switching from jffs2 to ubifs cut about=
=20
9 seconds off the boot time for our system (which was in the range of one=
=20
minute to start with) and gave us 3 MB more of free RAM after boot. It did=
=20
consume a couple of MB more of flash (the jffs2 file system was 18 MB, the=
=20
ubifs one 22 MB).

So yes, it may be overly complex, but in practice I feel there are=20
significant advantages: faster boot and consistent use of UBI/ubifs=20
throughout the whole system in this case.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
