Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T52NQ-00077Q-V0
 for linux-mtd@lists.infradead.org; Fri, 24 Aug 2012 22:29:17 +0000
Received: by wibhn17 with SMTP id hn17so1037495wib.0
 for <linux-mtd@lists.infradead.org>; Fri, 24 Aug 2012 15:29:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8A2833CE-CBA8-4B68-B8DB-D6AA72A147DB@ebertech.ca>
References: <8A2833CE-CBA8-4B68-B8DB-D6AA72A147DB@ebertech.ca>
Date: Fri, 24 Aug 2012 15:29:14 -0700
Message-ID: <CAN8TOE8hNLJxUZqGUCpchCDV9bgYurQkMifAF3ZKd=1zfsq88A@mail.gmail.com>
Subject: Re: Slow Linear Flash write speeds
From: Brian Norris <computersforpeace@gmail.com>
To: Andrew Eberbach <andrew@ebertech.ca>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org,
 Dominik Brodowski <linux@dominikbrodowski.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add Dominik Brodowski, who seems to have worked on this driver.

On Thu, Aug 23, 2012 at 4:03 PM, Andrew Eberbach <andrew@ebertech.ca> wrote=
:
> Hi
>
> I'm trying to figure out why I'm getting really slow (0.1 kB/sec) write s=
peeds using kernel 3.0.28 and the pcmciamtd driver on a 20MB Series 2 Intel=
 card. The reader/writer is an Elan P423 PCI card. I've had to set the VPP =
voltage to 12 to get it to write. The read speeds are very quick (can copy =
out 20mb in less than a minute) but the writes are taking way too long. I'v=
e tried both with dd and with the flashcp utility. Any insights would be ap=
preciated.
>
> Best Regards,
>
> Andrew Eberbach
> EberTech Inc.
