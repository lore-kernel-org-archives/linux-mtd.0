Received: from mail-wi0-f179.google.com ([209.85.212.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZHFie-0001Ul-0c
 for linux-mtd@lists.infradead.org; Mon, 20 Jul 2015 18:23:16 +0000
Received: by wibxm9 with SMTP id xm9so99185258wib.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Jul 2015 11:22:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20150720180847.GH24125@google.com>
References: <1431356341-31640-1-git-send-email-antoine.tenart@free-electrons.com>
 <1431356341-31640-8-git-send-email-antoine.tenart@free-electrons.com>
 <555792FC.8030407@vanguardiasur.com.ar>
 <20150520140631.GN22054@kwain>
 <555C9584.1030609@vanguardiasur.com.ar>
 <20150520142409.GP22054@kwain> <20150520144341.GQ22054@kwain>
 <55621B83.4040909@vanguardiasur.com.ar>
 <20150720180847.GH24125@google.com>
Date: Mon, 20 Jul 2015 15:22:53 -0300
Message-ID: <CAAEAJfDuDu_M7D41h5qtvVrAiAB2KW8scAauckP2z5gZjC6=1w@mail.gmail.com>
Subject: Re: [PATCH v5 07/12] mtd: nand: add Samsung K9GBG08U0A-M to nand_ids
 table
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 20 July 2015 at 15:08, Brian Norris <computersforpeace@gmail.com> wrote:
> Hi Ezequiel,
>
> On Sun, May 24, 2015 at 03:42:11PM -0300, Ezequiel Garcia wrote:
>> On 05/20/2015 11:43 AM, Antoine Tenart wrote:
>> [..]
>> >>
>> >> I just had a look on the datasheet, and I you're right, the nand shou=
ld
>> >> support JDEC. However I get a "No NAND device found" error when
>> >> reverting this patch.
>> >>
>> >> It seems nand_flash_detect_jedec() is not reading "JDEC" and is retur=
ning
>> >> directly. I'm having a look at this.
>> >
>> > So, I can read 'J', 'E', 'D' and 'E' but then I got 0xff's. So I tried
>> > to only check of JEDE in nand_flash_detect_jedec() but the JEDEC
>> > parameter page was then not valid.
>> >
>>
>> This uncovers two different bugs in the driver.
>>
>> 1. read_id_bytes is either '2' or '4', but JEDEC detections needs at
>> least 5 bytes.
>>
>> 2. The initial buffer (to read the ID and the parameter page) has
>> 256 bytes, but the JEDEC parameter page is 512-bytes.
>>
>> And while at it, the driver doesn't seem to support reading the
>> redundant parameter pages (recently reported on barebox ML [1]). So this
>> is a third bug.
>>
>> Would you try setting read_id_bytes to '5' and also increasing the READ_=
PARAM
>> transfer length? Something like this:
>
> I'm trying to parse through the latest pxa3xx_nand patches, and I'm a
> bit lost. Did this piece get dropped on the floor?
>

As far as I can see, yes. Regarding this particular patch, the flash device
supports JEDEC detection but the driver needs a fix.

Hopefully, Antoine will submit a fix in the future.

> At any rate, it looks like there are a few more things to fix in
> Antoine's latest work, so I can't quite take them. Correct me if I'm
> misunderstanding.
>

The current patchset under discussion is "v2 mtd: pxa3xx_nand: rework
the timing setup":

http://lists.infradead.org/pipermail/linux-mtd/2015-July/060033.html

We are trying to get that sorted out, so we can move to the Berlin SoC supp=
ort.

Cheers,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
