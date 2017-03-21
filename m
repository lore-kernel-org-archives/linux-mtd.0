Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqEFt-0001yZ-6i
 for linux-mtd@lists.infradead.org; Tue, 21 Mar 2017 07:30:58 +0000
Message-ID: <1490081431.11326.75.camel@gmail.com>
Subject: Re: =?UTF-8?Q?=E7=AD=94=E5=A4=8D=3A?= UBIFS: Failed to read/write
 file when contiguous pages are not enough
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?=E4=BD=99=E5=8D=8E=E5=85=B5=28=E5=B9=B3=E5=8F=B0=E4=B8=80?=
 =?UTF-8?Q?=E9=83=A8_?= =?UTF-8?Q?=E7=A6=8F=E5=B7=9E=29?=
 <yhb@ruijie.com.cn>, 'Richard Weinberger' <richard@nod.at>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: =?UTF-8?Q?=E4=BF=9E=E5=AF=BF=E5=8D=8E=28=E5=B9=B3=E5=8F=B0=E4=B8=80?=
 =?UTF-8?Q?=E9=83=A8_?= =?UTF-8?Q?=E7=A6=8F=E5=B7=9E=29?=
 <yushouhua@ruijie.com.cn>,
 =?UTF-8?Q?=E9=82=93=E6=96=87=E6=9D=B0=28=E5=B9=B3=E5=8F=B0=E4=B8=80?=
 =?UTF-8?Q?=E9=83=A8_?= =?UTF-8?Q?=E7=A6=8F=E5=B7=9E=29?=
 <dengwenjie@ruijie.com.cn>,
 =?UTF-8?Q?=E9=BB=84=E5=B4=87=E6=BB=A8=28=E5=B9=B3=E5=8F=B0=E4=B8=80?=
 =?UTF-8?Q?=E9=83=A8_?= =?UTF-8?Q?=E7=A6=8F=E5=B7=9E=29?=
 <huangcb@ruijie.com.cn>,
 =?UTF-8?Q?=E6=B1=9F=E4=BF=A1=E8=BE=89=28=E5=B9=B3=E5=8F=B0=E4=B8=80?=
 =?UTF-8?Q?=E9=83=A8_?= =?UTF-8?Q?=E7=A6=8F=E5=B7=9E=29?=
 <jiangxh@ruijie.com.cn>
Date: Tue, 21 Mar 2017 09:30:31 +0200
In-Reply-To: <80B78A8B8FEE6145A87579E8435D78C307988C07@FZEX3.ruijie.com.cn>
References: <80B78A8B8FEE6145A87579E8435D78C3079814E8@FZEX3.ruijie.com.cn>
 <1a5eb9d2-8db0-5ca3-d873-a2bd8439c30d@nod.at>
 <80B78A8B8FEE6145A87579E8435D78C307988C07@FZEX3.ruijie.com.cn>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2017-03-21 at 01:53 +0000, 余华兵(平台一部 福州) wrote:
> Or does this only happen when the kernel tries to produce free memory
> in the writeback path?
> //This happens when UBIFS reads or writes a file. UBIFS should avoid
> applying for continuous pages, otherwise it will fail when the
> continuous pages are not enough.

You are right that it will be better if UBIFS allocates single pages
only. But this is an improvement request. It is not a bug to do order 1
allocations, it is just an imperfection: UBIFS could work better on
system with highly fragmented memory.

Artem.
