Received: from wa-out-1112.google.com ([209.85.146.182])
	by pentafluge.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IfFDZ-0000NS-KY
	for linux-mtd@lists.infradead.org; Tue, 09 Oct 2007 14:33:54 +0100
Received: by wa-out-1112.google.com with SMTP id v33so1915116wah
	for <linux-mtd@lists.infradead.org>;
	Tue, 09 Oct 2007 06:33:28 -0700 (PDT)
Message-ID: <49eab5c80710090633l49ba7147j6f584f055103bcf3@mail.gmail.com>
Date: Tue, 9 Oct 2007 21:33:27 +0800
From: "falls huang" <falls.huang@gmail.com>
To: "Linux mtd" <linux-mtd@lists.infradead.org>
Subject: Re: About MLC Nand Driver
In-Reply-To: <AB85187D5025C54B878AD8E2BEDBD1910DC15F@sjmail2.sirf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <Pine.LNX.4.64.0709192310080.28990@lnxricardw.se.axis.com>
	<AB85187D5025C54B878AD8E2BEDBD1910DC15F@sjmail2.sirf.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello ysliu !

   I have successfully run Samsung's MLC nand flash in my linux board
with yaffs2/mtd , but the performance is low because the nand flash
driver that I wrote didn't support  two-plane page program .   You can
search this mailing list ,I have asked the tow-plane page program
problem several months ago.

  Besides yaffs2/mtd ,  you can alse purchase the samsung's RFS(Robust
Nandflash filesystem) , RFS supports MLC  and its performance is
excellect ( I heard from the samsung's guy but I never use RFS) .
  At last, why do u need to support a bare MLC nand flash chip?  for
BOM price ? You can just use a SD card in your product, it's simple
but the BOM will raise.

On 9/20/07, Yongsheng Liu <ysliu@sirf.com> wrote:
>
> Dear all,
>
> I was planing to get kernel supporting MLC Nand Flash. Any one of you
> guys has known something about this? Or is there anyone else planing
> this as well? Please give me comments on this, any comments will be
> appreciated.
>
> Best Regards
> YS Lau
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
Regards
Falls Huang
