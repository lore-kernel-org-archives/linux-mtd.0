Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12ZUz3-0006CF-00
	for mtd-list@infradead.org; Mon, 27 Mar 2000 09:34:49 +0100
Received: from tammy.cendio.se
	([193.180.23.67] helo=tammy.signum.se ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12ZUz1-0006C9-00
	for mtd@infradead.org; Mon, 27 Mar 2000 09:34:48 +0100
Date: Mon, 27 Mar 2000 10:35:49 +0200 (CEST)
From: Alexander Larsson <alex@cendio.se>
To: mtd@infradead.org
cc: Bjorn Wesen <bjorn.wesen@axis.com>, SeokKuon Kwon <kwonsk@mutech.co.kr>,
        Scott Anderson <sanders@mvista.com>
Subject: Re: Axis log based flash filesystem ported to 2.3 and MTD 
In-Reply-To: <5747.954145418@devel2.axiom.internal>
Message-ID: <Pine.LNX.4.10.10003271032020.3368-100000@tammy.signum.se>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

On Mon, 27 Mar 2000, David Woodhouse wrote:

> Forgive me for reposting private mails to the list, but it seems that some 
> introductions are in order....
> 
> alex@cendio.se said (re Axis' JFFS):
> >  This filesystem is really needed since the ftl layer has patent
> > problem and this one seems totally free. 
> 
> sanders@mvista.com said:
> >  From what little I understand about the M-systems' patent, it
> > basically patented the idea of using an array to do the translation
> > and I would guess that Axis' work would violate that.

While i haven't read the M-systems patent I think the Axis fs doesn't
violate it, because it uses no translation array. It is a fully
log-structured filesystem directly on the flash memory, and not a flash to
block device translator.

/ Alex





To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
