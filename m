Received: from mail-vx0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SPgiJ-0007jv-2m
 for linux-mtd@lists.infradead.org; Wed, 02 May 2012 21:03:55 +0000
Received: by vcbf13 with SMTP id f13so1012188vcb.36
 for <linux-mtd@lists.infradead.org>; Wed, 02 May 2012 14:03:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201205022249.30426.rjw@sisk.pl>
References: <1335951710-9390-1-git-send-email-hechtb@gmail.com>
 <1335951710-9390-3-git-send-email-hechtb@gmail.com>
 <201205022249.30426.rjw@sisk.pl>
Date: Thu, 3 May 2012 06:03:53 +0900
Message-ID: <CANqRtoT1cJ2uMZ+hqDO74681x2-5zMF16jyyDZh33USns4f8FA@mail.gmail.com>
Subject: Re: [PATCH v3 02/10] ARM: sh-mobile: mackerel: Add error IRQ resource
From: Magnus Damm <magnus.damm@gmail.com>
To: "Rafael J. Wysocki" <rjw@sisk.pl>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-sh@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 Laurent Pichart <laurent.pinchart@ideasonboard.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Bastian Hecht <hechtb@googlemail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/5/3 Rafael J. Wysocki <rjw@sisk.pl>:
> On Wednesday, May 02, 2012, Bastian Hecht wrote:
>> Supply the platform data for the FLSTEI error IRQ.
>>
>> Signed-off-by: Bastian Hecht <hechtb@gmail.com>
>
> I'm going to take this patch into the renesas.git tree and push it
> upstream throuch arm-soc, if that's not a problem.

Sure, that's fine. Seems like a rather clear case of a mach-shmobile
patch without any special dependencies.

Cheers,

/ magnus
