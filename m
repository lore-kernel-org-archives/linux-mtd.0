Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfhoO-0004Y1-TF
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 11:52:10 -0500
Date: Sat, 18 Dec 2004 17:52:01 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Joakim Tjernlund <Joakim.Tjernlund@lumentis.se>
Message-ID: <20041218165201.GB2654@wohnheim.fh-wedel.de>
References: <20041218160908.GB1083@wohnheim.fh-wedel.de>
	<BCEFJBPJCGFCNMMMIDBHKEMNCJAA.Joakim.Tjernlund@lumentis.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BCEFJBPJCGFCNMMMIDBHKEMNCJAA.Joakim.Tjernlund@lumentis.se>
Cc: jasmine@linuxgrrls.org, Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 18 December 2004 17:26:59 +0100, Joakim Tjernlund wrote:
> > On Fri, 17 December 2004 12:19:55 +0100, Joakim Tjernlund wrote:
> >
> > It sure is hard to read.  Is there any version in C around?
> 
> Found this in RFC1017:

Thanks!

>        {
>            /* Compute Internet Checksum for "count" bytes
>             *         beginning at location "addr".
>             */
>        register long sum = 0;
> 
>         while( count > 1 )  {
>            /*  This is the inner loop */
>                sum += * (unsigned short) addr++;
>                count -= 2;
>        }
> 
>            /*  Add left-over byte, if any */
>        if( count > 0 )
>                sum += * (unsigned char *) addr;
> 
>            /*  Fold 32-bit sum to 16 bits */
>        while (sum>>16)
>            sum = (sum & 0xffff) + (sum >> 16);
> 
>        checksum = ~sum;
>    }

Even weaker than the weak checksums from rsync.  Hmm...

The algorithm should be faster than adler32, but also less secure.
Tough question now is how secure does the algorithm have to be?

o How often would we expect data corruption on the flash?
o How is it handled?  Mark erase as bad block and continue?
o How many data corruptions occur before flash is declared broken?

In the end, if data gets replaced with completely random garbage, is
it good enough to miss once such occurence out of 10?  Out of 1000?
1000000?

Jörn

-- 
Courage is not the absence of fear, but rather the judgement that
something else is more important than fear.
-- Ambrose Redmoon
