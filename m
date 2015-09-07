Received: from mail-la0-f45.google.com ([209.85.215.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZYyqM-0001Wq-HE
 for linux-mtd@lists.infradead.org; Mon, 07 Sep 2015 16:00:31 +0000
Received: by lagj9 with SMTP id j9so54815612lag.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Sep 2015 09:00:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55EDA53C.6080305@imgtec.com>
References: <1438005019-28162-1-git-send-email-alex.smith@imgtec.com>
 <20150906203839.GB7745@laptop.cereza> <55EDA53C.6080305@imgtec.com>
Date: Mon, 7 Sep 2015 13:00:08 -0300
Message-ID: <CAAEAJfCENEYAeJMUWpVv+uLZU4pYdrJVbzo=fgn+Db344y9yqA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] mtd: nand: jz4780: Add NAND and BCH drivers
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Alex Smith <alex.smith@imgtec.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On 7 September 2015 at 11:54, Alex Smith <alex.smith@imgtec.com> wrote:
> On 06/09/2015 21:38, Ezequiel Garcia wrote:
>> On 27 Jul 02:50 PM, Alex Smith wrote:
>>> Hi,
>>>
>>> This series adds support for the BCH controller and NAND devices on
>>> the Ingenic JZ4780 SoC.
>>>
>>> Tested on the MIPS Creator Ci20 board. All dependencies are now in
>>> mainline so it should be possible to compile test now.
>>>
>>> This version of the series has been rebased on 4.2-rc4, and also adds
>>> an additional patch to fix an issue that was encountered in the
>>> external Ci20 3.18 kernel branch.
>>>
>>> Review and feedback welcome.
>>>
>>
>> The NEMC driver seems to be upstream. Any chance you submit devicetree
>> changes as well for Ci20 (so we can actually test this)?
>
> Sure, can do. The pinctrl driver is not yet upstream (needs some work) wh=
ich is why I didn't add the DT changes initially, but at least if you boot =
the board from the NAND then U-Boot should have left everything in a state =
usable by the kernel.
>

Great, thanks! I definitely look forward to test this.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
