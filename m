Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T9YjN-0000Rf-Cn
 for linux-mtd@lists.infradead.org; Thu, 06 Sep 2012 09:50:38 +0000
Received: by eaai12 with SMTP id i12so483153eaa.36
 for <linux-mtd@lists.infradead.org>; Thu, 06 Sep 2012 02:50:33 -0700 (PDT)
Message-ID: <504871AF.7040809@gmail.com>
Date: Thu, 06 Sep 2012 11:49:35 +0200
From: =?UTF-8?B?R2HDq3RhbiBDYXJsaWVy?= <gcembed@gmail.com>
MIME-Version: 1.0
To: javier Martin <javier.martin@vista-silicon.com>
Subject: Re: [1/1] mxc_nand : allow swapping the Bad block Indicator for NFC
 v1.
References: <CACKLOr0zCCZ0WNpGiOOvoUk4s_vR5Ls4aw6PhXDoYeNQFTESgQ@mail.gmail.com>
In-Reply-To: <CACKLOr0zCCZ0WNpGiOOvoUk4s_vR5Ls4aw6PhXDoYeNQFTESgQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Javier,
On 09/06/2012 11:14 AM, javier Martin wrote:
> Hi Gaëtan,
> has this behavior been documented by Freescale anywhere?
It is not documented but this value come from patch for RedBoot (eCos) 
provided by Freescale :
ecos_20050912.tar.gz + redboot_mx27pdk.zip (that includes 
patch-redboot-200840-base.bz2, patch-redboot-200840-mx27.bz2 and 
patch-redboot-200840-mx27pdk.bz2).
I don't have official document. I learned this bug at a training and 
they said : Check the box "BI SWAP" in Freescale Advanced Toolkit and 
that's it.
The sources of kernel 2.6.22 that gave us also have this bugfix in patch.
That is all that I know/have.
>
> I understand that the 0x835 offset is the offset meant for BI in the
> real spare area for 8 bit NANDs. However, this value is not correct
> for 16 bits. It should be 0x83A instead [1].
Have I to add a Test on the width of the bus of current NAND ?
>
> Furthermore, what I can't guess is where that 0x7D0 comes from. I know
> Jürgen described something related to the spare area being mixed with
> the data (main) area but, is there any documentation about it we can
> check?
In the ecos patch, there is the patch
#define NAND_MAIN_BUF3                  (NFC_BASE + 0x600)
#define NAND_SPAR_BUF3                  (NFC_BASE + 0x830)
// read column 464-465 byte but only 464 for bad block marker^M
#define BAD_BLK_MARKER_464          (NAND_MAIN_BUF3 + 464)^M
// read column 4-5 byte, but only 5 is used for swapped main area data^M
#define BAD_BLK_MARKER_SP_5         (NAND_SPAR_BUF3 + 4)^M

>
> Regards.
>
> [1] page 704, Freescale, i.MX27 Reference Manual, Rev. 0.4, 06/2012.
> [2] http://lists.infradead.org/pipermail/linux-mtd/2011-July/036885.html
>
Juergen Beisert have sent an email few minutes earlier about this patch. 
I still have to read it.
Regards,
Gaëtan Carlier.
