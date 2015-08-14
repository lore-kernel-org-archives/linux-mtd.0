Received: from mail-vk0-f52.google.com ([209.85.213.52])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQJOm-0008U2-M5
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 18:08:13 +0000
Received: by vkfi73 with SMTP id i73so33118397vkf.2
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 11:07:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <871tf5c08x.fsf@belgarion.home>
References: <1438612286-16070-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1438612286-16070-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <CAOiHx==8WbSqy=1XPGR5G4=hFouV55bNe_Y82k1Pby4+Yn+rxw@mail.gmail.com>
 <871tf5c08x.fsf@belgarion.home>
Date: Fri, 14 Aug 2015 15:07:51 -0300
Message-ID: <CAAEAJfDqpHXS53D5dysKUUt3930sGTg5Jv+NCpuM8HrUQPkzGQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] nand: pxa3xx: Increase READ_ID buffer and make the
 size static
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>,
 Brian Norris <computersforpeace@gmail.com>,
 Jonas Gorski <jogo@openwrt.org>
Cc: MTD Maling List <linux-mtd@lists.infradead.org>,
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

On 14 August 2015 at 13:18, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Jonas Gorski <jogo@openwrt.org> writes:
>
>>>
>>> -               info->data_size =3D 8;
>>> +               info->data_size =3D READ_ID_BYTES;
>>
>> You are reducing ->data_size from 8 to 7 here, is this intentional?
> I bet it's a small mistake.
>

Ah, good catch. Yes, as Robert explains this is a mistake.
Brian, if you can drop this patch, I'll send a new one.

> The pxa3xx NFC controller requires to read at least 8 bytes, as it is one=
 entry
> FIFO (chapter 3.7.1.2 "Non-DMA Operating mode" of PXA3xx VolII developer
> manual).
>
> Same constraint applies to DMA btw.
>

This is also explained on the A370 specs [1], section 14.4 NAND, Operation

""
For read ID and read status commands, software reads 8B from NDDB,
because the NFCv2
allocates one buffer entry (8B) to hold the read data for these
commands. Valid data is aligned to the
LSB; users should discard non-valid bytes, for example, for a 5B
read-ID command, bytes 0 through
4 are valid while bytes 5 through 7 should be ignored.
""

Read ID count should be set to 7 (the maximum allowed read id count),
buf_count will be set to 7 too, but data_size should be set to 8.

[1] http://www.marvell.com/embedded-processors/armada-300/assets/ARMADA370-=
FunctionalSpec-datasheet.pdf

Thanks a lot for the catch,
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
