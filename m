Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14EaB0-0005GX-00
	for mtd-list@infradead.org; Fri, 05 Jan 2001 16:57:14 +0000
Message-ID: <3A55FCE7.C8406CE0@inn.ericsson.se>
Date: Fri, 05 Jan 2001 17:57:11 +0100
From: Kenneth Johansson <kenneth.johansson@inn.ericsson.se>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Russ.Dill@asu.edu, mtd@infradead.org
Subject: Re: Supported flash memory
References: <978711806.3a55f4fe37922@webmail1.asu.edu>  <978636488.3a54cec86af09@webmail2.asu.edu> <2842.978696346@redhat.com> <8151.978712149@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:

> Russ.Dill@asu.edu said:
> >  I've noticed LART connects address and data lines to flash in
> > positions most convienent to route. Does this break any CFI
> > functionality?
>
> What do you mean? It's generally considered quite rude for hardware
> designers to connect nets to _completely_ random places on the chips,
> although sometimes it wouldn't really surprise me.
>

Well with SRAM you can intercange any data pin with another data pin and
likewise with the adress bus and nothing would notice. Doing this with ROM or
FLASH makes things quite interesting. This would mean that anything trying to
program the device has to do translation.

If you get random routing to simplify layout to work it would probably qualify
for the nobel price.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
