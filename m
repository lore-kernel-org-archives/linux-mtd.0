Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S0rkp-0003cp-AS
 for linux-mtd@lists.infradead.org; Fri, 24 Feb 2012 09:47:56 +0000
Date: Fri, 24 Feb 2012 10:47:44 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Matthias Fuchs <matthias.fuchs@esd.eu>
Subject: Re: Updating UBIFS rootfilesystem
In-Reply-To: <4F4746E8.9040002@esd.eu>
Message-ID: <Pine.LNX.4.64.1202241045220.1556@lnxricardw.se.axis.com>
References: <4F326E27.7020407@esd.eu>
 <1329141475.22240.151.camel@sauron.fi.intel.com>
 <4F4746E8.9040002@esd.eu>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 24 Feb 2012, Matthias Fuchs wrote:

> On 02/13/2012 02:57 PM, Artem Bityutskiy wrote:
>> On Wed, 2012-02-08 at 13:44 +0100, Matthias Fuchs wrote:
>>> Hi,
>>>
>>> is there an elegant way to update an UBIFS rootfilesystem?
>>>
>>> Let's say I have enough flash space for my actual rootfilesystem
>>> (rootfs1) and a new version (rootfs2). So while running from rootfs1
>>> I updated rootfs2 volume with a new rootfilesystem.
>>
>> I you cannot update a mounted fs - you have to unmount it first. If you
>> are able to do this, you should be able to ubirename.
> So I was thinking that a ubirename is not really an update and expected t=
he rename
> op to work even on a mounted fs.

I agree, it would be very nice to be able to rename a mounted file system,=
=20
although I don't know if there is something internal to UBI which would=20
conflict with that. For instance, when doing 'df', it reports the UBI=20
volume name (such as "ubi0:rootfs") and I don't know if it's possible to=20
change the corresponding string once the file system has been mounted.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
