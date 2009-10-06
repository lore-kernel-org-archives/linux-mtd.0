Received: from mail-bw0-f220.google.com ([209.85.218.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MvBDc-0002qC-A0
	for linux-mtd@lists.infradead.org; Tue, 06 Oct 2009 14:40:53 +0000
Received: by bwz20 with SMTP id 20so3464501bwz.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Oct 2009 07:40:46 -0700 (PDT)
Message-ID: <4ACB56EF.9050301@billgatliff.com>
Date: Tue, 06 Oct 2009 09:40:47 -0500
From: Bill Gatliff <bgat@billgatliff.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Should flash hardware look like UBI?
References: <1254751504.13096.725.camel@macbook.infradead.org>
In-Reply-To: <1254751504.13096.725.camel@macbook.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> But I've also been thinking about exactly what we _do_ want. We
> certainly want something a little more capable than the raw interface to
> NAND flash that ONFI provides.
>   

Actually, I prefer that we make the hardware as dumb as possible.  I'm 
ok with the chip timing its own flash erase and programming cycles, but 
everything else I want to keep up in our software.  That way we can 
adapt the functionality to whatever level of control that we want.

ECC can be difficult to get right, and the specific algorithm chosen can 
be application- and environment-dependent.  If it's baked into the chip 
then the algorithm decision is already made, and any bugs in the 
implementation are impossible to correct.  Also, like other posters have 
mentioned regarding SD/MMC firmware, any firmware running in a NAND 
flash will require thorough documentation so that users of the chip can 
accommodate its needs for power management, etc.

And on top of that, one really needs to know if the bits that they are 
reading back have required ECC to recover.  If a region of flash is 
failing, a sudden increase in the amount of error correction needed will 
tell you that some evasive action is necessary.  By its very nature, ECC 
can never be completely transparent to the user.

I don't see any substantial benefit to a chip having an inbuilt, 
hardware "memcpy" to allow one to move data around without reading it 
out.  That just sounds like more undocumented stuff to go wrong.  :)  
And more design decisions that have been made without the user's consent.


Just my US$0.02.


b.g.

-- 
Bill Gatliff
bgat@billgatliff.com
