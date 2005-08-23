Received: from mailout05.sul.t-online.com ([194.25.134.82])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1E7SHI-00023j-Rp
	for linux-mtd@lists.infradead.org; Tue, 23 Aug 2005 02:28:59 -0400
To: "Arvind Agrawal" <arvind@4access-comm.com>
From: Wolfgang Denk <wd@denx.de>
Mime-version: 1.0
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 8bit
In-reply-to: Your message of "Mon, 22 Aug 2005 18:38:42 PDT."
	<035a01c5a783$65057ce0$6501a8c0@arvindwin2000>
Date: Tue, 23 Aug 2005 08:27:56 +0200
Sender: wd@denx.de
Message-Id: <20050823062756.1D843353D32@atlas.denx.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: NAND support in BLOB 
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In message <035a01c5a783$65057ce0$6501a8c0@arvindwin2000> you wrote:
> 
> We have been using BLOB on a Lubbock Board using Intel Streta flash.
>  Now we are planning on using a ST Micro NAND flash and boot from
>  EPROM. Still need NAND support to Read linux Kernel Image in memory
>  and to be able to write images on the NAND flash.
>  
> I was wondering if anybody already has such a solution which we can port
>  or help in changing the existing Blob to support NAND.

It's definitely a bigger change, but here we go: use U-Boot instead?

Best regards,

Wolfgang Denk

-- 
Software Engineering:  Embedded and Realtime Systems,  Embedded Linux
Phone: (+49)-8142-66989-10 Fax: (+49)-8142-66989-80 Email: wd@denx.de
Forty two.
