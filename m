Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vg5aN-0002IW-8J
 for linux-mtd@lists.infradead.org; Tue, 12 Nov 2013 04:28:20 +0000
Received: by mail-ob0-f174.google.com with SMTP id uy5so3345064obc.33
 for <linux-mtd@lists.infradead.org>; Mon, 11 Nov 2013 20:27:56 -0800 (PST)
Date: Mon, 11 Nov 2013 20:27:53 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2] mtd: gpmi: fix the NULL pointer
Message-ID: <20131112042753.GJ20061@ld-irv-0074.broadcom.com>
References: <20131108175119.GA20061@ld-irv-0074.broadcom.com>
 <1384166419-23568-1-git-send-email-b32955@freescale.com>
 <20131112031833.GI20061@ld-irv-0074.broadcom.com>
 <5281A058.1080501@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5281A058.1080501@freescale.com>
Cc: fabio.estevam@freescale.com, dedekind1@gmail.com, dwmw2@infradead.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org, festevam@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ Fabio, in case he missed this (it was also in HTML, so it might not
have gotten through the filters)

On Tue, Nov 12, 2013 at 11:28:24AM +0800, Huang Shijie wrote:
> 于 2013年11月12日 11:18, Brian Norris 写道:
> 
>     So I would recommend the following: set the NAND_SKIP_BBTSCAN, then
>     rearrange to the following call structure:
> 
>      |_ nand_scan_ident
>      |_ chip->options |= NAND_SKIP_BBTSCAN;
>      |_ nand_init_last
>        |_ gpmi_init_last [1]
>          |_ gpmi_set_geometry
>      |_ nand_scan_tail
>      |_ gpmi_pre_bbt_scan [2]
>        |_ nand_boot_init
>          |_ mx23_boot_init
>            |_ mx23_check_transcription_stamp
>            |_ mx23_write_transcription_stamp
>      |_ chip->scan_bbt() [3]
> 
>     Regarding [1] and [2]: we can split apart the code from gpmi_init_last()
>     so that have the stuff that is *only* necessary to do before [3] placed
>     under [2]. That way, nand_scan_tail() will initialize remaining pieces,
>     and all you have to do is configure and run your BBT scan. No more
>     dancing around uninitialized callback functions or buffers.
> 
>     What do you think?
> 
> it's ok to me. I will code the patch right now, and send out it after i test
> it.

Sounds good.

Brian
