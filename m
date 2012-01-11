Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1RktFu-0001IX-JR
 for linux-mtd@lists.infradead.org; Wed, 11 Jan 2012 08:09:59 +0000
Message-ID: <4F0D4405.2060800@ftemaximal.fr>
Date: Wed, 11 Jan 2012 09:10:45 +0100
From: Alexandre Gambier <a.gambier@ftemaximal.fr>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB handling
References: <4F0C3339.6070909@ftemaximal.fr> <1326230599.2335.4.camel@koala>
In-Reply-To: <1326230599.2335.4.camel@koala>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> hi everyone,
>>
>> I use UBI volume and UBIFS on top of a NAND device with an embedded
>> video meter.
>> Everything works fine except that when a UBI volume is mounted the
>> following warning is outputted :
>> "UBI warning: ubi_eba_init_scan: cannot reserve enough PEBs for bad PEB
>> handling, reserved 0, need 20"
> Looks like the pool of reserved PEBs is fully used. Fo how long have you
> been using this flash?
This is a brand new flash...I've been using it for 2 months.

>
>> UBI: attaching mtd7 to ubi0
> When I see things like mtd7 - I get worried. Do you have 7 partitions on
> one chip? Even on old good and reliable chips this was not very good
> idea, let alone modern NANDs with all these unstable bits, "radiation"
> effects, low eraseblock max. erase count, etc...
Here is my partition table
   mtd0 -> UBoot -> 1 MiB
   mtd1 -> UBootSettings -> 128 KiB
   mtd2 -> SafeKernel -> 4 MiB => The linux kernel loaded in safe mode 
to restore the main rootfs and perform maintenance.
   mtd3 -> AppKernel -> 4 MiB => The linux kernel loaded in normal mode 
when running the application.
   mtd4 -> SafeFS => 64 MiB => The safe mode file-system.
   mtd5 -> AppFS => 128 MiB => The main application file-system.
   mtd6 -> Reserved => 54.875 MiB => Reserved during the development 
stage, will be used in stable version.
   mtd7 -> UserData => 256 MiB => User's data partition to store records 
and log files (that will never be erased or formatted).

> BTW, be aware of this problem:
>
> http://linux-mtd.infradead.org/doc/ubifs.html#L_unstable_bits
thanks..The user's data partition will be the only one mounted in r/w 
mode...files in it are not crucial.

> which has not been solved - we need a brave knight who'd spend time
> working on this issue.
A little bit to complicated for me otherwise I would love to help the 
MTD project.

Alex
