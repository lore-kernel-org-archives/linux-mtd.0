Received: from mail-yw1-xc42.google.com ([2607:f8b0:4864:20::c42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gGx3n-0001rf-5w
 for linux-mtd@lists.infradead.org; Mon, 29 Oct 2018 02:13:45 +0000
Received: by mail-yw1-xc42.google.com with SMTP id c126-v6so2748733ywd.8
 for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2018 19:13:31 -0700 (PDT)
Received: from mail-yw1-f44.google.com (mail-yw1-f44.google.com.
 [209.85.161.44])
 by smtp.gmail.com with ESMTPSA id 80-v6sm5454032ywh.55.2018.10.28.19.13.29
 for <linux-mtd@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 28 Oct 2018 19:13:29 -0700 (PDT)
Received: by mail-yw1-f44.google.com with SMTP id v199-v6so2763155ywg.1
 for <linux-mtd@lists.infradead.org>; Sun, 28 Oct 2018 19:13:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20181012112259.56f3c44f@bbrezillon>
References: <20181010184533.691620-1-arnd@arndb.de>
 <20181012111603.0d03e043@bbrezillon>
 <CAK8P3a1zYoGtfe6PVEM-oLNxXQAt12iiNR1ZLiaGvrY5LFKwwA@mail.gmail.com>
 <20181012112259.56f3c44f@bbrezillon>
From: Kees Cook <keescook@chromium.org>
Date: Sun, 28 Oct 2018 19:13:26 -0700
Message-ID: <CAGXu5jLS5sEFgM1Vzri+cAONYKUqdXbahyNUU1xvRF0cbZrX1w@mail.gmail.com>
Subject: Re: [PATCH] mtd: sa1100: avoid VLA in sa1100_setup_mtd
To: Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Arnd Bergmann <arnd@arndb.de>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd <linux-mtd@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 12, 2018 at 2:22 AM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> On Fri, 12 Oct 2018 11:19:52 +0200
> Arnd Bergmann <arnd@arndb.de> wrote:
>
>> On Fri, Oct 12, 2018 at 11:16 AM Boris Brezillon
>> <boris.brezillon@bootlin.com> wrote:
>> >
>> > Hi Arnd,
>> >
>> > On Wed, 10 Oct 2018 20:44:50 +0200
>> > Arnd Bergmann <arnd@arndb.de> wrote:
>> >
>> > > Enabling -Wvla found another variable-length array with randconfig
>> > > testing:
>> > >
>> > > drivers/mtd/maps/sa1100-flash.c: In function 'sa1100_setup_mtd':
>> > > drivers/mtd/maps/sa1100-flash.c:224:10: error: ISO C90 forbids variable length array 'cdev' [-Werror=vla]
>> > >
>> > > As far as I can tell, there is an upper bound on the number of resources
>> > > that can be passed, based on the number of CS lines on the bus.
>> > > In practice, all boards we support have either one or two resources,
>> > > but using six to be on the safe side has no extra cost.
>> >
>> > Why not dynamically allocate cdev instead? That removes any kind of
>> > guessing on the max value, and it shouldn't hurt much since this code is
>> > in the probe path.
>>
>> Fine with me as well, If you prefer that one, please just add
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>
> Oh, I thought I'd let you send a v2, but I can do it if you prefer.

Olof just pointed out to me that neither fix landed for this? What's
needed for this?

Thanks!

-- 
Kees Cook
