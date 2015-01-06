Received: from mail-lb0-x22e.google.com ([2a00:1450:4010:c04::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8TcV-00063y-Ql
 for linux-mtd@lists.infradead.org; Tue, 06 Jan 2015 12:52:24 +0000
Received: by mail-lb0-f174.google.com with SMTP id 10so19334126lbg.19
 for <linux-mtd@lists.infradead.org>; Tue, 06 Jan 2015 04:52:00 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20150106064931.GB13447@norris-Latitude-E6410>
References: <1417814086-30512-1-git-send-email-festevam@gmail.com>
 <20150106064931.GB13447@norris-Latitude-E6410>
Date: Tue, 6 Jan 2015 10:52:00 -0200
Message-ID: <CAOMZO5B7=zgxUU1RGm_YpfGU4yBGD529DogeoGYa-CX4yPv8hA@mail.gmail.com>
Subject: Re: [PATCH] mtd: fsl-quadspi: Fix module unbound
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>,
 Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Frank Li <Frank.Li@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 6, 2015 at 4:49 AM, Brian Norris
<computersforpeace@gmail.com> wrote:

> Huh? Why was this property even needed in the first place? It seems
> oddly specific, without actually being very explanatory/descriptive.

Huang, care to comment as you were the one that added it?

>
>> -             has_second_chip = true;
>> +             q->has_second_chip = true;
>>
>>       /* iterate the subnodes. */
>>       for_each_available_child_of_node(dev->of_node, np) {
>>               char modalias[40];
>>
>>               /* skip the holes */
>> -             if (!has_second_chip)
>> +             if (!q->has_second_chip)
>>                       i *= 2;
>
> Why do you need to "skip" anything here? It doesn't really look like
> you're skpping anything functionally, as this indexing is purely
> artificial. So you're just jumping through hoops for no reason.
>
> Can this just be more straightforward by dropping 'has_second_chip' and
> indexing straightforwardly? e.g. this patch:

With your proposed patch I get probe failure:

root@freescale /$ dmesg | grep qspi
[    1.688344] fsl-quadspi 21e4000.qspi: s25fl128s (16384 Kbytes)
[    1.698146] fsl-quadspi 21e4000.qspi: unrecognized JEDEC id bytes: ff, ff, ff
[    1.705350] fsl-quadspi 21e4000.qspi: Freescale QuadSPI probe failed
