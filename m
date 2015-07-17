Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZFzbw-0002Ee-A4
 for linux-mtd@lists.infradead.org; Fri, 17 Jul 2015 06:59:09 +0000
Subject: Re: UBIFS: recovery of master node
To: Richard Weinberger <richard.weinberger@gmail.com>
References: <55A7B004.2090705@dave-tech.it>
 <CAFLxGvxgKeKq1_cLNG9rS53NDT=OZsO9h6cizBnkU5Zv69EwSQ@mail.gmail.com>
Cc: mtd_mailinglist <linux-mtd@lists.infradead.org>
From: Andrea Scian <rnd4@dave-tech.it>
Message-ID: <55A8A7A4.906@dave-tech.it>
Date: Fri, 17 Jul 2015 08:58:44 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxgKeKq1_cLNG9rS53NDT=OZsO9h6cizBnkU5Zv69EwSQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Il 16/07/2015 17:29, Richard Weinberger ha scritto:
> Andrea,
>
> On Thu, Jul 16, 2015 at 3:22 PM, Andrea Scian <rnd4@dave-tech.it> wrote:
>>
>> If I bypass that check too, I can mount UBIFS and everything inside the FS
>> is there but, of course, I'm sure I'm doing something that may be wrong..
>>
>> WDYT?
>
> So, you're facing bitflips on empty space?

Another UBI/UBIFS "implementation" question: are there some other 
places, apart from get_master_node(), where UBIFS check empty space 
corruption and fails badly if something wrong?

TIA,

-- 

Andrea SCIAN

DAVE Embedded Systems
