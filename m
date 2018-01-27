Received: from smtp10.smtpout.orange.fr ([80.12.242.132]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1efNoB-0003tp-EA
 for linux-mtd@lists.infradead.org; Sat, 27 Jan 2018 10:34:05 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Miquel Raynal <miquel.raynal@free-electrons.com>
Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH v3 0/7] Marvell NAND controller rework with ->exec_op()
References: <20180109103637.23798-1-miquel.raynal@free-electrons.com>
 <20180111122751.4bd74366@bbrezillon> <87efmwb8bj.fsf@belgarion.home>
 <20180111232417.4aa86075@xps13> <87a7xjbis2.fsf@belgarion.home>
 <20180112094501.27706bfc@bbrezillon> <876087beui.fsf@belgarion.home>
 <20180112105228.176ab80f@bbrezillon> <87wp0majtg.fsf@belgarion.home>
 <20180113093807.3984c184@bbrezillon> <20180113120529.2f00ea20@xps13>
 <87o9lwaft9.fsf@belgarion.home> <20180122095149.590612d9@bbrezillon>
Date: Sat, 27 Jan 2018 11:33:47 +0100
In-Reply-To: <20180122095149.590612d9@bbrezillon> (Boris Brezillon's message
 of "Mon, 22 Jan 2018 09:51:49 +0100")
Message-ID: <87y3kj8ub8.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Hi Robert,
>
> On Sun, 14 Jan 2018 11:35:30 +0100
> Robert Jarzmik <robert.jarzmik@free.fr> wrote:
>
>> Miquel Raynal <miquel.raynal@free-electrons.com> writes:
>> 
>> >> It shouldn't be damaged anymore. The bug has been fixed just before we
>> >> asked you to scrub the BBT area.  
>> I confirm. The last marvell branch I have (2be03e113a5b ("HACK: Dump OOB data
>> while reading")) does work correctly on my zylonite.
>> 
>> I still have to make a test of a file write, and a devicetree based setup, but I
>> don't think anything wrong will happen now.
>
> Did you make any progress with that? Note that, no matter the outcome
> of your tests, I don't plan to queue the remaining patches for this
> release, so don't be afraid of putting your Tested-by/Acked-by on
> patches 5-6 if it works on your platforms ;-).

Hi Boris and Miquel,

I have done the write tests with my ubifs existing filesystem, it works.
Feel free to add to patches 5 and 6 my :

Tested-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
