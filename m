Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S3de5-0006fo-Ut
 for linux-mtd@lists.infradead.org; Sat, 03 Mar 2012 01:20:26 +0000
Received: from [192.168.12.102] (67.sub-166-250-0.myvzw.com [166.250.0.67])
 by smtp.newsguy.com (8.14.3/8.14.3) with ESMTP id q231KM1d033415
 (version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256 verify=NO)
 for <linux-mtd@lists.infradead.org>; Fri, 2 Mar 2012 17:20:23 -0800 (PST)
 (envelope-from mikedunn@newsguy.com)
Message-ID: <4F5171BB.2010708@newsguy.com>
Date: Fri, 02 Mar 2012 17:19:55 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Problems with mtd_oobtest
References: <CAHMF36F1Vd6=3YuQhKE_qEXm3hjGbbm=mmuMbQdt1i6Z=66zNQ@mail.gmail.com>
In-Reply-To: <CAHMF36F1Vd6=3YuQhKE_qEXm3hjGbbm=mmuMbQdt1i6Z=66zNQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/01/2012 04:16 AM, Matej Kupljen wrote:

>>> I can run mtd_speedtest, mtd_stresstest, mtd_readtest, mtd_pagetest without the
>>> problems, but when I start the mtd_oobtest it fails, basically on every page!
>>
>>
>> Your flash device probably does not support writing oob-only.  This is true of
>> some NAND devices.  I wouldn't worry about this test.  This failure is probably
>> unrelated to your ubifs problems.
> 
> Well, I haven't found that anywhere, so I was wondering in the dark :)
> I was looking at the code, but could find anything.


Take a look at how your driver handles writing oob-only.  Ideally it would
return -EOPNOTSUPP, but at least two drivers I know of silently save the data
and only do the oob write if the next operation is to write the page data itself
to the same page.  This is a hack to make utilities like nandwrite work.  This
utility assumes that oob can be written separately, and writes oob first, then
page data,  This is not possible on some NANDs where oob must be written at the
same time as the page data.  The disadvantage of the hack is that if the oob
write is not immediately followed by the page data write, the oob write silently
fails.  mtd_oobtest does not write the page data, only oob, and the fact that it
fails on every page suggests a situation like this.  I doubt it's relevant to
your ubifs troubles.

> 
>>> I can use JFFS2 on this device, and for some time even UBIFS, but then
>>> it just fails.
>>
>>
>> What is the nature of the ubifs failure?  The kernel log should tell you.  It
>> may be the same problem I experience, where over time too many erase bocks are
>> marked as bad.  This is due to the unforgiving nature of ubi wrt corrected
>> bitflips, and tends to be a problem on NAND flash devices with high bit errors,
>> for which the device compensates with strong ecc.  I'm working on some patches
>> that should fix this.
> 
> I re-flashed the UBFS image to my FLASH and have booted the device.
> It boots without the problem and here is the log (Please note, that is
> uses sub pages):


I'm not a ubi/ubifs expert, but if you're not sure how ubifs is failing, I
suggest running ubiformat on a blank device and then run some of the ubi test
utilities in mtd-utils, starting with io_basic.  If the problem is like the one
I'm having, the test will eventually fail (leave it running for a while) and the
error messages from ubi in the kernel log will likely be revealing.

Hope this helps.

Mike
