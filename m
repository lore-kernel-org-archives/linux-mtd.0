Received: from db3ehsobe002.messaging.microsoft.com ([213.199.154.140]
	helo=DB3EHSOBE002.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qu7Gn-0000ks-Ay
	for linux-mtd@lists.infradead.org; Thu, 18 Aug 2011 18:24:46 +0000
Message-ID: <4E4D58E6.7060706@freescale.com>
Date: Thu, 18 Aug 2011 13:24:38 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Matthieu CASTET <matthieu.castet@parrot.com>
Subject: Re: [PATCH v3] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
References: <1313634783-8855-1-git-send-email-b35362@freescale.com>
	<4E4D452C.7050805@parrot.com>
In-Reply-To: <4E4D452C.7050805@parrot.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
Cc: "linuxppc-dev@ozlabs.org" <linuxppc-dev@ozlabs.org>,
	"b35362@freescale.com" <b35362@freescale.com>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/18/2011 12:00 PM, Matthieu CASTET wrote:
> b35362@freescale.com a =E9crit :
>> From: Liu Shuo <b35362@freescale.com>
>>
>> Freescale FCM controller has a 2K size limitation of buffer RAM. In or=
der
>> to support the Nand flash chip whose page size is larger than 2K bytes=
,
>> we divide a page into multi-2K pages for MTD layer driver. In that cas=
e,
>> we force to set the page size to 2K bytes. We convert the page address=
 of
>> MTD layer driver to a real page address in flash chips and a column in=
dex
>> in fsl_elbc driver. We can issue any column address by UA instruction =
of
>> elbc controller.
>>
> Why do you need to do that ?
>=20
> When mtd send you a 4k page, why can't you write it by 2*2k pages write=
 ?

That would be more complicated given the statefulness of the interface,
for no real benefit.

> Even better send the first 2K and then if your controller allow it send=
 the
> remaining 2K without command/address phase.

IIRC Shuo tried this first and couldn't make it work.

-Scott
