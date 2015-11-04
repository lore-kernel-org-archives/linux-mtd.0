Received: from mx0b-00176a03.pphosted.com ([67.231.157.48])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu0sG-0005Uc-Qe
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 16:25:25 +0000
Received: from pps.filterd (m0048206.ppops.net [127.0.0.1])
 by m0048206.ppops.net-00176a03. (8.15.0.59/8.15.0.59) with SMTP id
 tA4GNVgI011685
 for <linux-mtd@lists.infradead.org>; Wed, 4 Nov 2015 11:25:03 -0500
Received: from cinmlip13.e2k.ad.ge.com ([12.71.149.1])
 by m0048206.ppops.net-00176a03. with ESMTP id 1xvs3847f8-12
 (version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
 for <linux-mtd@lists.infradead.org>; Wed, 04 Nov 2015 11:25:03 -0500
Subject: Re: nand_flash_detect_onfi error
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
References: <5638E074.5070800@ge.com>
 <CAAEAJfAjs0k26QumQdDzHeMGAM2s=xJw4E8N+yhs5GMCFkK=Aw@mail.gmail.com>
 <20151103212546.0184eaf6@bbrezillon>
 <CAAEAJfD3_TW4C6p7XU4bWrWxrhg4YRf-YK2QZu_vT3d7uwS4mw@mail.gmail.com>
 <20151103221812.013b5cc0@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Renaud Barbier <renaud.barbier@ge.com>
Message-ID: <563A3155.9010306@ge.com>
Date: Wed, 4 Nov 2015 16:24:53 +0000
MIME-Version: 1.0
In-Reply-To: <20151103221812.013b5cc0@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/11/2015 21:18, Boris Brezillon wrote:
> On Tue, 3 Nov 2015 17:59:01 -0300
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
> 
>> On 3 November 2015 at 17:25, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>> [..]
>>>
>>> Hm, sorry but I don't like this idea. ->cmdfunc() is not supposed to
>>> retrieve any data before ->read_xxx() is called. I know some
>>> controllers retrieve data ahead of time and then provide the previously
>>> stored data when ->read_buf() is called, but that's not a good practice
>>> to assume it will work this way on all controllers (actually I keep
>>> thinking the sane implementations are those waiting for the
>>> ->read_buf() call before starting retrieving the data from the NAND
>>> chip).
>>>
>>
>> Right. We've discussed this in the past, and although I don't recall
>> the details,
>> I recall you were right.
>>
>> In any case, I just wanted to mention that if Renaud is getting
>> a read beyond the buffer, then probably the driver needs fixing.
>>
> 
> My bad, I thought the "read beyond the buffer" thing mentioned by
> Renaud was something generic. Now I get your point, and I agree: it
> should be fixed in the NAND controller driver, either by increasing the
> read buffer or by reworking the implementation to delay data retrieval
> until ->read_buf() is called.
> 

My CPU is a Freescale P1014 supported by the driver
drivers/mtd/nand/fsl_ifc_nand.c. Based on your information it seems the
easiest path is to set the "read_bytes" count to 3 * 256 and program the
controller to use this byte count when the CMD_PARAM command is used.

Cheers.
