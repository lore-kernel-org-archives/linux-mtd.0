Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WMVmu-0003p4-Aa
 for linux-mtd@lists.infradead.org; Sun, 09 Mar 2014 04:56:37 +0000
Received: by mail-pa0-f50.google.com with SMTP id kq14so5851042pab.23
 for <linux-mtd@lists.infradead.org>; Sat, 08 Mar 2014 20:56:19 -0800 (PST)
Date: Sat, 8 Mar 2014 20:56:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Christian Riesch <christian.riesch@omicron.at>
Subject: Re: [PATCH v3] mtd: Fix the behavior of OTP write if there is not
 enough room for data
Message-ID: <20140309045615.GK31517@norris-Latitude-E6410>
References: <4cb7a3dd-9eac-41c5-8498-f2695f01576c@mary.at.omicron.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cb7a3dd-9eac-41c5-8498-f2695f01576c@mary.at.omicron.at>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Mar 06, 2014 at 12:42:37PM +0100, Christian Riesch wrote:
> If a write to one time programmable memory (OTP) hits the end of this
> memory area, no more data can be written. The count variable in
> mtdchar_write() in drivers/mtd/mtdchar.c is not decreased anymore.
> We are trapped in the loop forever, mtdchar_write() will never return
> in this case.
> 
> The desired behavior of a write in such a case is described in [1]:
> - Try to write as much data as possible, truncate the write to fit into
>   the available memory and return the number of bytes that actually
>   have been written.
> - If no data could be written at all, return -ENOSPC.
> 
> This patch fixes the behavior of OTP write if there is not enough space
> for all data:
> 
> 1) mtd_write_user_prot_reg() in drivers/mtd/mtdcore.c is modified to
>    return -ENOSPC if no data could be written at all.
> 2) mtdchar_write() is modified to handle -ENOSPC correctly. Exit if a
>    write returned -ENOSPC and yield the correct return value, either
>    then number of bytes that could be written, or -ENOSPC, if no data
>    could be written at all.
> 
> Furthermore the patch harmonizes the behavior of the OTP memory write
> in drivers/mtd/devices/mtd_dataflash.c with the other implementations
> and the requirements from [1]. Instead of returning -EINVAL if the data
> does not fit into the OTP memory, we try to write as much data as
> possible/truncate the write.
> 
> [1] http://pubs.opengroup.org/onlinepubs/9699919799/functions/write.html
> 
> Signed-off-by: Christian Riesch <christian.riesch@omicron.at>
> Cc: Brian Norris <computersforpeace@gmail.com>
> ---
> 
> Changes for v3:
> - Moved logic for returning -ENOSPC from cfi_intelext_write_user_prot_reg,
>   dataflash_write_user_otp, onenand_write_user_prot_reg to a common
>   implementation in mtd_write_user_prot_reg, as requested by Brian Norris.
> - Simplified the code in mtdchar_write as suggested by Brian.
> - Added more comments, commit message.

Thanks for the update. Pushed to l2-mtd.git!

Brian
