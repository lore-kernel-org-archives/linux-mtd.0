Received: from mail-qa0-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUBwQ-0004Qc-4L
 for linux-mtd@lists.infradead.org; Wed, 17 Sep 2014 09:54:26 +0000
Received: by mail-qa0-f51.google.com with SMTP id i13so1475019qae.24
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 02:54:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20140917083353.GB7362@norris-Latitude-E6410>
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410033389-32357-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D6CAB.7020501@ti.com> <540D8A92.2040209@ti.com>
 <20140910124849.GA25308@arch.hh.imgtec.org>
 <54104CB4.4020703@ti.com>
 <20140917083353.GB7362@norris-Latitude-E6410>
Date: Wed, 17 Sep 2014 10:54:03 +0100
Message-ID: <CAAEAJfDPnYZJbryFqDkBbq3p0CBFgwP9v9PG_j9cv-5T2Ymdnw@mail.gmail.com>
Subject: Re: [PATCH 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Tony Lindgren <tony@atomide.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?Q?Guido_Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>,
 Roger Quadros <rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 17 September 2014 09:33, Brian Norris <computersforpeace@gmail.com> wrot=
e:
> On Wed, Sep 10, 2014 at 04:05:56PM +0300, Roger Quadros wrote:
>> On 09/10/2014 03:48 PM, Ezequiel Garcia wrote:
>> > On 08 Sep 01:53 PM, Roger Quadros wrote:
>> >> On 09/08/2014 11:45 AM, Roger Quadros wrote:
>> >>> On 09/06/2014 10:56 PM, Ezequiel Garcia wrote:
>> >> I still get the following error if I set CONFIG_MTD_NAND_OMAP2 to y a=
nd
>> >> CONFIG_MTD_NAND_OMAP_BCH to m.
>> >>
>> >> CONFIG_MTD_NAND_OMAP_BCH is used to select the ELM driver and it must=
 be limited to
>> >> be built-in if CONFIG_MTD_NAND_OMAP2 is built-in.
>> >>
>> >
>> > Hm, yup. Any ideas on how to accomplish that? My Kconfig-foo is not st=
rong enough :(
>>
>> Mine neither ;). I'm unaware of any other method than making CONFIG_MTD_=
NAND_OMAP_BCH to bool.
>
> That could be part of the solution. Does the following patch work? It
> now forces elm and omap to be built the same -- either both as modules
> or both built-in -- but it solves the rest of the problem I think.
>
> (This also has the side effect of causing transition pains for any
> .config file that had CONFIG_MTD_NAND_OMAP_BCH=3Dm, since this becomes
> boolean now.)
>

http://patchwork.ozlabs.org/patch/388249/

I used my time-machine to go back in time and submitted the patch for you :=
-)
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
