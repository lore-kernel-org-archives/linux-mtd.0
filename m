Received: from anubis.se.axis.com ([195.60.68.12])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb770-0002hj-7h
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 10:00:55 +0000
Date: Wed, 21 Nov 2012 11:00:49 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
In-Reply-To: <20121121105636.4c8687e0@skate>
Message-ID: <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: Ezequiel Garcia <elezegarcia@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 21 Nov 2012, Thomas Petazzoni wrote:

> On Wed, 21 Nov 2012 06:28:43 +0100, Ricard Wanderlof wrote:
>
>> I don't want to diminish your work in any way, but what is the point of
>> the ubiblock feature? Mtd block devices are really only used in order to
>> give the mount/umount commands a block device, and for ubifs the device is
>> specified in another way. So I suspect the intended usage for ubiblock is
>> something else.
>
> The idea, when David Wagner implemented this, was to be able to use
> read-only block filesystems such as squashfs on top of a UBI volume.
> squashfs provides an excellent compression ratio, which makes it
> interesting.

Yes, I agree, that would be useful.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
