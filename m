Received: from wf-out-1314.google.com ([209.85.200.171])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kr1xj-0003vf-KI
	for linux-mtd@lists.infradead.org; Sat, 18 Oct 2008 02:54:44 +0000
Received: by wf-out-1314.google.com with SMTP id 28so957356wfc.24
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Oct 2008 19:54:41 -0700 (PDT)
Message-ID: <6934efce0810171954g106c2cb8l3a8166c1f1769a76@mail.gmail.com>
Date: Fri, 17 Oct 2008 19:54:41 -0700
From: "Jared Hulbert" <jaredeh@gmail.com>
To: "Nicolas Pitre" <nico@cam.org>
Subject: Re: [RFC/PATCH 8/8] LPDDR extended physmap driver to support LPDDR
	flash.
In-Reply-To: <alpine.LFD.2.00.0810171411210.26244@xanadu.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.LFD.1.10.0810082237210.13328@casper.infradead.org>
	<1223979634.6770.767.camel@macbook.infradead.org>
	<6934efce0810161730l2aa66f30v83c6ed644e0d6707@mail.gmail.com>
	<20081017010643.GE14569@xi.wantstofly.org>
	<6934efce0810171027i2afddf0ct77acc83fcf3dbd80@mail.gmail.com>
	<alpine.LFD.1.10.0810171828560.24182@casper.infradead.org>
	<6934efce0810171058g7ea41c72icb9c9e91a697b394@mail.gmail.com>
	<alpine.LFD.2.00.0810171411210.26244@xanadu.home>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Alexey Korolev <akorolev@infradead.org>,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> Right.  Which means you have to tweak the kernel sources when you
>> remap things.  I much prefer to let these kinds of options and
>> parameters not be hard coded into the kernel sources.
>
> Do you have remapable hardware?  ;-)

Yes.  Yes, I do.  I have a designed that is basically a Mainstone 2
with a highly configurable Flash bus.

What more there are dozens of machines out there for each major
reference design that differ only in how the various memory types are
configured and which peripherals are included.  The different
peripherals can be turned on or off with drivers in the .config, but
if I add Flash on a different chipselect I have to hack .c files.

On a x86 system you don't have to hack .c files for every "machine"
out there.  We don't have to tweak a device-map .c file to use a SATA
vs a SCSI vs an IDE drive.  Why do we put up with that for Flash?  You
can run the same zImage on PXA250/270/320 but if I dare move Flash
around I have to recompile?  We are so close.  CFI configures most NOR
parts, we just need a rational physmap mechanism to make this entire
Flash config thing "machine" agnostic.  Is nobody with me on this one?
