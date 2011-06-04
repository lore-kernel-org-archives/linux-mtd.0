MIME-Version: 1.0
In-Reply-To: <20110603223226.GC9161@kroah.com>
References: <BANLkTimos3-Ds4Y8FDfDZegqAhH7nSS4PA@mail.gmail.com>
	<1305865207-7869-1-git-send-email-leiwen@marvell.com>
	<BANLkTinuqQmp43K4H0iPDbb-H-rDA_nL9w@mail.gmail.com>
	<20110603223226.GC9161@kroah.com>
Date: Sat, 4 Jun 2011 09:45:25 +0200
Message-ID: <BANLkTi=GEV3xfAZ+UphPPSG2hZavchiwPQ@mail.gmail.com>
Subject: Re: [stable] [PATCH] MTD: pxa3xx_nand: fix nand detection issue
From: Daniel Mack <zonque@gmail.com>
To: Greg KH <greg@kroah.com>, Lei Wen <adrian.wenl@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <David.Woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Haojian Zhuang <haojian.zhuang@marvell.com>,
	linux-mtd@lists.infradead.org, Axel Lin <axel.lin@gmail.com>,
	linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 4, 2011 at 12:32 AM, Greg KH <greg@kroah.com> wrote:
> On Fri, Jun 03, 2011 at 11:11:54PM +0800, Lei Wen wrote:
>> Tested-by: Daniel Mack <zonque@gmail.com>
>>
>> Also cc to MTD maillist and stable kernel.
>
> <formletter>
>
> This is not the correct way to submit patches for inclusion in the
> stable kernel tree. =A0Please read Documentation/stable_kernel_rules.txt
> for how to do this properly.
>
> </formletter>

Jup.

Lei - when you collect the patches for this driver to send them out,
make sure every one gets a "Cc: stable@kernel.org" line under the
S-o-b, so it can be picked automatically later on.

Just to be sure, I count four patches now:

 - 1 from you regarding keep_config chip detection and DMA support
(which is *not* the one this thread refers to, you sent an amended
version to me privately, and it might make sense to split this patch
again)
 - 1 from me for the blank page ECC issue
 - 2 from Alex Lin (one for removal of unused variable, one plugs a memory =
leak)


Thanks,
Daniel
