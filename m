Received: from pacific.moreton.com.au ([203.143.235.130]
	helo=dorfl.internal.moreton.com.au)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BVAFX-0001YI-QW
	for linux-mtd@lists.infradead.org; Tue, 01 Jun 2004 10:28:24 -0400
Message-ID: <40BC93FA.1010508@snapgear.com>
Date: Wed, 02 Jun 2004 00:34:34 +1000
From: Greg Ungerer <gerg@snapgear.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <EFF9A3506F74924AB5CC77BDC66E79351812A4@atcml01.atc.army.mil>
	<1086097361.26119.213.camel@hades.cambridge.redhat.com>
In-Reply-To: <1086097361.26119.213.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC Mill Plus 32M  What next?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> On Tue, 2004-06-01 at 09:39 -0400, Carlos, John J USAATC wrote:
> 
>>What tools can I use on the chip to prepare it for use??  Nftl_format
>>reports wrong erase size of 0x10000?  I have read others postings and I am
>>not sure if I should be using nftl_format anyway?  Can soemone please tell
>>me the proper procedure to prep the chip for a jffs2 file system???
> 
> 
> Use the DOS tools if you can. Or look on SnapGear's web site to see if
> you can find an 'inftl_format' tool. 

I keep an nftl_format in the uClinux-dist code base that is capable
of formating INFTL as well.

Get the whole package and use uClinux-dist/user/mtd-utils/nftl_format.c

http://www.uclinux.org/pub/uClinux/dist/

Or just pull it from CVS at:

http://cvs.uclinux.org/cgi-bin/cvsweb/uClinux-dist/user/mtd-utils/nftl_format.c

It doesn't currently support erase sizes of 0x10000 either though...

Regards
Greg


------------------------------------------------------------------------
Greg Ungerer  --  Chief Software Dude       EMAIL:     gerg@snapgear.com
SnapGear -- a CyberGuard Company            PHONE:       +61 7 3435 2888
825 Stanley St,                             FAX:         +61 7 3891 3630
Woolloongabba, QLD, 4102, Australia         WEB: http://www.SnapGear.com
