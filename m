Received: from mail-pb0-x22b.google.com ([2607:f8b0:400e:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtXq9-0000on-4B
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 06:43:57 +0000
Received: by mail-pb0-f43.google.com with SMTP id md12so4415859pbc.30
 for <linux-mtd@lists.infradead.org>; Sun, 30 Jun 2013 23:43:34 -0700 (PDT)
Message-ID: <51D12513.6030202@gmail.com>
Date: Sun, 30 Jun 2013 23:43:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] mtd: chips: Add support for PMC SPI Flash chips in
 m25p80.c
References: <1368195520.26780.169.camel@sauron.fi.intel.com>
 <518D6138.2090009@wanadoo.fr> <1368425690.3208.14.camel@sauron.fi.intel.com>
 <1372660963.22014.21.camel@sauron.fi.intel.com>
In-Reply-To: <1372660963.22014.21.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Michel Stempin <michel.stempin@wanadoo.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/30/2013 11:42 PM, Artem Bityutskiy wrote:
> On Mon, 2013-05-13 at 09:14 +0300, Artem Bityutskiy wrote:
>> On Fri, 2013-05-10 at 23:06 +0200, Michel Stempin wrote:
>>>      Add support for PMC (now Chingis, part of ISSI) Pm25LV512 (512 kBbit), Pm25LV010 (1 Mbit) (see datasheet http://www.geocities.jp/scottle556/pdf/Pm25LV512-010.pdf) and Pm25LQ032 (32 Mbit) (datasheet:http://www.
>>>
>>>      This patch is resent in order to take into account this upstream patch:
>>>
>>>      commit e534ee4f9ca29fdb38eea4b0c53f2154fbd8c1ee
>>>      Author: Krzysztof Mazur <krzysiek@podlesie.net>
>>>      Date:   Fri Feb 22 15:51:05 2013 +0100
>>
>> I think it would make sense if Brien gook a glimpse on this patch.
>
> Oh My god, I meant "Brian (Norris) took a glimpse" here...

Hey, don't take it too hard :)

Thanks for the humorous reminder. I'll try to take a look at this one 
tomorrow.

Brian
