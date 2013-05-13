Received: from mo6-p05-ob.rzone.de ([2a01:238:20a:202:5305::1])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uboy0-0008WO-TI
 for linux-mtd@lists.infradead.org; Mon, 13 May 2013 09:22:50 +0000
Message-ID: <5190B0C9.5000006@denx.de>
Date: Mon, 13 May 2013 11:22:17 +0200
From: Stefan Roese <sr@denx.de>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: mtd_oobtest fails with GPMI-NAND
References: <50F97DB5.7040801@gmail.com> <50FCA426.6030309@freescale.com>
 <5105E4CE.1090800@gmail.com> <5105EE9B.9050405@freescale.com>
 <5106AFAA.1020502@gmail.com> <51072EA4.7000201@freescale.com>
 <51073373.4080006@gmail.com> <510735B3.1040509@freescale.com>
 <5107F899.5090506@gmail.com> <5108852C.5040002@freescale.com>
 <510CB507.4020105@gmail.com> <518A6228.6050608@denx.de>
 <518B96FC.6000806@gmail.com> <518C91AA.8040107@denx.de>
 <5190551A.5010400@freescale.com> <51909DF1.4060201@denx.de>
 <5190ABF0.10501@freescale.com>
In-Reply-To: <5190ABF0.10501@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Vikram Narayanan <vikram186@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/13/2013 11:01 AM, Huang Shijie wrote:
>> Please correct me if I'm wrong, but from my understanding the Linux GPMI
>> NAND driver configures the timings. So this is not board platform code
>> related but NAND driver related.
>>
>> Do you have any hints where to "tune/change" some values (timing or
>> signal related) to fix this error?
>>
> Please check the schematic, is there some pin conflict with the gpmi-nand?
> What's the pad value for these pins? You can take a reference with 
> current dts file.

We're currently using the same values as in imx6q-sabresd.dts. With this
addition:

+	soc {
+		nfc: gpmi-nand@00112000 {
+			status = "enabled";
+		};
+	};

to enable NAND support. So the pin muxing from imx6q.dtsi (gpmi-nand-1)
is used (which is what is also connected physically). Again, I don't
think that pin-muxing is our problem here.

>>> The key issue (i want to emphosis ) is that the current gpmi-nand does
>>> not support the
>>> subpage operations.
>> Yes. And this is disabled via setting NAND_NO_SUBPAGE_WRITE in the
>> options variable in the GPMI NAND driver.
>>
>> BTW: I just tested with the "mtd_nandbiterrs" test. This fails directly.
>> I would have expected the ECC to being able to at least correct the
>> errors for some loops:
>>
>> # insmod mtd_nandbiterrs.ko dev=3 mode=0

<snip>

>> Huang, is this to be expected? How does this look on one of your
>> officially "supported" imx6 boards with NAND support?
>>
> I suggest you do not use the mtd_nandbiterrs.ko. It will call the 
> mtd_write_oob() which will definitely lead to the
> -EBADMSG (-74) error.
> 
> The mtd_write_oob() in mtd_nandbiterrs.ko writes a whole page without 
> enabling the BCH to do the hardware ECC.
> But mtd_read() in mtd_nandbiterrs.ko DOES do the hardware ECC by the BCH.
> It's normal that you meet -74.

Okay. Thanks for the explanation.

> You can use the mtd_torturetest, such as:
> 
> #insmod mtd_torturetest.ko dev=3 check=1 cycles_count=1 eb=0 ebcnt=4 gran=1

Done. But no errors in this test though. Even with increasing the
cycles_count. I don't want to destroy this chip, so I'm not increasing
the cycles too much.

Which NAND devices did you test with on imx6? Did you also tests with a
"similar" Micron ONFI chip as this one (MT29F4G08ABADAH4)?

>> SLC. Why do you ask?
> For the MLC, if you write the OOB, it will impacts other part of the 
> page. For some nands, you will meet a -74.
> that's another story.

Thanks,
Stefan
