Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtbsI-0005Kv-01
	for linux-mtd@lists.infradead.org; Tue, 14 Apr 2009 06:12:09 +0000
Subject: RE: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Eric Holmberg <Eric_Holmberg@Trimble.com>
In-Reply-To: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
References: <C77C279BA71FD14985DC8E75FB265AB702DEEF07@usw-am-xch-02.am.trimblecorp.net>
	<49C8FC89.7040709@nokia.com>
	<C77C279BA71FD14985DC8E75FB265AB702DEF104@usw-am-xch-02.am.trimblecorp.net>
	<1238050770.3321.41.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 14 Apr 2009 09:11:40 +0300
Message-Id: <1239689500.3390.82.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Adrian Hunter <adrian.hunter@nokia.com>, linux-mtd@lists.infradead.org,
	Urs Muff <urs_muff@Trimble.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2009-04-10 at 12:33 -0600, Eric Holmberg wrote:
> > On Fri, 2009-04-10 at 11:00 -0600, Eric Holmberg wrote:
> > > Thank you very much for your help so far. 
> > NP, this is all I can do now without having real NOR and much time :-)
> > 
> > >  I am going to do two things:
> > >  1. Turn off write buffering which converts the NOR minimum 
> > I/O size from 1 to effectively 32 16-bit words (64 bytes) and 
> > re-run all of the tests.
> > 
> > Err, which buffering? Is this something at the flash driver level? 
> 
> This is for the CFI flash interface.  The
> drivers/mtd/chips/cfi_cmdset_0002.c driver has write buffers which is
> uses to do a "block" write to the NOR flash which for my chip allows
> writing up to 32 16-bit words. 

Oh, this is something from the CFI standard? Then we may just add this
knowledge to UBIFS: if this is NOR, then UBIFS knows that the up to 64
bytes may contain garbage.

>  This is what I used for the tests with
> U-Boot and it is why you see patterns such as the one below.  The code I
> used to write this pattern to flash wrote the entire block in 1 write.
> The CFI driver then broke up the writes into 64-byte writes.
> Apparently, it didn't do them in order (or the flash chip didn't), which
> is why you have aa55aa0a values after ffffffff values.  Turning off the
> write buffering in the CFI driver by setting FORCE_WORD_WRITE to 1
> should solve this (although it will now probably be somewhere between
> 10x and 32x slower).

Yes, it is worth disabling this and test. If it helps, we can add
some CFI/NOR-awareness to UBIFS.

> 30352250  aa55aa0a aa55aa0a aa55aa0a aa55aa0a 
> 30352260  aa55aa0a aa55aa0a aa55aa0a aa55aa0a 
> 30352270  aa55aa0a aa55aa0a aa55aa0a aa55aa0a 
> 30352280  ffffffff ffffffff ffffffff ffffffff 
> 30352290  ffffffff ffffffff ffffffff ffffffff 
> 303522a0  ffffffff ffffffff ffffffff ffffffff 
> 303522b0  aa55aa0a aa55aa0a aa55aa0a aa55aa0a 
> 303522c0  ffffffff ffffffff ffffffff ffffffff 
> 303522d0  ffffffff ffffffff ffffffff ffffffff 
> 
> Does that make sense now, or am I on the wrong path?

Yes, makes perfect sense for me.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
