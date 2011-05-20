Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QNQfM-00089n-6B
	for linux-mtd@lists.infradead.org; Fri, 20 May 2011 14:27:00 +0000
Received: by ewy3 with SMTP id 3so1416892ewy.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 20 May 2011 07:26:58 -0700 (PDT)
Subject: Re: ubiattach error!
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Timon ter Braak <timonterbraak@gmail.com>
In-Reply-To: <loom.20110520T161007-38@post.gmane.org>
References: <71103bce1003230226q7fce2443vad3853d7c6d6d947@mail.gmail.com>
	<1270715032.6754.108.camel@localhost>
	<loom.20110520T161007-38@post.gmane.org>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 20 May 2011 17:23:08 +0300
Message-ID: <1305901388.2630.151.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

On Fri, 2011-05-20 at 14:14 +0000, Timon ter Braak wrote:
> Artem Bityutskiy <dedekind1 <at> gmail.com> writes:
> 
> > 
> > > # ubiattach /dev/ubi_ctrl -m 3
> > > UBI: attaching mtd3 to ubi0
> > > UBI: physical eraseblock size:   524288 bytes (512 KiB)
> > > UBI: logical eraseblock size:    516096 bytes
> > > UBI: smallest flash I/O unit:    4096
> > > UBI: VID header offset:          4096 (aligned 4096)
> > > UBI: data offset:                8192
> > > UBI error: ubi_scan_add_used: two LEBs with same sequence number 4
> > > ubiattach: error!: cannot attach mtd3
> > >           error 22 (Invalid argument)
> > 
> > Looks weird, is this reproducible with nandsim?
> > 
> 
> After a power cut / reset, we experience similar problems.
> I just upgraded to linux 2.6.39 as more and more UBIFS 'bugs' seem to get solved.
> Unfortunately, we use a Spansion GL512P (64MB) NOR Flash chip,
> which makes life kind of hard:
> 
> [    0.510000] UBI: attaching mtd1 to ubi0
> [    0.510000] UBI: physical eraseblock size:   131072 bytes (128 KiB)
> [    0.520000] UBI: logical eraseblock size:    130944 bytes
> [    0.530000] UBI: smallest flash I/O unit:    1
> [    0.530000] UBI: VID header offset:          64 (aligned 64)
> [    0.540000] UBI: data offset:                128
> [    0.540000] UBI error: ubi_scan_add_used: two LEBs with same sequence number 9
> [    0.550000] UBI error: ubi_init: cannot attach mtd1

Hmm. Can you confirm that:

1. you can attach the mtd device successfully.
2. detach it and attach again successfully.
3. Have a power cut, and then be unable attach it again because of this
   error?

Do you flash an UBI image? How do you do this?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
