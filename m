Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRcQL-0002Fr-Uy
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 08:39:14 +0000
Received: from localhost (localhost [127.0.0.1])
 by arrakis.dune.hu (Postfix) with ESMTP id 85C9628BC8B
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 10:37:55 +0200 (CEST)
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
 [209.85.215.49])
 by arrakis.dune.hu (Postfix) with ESMTPSA id 78ED128BC3A
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 10:37:50 +0200 (CEST)
Received: by lagz9 with SMTP id z9so94731576lag.3
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 01:38:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150818013019.GB17499@localhost>
References: <1439785625-36183-1-git-send-email-B48286@freescale.com>
 <CAOiHx=mFoke2sTQGsjyNF+k8DFq4GAt9AgU8ednxn5Kx4R7SNw@mail.gmail.com>
 <20150818013019.GB17499@localhost>
From: Jonas Gorski <jogo@openwrt.org>
Date: Tue, 18 Aug 2015 10:38:16 +0200
Message-ID: <CAOiHx=kuYf24CerQ_F7HCS8f6cwshzti8hHYiUfZNqQhCp6QvA@mail.gmail.com>
Subject: Re: [PATCH V6] mtd: m25p80: Modify the name of mtd_info
To: Brian Norris <computersforpeace@gmail.com>
Cc: "Rafa?? Mi??ecki" <zajec5@gmail.com>, Zhiqiang Hou <B48286@freescale.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, mike@steroidmicros.com,
 Mingkai.Hu@freescale.com, David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 18, 2015 at 3:30 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> On Mon, Aug 17, 2015 at 06:27:36PM +0200, Jonas Gorski wrote:
>> On Mon, Aug 17, 2015 at 6:27 AM, Zhiqiang Hou <B48286@freescale.com> wrote:
>> > From: Hou Zhiqiang <B48286@freescale.com>
>> >
>> > Set the mtd_info's name to a fixed one, so spi flash layouts can
>> > be specified by "mtdparts=..." in kernel cmdline, because the
>> > cmdlinepart's parser will match the name of mtd_info with the name
>> > given in cmdline.
>> >
>> > So far, if DT is used, the mtd_info's name will be set to the name
>> > of spi->dev. It includes spi_master->bus_num, and the bus_num may
>> > be dynamically allocated. So, replace the component bus_num with
>> > the physical address of spi controller.
>>
>> You can easily enforce fixed bus numers in linux using aliases in the
>> DT, this is supported
>> by the spi core since v3.9 or so.
>
> Interesting. Thanks for the suggestion. I haven't verified it myself,
> but if this is a workable solution, then I'd much prefer that to
> fiddling with the name here. So, tentative NAK.

Should have added that to my reply, it's this part:

http://lxr.free-electrons.com/source/drivers/spi/spi.c#L1536

int spi_register_master(struct spi_master *master)
{
        ...
        if ((master->bus_num < 0) && master->dev.of_node)
                master->bus_num = of_alias_get_id(master->dev.of_node, "spi");


so just using

aliases {
    spi123 = &spi;
};

should be enough to get "stable" names.

Jonas
