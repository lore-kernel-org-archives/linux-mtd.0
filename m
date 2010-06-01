Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OJOTz-0006rt-D7
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2010 10:14:04 +0000
Received: by fxm15 with SMTP id 15so3548511fxm.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 01 Jun 2010 03:14:01 -0700 (PDT)
MIME-Version: 1.0
Sender: foxcore@gmail.com
In-Reply-To: <20100601095512.GC16143@pengutronix.de>
References: <20100526175320.GD24167@pengutronix.de>
	<20100601095512.GC16143@pengutronix.de>
From: Guillaume LECERF <glecerf@gmail.com>
Date: Tue, 1 Jun 2010 12:13:41 +0200
Message-ID: <AANLkTinas78bDYXGg8eoLFgB0zSL6BCF10IZtQpEtjHZ@mail.gmail.com>
Subject: Re: Do we remove from jedec_probe.c?
To: Wolfram Sang <w.sang@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2010/6/1 Wolfram Sang <w.sang@pengutronix.de>:
> On Wed, May 26, 2010 at 07:53:20PM +0200, Wolfram Sang wrote:
>> Hi,
>>
>> now that Guillaume introduced cfi-support for some SST-flashes, I wonder if
>> those can be removed from jedec_probe.c? Or should they stay for
>> backward-compatibility?

May I add that SST39VF3201 (0x235b) jedec detection does not work, the
chip being mis-detected as SST49LF080A (0x005B).
This is because of this changeset [1] that checks for 8bit devices
before 16bits.

This may be the case for others chips whom IDs lower bits overlap.

[1] http://git.infradead.org/mtd-2.6.git/commitdiff/6170b43401a3230756ff76287ee07db0d75eddde
-- 
Guillaume LECERF
GeeXboX developer - www.geexbox.org
