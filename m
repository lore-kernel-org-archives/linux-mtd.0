Received: from mail-ie0-f172.google.com ([209.85.223.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WB8v7-0000Gx-NA
 for linux-mtd@lists.infradead.org; Wed, 05 Feb 2014 20:18:06 +0000
Received: by mail-ie0-f172.google.com with SMTP id e14so20905iej.3
 for <linux-mtd@lists.infradead.org>; Wed, 05 Feb 2014 12:17:40 -0800 (PST)
Date: Wed, 5 Feb 2014 14:13:40 -0600
From: Andrew Ruder <andy@aeruder.net>
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
Message-ID: <20140205201223.GA25295@gmail.com>
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>
 <20140204194925.GA3184@gmail.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474D@Exchange1.lawo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A18A7474D@Exchange1.lawo.de>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 05, 2014 at 09:39:40AM +0100, Wiedemer, Thorsten (Lawo AG) wrote:
> Its arm-fsl-linux-gnueabi-gcc-4.8.2

Perhaps relevant:

https://lkml.org/lkml/2014/1/24/186
http://www.mail-archive.com/linux-kernel@vger.kernel.org/msg574770.html
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=58854

Wish there was some way of getting this news out there a little more
that this gcc 4.8 bug basically breaks Linux kernel compiles.  Until
then, 4.7, a recent snapshot of 4.8, or buildroot's patched compiler
works.

Cheers,
Andy
