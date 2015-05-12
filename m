Received: from mail-wi0-f176.google.com ([209.85.212.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YsDar-0001vw-8C
 for linux-mtd@lists.infradead.org; Tue, 12 May 2015 17:03:46 +0000
Received: by wief7 with SMTP id f7so117154410wie.0
 for <linux-mtd@lists.infradead.org>; Tue, 12 May 2015 10:03:23 -0700 (PDT)
Message-ID: <5552319E.4010308@vanguardiasur.com.ar>
Date: Tue, 12 May 2015 14:00:14 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: "a.lombardinilo" <a.lombardinilo@sintau.it>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
Subject: Re: pxa3xx_nand and ECC 8 bit mode
References: <NO8WXS$26BAD26DC922DA6D3BBBBB5C64C24D37@sintau.it>
In-Reply-To: <NO8WXS$26BAD26DC922DA6D3BBBBB5C64C24D37@sintau.it>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ccing Boris, Antoine, and the MTD folks.

On 05/12/2015 01:39 PM, a.lombardinilo wrote:
> Hi Ezequiel,
> 
> first of all I apologize for this: I wanted to write on mailng list, but
> I did not understand how.
> 
> I have a custom board based on armada 370 processor (mv88F6710) and
> Micron MT29F8G08ABACAWP in 8BIT mode.
> 
> I use u-boot from Marvell version: v2011.12 2014_T2.0p1 and linux-3.18.11.
> 
> The Bad Block Table written by u-boot is not readed from the kernel and
> vice versa.
> If I set a 4 bit ECC, the BBT is readed, but warning is displayed:
> "the ECC used on your system is too weaj compared to the one required by
> the NAND chip"
> 
> Basically I think there is a bug/unsupported features in the pxa3xx_nand
> driver.
> 

It seems the bootloader and kernel ECC setup is mismatching. You can
either do:

*) update your bootloader to match the kernel ECC setup, and the flash
requirement.

*) use the weaker ECC setup, and live a life of danger :)

> Can you help me to fix it or show me how to get support from the mailing
> list
> 

I just did the latter.

-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
