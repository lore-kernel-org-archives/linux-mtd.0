Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW0MC-0002kw-1n
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 10:28:49 +0000
Message-ID: <55016A43.3000201@nod.at>
Date: Thu, 12 Mar 2015 11:28:19 +0100
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
In-Reply-To: <0D23F1ECC880A74392D56535BCADD7354973D2A1@NTXBOIMBX03.micron.com>
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

Am 11.03.2015 um 22:16 schrieb Jeff Lauruhn (jlauruhn):
> Glad to help out.  I train FAE's and customers on many aspects of NAND including MLC.  

UBI (and UBIFS) was designed with SLC NAND in mind, so far we know that we have to
address the following constraints when we want UBI on MLC NAND:

1. Avoid repeating bit patterns. This can be solved by scrambling. Boris did some great work in this area.
2. Paired pages. We'll have choose pages we write to very carefully to not loss already written data in case of a power cut.
3. Read disturb. Happens also on SLC but not that early. I'm working in this.
4. Data retention. i.e, blocks that have not been erased for a long time have to be re-erased. I'm working in this too.
5. Unstable bits (not MLC specific).
6. What did I miss?

Jeff, what do you think?
Can you point us to some hard facts? I'm specially interested in numbers on read disturb and data retention.

Thanks,
//richard
