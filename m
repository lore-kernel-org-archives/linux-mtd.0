Received: from mail-oi0-x22f.google.com ([2607:f8b0:4003:c06::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aaiV2-0004Wt-JK
 for linux-mtd@lists.infradead.org; Tue, 01 Mar 2016 11:29:58 +0000
Received: by mail-oi0-x22f.google.com with SMTP id r187so4585256oih.3
 for <linux-mtd@lists.infradead.org>; Tue, 01 Mar 2016 03:29:35 -0800 (PST)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <56D56E95.4030204@atmel.com>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
 <56D56E95.4030204@atmel.com>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Tue, 1 Mar 2016 12:29:15 +0100
Message-ID: <CAGkQfmP5p3ezZwEub2RDW-y--aeJHDBN_oT9K4Wga=YYfBCLqA@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 Boris BREZILLON <boris.brezillon@free-electrons.com>,
 devicetree@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>, Yang Wenyou <Wenyou.Yang@atmel.com>
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

Hi Nicolas,

2016-03-01 11:27 GMT+01:00 Nicolas Ferre <nicolas.ferre@atmel.com>:
> Le 01/02/2016 11:25, Romain Izard a =C3=A9crit :
>> The NAND Flash controller for SAMA5D2 has small differences that make
>> it impossible to use the existing driver for SAMA5D3. This patchset
>> uses the device tree's compatible string to get those differences,
>> and the code is slightly modified to handle them.
>>
>> Base on linux-mtd-next, commit
>> 15c0be7bec002f9a529dd0966d0db96dde176fd0
>>
>> See previous revisions to apply on the Atmel Linux 4.1 branch.
>>
>> Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there
>> is no existing SAMA5D2 board with NAND Flash memory (yet).
>
> Brian,
>
> Hi, do we need to resend this series with all the tags collected (aka
> ping ;-)) ?
>

A v4 has already been sent, and Brian has picked patches 1-4, as seen
in: http://article.gmane.org/gmane.linux.drivers.devicetree/155864/

For patch #5, it is the update for the sama5d2.dtsi to describe the
NAND controller. Perhaps you can take it on your tree for 4.6, it
won't change anything until a board needs it, either Atmel's SAMA5D2 PTC
or another one.

Best regards,
--=20
Romain Izard
