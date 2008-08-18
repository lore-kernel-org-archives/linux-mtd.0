Received: from smtpauth03.csee.onr.siteprotect.com ([64.26.60.137])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVCvY-0006iP-1Y
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 22:10:19 +0000
Message-ID: <48A9F346.7020706@boundarydevices.com>
Date: Mon, 18 Aug 2008 15:10:14 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>	
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>	
	<1218793271.3184.77.camel@pmac.infradead.org>	
	<ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>	
	<1218795140.3184.84.camel@pmac.infradead.org>	
	<48A5D154.2000409@boundarydevices.com>	
	<alpine.DEB.0.99.0808152300300.9220@frans-desktop>	
	<48A8937D.1010007@boundarydevices.com>	
	<ac9c93b10808172333l1f6771b2w1404f9ac771d3058@mail.gmail.com>	
	<48A9AF73.2040105@boundarydevices.com>
	<ac9c93b10808181409uca8dc59ja62f43a217f4a969@mail.gmail.com>
	<48A9E99E.7070302@boundarydevices.com>
In-Reply-To: <48A9E99E.7070302@boundarydevices.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Troy Kisky wrote:
> Frans Meulenbroeks wrote:
> (ignoring inversions)
> Example: You have a block of all zeros.
> 
> The ecc stored in the spare bytes of this is also 0.
> Now, upon reading this block of zeroes, a two bit ecc occurs. The bits that happen to be
> read incorrectly are bit # 0 & bit # 0x3f of the block
> The hardware calculated ecc will be
> 0:0 ^ 0:fff = 0:fff after bit 0
> 0:fff ^ 3f:fc00 = 3f:3f after bit 3f
> 
> Now, when your algorithm counts bits you get 12, and decide
> it is a single bit ecc error.
> 
> The old way however will xor the high and low 12 bits 3f ^ 3f = 0, 0 != fff and
> decide it is multi bit ecc error and give an error.
> 
> Note, that both approaches would have decide it was a single bit error, if the second
> error wouldn't have happened.
> 
> 
> So, try a block of zeroes and flip bits 0 and 0x3f.
> 
> Troy
> 

Whoops, that's a 512 bytes ecc example (as that's what I'm used to).

The 256 byte ecc may be harder. How about
bit 0, 0x3f, and the 1st bit of the ecc

 0:0 ^ 0:7ff = 0:7ff after bit 0
 0:7ff ^ 3f:7c00 = 3f:3f after bit 3f
 3f:3f ^ 0:1 = 3f:3e



This is 11 bits but 3f^3e = 1, 1 !=7ff and the old algorithm will refuse to correct.
So the new behavior is different.

Any extra detection is worth it to me.

Troy
