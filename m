Received: from gate.epygi.de ([212.126.211.241])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cbyg1-0006mb-TO
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2004 05:04:07 -0500
From: "Stephan Linke" <Stephan.Linke@epygi.de>
To: "Subrahmanyam" <subrahmanyam@navayuga.co.in>
Date: Wed, 8 Dec 2004 11:03:51 +0100
Message-ID: <NGENJJFPMHGLPILEKKAMGEBBCFAA.Stephan.Linke@epygi.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
In-Reply-To: <1102487832.13353.486.camel@tglx.tec.linutronix.de>
Cc: linux-mtd@lists.infradead.org
Subject: RE: MTD driver
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

you may setup a dedicated partition that gives you access to the particular
location in the flash where you whant to place this data. Then you can use
normal open() read() write() and seek() functions to access what ever byte in
this partition. How to erass a block you can look up in one of the MTD tools.
(Only if you are using NAND flash you should not do it like this since bad block
handling whould be missing.)
But I aggree with Thomas. Best whould be to put it into a filesystem...

Stephan


> -----Original Message-----
> From: linux-mtd-bounces@lists.infradead.org
> [mailto:linux-mtd-bounces@lists.infradead.org]On Behalf Of Thomas
> Gleixner
> Sent: Mittwoch, 8. Dezember 2004 07:37
> To: Subrahmanyam
> Cc: linux-mtd@lists.infradead.org
> Subject: Re: MTD driver
>
>
> On Tue, 2004-12-07 at 09:16 +0530, Subrahmanyam wrote:
> >  Hi,
> >
> >  I need to provide an user interface/GUI wherein when a certain data
> > (string/key) is entered, it should basically store the key in the flash
> > (this basically happens during run time after the target has been
> identified
> > by the host).
> >
> > In the target we have a flash in which there is jffs2 file system and also
> > mtd drivers, since i need to store block oriented data, i am looking at the
> > possiblity of using mtd driver and storing data(key) in a particular
> > location in flash. How should i proceed in acheiving the same.
>
> Is there any good reason, why the key cannot be stored on the already
> available jffs2 filesystem ?
>
> tglx
>
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
