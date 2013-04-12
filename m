Received: from moutng.kundenserver.de ([212.227.17.8])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UQZzU-0007BC-2p
 for linux-mtd@lists.infradead.org; Fri, 12 Apr 2013 09:09:53 +0000
Message-ID: <5167D00A.1090006@ammonit.com>
Date: Fri, 12 Apr 2013 11:12:42 +0200
From: =?ISO-8859-1?Q?Steffen_K=FChn?= <sk@ammonit.com>
MIME-Version: 1.0
To: David Mosberger-Tang <dmosberger@gmail.com>
Subject: Re: Changing the ECC method for a running system (UBI seems to use
 OOB?)
References: <5166E4F8.5030107@ammonit.com>
 <CACwUX0PEfQfNa_Yg5JFEWFsFAC++Y1MgmPmckE5_2KZG8YuEOw@mail.gmail.com>
In-Reply-To: <CACwUX0PEfQfNa_Yg5JFEWFsFAC++Y1MgmPmckE5_2KZG8YuEOw@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello David,

> We had exactly the same issue with our embedded systems (I'm really mad at
> Micron that they released the 4-bit ECC chips without as much as putting a
> warning message in the Linux kernel, but that's a separate topic...).
> 
> Anyhow, we modified the AT91bootstrap loader to convert the entire NAND
> from 1-bit sw-ecc to on-die 4-bit ECC.  I'd be happy to send a patch to
> this mailing list if you think this would be useful.

Yes, this would be great! The patch is certainly also helpful for the
next with the same problem ...

> 
> UBI fortunately does not use OOB at all, so there should be no issue from
> there.
I have read this too. I'm happy that I have not to deal with YAFFS2.

> 
> The subpage size has to match though.  In our case, UBI was built for 512B
> subpage, but when turning on the on-die ECC support, it'd by default only
> support 2048B pages.  The patch I sent earlier to this mailing list enables
> 512B subpage writes with on-die ECC.

That could be my problem. I have not considered this point. Thanks!

Best regards,
Steffen
