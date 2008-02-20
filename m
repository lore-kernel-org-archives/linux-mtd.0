Received: from py-out-1112.google.com ([64.233.166.176])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JRwzE-0004Dw-1a
	for linux-mtd@lists.infradead.org; Wed, 20 Feb 2008 22:00:20 +0000
Received: by py-out-1112.google.com with SMTP id p76so4215254pyb.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Feb 2008 14:00:19 -0800 (PST)
Message-ID: <4ffb81490802201400j2ae2fd61l227345968b32281@mail.gmail.com>
Date: Wed, 20 Feb 2008 17:00:18 -0500
From: "Ken Chan" <ken8804@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: MTD - NAND (Micron MT29F16G08)
In-Reply-To: <Pine.LNX.4.64.0802201723410.3508@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4ffb81490802200607n3d5f6ad5h12f4a53399a32466@mail.gmail.com>
	<Pine.LNX.4.64.0802201723410.3508@lnxricardw.se.axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Just a guess here, does it matter that the exact oob size is not
> supported? As long as there are enough bytes for what is needed (bad block
> indicator, ECC data, and jffs2 cleanmarkers if using jffs2 filesystem) it
> might not matter what the exact size is. Most flashes support reading and
> writing less than a full page or oob.
>

I tried to use "oob_64" and format the NAND Flash to use jffs2 filesystem.
The format part went well.  It detected a few bad sectors.....
After the format finished, I tried to do "mount -t jffs2
/dev/mtdblock8 /nand" but I got
the following exception error message:

sh-2.05b# mount -t jffs2 /dev/mtdblock8 /nand

[  617.996658] Oops: kernel access of bad area, sig: 11 [#1]
[  618.019446] NIP: FFFFFFFC LR: FFFFFFFF CTR: 00000000
[  618.049179] REGS: cb615b00 TRAP: 0400   Not tainted  (2.6.16.1)
[  618.084642] MSR: 00029200 <EE,ME>  CR: 28004482  XER: 20000000

ken



On Wed, Feb 20, 2008 at 11:25 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
>
> On Wed, 20 Feb 2008, Ken Chan wrote:
>
> > Hi,
> > I am trying to get my NAND Flash (Micron MT29F16G08 -- 2 GBytes NAND) going.
> > Based on the data sheet, the page size is 4KB, the Spare area size (i.e.
> > OOB) is 218 Bytes, the Block size is 512KB.
> > I am using Linux Kernel 2.6.16 and it does not support this NAND Flash
> > because of the OOB is 218 Bytes.
> > I checked the Linux Kernel (2.6.24) and same thing applied.
> >
> > Here are my questions:
> > 1) How can I build a data structure "struct nand_oobinfo nand_oob_218"?
> > What shall I put for those eccpos[]?
> > 2) If I don't want to create that new data structure, what is the
> > alternative method to bring up that NAND Flash?
> > 3) Do anyone have similar problem using that kind of NAND Flash?
>
