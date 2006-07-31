Received: from wr-out-0506.google.com ([64.233.184.231])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G7TkL-0007Js-MI
	for linux-mtd@lists.infradead.org; Mon, 31 Jul 2006 05:07:42 -0400
Received: by wr-out-0506.google.com with SMTP id 57so242447wri
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jul 2006 02:07:32 -0700 (PDT)
Message-ID: <91b24a870607310205w7fa0d847wb652da7a1b0c52c7@mail.gmail.com>
Date: Mon, 31 Jul 2006 17:05:52 +0800
From: "Marteo Tim" <tim.marteo@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
Subject: Re: about using UBI on MLC Nand flash
In-Reply-To: <44C9BA59.7030006@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <91b24a870607272033n1fa43a45vb523982186708f8e@mail.gmail.com>
	<44C9BA59.7030006@yandex.ru>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2006/7/28, Artem B. Bityutskiy <dedekind@yandex.ru>:
> Hello Tim,
>
> Marteo Tim wrote:
> > I noticed that UBI need to write 2 times at 1st page in 1 block, one
> > for EC header, and the other for VID header. But it is not suitable
> > for MLC NAND flash, which only can write once per page. And by
> > default, MTD's nand_write can only write page-aligned data.
> > Although we can set the module parameter vid_hdr_offsets to the 2nd
> > page, but it will occupy more flash space. It is in a dilemma. :(
>
> I wonder, what's your flash What's the NAND page size of your flash?
>

My NAND flash page size is 2k byte.

> unfortunately, I failed to find any MLC NAND flash manual to read about
> it. If you could send me one, I'd be grateful. Or URL? Is it only
> Toshiba who produce them?
>

OK, I'm glad to send it to you, include SAMSUNG&TOSHIBA's MLC NAND
flash datasheet, please check your email, :)

> Is this a feature of MLC NANDs or this is just MTD which does not
> support multiple writes? For example, Samsung SLC flashes *do* support 4
> writes per NAND page, but MTD *does not* support this so far (but there
> is a plan to implement this).
>

By now, as the datasheet described, MLC NAND flash cannot write exceed
one time for main area and one time for spare area. I don't know it is
due to manufacture technology's limit or other reasons.

> And it is strange if UBI tries to write to one NAND page twice at your
> case. By default it should not, granted mtd->writesize is correct in
> your case.
>

Yes, for SLC NAND flash, it would be easy to write more times per page
by setting mtd->writesize to 512.

Due to cheap price, MLC NAND flash maybe use more and more popular,
especially in bulky flash. Yaffs2 can already support MLC chips by
zero page rewrites, and I want UBI can support it too. :)
