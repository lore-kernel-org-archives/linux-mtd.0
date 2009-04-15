Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lu9oV-0002L0-F1
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 18:26:30 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KI5000DRN7NYAE0@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 14:26:11 -0400 (EDT)
Date: Wed, 15 Apr 2009 14:26:11 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: UBIFS Corrupt during power failure
In-reply-to: <20090415164416.GD4325@shareable.org>
Message-id: <alpine.LFD.2.00.0904151422170.6741@xanadu.home>
References: <1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
	<1239775237.3390.144.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB70305C5D8@usw-am-xch-02.am.trimblecorp.net>
	<20090415160921.GA4325@shareable.org>
	<C77C279BA71FD14985DC8E75FB265AB70305C6B2@usw-am-xch-02.am.trimblecorp.net>
	<20090415164416.GD4325@shareable.org>
Cc: Adrian Hunter <adrian.hunter@nokia.com>,
	Eric Holmberg <Eric_Holmberg@Trimble.com>,
	linux-mtd@lists.infradead.org, Urs Muff <urs_muff@trimble.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 15 Apr 2009, Jamie Lokier wrote:

> Unrelated to this chip: I vaguely remember, aren't there some flash
> chips which can do more than one block write in parallel, or a write
> in parallel with an erase to a different block?

Some NOR flash parts can do a write _or_ an erase in one block while 
performing any amount of reads in other blocks.  At least that's what we 
support.  If some parts allow for concurrent writes we currently don't 
support that.


Nicolas
