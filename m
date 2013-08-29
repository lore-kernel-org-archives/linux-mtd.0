Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VEyFC-0004xT-S5
 for linux-mtd@lists.infradead.org; Thu, 29 Aug 2013 09:10:23 +0000
Received: by mail-pa0-f50.google.com with SMTP id fb10so656239pad.37
 for <linux-mtd@lists.infradead.org>; Thu, 29 Aug 2013 02:09:59 -0700 (PDT)
Message-ID: <521F0FE4.90709@gmail.com>
Date: Thu, 29 Aug 2013 02:09:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: m68k: io{read,write} accessors
References: <CAN8TOE9WRQ0A=1nYiOMmanX+BbxwDDv_0TgKpMyiPD0-8AA2nw@mail.gmail.com>
 <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
In-Reply-To: <CAMuHMdXdS5j==sOoj3WKkTsjzMwWHZDEhYMSXNDErpB82xT=+w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-m68k <linux-m68k@lists.linux-m68k.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Alexander Shiyan <shc_work@mail.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/29/2013 01:15 AM, Geert Uytterhoeven wrote:
> On Wed, Aug 28, 2013 at 8:36 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
>> It appears that m68k doesn't properly define the io{read,write}
>> functions. I get complaints like this from my compile testing:
>>
>> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf':
>> drivers/mtd/nand/nand_base.c:216:2: error: implicit declaration of
>> function 'iowrite8_rep' [-Werror=implicit-function-declaration]
>> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf':
>> drivers/mtd/nand/nand_base.c:231:2: error: implicit declaration of
>> function 'ioread8_rep' [-Werror=implicit-function-declaration]
>> drivers/mtd/nand/nand_base.c: In function 'nand_write_buf16':
>> drivers/mtd/nand/nand_base.c:247:2: error: implicit declaration of
>> function 'iowrite16_rep' [-Werror=implicit-function-declaration]
>> drivers/mtd/nand/nand_base.c: In function 'nand_read_buf16':
>> drivers/mtd/nand/nand_base.c:263:2: error: implicit declaration of
>> function 'ioread16_rep' [-Werror=implicit-function-declaration]
>
> This is a nommu config?
> If CONFIG_MMU=y,  GENERIC_IOMAP=y and iowrite8_rep() is available.

Right, CONFIG_MMU=n.

Brian
