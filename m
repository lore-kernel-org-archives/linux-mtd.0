Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vbtrx-0002QR-8o
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 15:09:09 +0000
Date: Thu, 31 Oct 2013 12:08:45 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Konstantin Tokarev <annulen@yandex.ru>
Subject: Re: Flashing UBIFS image to gluebi mtd
Message-ID: <20131031150844.GA1092@localhost>
References: <72811383227314@web24j.yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72811383227314@web24j.yandex.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Konstantin,

On Thu, Oct 31, 2013 at 05:48:34PM +0400, Konstantin Tokarev wrote:
> 
> I'm migrating rootfs of device from SquashFS on top of gluebi to UBIFS.

Sounds like you could use ubiblock for that setup, which is suitable
for squashfs, and completely independent of ubifs (thus less cpu and
memory hungry and easier to setup).

You can find some patches floating around, but the *latest* work
is here:

http://git.free-electrons.com/users/ezequiel-garcia/linux/log/?h=ubiblock-v4-cache-optional

And you'll need a patch for mtd-utils as well:

http://git.free-electrons.com/users/ezequiel-garcia/mtd-utils

Feel free to use it and report any issues. However, be very
careful as the driver is a bit experimental yet.

Others are already using it, so it should be more or less
fine!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
