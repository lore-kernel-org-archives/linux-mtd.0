Received: from po-out-1718.google.com ([72.14.252.158])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K8Pz1-0004va-DB
	for linux-mtd@lists.infradead.org; Tue, 17 Jun 2008 01:28:56 +0000
Received: by po-out-1718.google.com with SMTP id b23so9600246poe.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 16 Jun 2008 18:27:15 -0700 (PDT)
Message-ID: <366f00c80806161827q46a5ea2bmc0e51f5c4d6c96ec@mail.gmail.com>
Date: Tue, 17 Jun 2008 06:57:13 +0530
From: "Sudeep K N" <sudeepholla.maillist@gmail.com>
To: "Suresh Rajashekara" <suresh@mistralsolutions.com>
Subject: Re: JFFS2 Cleanmarker Issue
In-Reply-To: <4856F1F7.4040003@mistralsolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4856F1F7.4040003@mistralsolutions.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

The clean marker is not getting written to spare area on your nand device.
The first 4 bytes of clean maker is 19852003 I think.
Just check whether you are getting spare write request for these bytes in your
Nand driver and also check if you have written it properly to the spare area.

On Tue, Jun 17, 2008 at 4:36 AM, Suresh Rajashekara
<suresh@mistralsolutions.com> wrote:
> Hi Everyone,
>
> Few necessary details before I explain my issue.
>
> Hardware I use: OMAP5912 based board
> Linux: 2.6.16-rc3
>
> Let me know if you guys need more details.
>
> The issue:
> I use the JFFS2 file system on the oneNAND flash. Every time I boot the
> board I see the following on the serial console (I have
> CONFIG_JFFS2_FS_DEBUG=2)
>
> <SNIP>
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00000000 OOB at 00000000 was ff ff 00 19 03 03 ff ff ff ff ff 56 fe
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff jffs_check_nand_cleanmarker returned 1 jffs2_check_oob_empty
> returned 1
> JFFS2: Erase block at 0x00000000 is not formatted. It will be erased
> jffs2_check_nand_cleanmarker(): Cleanmarker node not detected in block
> at 00020000 OOB at 00020000 was ff ff 00 19 03 03 ff ff ff ff ff 56 fe
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff jffs_check_nand_cleanmarker returned 1 jffs2_check_oob_empty
> returned 1 blah..
> .
> blah...
> .
> .
> </SNIP>
>
> Getting this on the first boot, is I guess expected. But this messages
> repeats every time we reboot the board. I did some debugging and found
> that the JFFS2 driver is marking these blocks and writes the clean markers.
>
> Since these prints were appearing on every boot, I read the oob area
> which the jffs2 driver wrote to mark the cleanmarkers. I found the data
> to be shifted. I tried Googling and also went through the GIT log
> messages to find if this was a known issue, but could not find any. Is
> this a known issue in 2.6.16-rc3.
>
> The developers who did the initial design have chosen to format the
> partition using the nftl_format command. I read on the MTD howto that it
> should not be used. I tried replacing that with "flash_eraseall -j" and
> created the jffs2 file system using the command mkfs.jffs2 (I tried with
> the correct page size and other stuff by looking in to the datasheet)
> and wrote the jffs2 file system using the nand_write command, but none
> helped.
>
> Could someone please point me in the right direction?
>
> Thanks in advance,
>
> Best Regards,
> Suresh
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



-- 
Regards,
Sudeep
