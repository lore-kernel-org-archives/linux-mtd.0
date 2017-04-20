Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d1CUE-0003Ui-Ax
 for linux-mtd@lists.infradead.org; Thu, 20 Apr 2017 13:51:08 +0000
Subject: Re: Regarding UBI fastmap data CRC failure
To: Ronak Desai <ronak.desai@rockwellcollins.com>
References: <CADFuHZ6xb=M_zRkktnq2b8QBOhq-WDsqgzViPHU1g8Gj9M3E-g@mail.gmail.com>
 <CAFLxGvx6S8V7c8YYR2-G7+hDDcRi-0Cnk+EWeWWN9i2oy-DVvQ@mail.gmail.com>
 <CADFuHZ54cG32S1-3PA5q_5P1od1rBa5=3YeB1jLhB+Jzm2f0Ng@mail.gmail.com>
 <c9b139cc-7bf0-836d-69cf-4889a6c35ec2@nod.at>
 <CADFuHZ6oRRKFnbvJqQDywaLO=P=WR+q33AAve=y5AmdVkeUKPQ@mail.gmail.com>
 <CADFuHZ7PC8AOeS6ojiPZD_6OCteCF32igpjTzYdpWff56LofeQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <000fc3ef-ceb3-e550-f752-a7601863ea11@nod.at>
Date: Thu, 20 Apr 2017 15:50:42 +0200
MIME-Version: 1.0
In-Reply-To: <CADFuHZ7PC8AOeS6ojiPZD_6OCteCF32igpjTzYdpWff56LofeQ@mail.gmail.com>
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

Ronak Desai,

Am 19.04.2017 um 17:10 schrieb Ronak Desai:
>> I need to perform more testing to finalize the changes though. I
>> appreciate your time for answering my questions.
> 
> So, I confirm that after doing a regression with back-ported UBI
> subsystem I don't see this issue anymore on kernel 3.12.

Good! :-)

> Also, I wanted to test whether the wear leveling is working correctly
> or not. Is there any tests/utility which I can cross compile and run
> to test these algorithms ?

You can lower the wear levelling threshold and observe
/sys/class/ubi/ubiX/max_ec.

Thanks,
//richard
