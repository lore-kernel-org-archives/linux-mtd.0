Received: from mail.free-electrons.com ([88.190.12.23])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1QUeYi-0006VA-HP
	for linux-mtd@lists.infradead.org; Thu, 09 Jun 2011 12:42:01 +0000
Message-ID: <4DF0C03E.90909@free-electrons.com>
Date: Thu, 09 Jun 2011 14:44:46 +0200
From: David Wagner <david.wagner@free-electrons.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: impact of 2X_PROGRAM on read operations
References: <4DECC41F.5060808@free-electrons.com>
	<1307370761.3112.76.camel@localhost>
In-Reply-To: <1307370761.3112.76.camel@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/06/2011 04:32 PM, Artem Bityutskiy wrote:
> On Mon, 2011-06-06 at 14:12 +0200, David Wagner wrote:
>> Is there a way to safely read without 2X_PROGRAM enabled once it has
>> been flashed with a 2X_PROGRAM-enabled flasher (e.g. patched u-boot).
> 
> Not sure about u-boot, but AFAIK 2x is a completely separate mode which
> gives you I/O speed-up but makes things incompatible with "normal" mode.
> E.g., you can mount JFFS2 only in one of the modes.
> 

Ok, so I guess it doesn't make sense trying to address the issue of
incompatibilities.

I may have to check once again, but I'm pretty sure, however, that I
managed to flash a UBI image with a 2X_PROGRAM-enabled u-boot and read
it with a regular kernel. The u-boot code for 2X_PROGRAM handling seems
to basically be a copy-paste from the kernel.
If the diagram in my first mail is correct, that could not be possible.

Kyungmin, do you know what's wrong in my reasoning ?


Regards,
David Wagner.
-- 
David Wagner, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
