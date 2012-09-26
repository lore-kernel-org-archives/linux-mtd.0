Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1TGpF1-0000yX-3V
 for linux-mtd@lists.infradead.org; Wed, 26 Sep 2012 10:53:19 +0000
Date: Wed, 26 Sep 2012 12:53:15 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Offtopic: ubifs and best practice for supporting browser based
 firmware upgrades
In-Reply-To: <1348651795.24309.49.camel@sauron.fi.intel.com>
Message-ID: <alpine.DEB.2.00.1209261251200.19047@lnxricardw.se.axis.com>
References: <CADqH6VzVhsGvCCbokjW8TAJSq5Sj33GiHt4gZxOFZaeHtJ4JeQ@mail.gmail.com>
 <1346751620.12610.35.camel@sauron.fi.intel.com>
 <CADqH6Vw0kY=U-jymgpj_JpzLkqLb0JjK7J1C1V6qF_uo-jDFng@mail.gmail.com>
 <1348651795.24309.49.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Jaya Kumar <jayakumar.lkml@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 26 Sep 2012, Artem Bityutskiy wrote:

> On Wed, 2012-09-26 at 13:42 +0800, Jaya Kumar wrote:
>> I think what this means is that after doing the rootfs upgrade using
>> ubiupdatevol, I must reboot into a 3rd partition running a minimal OS
>> to perform the ubirename of roofs_reserve and then reboot again. This
>> step seems expensive to have to boot into a 3rd partition to do the
>> rename operation.
>>
>> I see someone else also has encountered this,
>> http://comments.gmane.org/gmane.linux.drivers.mtd/39415 and solved by
>> having a initramfs. I guess I could do that. But still seems messy.
>
> Yes, the way it is currently implemented is:
>
> 1. ubirename /dev/ubi0 rootfs rootfs_reserve
> 2. UBI figures out that old 'rootfs' should be removed.
> 3. UBI changes the volume table and wipes old rootfs from there,
>   and changes name 'rootfs_reserve' to 'rootfs'.
>
>   Now if you have a power cut, you will no longer see the old rootfs
>   vloume, only the new one.
> 4. Then UBI actually deletes the old volume from all the in-memory
>   data structures. Obviously, you cannot use this volume at the same
>   time.
>
> But this can be improved, I did not think a lot about this, but I guess
> if you just skip step 4, it should work. The rename will succeed, but
> you will still see the old layout. And only when you reboot, you'll have
> the old rootfs deleted and the new one being in place.

But the problem is that the first step fails as the system is still 
running, and you can't unmount / while it is up.

> Also, I guess the rename path should not open the volume in the
> exclusive mode.

Yes, that would be a workable solution, if there weren't any other 
disadvantages (e.g. something getting confused by the volume name 
changing, like df).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
