Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14TMBT-00046g-00
	for mtd-list@infradead.org; Thu, 15 Feb 2001 11:02:47 +0000
Message-ID: <E6FE4E054F02D511818E00025558B61D429E20@cluster01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: RE: Problems with cfi_cmdset_0002.c 
Date: Thu, 15 Feb 2001 12:01:54 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

> jonas.holmberg@axis.com said:
> > +	if (!bootloc) { 
> > +		if (cfi->id & 0x80) {
> 
> 
> If possible, we should be checking the version number of the 
> query table,
> and using bootloc if the version number is equal to or 
> greater than the
> version at which the bootloc field was defined. If it's undefined, it
> doesn't have to be zero. 
> 

I cannot find any info on relationship between CFI version numbers and bootloc. I looked through the CFI 1.0 and 1.1 spec, but found nothing. Does anybody know? Otherwise my suggestion is still "if (!bootloc)" until proven wrong. I think it's safer than "cfi_version < 1.1". What do you think?

> I'd like to keep this kludge wrapped in an ifdef just to make 
> sure it's 
> easy to disable it if necessary. It can be left on by default.

Okidoki.

/Jonas


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
