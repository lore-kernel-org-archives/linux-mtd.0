Received: from [212.105.56.244] (helo=dmz.lumentis.net)
	by canuck.infradead.org with esmtps (Exim 4.42 #1 (Red Hat Linux))
	id 1CfhQI-00049G-F0
	for linux-mtd@lists.infradead.org; Sat, 18 Dec 2004 11:27:15 -0500
From: "Joakim Tjernlund" <Joakim.Tjernlund@lumentis.se>
To: "Jörn Engel" <joern@wohnheim.fh-wedel.de>
Date: Sat, 18 Dec 2004 17:26:59 +0100
Message-ID: <BCEFJBPJCGFCNMMMIDBHKEMNCJAA.Joakim.Tjernlund@lumentis.se>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
In-Reply-To: <20041218160908.GB1083@wohnheim.fh-wedel.de>
Cc: jasmine@linuxgrrls.org, Thomas Gleixner <tglx@linutronix.de>,
	Linux MTD mailing list <linux-mtd@lists.infradead.org>
Subject: RE: JFFS3 & performance
Reply-To: Joakim.Tjernlund@lumentis.se
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> On Fri, 17 December 2004 12:19:55 +0100, Joakim Tjernlund wrote:
> >
> > Looked a little closer on csum_partial and I think JFFS3 can use it. You need
> > csum_fold as well:
> > seed = ~0;
> > crc = csum_fold(csum_partial(buff, len, seed));
> >
> > Don't know if it is good enough for JFFS3 but it is fast.
>
> It sure is hard to read.  Is there any version in C around?
>
> Jörn

Found this in RFC1017:

       {
           /* Compute Internet Checksum for "count" bytes
            *         beginning at location "addr".
            */
       register long sum = 0;

        while( count > 1 )  {
           /*  This is the inner loop */
               sum += * (unsigned short) addr++;
               count -= 2;
       }

           /*  Add left-over byte, if any */
       if( count > 0 )
               sum += * (unsigned char *) addr;

           /*  Fold 32-bit sum to 16 bits */
       while (sum>>16)
           sum = (sum & 0xffff) + (sum >> 16);

       checksum = ~sum;
   }
