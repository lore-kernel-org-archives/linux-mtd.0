Received: from smtp-sh.infomaniak.ch ([128.65.195.4])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cnkOH-0002G1-8l
 for linux-mtd@lists.infradead.org; Tue, 14 Mar 2017 11:13:23 +0000
Subject: Re: Timeout in denali.c on Micron nandflash (Altera SoC)
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <58BEB65B.3050003@idquantique.com>
 <CAFLxGvy=PHU1Yc74TgQ-S9+Q_jRnYEUVywzYqbhdmQRGHk_vJA@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "laurent.monat@idquantique.com" <laurent.monat@idquantique.com>,
 David Oberhollenzer <goliath@sigma-star.at>
From: Thorsten Christiansson <thorsten.christiansson@idquantique.com>
Message-ID: <58C7D033.4030902@idquantique.com>
Date: Tue, 14 Mar 2017 12:12:51 +0100
MIME-Version: 1.0
In-Reply-To: <CAFLxGvy=PHU1Yc74TgQ-S9+Q_jRnYEUVywzYqbhdmQRGHk_vJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Richard,

On advice from Altera, I have been testing using JFFS2 directly on top
of MTD, and thereby bypassing the UBI completely. At first it looked
promising, but I have seen the same 'timeout' here as well.

I will get back to running some tests with an up-to-date kernel, and will
keep you posted.


Thanks,

Thorsten

On 03/09/2017 11:09 PM, Richard Weinberger wrote:
> Thorsten,
>
> On Tue, Mar 7, 2017 at 2:32 PM, Thorsten Christiansson
> <thorsten.christiansson@idquantique.com> wrote:
>> Hi all,
>>
>> I'm using Linux on an Altera SoC (Arria V), on which I'm using UBIFS on a
>> nandflash from Micron (MT29F8G08ADADAH4).  I have a 400Mb r/w partition on
>> which I have a sqlite3-based database. We're running an application that
>> reads/writes fairly small blocks. After running for about a week at moderate
>> load, I get an error message, and the filesystem becomes read-only.
>>
>> The message I get is a timeout, originating in the denali.c driver.
>> [11744.733748] timeout occurred, status = 0x0, mask = 0x4
>> [11745.733685] timeout occurred, status = 0x0, mask = 0x120
>>
>> I can also reproduce the error much faster (in ~1h) using the GNU 'stress'
>> command, writing/reading small files continuously.
>>
>> I'm using Linux 4.4, with some patches from Altera. I have compared the
>> denali.c that I'm using with the current HEAD on github, and the differences
>> appear to be only cosmetic.
>>
>> I have asked Altera for help, but their only response so far has been that
>> they can reproduce the issue on their latest SoCs (it apparently appears on
>> both Arria10 and CycloneV) with the same flash. (We have also tested with a
>> Macronix MX66U51235FMI-10G, with the same results.)
>>
>> At first we used the FASTMAP feature of the UBIFS, but then we ran into this
>> issue after only a couple of hours running at moderate load. When we
>> disabled
>> that, we thought the problem was gone, but it appears that it was only
>> hiding,
>> and now comes out to bite us after about a week.
>>
>>
>> My questions are the following:
>> - Are there any known issues with the denali driver that could cause this?
> Well, 4.4. is not very fresh. Maybe it saw fixes in recent version.
>
>> - Could it be an issue in the MTD/UBI/UBIFS layers?
> Since the denali driver prints the timeouts I'd say the root of the
> problem is there.
>
>> - Are there any other parameters that can be tuned in order to alleviate the
>>   problem?
>>
>> and of course
>> - Have I missed something obvious? I'm pulling my hair here...
> Can you please give MTD tests a try?
>

-- 
Thorsten Christiansson
Security Engineer
ID Quantique
thorsten.christiansson@idquantique.com
<mailto:thorsten.christiansson@idquantique.com>
Tel: +41 22 301 8373 Fax: +41 22 301 8379
www.idquantique.com <https://www.idquantique.com>
https://twitter.com/IDQuantique
https://www.linkedin.com/company/id-quantique-sa
