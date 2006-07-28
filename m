Received: from smtp2.yandex.ru ([213.180.200.18] helo=mx18.yandex.ru)
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1G6Mid-0006Fl-Dq
	for linux-mtd@lists.infradead.org; Fri, 28 Jul 2006 03:25:16 -0400
Received: from MS-131-114.dyn-ip.SPb.SkyLink.RU ([212.129.114.131]:45797 "EHLO
	[192.168.38.21]" smtp-auth: "dedekind" TLS-CIPHER: <none>
	TLS-PEER-CN1:
	<none>) by mail.yandex.ru with ESMTP id S3375793AbWG1HSw (ORCPT
	<rfc822;linux-mtd@lists.infradead.org>);
	Fri, 28 Jul 2006 11:18:52 +0400
Message-ID: <44C9BA59.7030006@yandex.ru>
Date: Fri, 28 Jul 2006 11:18:49 +0400
From: "Artem B. Bityutskiy" <dedekind@yandex.ru>
MIME-Version: 1.0
To: Marteo Tim <tim.marteo@gmail.com>
Subject: Re: about using UBI on MLC Nand flash
References: <91b24a870607272033n1fa43a45vb523982186708f8e@mail.gmail.com>
In-Reply-To: <91b24a870607272033n1fa43a45vb523982186708f8e@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Tim,

Marteo Tim wrote:
> I noticed that UBI need to write 2 times at 1st page in 1 block, one
> for EC header, and the other for VID header. But it is not suitable
> for MLC NAND flash, which only can write once per page. And by
> default, MTD's nand_write can only write page-aligned data.
> Although we can set the module parameter vid_hdr_offsets to the 2nd
> page, but it will occupy more flash space. It is in a dilemma. :(

I wonder, what's your flash What's the NAND page size of your flash?

unfortunately, I failed to find any MLC NAND flash manual to read about
it. If you could send me one, I'd be grateful. Or URL? Is it only
Toshiba who produce them?

Is this a feature of MLC NANDs or this is just MTD which does not
support multiple writes? For example, Samsung SLC flashes *do* support 4
writes per NAND page, but MTD *does not* support this so far (but there
is a plan to implement this).

And it is strange if UBI tries to write to one NAND page twice at your
case. By default it should not, granted mtd->writesize is correct in
your case.

I guess you read at UBI-FAQ? FYI:

-------------------
"How much flash space do UBI headers consume?

This depends on the flash flash you are using. Both EC and VID headers
take 64 bytes, so in case of NOR flash UBI headers consume 128 bytes,
and the logical eraseblock size is equivalent to the physical eraseblock
size minus 128 bytes. But the situation may be different in case of
other flash types.

As it is noted here , UBI writes twice to the flash, not just both UBI
headers in one go. But many flashes have a notion of the "minimal
Input/Output unit size". For example, in case of NAND flash it is
typically equivalent to the NAND page size, which is either 512 bytes or
2KiB. In this case, the EC header would be situated at the first NAND
page, the VID header - at the second NAND page, and both headers would
take two NAND pages (1KiB or 4KiB). The situation is similar in case of
other flash types.

Implementation-wise, UBI just looks at the writesize field of the struct
mtd_info MTD device description object and uses it as the min. I/O unit
when calculating sizes and positions of UBI headers.

Fortunately, many NAND flashes allow several (typically 4) write
operations to one NAND page. Thus, say, in case of a Samsung flash with
2KiB NAND pages one may fit UBI headers at the first two 512-byte chunks
of the NAND page. But this must be supported by the MTD flash driver
(writesize has to be 512 bytes, not 2KiB)."
-------------------

-- 
Best Regards,
Artem B. Bityutskiy,
St.-Petersburg, Russia.
