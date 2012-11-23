Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TbwGV-0003Fx-Go
 for linux-mtd@lists.infradead.org; Fri, 23 Nov 2012 16:38:08 +0000
Received: by mail-ee0-f49.google.com with SMTP id c4so3542377eek.36
 for <linux-mtd@lists.infradead.org>; Fri, 23 Nov 2012 08:38:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1353685418-30623-1-git-send-email-zajec5@gmail.com>
References: <1353685418-30623-1-git-send-email-zajec5@gmail.com>
Date: Fri, 23 Nov 2012 10:38:03 -0600
Message-ID: <CAJiQ=7CPYJfweB03Lh3SbSDYt8pr05EqqCQRuOwd=JTL_smg1A@mail.gmail.com>
Subject: Re: [RFC][PATCH] bcm47xxnflash: use small delay between polling
From: Kevin Cernekee <cernekee@gmail.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 23, 2012 at 9:43 AM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com>=
 wrote:
> ---
> I think it's a good idea to add some delays between polling the
> hardware. I'm not sure however what delays should be used.
>
> In the proposed patch I put "ndelay(1)" which is extermely low delay,
> but even with that it's common for the loop to make only 0-3 iterations.
> For that reason I don't want to put delays like "ndelay(10)" or bigger.
> This could mean waiting 10ns while the hardware is ready after 1ns.
>
> What do you think about this?

You might want to run a few tests to see how much time the register
access itself takes.  I don't know about this platform specifically,
but it is not uncommon to see times in the range of 0.5us ~ 1us.  So a
1ns or 10ns delay might not even be noticeable.

1ns is one cycle on a 1 GHz processor; peripherals (and even RAM) are
usually much much slower than that.

A quick and dirty way to measure register access time is to run, say,
10 million reads, and time the loop with a stopwatch.
