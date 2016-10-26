Received: from mail-ve1eur03on072e.outbound.protection.outlook.com
 ([2a01:111:f400:fe09::72e]
 helo=EUR03-VE1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bzEAr-0001Sz-5T
 for linux-mtd@lists.infradead.org; Wed, 26 Oct 2016 02:44:45 +0000
Message-ID: <5810179D.90104@axentia.se>
Date: Wed, 26 Oct 2016 04:40:29 +0200
From: Peter Rosin <peda@axentia.se>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: Regression caused by commit c83ed4c9dbb3 "ubifs: Abort readdir
 on error"
References: <ce65141e-87d2-344e-82d2-a1c4ed0bdbf1@lysator.liu.se>
 <e4cbe883-003e-5522-400a-da79a98a0ec4@nod.at>
 <2e3cf9f7-d747-7129-455f-a1105f5474de@nod.at>
In-Reply-To: <2e3cf9f7-d747-7129-455f-a1105f5474de@nod.at>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 2016-10-25 22:50, Richard Weinberger wrote:
> Peter,
> 
> On 25.10.2016 22:09, Richard Weinberger wrote:
>>> /bin/mkdir -p /mnt/ovl/ovl
>>> /bin/mkdir -p /mnt/ovl/work
>>> # with c83ed4c9dbb3, the following mount fails with
>>> # mount: mounting overlay on /mnt/merge failed: No such file or directory
>>> /bin/mount -t overlay -o lowerdir=/,upperdir=/mnt/ovl/ovl,workdir=/mnt/ovl/work overlay /mnt/merge
>>
>> Uhhhh! Thanks for catching this.
>> I think I know what is going on, the fix exposes now internal UBIFS return codes to VFS.
>> Let me prepare a fix.
> 
> Does the attached patch cure the issue?

Yup, back to normal AFAICT. Thanks for the speedy fix!

Reported-by: Peter Rosin <peda@axentia.se>
Tested-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
