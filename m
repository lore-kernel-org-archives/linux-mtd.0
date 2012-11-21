Received: from mail.free-electrons.com ([88.190.12.23])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb7BQ-0005Go-3k
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 10:05:29 +0000
Date: Wed, 21 Nov 2012 11:05:18 +0100
From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
Message-ID: <20121121110518.3147bd34@skate>
In-Reply-To: <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
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

On Wed, 21 Nov 2012 11:00:49 +0100, Ricard Wanderlof wrote:

> > The idea, when David Wagner implemented this, was to be able to use
> > read-only block filesystems such as squashfs on top of a UBI volume.
> > squashfs provides an excellent compression ratio, which makes it
> > interesting.
> 
> Yes, I agree, that would be useful.

Yes, but only the read-only side of ubiblock. The write side is
dangerous and useless, IMO.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
