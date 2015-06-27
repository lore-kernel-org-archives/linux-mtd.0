Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z8woG-0000nu-Nl
 for linux-mtd@lists.infradead.org; Sat, 27 Jun 2015 20:34:45 +0000
Received: by igblr2 with SMTP id lr2so32357474igb.0
 for <linux-mtd@lists.infradead.org>; Sat, 27 Jun 2015 13:34:23 -0700 (PDT)
Message-ID: <558F08CB.8070506@gmail.com>
Date: Sat, 27 Jun 2015 16:34:19 -0400
From: nick <xerofoify@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>,
 Brian Hill <brian@houston-radar.com>
Subject: Re: ubifs_scan: corrupt empty space
References: <558D6251.1070603@houston-radar.com>
 <CAFLxGvzr9nBgfWbRsg9seviD4AQ9-u+CNadDFyyvr-j2N_XKqA@mail.gmail.com>
In-Reply-To: <CAFLxGvzr9nBgfWbRsg9seviD4AQ9-u+CNadDFyyvr-j2N_XKqA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 2015-06-27 04:11 PM, Richard Weinberger wrote:
> On Fri, Jun 26, 2015 at 4:31 PM, Brian Hill <brian@houston-radar.com> wrote:
>>
>> One of our systems using Atmel ARM A5, Micron MT29F4G08ABADAWP -w- kernel 3.17 produced this error, which proved unrecoverable:
>>
>> UBIFS error (pid 452): ubifs_scan: corrupt empty space at LEB 2670:125358
>> UBIFS error (pid 452): ubifs_scanned_corruption: corruption at LEB 2670:125358
>> UBIFS error (pid 452): ubifs_scanned_corruption: first 1618 bytes from LEB 2670:125358
>> 00000000: fffffffd ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff ffffffff
>>
>> There have been various threads on this type of error over the years, such as:
>> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039254.html
>>
>> The most notable comment being:
>>
>>> ubifs expect empty space to be protected by ecc. But if empty page ecc is not
>>> ff, this need hack in the nand driver.
>>
>> I find that no, the atmel driver, unlike some others, doesn't attempt to "correct" erased pages which contain bit flips.
>> Is the driver still the preferred place to address this issue?  What if the erased space has more bit flips than the ECC strength of the device?  It seems like that block should simply be retired - it has no actual user data.  Will UBIFS handle this particular condition?
> 
> UBIFS assumes that an empty page contains only 0xFFs.
> On modern NAND chips, especially MLC, this seems no longer to be the case.
> 
> So far no generic solution was found.
> Please see:
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052521.html
> and
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052507.html
> 
Richard,
There seem to be a lot of messages related to unfixed/issues with ubifs and current 
flash hardware. I was wondering if we can either write better documentation on the
mtd wiki for this or even better in the kernel Documentation directory to help save
you some time with answering these common questions now. :) Unfortunately I am not
aware of all the issues so letting someone else to write the Docs is better. 
Nick
