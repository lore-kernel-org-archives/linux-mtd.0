Received: from smtp.firstline.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NHU8u-0007uh-7n
	for linux-mtd@lists.infradead.org; Mon, 07 Dec 2009 03:20:13 +0000
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Subject: Re: What filesystem for NAND flash with OOB 218
Date: Mon, 7 Dec 2009 16:19:56 +1300
References: <4B1C682D.1020603@theptrgroup.com>
In-Reply-To: <4B1C682D.1020603@theptrgroup.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200912071619.56623.manningc2@actrix.gen.nz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Monday 07 December 2009 15:27:57 Jeff Angielski wrote:
> I was wondering what type of filesystem everybody is using for the newer
>   NAND flash with OOB>=128 bytes.  For me, this is the Micron
> MT29F8G08AAA which has an OOB=218.
>
> It seems that the JFFS2 tools are out of date and don't work with
> anything less than or equal to 64bytes of OOB.
>
> YAFFS2 does not compile in the latest kernel source trees (2.6.31 in the
> DENX linux-2.6-denx git tree).  Is this filesystem dead?

Far from it. 
I'll take a look at why it does not compile.

>
> As far as I can tell, that only leaves UBIFS.  Is UBIFS ready to
> deployed in the field?
>
> Is there any other choice for these parts?
