Received: from mail-vc0-x234.google.com ([2607:f8b0:400c:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VpfaO-0003TH-VG
 for linux-mtd@lists.infradead.org; Sun, 08 Dec 2013 14:43:58 +0000
Received: by mail-vc0-f180.google.com with SMTP id if17so2527267vcb.25
 for <linux-mtd@lists.infradead.org>; Sun, 08 Dec 2013 06:43:33 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1885453.87ds9Vg2nc@leonp.plris.com>
References: <1885453.87ds9Vg2nc@leonp.plris.com>
Date: Sun, 8 Dec 2013 15:43:33 +0100
Message-ID: <CAFLxGvyvB_tTsVm1j6H26W+its4+ko8Ug5vmSBk0zRp-t3HGuw@mail.gmail.com>
Subject: Re: Erase error does not mark smth in BBT
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Leon Pollak <leonp@plris.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 8, 2013 at 10:51 AM, Leon Pollak <leonp@plris.com> wrote:
> Hello, all.
>
> I am studying the code in nand_base.c
> I thought that when erase command ends with an error, the corresponding
> block will be marked as bad or in OOB or in BBT or in both.
> I think I walked through the code carefully, but did not find this
> BBT/OOB treatment.
>
> Please, help me - where is my error?

You're looking at the wrong layer. :-)
Look at the users of mtd_block_markbad().

-- 
Thanks,
//richard
