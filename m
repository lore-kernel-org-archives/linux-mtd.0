Received: from a.ns.innominate.com ([212.21.76.70] helo=innominate.com)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16x7Uu-0006Z2-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 15:30:24 +0100
Received: from tkeitel by tino with local (Exim 3.34 #1 (Debian))
	id 16x7JM-0005Oj-00
	for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2002 16:18:28 +0200
Date: Mon, 15 Apr 2002 16:18:28 +0200
To: linux-mtd@lists.infradead.org
Subject: Re: Writing JFFS2 image to Nand flash
Message-ID: <20020415141828.GA20737@tino>
References: <541025071C7AC24C84E9F82296BB9B952CF8@OPTEX1.optex.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <541025071C7AC24C84E9F82296BB9B952CF8@OPTEX1.optex.local>
From: Tino Keitel <tino.keitel@innominate.com>
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

On Mon, Apr 15, 2002 at 14:42:39 +0100, John Hall wrote:
> > > This image should then be written to the device with cp or dd.
> > > However, if I have bad blocks on the device then dd fails.
> > 
> > Not sure about dd, I've just been using cp. But the main issue...
> 
> Even with the correct branch of JFFS2, I think this problem will still
> exist. Using cp or dd to write the initial filesystem image takes no
> account of bad blocks near the beginning of the NAND flash.

What about the seek option of dd?

Regards,
Tino

-- 
tino.keitel@innominate.com
dipl.-inf.                        Innominate Security Technologies AG
software engineer                                   networking people
tel: +49.30.6392-3308                      http://www.innominate.com/
