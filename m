Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y68fP-0001Rk-7c
 for linux-mtd@lists.infradead.org; Wed, 31 Dec 2014 02:05:44 +0000
Message-ID: <54A359AE.3080105@atmel.com>
Date: Wed, 31 Dec 2014 10:04:30 +0800
From: Josh Wu <josh.wu@atmel.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: Does UBIFS NAND ECC info get stored in OOB?
References: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>
In-Reply-To: <CALupW3Dv=OvY-5y_ScG1St8HUBYfXYpTnYAWDt_GJ+3+7KmC9Q@mail.gmail.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Steve

On 12/31/2014 3:44 AM, Steve deRosier wrote:
>   Hi All,
>
> Sorry if this is a stupid question, but I found a number of old
> archived messages that explicitly state that UBIFS (actually, probably
> UBI) doesn't utilize the OOB of a NAND flash at all for storing the
> ECC information.
Could you list out these UBI/UBIFS messages so that people can help?

> And as near as I can tell from behavior and code, it
> does certainly store ECC info in the OOB area.
>
> So, does UBIFS utilize the OOB area to store ECC bits?  And if not,
> where/how does it store this information?
>
> I'm starting to assume that you're simply saying that UBIFS itself
> doesn't use the OOB area, nor even handles the ECC itself, but that's
> up to the chip driver layer. And that the driver will handle the ECC
> and OOB as appropriate.  Am I correct?
yes. I think you are correct.

>
> Details of my question:
>
> We're having some trouble with filesystem corruption on a Linux 3.8
> kernel based on an Atmel SAM9g25 controller.  The controller does have
> the PMECC unit.

Does your system can boot up correctly and work sometime? or you cannot 
mount your UBI filesystem at all?
Could get me a system boot log about your corruption, and another boot 
log without corruption?
>
> It utilizes the mtd/nand/atmel_nand.c driver. This driver has the
> PMECC bits in it and does appear to write/read/correct-via ECC bits in
> the OOB area of the NAND.
>
> We're using UBIFS for our rootfs.
>
> And yes, I understand the 3.8 kernel is old, and we're upgrading, but
> I'm trying to figure out why we're having the problems as I'm assuming
> it's not a bug in the code but more of a configuration or process or
> hardware issu
So could give me some configuration about your PMECC?
4 bits correction in 512 bytes or else? What is your nand flash ecc 
minimal requirement?

Best Regards,
Josh Wu

>
> One example of finding that UBI & UBIFS doesn't use the OOB area is "
> this is not a problem for UBI/UBIFS, because neither UBIFS nor UBI use
> OOB area;" from http://www.linux-mtd.infradead.org/doc/ubifs.html
>
> Thanks any help,
> - Steve
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
