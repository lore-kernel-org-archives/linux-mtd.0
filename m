Received: from creative.actrix.co.nz ([203.96.26.135])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16V0cA-0008Bt-00
	for <linux-mtd@lists.infradead.org>; Mon, 28 Jan 2002 01:29:43 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Ramya Ravichandran <rrhsin@yahoo.co.in>
Subject: Re: Cf Card vs DiskOnChip
Date: Mon, 28 Jan 2002 14:35:20 +1300
Cc: linux-mtd@lists.infradead.org
References: <20020126080500.34286.qmail@web8101.in.yahoo.com>
In-Reply-To: <20020126080500.34286.qmail@web8101.in.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020128013905.81A0611FD@creative.actrix.co.nz>
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

On Sat, 26 Jan 2002 21:05, Ramya Ravichandran wrote:
> > If the CF is "embedded" and you are not going to
> > remove it while it is
> > powered up (ie. use it like you would a DOC) then
> > you quite likely do not
> > need any PCMCIA adapter chips  I've seen a few
> > designs using CF this way.
>
> You have a desktop system and in this desktop system I
> just want to remove the HD and replace it with the CF
> card or DOC .Do you need adapters for this. IF DOC
> then can it be directly embedded in the motherboard.
>
> Please help.

OK so if I understand you correctly, you want to take a normal x86 system, 
throw away the hand disk and put int a CF instead.

If that is what you want to do then the sandisk link shows how.  All you need 
is a very simple cable that goes from a standard IDE connector to a CF socket.
My understanding, which might be off, is that if you look inside a Sandisk 
Flashdrive then that is what you'll find.

For all you nay-sayers, there are some good reasons to do this. One good 
reason to do this over a DOC-based solution is that you don't have to load 
special DOC access software or have a specail DOC-friendly BIOS. The system 
can't tell the difference between a CF and a rotating disk. It's a nice easy 
way to get from A toZ, especially for an exploratory product or an "embedded 
PC" that's going into a vehicle or other high vibration scenario that will 
shake a disk to death.

kira I reckon you're being a bit rude! An honest question deserves a useful 
answer - not abuse. Help or shut up. IMHO.

-- Charles
