Received: from nz-out-0506.google.com ([64.233.162.227])
	by bombadil.infradead.org with esmtp (Exim 4.66 #1 (Red Hat Linux))
	id 1IpLox-0006Qy-W4
	for linux-mtd@lists.infradead.org; Tue, 06 Nov 2007 05:38:18 -0500
Received: by nz-out-0506.google.com with SMTP id z3so1198227nzf
	for <linux-mtd@lists.infradead.org>;
	Tue, 06 Nov 2007 02:38:08 -0800 (PST)
Message-ID: <8bf247760711060238q46c0c98es57a63e1683648a92@mail.gmail.com>
Date: Tue, 6 Nov 2007 16:08:07 +0530
From: Ram <vshrirama@gmail.com>
To: Sameer <x0081444@ti.com>
Subject: Re: NAND driver - spare area ecc
In-Reply-To: <004401c81470$c128fa40$ec8818ac@ent.ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <AcgUcMB7cv/FBkWTQ66Eo6zxYVoOUQ==>
	<004401c81470$c128fa40$ec8818ac@ent.ti.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/22/07, Sameer <x0081444@ti.com> wrote:
> Hi,
> I am working on NAND flash driver on TI's OMAP based board.
> NAND is large page nand with 8bit buswidth.
> I need to calculate ecc for the spare area data.
> 1.Does the current linux nand driver support ecc calulation for spare area
>   with hw_ecc/sw_ecc enabled?

     It depends on the driver. which processor are you using?. You
could either use
    software to generate ecc or use the hardware to generate the ecc.


> 2.If not could any one suggest on what data of the spare area info I need to
>   calculate ECC?

     ECC is computed for the data that is stored in that particular
page of the flash.
     ECC and other information like bad block is stored in the spare area.





Regards,
sriram

>
> I am a begineer working on MTD driver. Please provide your
> Valuable comments.
>
>
> Regards,
> -Sameer
>
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
