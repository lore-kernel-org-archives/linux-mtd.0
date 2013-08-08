Received: from mail-pa0-x22f.google.com ([2607:f8b0:400e:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7V6u-0006K7-Je
 for linux-mtd@lists.infradead.org; Thu, 08 Aug 2013 18:38:57 +0000
Received: by mail-pa0-f47.google.com with SMTP id kl13so3875849pab.34
 for <linux-mtd@lists.infradead.org>; Thu, 08 Aug 2013 11:38:34 -0700 (PDT)
Message-ID: <5203E5A7.7060108@gmail.com>
Date: Thu, 08 Aug 2013 11:38:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH V3 1/3] mtd: add new fields to nand_flash_dev{}
References: <1359349039-11510-1-git-send-email-b32955@freescale.com>				
 <1359349039-11510-2-git-send-email-b32955@freescale.com>				
 <1360684037.12703.117.camel@sauron.fi.intel.com>				
 <CAMiH66ExMK8rPMw3kvs9M2b-0ZSkfxBYteTi8QTZf+XCzJw5Dw@mail.gmail.com>			
 <1362234094.2745.9.camel@sauron> <513437DF.2030505@freescale.com>		
 <1362383434.2943.5.camel@sauron> <5134566C.2090405@freescale.com>	
 <1362385446.2943.7.camel@sauron> <51345DFA.7070601@freescale.com>
 <1362386776.2943.11.camel@sauron> <51346287.9010801@freescale.com>
In-Reply-To: <51346287.9010801@freescale.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: dwmw2@infradead.org, Huang Shijie <shijie8@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

For some reason, I just noticed your question here. But I think it's 
important to answer.

On 03/04/2013 12:59 AM, Huang Shijie wrote:
> 于 2013年03月04日 16:46, Artem Bityutskiy 写道:
>> Thanks, I forgot we have this great table. BTW, please, do not forget to
>> update it with information about these 4 chip you are adding,
>> irrespective of the solution we end up with.
> I also want to update the table, but i do not know how to do it.

You can submit a patch against mtd-www.git. See:

http://www.linux-mtd.infradead.org/faq/general.html#L_mtdwww

You just need to edit the CSV table under nand-data/nanddata.csv.

Brian
