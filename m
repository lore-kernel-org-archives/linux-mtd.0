Received: from dragon.actrix.co.nz ([203.96.16.164])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 179afZ-0003jb-00
	for <linux-mtd@lists.infradead.org>; Mon, 20 May 2002 01:04:58 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Charles Manning <manningc2@actrix.gen.nz>
Reply-To: manningc2@actrix.gen.nz
To: Yong-iL Joh <tolkien@mizi.com>,
	Studying MTD <studying_mtd@yahoo.com>
Subject: Re: FAT for NAND Flash  --> Use of OOB
Date: Mon, 20 May 2002 11:58:27 +1200
Cc: linux-mtd@lists.infradead.org
References: <20020516144608.86328.qmail@web21509.mail.yahoo.com> <hbvg9m9gs5.fsf@tolkien.mizi.com>
In-Reply-To: <hbvg9m9gs5.fsf@tolkien.mizi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <20020520000344.CB74B4B989@dragon.actrix.co.nz>
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

On Sat, 18 May 2002 17:16, Yong-iL Joh wrote:
> Studying MTD <studying_mtd@yahoo.com> writes:
> > If i want to use FAT with NAND then i have to use :-
> >
> > A. FAT: filesystem driver
> > B. Translation: Translation layer
> > C. MTD: Memory Technology Devices driver
> > D. NAND: generic NAND driver
> > E. Hardware specific driver
> >
> > So i have to add only Translation layer, rest layers
> > will remain same.
> >
> > Am i right ? If not, please correct me.
> >
> > How can i write traslation layer , any reference.
>
> IMHO, you're right.
> we have implemented this way for SMC(SmartMedia Card). :)
>
> but, we can't use current MTD's nand.c because of different usage of OOB.
> we called SMCTL as "B. Translation".

Can you be more specific about the issue here? I'm interested as there might 
be some synergy.

I have a different file system (not JFFSx) that uses nand.c, but  the 
interface provided by nand.c is not optimal.

What I did is write some wrapper functions to map from the way I like to see 
NAND ( probably a bit more like SMFS) and the functions provided by nand.c

In the short term, writing your own wrappers is the way to go since it 
buffers your code from the mtd nand interface.
In the longer term, the mtd nand interface might expose more functions to to 
more SM friendly.

-- Charles
