Received: from mga11.intel.com ([192.55.52.93])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh2YB-00040H-2Q
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 15:40:07 +0000
Subject: Re: [PATCH V2 1/5]nand/denali Clean up all white spaces in code indent
From: David Woodhouse <David.Woodhouse@intel.com>
To: Chuanxiao <chuanxiao.dong@gmail.com>
In-Reply-To: <20100805152934.GA6828@infernal>
References: <20100805150604.GA6589@infernal>
	<1281021118.8720.5.camel@localhost>  <20100805152934.GA6828@infernal>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 16:40:02 +0100
Message-ID: <1281022802.8720.16.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Dong, Chuanxiao" <chuanxiao.dong@intel.com>, "Yuan,
	Hang" <hang.yuan@intel.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Gao, Yunpeng" <yunpeng.gao@intel.com>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-05 at 16:29 +0100, Chuanxiao wrote:
> On Thu, Aug 05, 2010 at 04:11:58PM +0100, David Woodhouse wrote:
> >On Thu, 2010-08-05 at 16:06 +0100, Chuanxiao wrote:
> >> Hi,
> >> I have changed the outlook mail cliet to be linux mutt client and use my
> >> personal gmail to submit patches.
> >> Here are 5 new patches to fix nand/denali check patch errors. The other
> >> 4 patches will be sent out after this mail.
> >> Thanks for your review.
> >
> >Apply? [y]es/[n]o/[e]dit/[v]iew patch/[a]ccept all y
> >Applying: nand/denali Clean up all white spaces in code indent
> >error: patch failed: drivers/mtd/nand/denali.c:29
> >error: drivers/mtd/nand/denali.c: patch does not apply
> >Patch failed at 0001 nand/denali Clean up all white spaces in code indent
> >
> >
> >Are you *really* sending this stuff to yourself first, and checking that
> >it applies *before* you try sending mail to anyone else?
>
> Before I send these patches to mail list I have sent them to myself
> first and applies all of them, but not using "intel.com" account.
> I have already using mutt as mail client.
> I have been tortured by "intel.com" mail for several days and found that
> the email I received through "intel.com" account lost tab and some white
> spaces but no problems recevied through my personal mail "gmail.com".
> I don't understand how this happend.
> So David, can you try the patches get from linux-mtd mail list, not from
> your "intel.com" account?

Yes, the copy I received through my external email is working fine.
Sorry for not checking that before -- I thought the issues with Intel
mail servers corrupting email were long since fixed.

Please don't use my @intel.com mail address for *anything* that needs to
survive intact; please use dwmw2@infradead.org instead.

I've now applied your patches. Are there more to come?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
