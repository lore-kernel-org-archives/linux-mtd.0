Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13ZYpI-0001Uw-00
	for mtd-list@infradead.org; Thu, 14 Sep 2000 14:13:16 +0100
From: "Alex J Lennon" <ajlennon@arcom.co.uk>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <mtd@infradead.org>
Subject: RE: sbc-mediagx 
Date: Thu, 14 Sep 2000 14:12:10 +0100
Message-ID: <NEBBLLDBMLGONJHPHHEKIEMNCHAA.ajlennon@arcom.co.uk>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <11598.968936086@passion.cygnus.co.uk>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


> >  FlashFx implements VBF to support block access to the media and to
> > provide wear levelling amongst other things (I believe). The "Variable
> > Block Flash" component is *not* a filesystem. It simply translates
> > logical sector requests to physical flash locations.
>
> Similar in principle, then, if not in implementation, to FTL.
> A kind of pseudo-filesystem which is used to emulate a block device.
>
> Does it use the concepts which are patented by M-Systems? I believe that
> the patents in this area are extremely broad, and cover almost all obvious
> methods of implementing wear levelling.
>
>

There is a whitepaper discussing VBF at
www.datalight.com/wp-data-integrity.htm

Also , there is a discussion of a possible pre-cursor to FlashFx in DDJ, May
'93
- although I haven't managed to source this .

Alex




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
