Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWiuw-0005gW-TA
 for linux-mtd@lists.infradead.org; Sat, 14 Mar 2015 10:03:40 +0000
Message-ID: <5504075B.8030201@nod.at>
Date: Sat, 14 Mar 2015 11:03:07 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Jeff Lauruhn (jlauruhn)" <jlauruhn@micron.com>
Subject: Re: RFC: detect and manage power cut on MLC NAND
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
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973DAD6@NTXBOIMBX03.micron.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 mtd_mailinglist <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Jeff,

Am 12.03.2015 um 23:57 schrieb Jeff Lauruhn (jlauruhn):
> 
> 
> Jeff Lauruhn
> NAND Application Engineer
> Embedded Business Unit
> Micron Technology, Inc
> 
> 
> -----Original Message-----
> From: Richard Weinberger [mailto:richard@nod.at] 
> Sent: Thursday, March 12, 2015 3:28 AM
> To: Jeff Lauruhn (jlauruhn)
> Cc: Andrea Scian; dedekind1@gmail.com; Boris Brezillon; mtd_mailinglist
> Subject: Re: RFC: detect and manage power cut on MLC NAND
> 
> Am 11.03.2015 um 22:16 schrieb Jeff Lauruhn (jlauruhn):
>> Glad to help out.  I train FAE's and customers on many aspects of NAND including MLC.  
> 
> UBI (and UBIFS) was designed with SLC NAND in mind, so far we know that we have to address the following constraints when we want UBI on MLC NAND:
> 
> 
> 1. Avoid repeating bit patterns. This can be solved by scrambling. Boris did some great work in this area.
> 2. Paired pages. We'll have choose pages we write to very carefully to not loss already written data in case of a power cut.
> 	For MLC we store 4 bits in the same cell has 
> 3. Read disturb. Happens also on SLC but not that early. I'm working in this.
> 		
> 4. Data retention. i.e, blocks that have not been erased for a long time have to be re-erased. I'm working in this too.
> 	
> 5. Unstable bits (not MLC specific).
> 	Two types.  Data retention and Disturbs (read and program).   Data retention (charge loss) tends to shift left,  
> 6. What did I miss?
> 
> Jeff, what do you think?

can you please say something on the "TODO" list? Did we miss something?
Do you have kind of a design document?

> Can you point us to some hard facts? I'm specially interested in numbers on read disturb and data retention.
> I wish there were numbers, it would make my job a lot easier, but NAND doesn't work that way.  Data retention is dependent on process node (35nm, 25nm, 20nm 15nm for example) P/E cycles and temperature. We generally specify our NAND using JEDC standards, x numbers of years at 55C with 10% cycling.   If you apply our recommended ECC, then you will be able to store data and recover it after x numbers of years.  But temperature, P/E, process size and usage have major effects on data retention so we recommend actively managing your NAND.  This is what you do and what I find so interesting about your group.

But I'm sure there are some rough numbers. Do we have to expect read disturb after say 100 reads?
https://www.micron.com/~/media/Documents/Products/Presentation/flash_mem_summit_jcooke_inconvenient_truths_nand.pdf
Are the numbers on page 20 still valid?

> I can speak in generalities for now, and when I get more specifics I can predict and recommend solutions.
> 
> Data Retention is characterized by a loss of charge.  We program a bit from 1 to 0 (just the opposite of what people think).  Over time the charge will leave the gate, this is normal NAND behavior.  I say that the distribution of charged cell shifts left toward uncharged. Why is SLC better than MLC?  First SLC was first and used older larger lithographies.  You could store 10's of thousands of electrons on a 40nm gate and you only had two states L0 erased (0volts) or L1 programmed (1.5v for example). If you lose a few, it didn't make much difference and there was a lot of room between 0 and 1.5 volts.  Newer processes are 20nm and MLC.  With a smaller gate there are just a few hundred electrons and they need to be disturbed in one of 4 levels L0 (0 volts), L1(.5 volts), L2(1volts) or L3 (1.5 volts).  Now adding or losing a few electrons can have a larger effect.  We determine a programmed cell by measuring between the L0 and L1.  If the levels have shifted, they can shift to the poi
nt where you can't reliably tell the difference between L0 and L1.  When there are more levels and they are closer together it makes it just that much more challenging.  
> 
> 
> Program/Read Disturb are characterized by charge gain or a shift right.  The problem is the same.
> 
> These affects are not instantaneous, they happen over long periods of time.  Instead of trying to predict every case, we recommend actively managing NAND, and that's what your team does.  Read the data an use ECC to see how much the data has changed.  Create a threshold and when the data hits the threshold move the data to a fresh block.  

Thanks,
//richard
