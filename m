Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXQum-00069l-2q
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 09:02:25 +0000
Date: Mon, 16 Mar 2015 10:01:58 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
In-Reply-To: <20150313213134.1b53430b@bbrezillon>
Message-ID: <alpine.DEB.2.02.1503160955000.7125@lnxricardw1.se.axis.com>
References: <54FEDC42.2060407@dave-tech.it>
 <CAFLxGvx2WMZXvy7f_YyefgAFKDKgMoeoeqt905M1pJFJ28dXrw@mail.gmail.com>
 <1426058414.1567.2.camel@sauron.fi.intel.com> <5500037A.9010509@nod.at>
 <1426064733.1567.6.camel@sauron.fi.intel.com> <55000637.1030702@nod.at>
 <550074D2.1070406@dave-tech.it>
 <0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com>
 <55007B79.2090705@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
 <55016A43.3000201@nod.at>
 <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
 <20150313213134.1b53430b@bbrezillon>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: 8BIT
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi Jeff,

I have a question regarding MLC:s, probably not so much something we can 
do anything about, but I'm curious just the same:

If I understand correctly, page pairing in MLC's means that of the two 
bits in a cell, one is allocated to one page and another one to a 
completely different page. This means (among other things) that rewriting 
one page may impact the other, paired, page.

My question is: why is it done this way? Is it to distribute bit flips 
more evenly?

An initial trivial allocation would otherwise be to put the paired bits in 
the same byte, for two reasons a) to avoid page-pairing issues, and b) 
because it simply would be easier to write both bits in a cell at the same 
time rather than at different times.

Granted, without page pairing, any sort of failure or disturb in one bit 
cell would would require twice the amount of ECC as both bits would likely 
be corrupted, on the other hand, we'd avoid having data in one part of the 
flash be corrupted by operations in another part of the flash.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
