Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb2rh-0002Za-OG
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 05:28:50 +0000
Date: Wed, 21 Nov 2012 06:28:43 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
In-Reply-To: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
Message-ID: <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
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


On Tue, 20 Nov 2012, Ezequiel Garcia wrote:

> I'm happy to announce we finally have a read/write ubiblock implementation!
>
> What follows are some historical notes and some implementation hints.
> Feel free to comment on anything, ask questions or provide feedback.
> You can even fire some flames if you like, my asbestos suite works just fine ;-)

I don't want to diminish your work in any way, but what is the point of 
the ubiblock feature? Mtd block devices are really only used in order to 
give the mount/umount commands a block device, and for ubifs the device is 
specified in another way. So I suspect the intended usage for ubiblock is 
something else.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
