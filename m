Received: from mail-vc0-x22e.google.com ([2607:f8b0:400c:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WcL8t-0006jB-6j
 for linux-mtd@lists.infradead.org; Mon, 21 Apr 2014 20:48:43 +0000
Received: by mail-vc0-f174.google.com with SMTP id ld13so1535156vcb.19
 for <linux-mtd@lists.infradead.org>; Mon, 21 Apr 2014 13:48:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAMPHVD9=1icuuuXybU2qCyc6n9ZzF2igpr1HFjBU_RUHEaADPw@mail.gmail.com>
References: <CAMPHVD9=1icuuuXybU2qCyc6n9ZzF2igpr1HFjBU_RUHEaADPw@mail.gmail.com>
Date: Mon, 21 Apr 2014 22:48:19 +0200
Message-ID: <CAFLxGvy0d_xDe8c-1CjRz1VxSz02_hQVJ8FK-Qadq0JVs-eryg@mail.gmail.com>
Subject: Re: Estimating flash life by reading EC (Erase Counters)
From: Richard Weinberger <richard.weinberger@gmail.com>
To: David Yat Sin <jd.yatsin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 21, 2014 at 9:41 PM, David Yat Sin <jd.yatsin@gmail.com> wrote:
> Hi,
> My goal is to be able to estimate the flash drive life in a production
> environment, so if there is a better/easier way of achieving this,
> please let me know.
>
> I have a small embedded device using NAND than runs UBIFS for the user
> partition. Our application constantly writes to log files, the log
> files are appended and gzip'ed, so it is hard to determine how much
> data is actually written to disk.
>
> I am hoping to do this by:
>
> 1. Read the EC (Erase Count) headers for each page on the partition
> 2. Let my system run for several days/weeks/months
> 3. Read the EC headers again
> 4. Then extrapolate drive life expectancy by comparing number of erase
> counts with the NAND endurance.
>
> Is there a utility that I could use to read the Erase Counters on a
> UBIFS partition?

IIRC ubinfo can tell you the value of the highest EC.

-- 
Thanks,
//richard
