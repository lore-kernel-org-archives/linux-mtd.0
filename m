Received: from rv-out-0910.google.com ([209.85.198.186])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IV1xn-0008Ei-Kd
	for linux-mtd@lists.infradead.org; Tue, 11 Sep 2007 05:23:22 -0400
Received: by rv-out-0910.google.com with SMTP id c24so1322786rvf
	for <linux-mtd@lists.infradead.org>;
	Tue, 11 Sep 2007 02:23:18 -0700 (PDT)
Message-ID: <49eab5c80709110223k525104f5ke965b190f16f634f@mail.gmail.com>
Date: Tue, 11 Sep 2007 17:23:17 +0800
From: "falls huang" <falls.huang@gmail.com>
To: "Wanghao.Yu@infineon.com" <Wanghao.Yu@infineon.com>
Subject: Re: How to use MTD util: nandwrite
In-Reply-To: <BA6FCA7F70D9FD43B88BFB2DD4E6EB7701136E41@xiyse301.ap.infineon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <BA6FCA7F70D9FD43B88BFB2DD4E6EB7701136E41@xiyse301.ap.infineon.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Yu Wanghao!

   It's seemed that you made a low level mistake.

   Plz read the the nandwrite's usage and code carefully:  "Usage:
nandwrite [OPTION] MTD_DEVICE INPUTFILE" ,  but your command is :
"nandwrite /tmp/hello /dev/mtd0 ."

   RTFM !

2007/9/11, Wanghao.Yu@infineon.com <Wanghao.Yu@infineon.com>:
> Hi,
> I met a problem when I used nandwrite to copy file to NandFlash.
> The command I used is as follows.
> #nandwrite /tmp/hello /dev/mtd0 (copy file named hello to /dev/mtd0)
> The error message is
> MEMGETINFO: Inappropriate ioctl for device.
> Before using nandwrite, I have already used "flash_eraseall -j /dev/mtd0" to erase the NandFlash.
> I don't know where the problem is.
> Could anyone help me?
>
> Best Regards,
>
> Yu Wanghao (Helen)
> Component Verification
> COM IFCX CV
> Infineon Technologies
> CV Lab,F3, Block A, No.38, Gaoxin 6th Road,
> Xi'an High-tech Industries Development Zone,
> Xi'an,  P.R.China 710075
> Tel.    +86 29 8832 8222 ext 8513
> Fax     +86 29 8831 7279
> mailto:wanghao.yu@infineon.com
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>


-- 
Regards
Falls Huang
