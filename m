Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15qqnI-0007og-00
	for <linux-mtd@lists.infradead.org>; Tue, 09 Oct 2001 07:55:12 +0100
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Q: Probing for devices > buswidth???
References: <m3wv25gvdq.fsf@DLT.linuxnetworx.com>
	<m3y9mljsin.fsf@DLT.linuxnetworx.com> <29886.1002609959@redhat.com>
	<30115.1002610420@redhat.com>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 09 Oct 2001 01:04:17 -0600
In-Reply-To: <30115.1002610420@redhat.com>
Message-ID: <m3wv25fg5q.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

David Woodhouse <dwmw2@infradead.org> writes:

> ebiederman@lnxi.com said:
> >  Just so I understand.  There are chips with a 16-bit interface that
> > you can put in a crippled mode such that they pretend use only an 8
> > bit bus.  But the id logic is the same as when the are on a 16-bit
> > bus?
> 
> Basically, yes. They are 16-bit devices, with the A0 line selecting which 
> 16-bit word you should look at - and all the 'magic' addresses must be 
> placed on the address bus starting at A0. But they decided they wanted to 
> be able to use them with an 8-bit bus, so they added an 'A-1' address line 
> too.
> 
> > I'm just trying to comprehend this weird situation.
> 
> Do yourself a favour - don't. Just accept it. Or do me a favour and take 
> responsibility for it from now on :)

I'll probably take responsiblity for the legacy jedec side of things.
Or at the very least I'll be a very active tester/user.  So I want
enough understanding so that I don't look at someone else's code and
say that is broken, and be wrong.  I have fixed a whole bunch of small
bugs already.  Currently I have 4 map drivers completed and a 5th one
to write, and none of them use these nice new chips.  The worst case
is the driver for the boot rom on the eepro100 it doesn't even
implement block erase, just chip erase.  

Anyway my smorgase board currently looks like:
eepro100 boot rom.
BIOS on AMD766 southbrige.
BIOS on the l440gx motherboard.
BIOS on Compaq DS10
BIOS connected to the ICH2 (Intel firmware hub.) 
   [This one I should be getting started on in a couple of hours].

Eric
