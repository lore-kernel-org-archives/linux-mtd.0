Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MKsrm-0006s0-NL
	for linux-mtd@lists.infradead.org; Sun, 28 Jun 2009 11:48:21 +0000
Received: by fxm20 with SMTP id 20so75297fxm.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 28 Jun 2009 04:48:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1245842095.25547.5380.camel@macbook.infradead.org>
References: <1245527124.30962.14.camel@yio.site>
	<1245675383.25547.50.camel@macbook.infradead.org>
	<1245832038.2483.3.camel@yio.site>
	<1245842095.25547.5380.camel@macbook.infradead.org>
From: Kay Sievers <kay.sievers@vrfy.org>
Date: Sun, 28 Jun 2009 13:47:57 +0200
Message-ID: <ac3eb2510906280447kdd5aa98o2baa239521752066@mail.gmail.com>
Subject: Re: BUS_ID_SIZE is going away
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Takashi Iwai <tiwai@suse.de>, catalin.marinas@arm.com,
	linux-kernel <linux-kernel@vger.kernel.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-mtd@lists.infradead.org, Greg KH <greg@kroah.com>,
	"David S. Miller" <davem@davemloft.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 24, 2009 at 13:14, David Woodhouse<dwmw2@infradead.org> wrote:
> On Wed, 2009-06-24 at 10:27 +0200, Kay Sievers wrote:
>> On Mon, 2009-06-22 at 13:56 +0100, David Woodhouse wrote:
>> > I have this queued for 2.6.31 but have been on jury duty for the last =
2
>> > weeks so I'm hoping to get the pull request to Linus today now that I'=
m
>> > free.
>>
>> The old one is gone, but seems you merged a new one with BUS_ID_SIZE :)
>>
>> =C2=A0 ./drivers/mtd/maps/integrator-flash.c:#define SUBDEV_NAME_SIZE =
=C2=A0 =C2=A0 =C2=A0(BUS_ID_SIZE + 2)
>
> Hm, true :)

Seems, it's the last one left. In case the "real" fix you are working
on is not ready to apply, care to push out a change, so we can finally
get rid of itl? Or let me know, and we can replace it with "20" along
with the removal from the driver core.

Thanks,
Kay
