Received: from mail-la0-x236.google.com ([2a00:1450:4010:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YtiuW-0006wi-JX
 for linux-mtd@lists.infradead.org; Sat, 16 May 2015 20:42:17 +0000
Received: by labbd9 with SMTP id bd9so168808430lab.2
 for <linux-mtd@lists.infradead.org>; Sat, 16 May 2015 13:41:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
References: <CAD=nrE_4tsSvKQ_Rz8XJpjJhfT-z+-Tkhn-SMvvcyUaPzg1PHA@mail.gmail.com>
 <CAAbfDBfXZCrRJ2M_MDGP8Pmo97tLiduYGHa2AdKasTya60e81A@mail.gmail.com>
Date: Sat, 16 May 2015 22:41:53 +0200
Message-ID: <CAD=nrE9=040qfZHQi349KAikhiRAr5YrPgO52-7bm9uA9WmW=Q@mail.gmail.com>
Subject: Re: Tracking flash IO activity?
From: "valent.turkovic@gmail.com" <valent.turkovic@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have used iostat but it is not showing any changes on /dev/mtdblock5
which is mounted as /overlay jffs2 partition on this device I'm using.
I have also checked stats in /proc/diskstat, and they also only change
for /dev/mmcblk0p1 which is usb device, but not for any of
/dev/mtdblockX partitions.



> through fio and iostats , just starts an io through dd gets status through
> iostats, i have not used but i know.
>
> On Sun, May 17, 2015 at 1:51 AM, valent.turkovic@gmail.com
> <valent.turkovic@gmail.com> wrote:
>>
>> Hi,
>> I'm using low cost devices like home wifi routers for few diy projects
>> using OpenWrt.
>>
>> These devices use mtd partitions, but I don't have enough knowledge on
>> how to track IO activity, especially number of writes.
>>
>> Can you please point me in the right direction? Thanks.
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
>
