Received: from mail-lb0-f180.google.com ([209.85.217.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZROGM-0006DH-QY
 for linux-mtd@lists.infradead.org; Mon, 17 Aug 2015 17:31:59 +0000
Received: by lbbsx3 with SMTP id sx3so86808201lbb.0
 for <linux-mtd@lists.infradead.org>; Mon, 17 Aug 2015 10:31:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87oai6an6j.fsf@belgarion.home>
References: <1439323034-8820-1-git-send-email-robert.jarzmik@free.fr>
 <1439323034-8820-3-git-send-email-robert.jarzmik@free.fr>
 <20150816213655.GA4585@laptop.cereza>
 <87oai6an6j.fsf@belgarion.home>
Date: Mon, 17 Aug 2015 14:31:34 -0300
Message-ID: <CAAEAJfC_QM=fZOZ1guThuY7hXbAbr7O7U6p3aewqOzVaAsbuMQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] mtd: nand: pxa3xx-nand: fix readid without keep_config
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Antoine Tenart <antoine.tenart@free-electrons.com>
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

On 16 August 2015 at 19:22, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> writes:
>
>> On 11 Aug 09:57 PM, Robert Jarzmik wrote:
>>> The cases of READID detection are broken on pxa3xx. The reason is that
>>> in the early stages of nand probing, ie. at pxa3xx_nand_scan(), we
>>> always have :
>>>  - info->use_dma =3D 0 (regardless of dma support yet)
>>>  - info->chunk_size =3D 0 (not yet detected)
>>>
>>> The READID issued by pxa3xx_nand_scan() will therefore end up in
>>> handle_data_pio(), and do_bytes will be 0, leading to not reading the
>>> nand id, and blocking detection.
>>>
>>> This doesn't happen if "keep_config" is used, which is probably the mos=
t
>>> tested case.
>>>
>>> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
>>> Fixes: 70ed85232a93 ("mtd: nand: pxa3xx: Introduce multiple page I/O
>>> support")
>>
>> To be fair, Antoine submitted this a while ago:
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2015-April/058739.html
>>
>> Not sure which one takes precedence in such a case (and yours
>> has a proper Fixes tag).
> His has precedence. How is it that a fix patch is not yet merge since Apr=
il ?
> Is it because it's part of a still in review serie ?
>

Exactly. And because I thought it was needed for Berlin support,
so it wasn't a regression.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
