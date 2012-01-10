Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkjAC-0008EU-BQ
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 21:23:25 +0000
Received: by eekc4 with SMTP id c4so9182eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 13:23:20 -0800 (PST)
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Alexandre Gambier <a.gambier@ftemaximal.fr>
Date: Tue, 10 Jan 2012 23:23:18 +0200
In-Reply-To: <4F0C3339.6070909@ftemaximal.fr>
References: <4F0C3339.6070909@ftemaximal.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326230599.2335.4.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-01-10 at 13:46 +0100, Alexandre Gambier wrote:
> hi everyone,
> 
> I use UBI volume and UBIFS on top of a NAND device with an embedded 
> video meter.
> Everything works fine except that when a UBI volume is mounted the 
> following warning is outputted :
> "UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB 
> handling, reserved 0, need 20"

Looks like the pool of reserved PEBs is fully used. Fo how long have you
been using this flash?

> UBI: attaching mtd7 to ubi0

When I see things like mtd7 - I get worried. Do you have 7 partitions on
one chip? Even on old good and reliable chips this was not very good
idea, let alone modern NANDs with all these unstable bits, "radiation"
effects, low eraseblock max. erase count, etc...

BTW, be aware of this problem:

http://linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits


which has not been solved - we need a brave knight who'd spend time
working on this issue.

Artem.
