Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13NBEX-0006Mk-00
	for mtd-list@infradead.org; Fri, 11 Aug 2000 10:36:09 +0100
Received: from athena.evoserve.com ([210.16.10.134])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 13NBEU-0006Md-00
	for mtd@infradead.org; Fri, 11 Aug 2000 10:36:06 +0100
Received: from evoserve.com (gateway.evoserve.com [210.16.10.120])
	by athena.evoserve.com (8.9.3/8.9.3) with ESMTP id RAA26774
	for <mtd@infradead.org>; Fri, 11 Aug 2000 17:38:45 +0800
Message-ID: <3993CD0E.84A9B5B@evoserve.com>
Date: Fri, 11 Aug 2000 17:53:18 +0800
From: "Rogelio M. Serrano Jr." <rogelio@evoserve.com>
MIME-Version: 1.0
To: mtd@infradead.org
Subject: Re: Has MTD production quality support for DOC2000?
References: <ylb66p947pd.fsf@ganglot.ifi.uio.no> <5585.965911459@cygnus.co.uk> <ylbvgx88b7i.fsf@ganglot.ifi.uio.no>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Sigurd Urdahl wrote:

> David Woodhouse <dwmw2@redhat.com> writes:
> > sigurdur@ifi.uio.no said:
> > >  I'm quite new at embedding my penguin, and will have to embedd it on
> > > a DOC2000. But since I'm new at this I am quite confused... I am
> > > considering going with MTD instead of m-sys drivers, but after
> > > searching the archives I'm still not sure on wether MTD is stable
> > > enough for production or not, so please help:=)
> >
> > Not yet, if you want to write to the device. Nobody at the moment seems to
> > be working very fast on it, and I've been busy with JFFS recently.
>

I have been writing to the DOC for weeks now under jffs. I have given up
on NFTL
completely. I have patches here but I will not submit them because I
have not
tested them with NFTL except for the multipage read write support.
Anyone who is
interested can email me. I got a little lost in the middle of all the
activity on
both MTD and JFFS. I have to get in sync with all the developments and
all.


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
