Received: from mail014.syd.optusnet.com.au ([203.2.75.175])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16lIO6-0001M2-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Mar 2002 23:42:30 +0000
Message-ID: <3C8FE5DD.5A4561B2@ctam.com.au>
Date: Thu, 14 Mar 2002 10:50:53 +1100
From: Justin Ipsen <justin.ipsen@ctam.com.au>
Reply-To: justin.ipsen@ctam.com.au
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: linux-mtd@lists.infradead.org
Subject: Re: ECC Reset problems
References: <3C8F04B4.D745D633@ctam.com.au> <25659.1016011052@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Thanks David.

Its seems to be a timing issue, although not with ECC resets.
We had to make the following changes to affect all delays used in doc2000.c
I had forgotten that I multiplied "cycles" by 6 to make the 32M DOC work.
I increased this to 9 and the 48M DOC now works fine.

Would this just be a specific board architecture thing?

Thanks again.

Justin.

    /* Perform the required delay cycles by reading from the appropriate
register */
    static void DoC_Delay(struct DiskOnChip *doc, unsigned short cycles)
    {
        volatile char dummy;
        int i;

        for (i = 0; i < cycles*12; i++) {
            if (DoC_is_Millennium(doc))
                dummy = ReadDOC(doc->virtadr, NOP);
            else
                dummy = ReadDOC(doc->virtadr, DOCStatus);
        }
    }



David Woodhouse wrote:

> justin.ipsen@ctam.com.au said:
> >  I'm running linux 2.4.1-pre11 on a powerPC platform. I have been
> > using a 32M doc2000 with no problems. I've just started to use a 48M
> > doc2000 but the On-Chip ECC engine seems to work just once after reset
> > and not again.   It looks like the "ECC Config" Resets function has
> > stopped working?
>
> Hmmm. I can't see any documented timing constraints on the ECC Reset. But
> try adding a delay between...
>
>                 /* Prime the ECC engine */
>                 WriteDOC(DOC_ECC_RESET, docptr, ECCConf);
>                 WriteDOC(DOC_ECC_EN, docptr, ECCConf);
>
> Might also be worth looking in include/linux/mtd/doc2000.h and changing the
> definition of DOC_ECC_RESET to DOC_ECC_RESV instead of zero.
>
> --
> dwmw2
