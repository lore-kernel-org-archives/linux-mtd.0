Received: from smtpauth02.csee.onr.siteprotect.com ([64.26.60.136])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KUpVK-0000UY-An
	for linux-mtd@lists.infradead.org; Sun, 17 Aug 2008 21:09:38 +0000
Message-ID: <48A8937D.1010007@boundarydevices.com>
Date: Sun, 17 Aug 2008 14:09:17 -0700
From: Troy Kisky <troy.kisky@boundarydevices.com>
MIME-Version: 1.0
To: frans <fransmeulenbroeks@gmail.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218472202.2977.12.camel@pmac.infradead.org>
	<ac9c93b10808120153m7435424ci3e49a70d3599cc06@mail.gmail.com>
	<1218535872.2977.133.camel@pmac.infradead.org>
	<alpine.DEB.0.99.0808142007340.6572@frans-desktop>
	<48A48330.70105@boundarydevices.com>
	<ac9c93b10808150141o6627e350pd23895d56426d59c@mail.gmail.com>
	<1218789997.3184.64.camel@pmac.infradead.org>
	<ac9c93b10808150223h6fb6032co61ffa7babba57884@mail.gmail.com>
	<1218793271.3184.77.camel@pmac.infradead.org>
	<ac9c93b10808150304k14f054faw402a7f67e868d2a@mail.gmail.com>
	<1218795140.3184.84.camel@pmac.infradead.org>
	<48A5D154.2000409@boundarydevices.com>
	<alpine.DEB.0.99.0808152300300.9220@frans-desktop>
In-Reply-To: <alpine.DEB.0.99.0808152300300.9220@frans-desktop>
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

frans wrote:
> 
> On Fri, 15 Aug 2008, Troy Kisky wrote:
>> You might also test it on a big endian system to be safe.
>>
>> Troy
>>
> Good remark!
> I should have mentioned this more explicitly. As mentioned before I did test
> on Linksys NSLU2. This is an ARM and standard Linksys software (as well as
> the std unslung one from nslu2-linux.org) is big endian (and yes, that
> is the part I did not mention).
> 

So, you have tried reading a file system that was created before your patch
was applied on a big endian system? Sorry to be a pest, but I didn't see any
endian-ness test in your patch. But I will admit that my eyes aren't very good.
I'm especially bad at spotting the jelly in the fridge. :^)

Troy
