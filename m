Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRNXV-0004j4-14
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2015 16:45:37 +0000
Received: by igbjg10 with SMTP id jg10so60123782igb.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 09:45:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAOiHx=mFoke2sTQGsjyNF+k8DFq4GAt9AgU8ednxn5Kx4R7SNw@mail.gmail.com>
References: <1439785625-36183-1-git-send-email-B48286@freescale.com>
 <CAOiHx=mFoke2sTQGsjyNF+k8DFq4GAt9AgU8ednxn5Kx4R7SNw@mail.gmail.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 17 Aug 2015 18:44:34 +0200
Message-ID: <CAOMqctS0qV2YK7yAx57CknJoTZW_81MppORvqSNO0u=0J+LG9g@mail.gmail.com>
Subject: Re: [PATCH V6] mtd: m25p80: Modify the name of mtd_info
To: Jonas Gorski <jogo@openwrt.org>
Cc: Zhiqiang Hou <B48286@freescale.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>, mike@steroidmicros.com,
 Hu Vincent <Mingkai.Hu@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 August 2015 at 18:27, Jonas Gorski <jogo@openwrt.org> wrote:
> Hi,
>
> On Mon, Aug 17, 2015 at 6:27 AM, Zhiqiang Hou <B48286@freescale.com> wrote:
>> From: Hou Zhiqiang <B48286@freescale.com>
>>
>> Set the mtd_info's name to a fixed one, so spi flash layouts can
>> be specified by "mtdparts=..." in kernel cmdline, because the
>> cmdlinepart's parser will match the name of mtd_info with the name
>> given in cmdline.
>>
>> So far, if DT is used, the mtd_info's name will be set to the name
>> of spi->dev. It includes spi_master->bus_num, and the bus_num may
>> be dynamically allocated. So, replace the component bus_num with
>> the physical address of spi controller.
>
> You can easily enforce fixed bus numers in linux using aliases in the
> DT, this is supported
> by the spi core since v3.9 or so.

WIth the bonus that you can move your boot partitions to another mtd
device with a one line change in dt.

It might be nice to add a warning when partitions are created and the
alias is not present.

Thanks

Michal
