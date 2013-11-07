Received: from mail-vc0-x22d.google.com ([2607:f8b0:400c:c03::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeQga-0000iF-Cd
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 14:35:53 +0000
Received: by mail-vc0-f173.google.com with SMTP id lh4so419413vcb.32
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 06:35:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <527B7CD1.1020105@codeaurora.org>
References: <527B7CD1.1020105@codeaurora.org>
Date: Thu, 7 Nov 2013 15:35:30 +0100
Message-ID: <CAFLxGvx=8vcDzUcA6vG_84X8snYkDLBkyboQZmDTUdDgi3xccQ@mail.gmail.com>
Subject: Re: [mtd] possible bug in nandsim
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind@infradead.org, dedekind@oktetlabs.ru,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 pratibha@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 7, 2013 at 12:43 PM, Tanya Brokhman <tlinder@codeaurora.org> wrote:
> Hi
>
> I've recently started working with the nand simulator. For my testing
> purposes I have to use it with a cache file. Bellow are the commands I run:
>
> modprobe nandsim first_id_byte=0x20 second_id_byte=0xaa third_id_byte=0x00
> fourth_id_byte=0x15 cache_file=cache_file.txt
> modprobe ubi mtd=0 fm_autoconvert=1
>
> Unfortunately, when trying the above I noticed that the next time i load
> nandsim and ubi on top of it the fastmap data is not saved at cache_file.txt
> and the device comes up as clean. Meaning, the cache file feature of the
> nandsim isn't working properly.

IIRC this feature is really meant as a cache and not persistent storage.

> So while debugging this I think I found the root cause:
> unsigned long *pages_written from struct nandsim also needs saving.
> Otherwise while reading a page (at read_page()) we enter the following code
> flow:
>
> if (!test_bit(ns->regs.row, ns->pages_written)) {
>                 memset(ns->buf.byte, 0xFF, num);
> } else {
>
> thus, ignoring the content of the cache file.
>
> I've fixed this internally in my build by just saving the content of
> pages_written to a file on __exit and reading from that file on __init.
>
> I was wondering if someone had done this in a more elegant way perhaps?
>
> If not, I'll beautify my patch and share.
>
> Thanks,
> Tanya Brokhman
> --
> QUALCOMM ISRAEL, on behalf of Qualcomm Innovation Center, Inc. is a member
> of Code Aurora Forum, hosted by The Linux Foundation
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/



-- 
Thanks,
//richard
