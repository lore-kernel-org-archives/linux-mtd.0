Message-ID: <52663895.9040907@ti.com>
Date: Tue, 22 Oct 2013 14:04:29 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V2 0/4] mtd: gpmi: support two nand chips at most
References: <1377595747-21033-1-git-send-email-b32955@freescale.com>	<5260DA32.4090502@freescale.com>
 <CAN8TOE8xDdRF4Hf+p4JMAixWfkxkbKCZB-fqpPA6yiMHYm=Qew@mail.gmail.com>
 <5264A220.2070900@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA2910B@DBDE04.ent.ti.com>
 <5264E6A9.6070400@freescale.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA29221@DBDE04.ent.ti.com>
 <5266347A.6060000@freescale.com>
In-Reply-To: <5266347A.6060000@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, "Gupta, Pekon" <pekon@ti.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,
On Tuesday 22 October 2013 01:46 PM, Huang Shijie wrote:
> 于 2013年10月21日 17:02, Gupta, Pekon 写道:
>> If you already have done some work on m25p80.c then please see if
>> you can convert on above thoughts and post it. I'll review them and
>> add more stuff and cleanups.
> I will convert my code, and send out as soon as possible.
>
> thanks
> Huang Shijie
>
>
Did you get the chance to follow the three patch series which I had sent?
One of the patch modifies m25p80 to add support for spnasion and 
macronix quad read
support. If that looks cool also to you[1], we can push for that patch. 
So that, our further works
on m25p80 will be reduced.

[1]:  http://permalink.gmane.org/gmane.linux.drivers.mtd/48755
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
