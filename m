Received: from pop.scorch.co.nz ([203.167.210.162] helo=firstline.co.nz)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HlXGy-0002Ua-LC
	for linux-mtd@lists.infradead.org; Tue, 08 May 2007 17:31:06 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org,
 dedekind@infradead.org
Subject: Re: MLC NAND support in JFFS2
Date: Wed, 9 May 2007 09:38:45 +1200
References: <dd2695e90705080020u576249aah71121e245f659bd3@mail.gmail.com>
	<dd2695e90705080132h234b7389x37762c4884047cb0@mail.gmail.com>
	<1178614097.3708.21.camel@sauron>
In-Reply-To: <1178614097.3708.21.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705090938.45247.manningc2@actrix.gen.nz>
Cc: Stanley Cai <stanley.w.cai@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 08 May 2007 20:48, Artem Bityutskiy wrote:
> On Tue, 2007-05-08 at 16:32 +0800, Stanley Cai wrote:
> > hi
> >   I find that some vendor's MLC NAND such as Samsung require the user
> > programs the pages in the same block in sequence from least
> > significant page to most significant page. i think current JFSS2 can
> > not do this now.
>
> Please, no private mails.
>
> This was a requirement for SLC flashes as well, at least Toshiba's data
> sheets noted this. JFFS2 satisfies this requirement.

I think the bigger issue is supporting multi-bit error correction via BCH. The 
current 1-bit correcting Hamming code is inadequate for MLC.
