Received: from mail.free-electrons.com ([88.190.12.23])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb736-0002B9-6E
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 09:56:52 +0000
Date: Wed, 21 Nov 2012 10:56:36 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
Message-ID: <20121121105636.4c8687e0@skate>
In-Reply-To: <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

Dear Ricard Wanderlof,

On Wed, 21 Nov 2012 06:28:43 +0100, Ricard Wanderlof wrote:

> I don't want to diminish your work in any way, but what is the point of 
> the ubiblock feature? Mtd block devices are really only used in order to 
> give the mount/umount commands a block device, and for ubifs the device is 
> specified in another way. So I suspect the intended usage for ubiblock is 
> something else.

The idea, when David Wagner implemented this, was to be able to use
read-only block filesystems such as squashfs on top of a UBI volume.
squashfs provides an excellent compression ratio, which makes it
interesting.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
