Received: from mail-wm0-x229.google.com ([2a00:1450:400c:c09::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1atZbF-000794-JR
 for linux-mtd@lists.infradead.org; Fri, 22 Apr 2016 11:50:18 +0000
Received: by mail-wm0-x229.google.com with SMTP id u206so22885796wme.1
 for <linux-mtd@lists.infradead.org>; Fri, 22 Apr 2016 04:49:56 -0700 (PDT)
Subject: Re: DaVinci NAND: disable subpage write (28c015)
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <5719DEB9.1020909@barix.com> <20160422110547.7fdf019c@bbrezillon>
Cc: Murali Karicheri <m-karicheri2@ti.com>, linux-mtd@lists.infradead.org
From: Petr Kulhavy <petr@barix.com>
Message-ID: <571A0FE1.4040202@barix.com>
Date: Fri, 22 Apr 2016 13:49:53 +0200
MIME-Version: 1.0
In-Reply-To: <20160422110547.7fdf019c@bbrezillon>
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

On 22.04.2016 11:05, Boris Brezillon wrote:
> Hi Petr,
>
> On Fri, 22 Apr 2016 10:20:09 +0200
> Petr Kulhavy <petr@barix.com> wrote:
>
>> Hi,
>>
>> this email refers to the commit:
>> 28c015a9daabe4ed3aeb0ccf669a3f1c2b8b81d5 on drivers/mtd/nand/davinci-nand.c.
>> This commit sets the NAND_NO_SUBPAGE_WRITE option for "ti,keystone-nand"
>> to workaround a HW issue on the controller.
>>
>> Disabling subpage write however should be made a general option because
>> some NAND chips do not support subpage write at all. Subpage write is a
>> feature of the NAND chip, not the NAND interface. In combination with
>> "ti,davinci-nand" there is no option to disable subpage write.
>> In my case I'm struggling with this issue on the AM1808 with a 1Gb
>> Micron NAND (MT29F1GxxABB).
> That's true that subpage write is initially a feature exposed by NAND
> chips (actually called subpage in datasheets), but the controller can
> say that it does not support writing subpages.
> The problem is, in most drivers we don't have the concept of
> controllers, hence the reason we're asking NAND controllers to
> explicitly modify chip->options and set the NAND_NO_SUBPAGE_WRITE flag
> manually.
>
> Note that, unless the CHIP supports subpage write, mtd->subpage_sft
> will be 0, which should prevent subpage writes [1].

Thank you for the explanation. Do you mean that the controller should 
detect if the chip supports subpage writing? Where is the piece of code 
doing the detection?
That is interesting, because in my case the detection does not work. 
Using compatible string "ti,davinci-nand" causes heavy ECC errors with 
UBI (which extensively uses subpage writes) and after setting the 
compatible string to "ti,keystone-nand" the errors are gone...

Regards
Petr
