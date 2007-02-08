Received: from smtp.nokia.com ([131.228.20.173] helo=mgw-ext14.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HFA1U-0002Pg-8V
	for linux-mtd@lists.infradead.org; Thu, 08 Feb 2007 09:13:19 -0500
Received: from esebh106.NOE.Nokia.com (esebh106.ntc.nokia.com [172.21.138.213])
	by mgw-ext14.nokia.com (Switch-3.2.5/Switch-3.2.5) with ESMTP id
	l18EA3MY007023
	for <linux-mtd@lists.infradead.org>; Thu, 8 Feb 2007 16:10:04 +0200
Message-ID: <45CB2FAC.5020107@nokia.com>
Date: Thu, 08 Feb 2007 16:11:56 +0200
From: Adrian Hunter <ext-adrian.hunter@nokia.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
References: <45C2EE39.7050909@nokia.com>
	<003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C6DB35.3040106@nokia.com>
	<003d01c748f9$705677c0$c7a3580a@swcenter.sec.samsung.co.kr>
	<1170664239.3628.64.camel@sauron>
	<005a01c74994$b5f5c9c0$c7a3580a@swcenter.sec.samsung.co.kr>
In-Reply-To: <005a01c74994$b5f5c9c0$c7a3580a@swcenter.sec.samsung.co.kr>
Content-Type: text/plain; charset=EUC-KR
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

ext Kyungmin Park wrote:
> BTW, after patch, we got dead code.
> I downloaded oobtest again, re-run it and see that it trigger exception
> code in onenand_do_write_oob
> But it don't touch following codes whether include your patch or not.
> 
>         /* Do not allow write past end of device */
>         if (unlikely(to >= mtd->size ||
>             column + len > ((mtd->size >> this->page_shift) -
>                                 (to >> this->page_shift)) * oobsize)) {
>                 DEBUG(MTD_DEBUG_LEVEL0, "onenand_write_oob: Attempted to
> write past end of device\n");
>                 return -EINVAL;
>         }
> 
> Please check oobtest program.
> 
> Thank you,
> Kyungmin Park
> 
> --
> 
> oobtest: Test 4 of 5
> oobtest: erasing
> oobtest: erased 0
> oobtest: erased 128
> oobtest: Attempting to start write past end of oob
> oobtest: An error is expected...
> oobtest: Error occurred as expected
> oobtest: Attempting to start read past end of oob
> oobtest: An error is expected...
> oobtest: Error occurred as expected
> oobtest: Attempting to write past end of device
> oobtest: An error is expected...
> -> onenand_write_oob: Attempt to write past end of page
> oobtest: Error occurred as expected
> oobtest: Attempting to read past end of device
> oobtest: An error is expected...
> oobtest: error: read past end of device
> oobtest: Attempting to write past end of device
> oobtest: An error is expected...
> -> onenand_write_oob: Attempt to write past end of page
> oobtest: Error occurred as expected
> oobtest: Attempting to read past end of device
> oobtest: An error is expected...
> oobtest: error: read past end of device
> 

Seems ok for me:

oobtest: Attempting to start write past end of oob
oobtest: An error is expected...
onenand_write_oob: Attempted to start write outside oob
oobtest: Error occurred as expected
oobtest: Attempting to start read past end of oob
oobtest: An error is expected...
onenand_read_oob: Attempted to start read outside oob
oobtest: Error occurred as expected
oobtest: Attempting to write past end of device
oobtest: An error is expected...
onenand_write_oob: Attempted to write past end of device
oobtest: Error occurred as expected
oobtest: Attempting to read past end of device
oobtest: An error is expected...
onenand_read_oob: Attempted to read beyond end of device
oobtest: Error occurred as expected
oobtest: Attempting to write past end of device
oobtest: An error is expected...
onenand_write_oob: Attempted to write past end of device
oobtest: Error occurred as expected
oobtest: Attempting to read past end of device
oobtest: An error is expected...
onenand_read_oob: Attempted to read beyond end of device
oobtest: Error occurred as expected
