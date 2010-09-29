Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P0wfd-0003J6-GJ
	for linux-mtd@lists.infradead.org; Wed, 29 Sep 2010 13:26:06 +0000
Received: by pvg12 with SMTP id 12so225672pvg.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 06:26:03 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED6015C@Cloud.RL.local>
References: <4CA2B3E9.3030707@call-direct.com.au>
	<70E876B0EA86DD4BAF101844BC814DFE093ED6015C@Cloud.RL.local>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 29 Sep 2010 09:25:42 -0400
Message-ID: <AANLkTimMAep5SM=ZHKFdP=WNuT+-7Wvun2ARx+d-ePK7@mail.gmail.com>
Subject: Re: [PATCH] nandwrite: add --nobad to write bad blocks
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Iwo Mergler <iwo@call-direct.com.au>,
	"dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 29, 2010 at 02:56, Jon Povey wrote:
> linux-mtd-bounces@lists.infradead.org wrote:
>> Mike Frysinger wrote:
>>> i'm open to logic, but i cant figure out your side. =C2=A0all i can see=
 is
>>> "it's been this way" and "we shouldnt write bad blocks". =C2=A0but both
>>> sound like policies that the end user should have control over rather
>>> than the userspace utils always enforcing. =C2=A0so if you feel i've
>>> missed something, please highlight it.
>>
>> while I agree with the philosophy to allow users to shoot
>> themselves in the foot if they really like that sort of thing,
>> the "don't touch bad blocks" rule makes sense and it's not
>> necessarily obvious.
>
> [manufacturer-marked bad blocks]
>
>> Thus the rule about not touching bad blocks. It's the only
>> way to make sure that you don't end up with a batch of products
>> that will die on the shelf, after you successfully tested them.
>
> I can't speak for Mike, but I have run into a few situations where
> blocks were marked bad incorrectly. For example, the ROM bootloader of
> a chip I work with requires a different OOB layout to that specified by
> the NAND flash manufacturer, so to write the second-stage bootloader
> you must write data into what is, as far as the NAND maker is concerned,
> the OOB area. Then when u-boot or Linux loads, it finds no BBT, scans
> the bootloader, finds non-FF OOB and marks it bad.

this is actually the same situation i am dealing with (i doubt we're
using the same processor though), and as i described in my original
posting: "like when the block isn't actually bad but the OOB layout
isn't what the kernel is expecting or is otherwise screwed up".
-mike
