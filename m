Received: from mx0a-00176a03.pphosted.com ([67.231.149.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXZTJ-0002kl-QR
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 18:10:38 +0000
Received: from pps.filterd (m0048274.ppops.net [127.0.0.1])
 by m0048274.ppops.net-00176a03. (8.14.7/8.14.7) with SMTP id t2GIA8E0010606
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 14:10:15 -0400
Received: from cinmlip14.e2k.ad.ge.com ([12.71.149.1])
 by m0048274.ppops.net-00176a03. with ESMTP id 1t63pq80q7-3
 (version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 14:10:15 -0400
Message-ID: <55071C7E.4050102@ge.com>
Date: Mon, 16 Mar 2015 18:10:06 +0000
From: Renaud Barbier <renaud.barbier@ge.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: UBI/UBIFS: debugging help
References: <5503285A.5090500@ge.com>
 <CAFLxGvxrpAcHN_F_yjgJP7VE1YanE9Hrga-GYW20Bjdp=zGEVA@mail.gmail.com>
In-Reply-To: <CAFLxGvxrpAcHN_F_yjgJP7VE1YanE9Hrga-GYW20Bjdp=zGEVA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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

Thanks.

I just found that after moving the files out and copying them  back
under Linux, then copying out the files works under barebox.
I will see how Linux handles the same PEBs read, maybe that will give me
a clue.




On 13/03/2015 18:42, Richard Weinberger wrote:
> On Fri, Mar 13, 2015 at 7:11 PM, Renaud Barbier <renaud.barbier@ge.com> wrote:
>> My platform is based on a ARM Cortex-A9 and boots barebox from a spi-nor.
>>
>> I have tested UBI/UBIFS from Linux on this platform with no issue after
>> disabling 4KB support for the spi nor I am using.
>>
>> However, I got problem on the boot loader side. UBI/UBIFS has been
>> ported by the barebox community from Linux and I used it successfully
>> on a previous project on a PPC platform.
>>
>> On the ARM platform I can ubiattach, mount the mtd partition and copy a
>> small file (~65KB spanning two sectors). The issue comes when I copy out
>> a larger file (512KB) out. It fails to copy the whole file.
>>
>> At the point of failure, ubifs_tnc_locate fails resulting in the
>> function read_block to return -ENOENT.
>>
>> Debugging shows that in the function ubifs_search_zbranch no keys match
>> is found prior to the failure.
>>
>> I know this list is called linux-mtd but I was hoping that somebody
>> could give me a pointer on where to look next. I am currently going
>> through git logs and mailing list.
> 
> In such situations I start with testing all layers bottom up.
> 1. Does the MTD driver work (I mean really work)
> 2. Does UBI work correctly? (ubi tests, etc...)
> 3. Same for UBIFS
> 
> HTH,
> //richard
> 
