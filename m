Received: from rproxy.gmail.com ([64.233.170.204])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRNhK-0006Sx-U3
	for linux-mtd@lists.infradead.org; Mon, 08 Nov 2004 23:33:40 -0500
Received: by rproxy.gmail.com with SMTP id i8so11089rne
	for <linux-mtd@lists.infradead.org>;
	Mon, 08 Nov 2004 20:33:32 -0800 (PST)
Message-ID: <b4618e0f04110820333b6140d3@mail.gmail.com>
Date: Tue, 9 Nov 2004 10:03:31 +0530
From: bandwidthcrunch <bandwidthcrunch@gmail.com>
To: Chan Siu Ming <namely_void@yahoo.co.uk>
In-Reply-To: <20041108211932.34600.qmail@web25006.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <20041108211932.34600.qmail@web25006.mail.ukl.yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Getting mtd to work with IBM Evaluation boards (Ebony/Walnut)
Reply-To: bandwidthcrunch <bandwidthcrunch@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

http://kelp.or.kr/korweblog/stories.php?story=04/06/30/7742286 is
doing something with one of these boards .


On Mon, 8 Nov 2004 21:19:32 +0000 (GMT), Chan Siu Ming
<namely_void@yahoo.co.uk> wrote:
> Hello,
> I'm trying to get mtd to work with IBM Walnut and
> Ebony PPC evaluation boards. I tried with mtd CVS
> from 2004.11.03 and Linux 2.6.9, but seem to have
> some problems. Here's first what I did do with
> success:
> * patched kernel with CVS mtd and compiled it,
>   everything into the kernel - no modules. I'm
>   not quite sure what I should have enabled in
>   the config, but I guess these boards have CFI
>   AMD chips in them.
> * populated /dev with the MAKEDEV in mtd tree
> * compiled the mtd utils
> My problems are:
> * There doesn't seem to be a map for Walnut boards,
>   anyone has got one?
> * Ebony can read from the flash well, but cannot
> write.
>   Flash_info says: "0 erase regions". Flash_unlock and
>   all write attemps fail, when trying to open the
>   device in O_RDWR or O_WRONLY mode. What might be
>   the problem?
> Tested the physical ram test device on Walnut (mapped
> to the boards SRAM at 0xFFF00000) and that worked
> fine.
> 
> Thanks for any help.
> 
> ___________________________________________________________ALL-NEW Yahoo! Messenger - all new features - even more fun! http://uk.messenger.yahoo.com
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
