Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YYClC-00072m-Ll
 for linux-mtd@lists.infradead.org; Wed, 18 Mar 2015 12:07:43 +0000
Message-ID: <55096A75.8080207@nod.at>
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Andrea Marson <andrea.marson@dave.eu>
Subject: Re: RFC: detect and manage power cut on MLC NAND (linux-mtd Digest,
 Vol 144, Issue 70)
References: <mailman.37176.1426610573.22890.linux-mtd@lists.infradead.org>	<mailman.37176.1426610573.22890.linux-mtd.{ec43ae5e-9450-4d5f-9aa7-4de61fefcb43}.0@lists.infradead.org>	<0D23F1ECC880A74392D56535BCADD7354973E51A@NTXBOIMBX03.micron.com>	<55093B1E.2050805@dave.eu>
 <20150318100645.1babecfd@bbrezillon>
In-Reply-To: <20150318100645.1babecfd@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian <rnd4@dave-tech.it>,
 "Jeff Lauruhn \(jlauruhn\)" <jlauruhn@micron.com>,
 linux-mtd@lists.infradead.org, "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 18 Mar 2015 12:07:44 -0000

Am 18.03.2015 um 10:06 schrieb Boris Brezillon:
>> 1) IIUC read/program disturb effects exhibit at block level.
>> In a typical embedded linux systems there are software parts - 
>> bootloader, kernel image etc. - that virtually are never changed (almost 
>> ...) but are read many times. Other parts - application libraries, log 
>> files etc. - are read and wrote many times instead.
>> If these two kinds of software are stored in different MTD partitions - 
>> ket's say partition A for bootloader, kernel etc. and partition B for 
>> application libraries, log files etc. - can we say that read/write 
>> operations performed on partition B have no disturb effects on partition A?
> 
> AFAIK, read/write disturb effects only occur on pages of the same
> block, so we shouldn't see bitflips on partition A caused by read/write
> on partition B.

I already saw corruptions on nearby blocks but I'm not sure if really
plain read disturb was the root cause as this NAND chips showed in general
funny symptoms.

Jeff, can you tell us more?

Thanks,
//richard
