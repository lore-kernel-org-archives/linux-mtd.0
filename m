Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16PBU8-0007vb-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 23:53:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m3k7uotpjb.fsf@DLT.linuxnetworx.com> 
References: <m3k7uotpjb.fsf@DLT.linuxnetworx.com>  <E16MWkI-0003Z1-00@pentafluge.infradead.org> <20020104085040.A48397@idiom.com> <179401c19af8$a0418560$4101220a@csteinathlon> 
To: ebiederman@lnxi.com (Eric W. Biederman)
Cc: "Charles Steinkuehler" <charles@steinkuehler.net>,
    linux-mtd@lists.infradead.org
Subject: Re: Atmel Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sat, 12 Jan 2002 00:04:11 +0000
Message-ID: <15105.1010793851@redhat.com>
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

ebiederman@lnxi.com said:
> "Charles Steinkuehler" <charles@steinkuehler.net> writes:
> > Are the small-sector Atmel flash (ie 29C010/29C040) parts supported by
> > MTD?
> 
> > These are the parts with 128/256 Byte sector size (ie 1024 128 byte
> > sectors in the '010, and 2048 256 byte sectors in the '040), with no
> > explicit erase command required before writing new data.

> Other atmel parts are.  If they aren't cfi then there is the issue
> that they aren't in the table jedec_probe.c.   But it should be
> trivial to add them.

I think the other supported Atmel parts are the ones with the conventional 
command set. These ones are different. It's not too hard to write support 
for them though.

--
dwmw2
