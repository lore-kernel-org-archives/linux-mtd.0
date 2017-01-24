Received: from mail-ot0-f196.google.com ([74.125.82.196])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cVwDX-0004yu-FS
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2017 08:12:42 +0000
Received: by mail-ot0-f196.google.com with SMTP id f9so18648005otd.0
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2017 00:12:18 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170124085810.29afbfaf@bbrezillon>
References: <8aa988fcc46c480d863cf4ee2ef40b2c@SGPMBX1023.APAC.bosch.com>
 <20170124085810.29afbfaf@bbrezillon>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 24 Jan 2017 09:11:17 +0100
Message-ID: <CAFLxGvw1UfFYQU7G3J_E=as5Y=rxDGJwFOTVz4=grTOQy-nmzQ@mail.gmail.com>
Subject: Re: Bad block Management Patch
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Raghavan Anurag,

On Tue, Jan 24, 2017 at 8:58 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Tue, 24 Jan 2017 04:56:47 +0000
> "Anurag Raghavan (RBEI/ETW11)" <Raghavan.Anurag@in.bosch.com> wrote:
>
>> Hi Boris,
>>
>>
>> I am using kernel version-3.0.35
>> I am facing uncorrectable ECC error in ubifs. I am suspecting, it is because of bad blocks are not properly handled in my driver.
>> Is there any patches available to handle the bad block in the specified version...

This is not how community support works.
He happily help with recent kernels but debugging problems on
outdated kernels with vendor patches applied is out of scope.

What you expect from us is hard and takes a lot of time, we cannot
do that for free in our spare time.

-- 
Thanks,
//richard
