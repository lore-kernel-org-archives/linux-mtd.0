Received: from [208.176.144.228] (helo=ns1.pwrseries.com)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1EQ6Cx-0007uk-JH
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2005 12:47:36 -0400
From: "Joseph M Dupre (AVAB Inc.)" <dupre@avab.com>
To: linux-mtd@lists.infradead.org
Date: Thu, 13 Oct 2005 09:44:35 -0700
MIME-Version: 1.0
Message-ID: <434E2C83.15605.52E248@localhost>
In-reply-to: <434BFE23.4060701@ieee.org>
References: <434B98B0.776.50BEDB@localhost>
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Content-description: Mail message body
Cc: Dan Brown <dan_brown@ieee.org>
Subject: Re: docboot: nandwrite:  Input file is not page aligned
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11 Oct 2005 at 14:02, Dan Brown wrote:

> >I am using the uClibc "Buildroot" toolchain.  Dev machine is i686 and
> > target is i486 with a DOC 2000 (MD2202-D128)

> Well, I guess the next step is to examine the code in nandwrite
> carefully.
> I'd start to wonder if the mtd tools just don't build (or run)
> properly under uClibc.  Is there any chance you can use a standard
> glibc environment to doublecheck?

Dan,

I was just now successful in writing doc_spl to the device using 
nandwrite generated with glibc-2.2.5 on a RedHat 7.3 partition.

So, evidently there is a problem with the uClibc libraries and 
nandwrite, although there are no errors or warnings generated when 
compiling with uClibc.

I am just learning C, so I won't be very useful in examining the 
nandwrite code "carefully".  Perhaps you could suggest some 'talking 
points' I could bring up with the uClibc people.

- Joe
