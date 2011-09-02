Received: from mail-qw0-f43.google.com ([209.85.216.43])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QzNtH-0002HR-14
	for linux-mtd@lists.infradead.org; Fri, 02 Sep 2011 07:10:15 +0000
Received: by qwm42 with SMTP id 42so2059716qwm.16
	for <linux-mtd@lists.infradead.org>;
	Fri, 02 Sep 2011 00:10:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4E494520.7050509@freescale.com>
References: <1310446122-18050-1-git-send-email-b35362@freescale.com>
	<1313423954.8691.17.camel@sauron> <4E494520.7050509@freescale.com>
Date: Fri, 2 Sep 2011 09:10:13 +0200
Message-ID: <CAOY=C6Fgkwvi90BrPE=meBP_71TraDGSGJFU5PtK2Bm8QR0Uhw@mail.gmail.com>
Subject: Re: [PATCH v2] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
From: Stijn Devriendt <highguy@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, b35362@freescale.com, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 15, 2011 at 6:11 PM, Scott Wood <scottwood@freescale.com> wrote=
:
> On 08/15/2011 10:59 AM, Artem Bityutskiy wrote:
>> On Tue, 2011-07-12 at 12:48 +0800, b35362@freescale.com wrote:
>>> + =A0 =A0/*
>>> + =A0 =A0 * Hack for supporting the flash chip whose writesize is
>>> + =A0 =A0 * larger than 2K bytes.
>>> + =A0 =A0 */
>>> + =A0 =A0if (mtd->writesize > 2048) {
>>> + =A0 =A0 =A0 =A0 =A0 =A0elbc_fcm_ctrl->subpage_shift =3D ffs(mtd->writ=
esize >> 11) - 1;
>>> + =A0 =A0 =A0 =A0 =A0 =A0elbc_fcm_ctrl->subpage_mask =3D
>>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(1 << elbc_fcm_ctrl->subpage_s=
hift) - 1;
>>> + =A0 =A0 =A0 =A0 =A0 =A0/*
>>> + =A0 =A0 =A0 =A0 =A0 =A0 * Rewrite mtd->writesize, mtd->oobsize, chip-=
>page_shift
>>> + =A0 =A0 =A0 =A0 =A0 =A0 * and chip->pagemask.
>>> + =A0 =A0 =A0 =A0 =A0 =A0 */
>>> + =A0 =A0 =A0 =A0 =A0 =A0mtd->writesize =3D 2048;
>>> + =A0 =A0 =A0 =A0 =A0 =A0mtd->oobsize =3D 64;
>>> + =A0 =A0 =A0 =A0 =A0 =A0chip->page_shift =3D ffs(mtd->writesize) - 1;
>>> + =A0 =A0 =A0 =A0 =A0 =A0chip->pagemask =3D (chip->chipsize >> chip->pa=
ge_shift) - 1;
>>> + =A0 =A0}
>>
>> So basically if the flash has 4KiB NAND pages, you are considering it as
>> a flash with 2KiB NAND pages. But surely this will work only if the
>> underlying flash has NOP 2 at least. Or even, if you consider that JFFS2
>> and YAFFS want to write to OOB, you need NOP 4 (2 ECC writes and 2
>> writes from YAFFS/JFFS2) ? So this won't work for NOP1 flashes?
>
> Right. =A0The set of chips that work with this controller is still larger
> with this than without this.
>
> It looks like NOP1 tends to be MLC -- you probably wouldn't want to use
> MLC with this controller anyway as it only does 1-bit ECC.
>
I currently have the fsl_elbc_nand driver working with BCH codes in softwar=
e.
The patch is fairly small (although I'm just hardcoding the required ECC
configuration). I'll see if I can clean it up and push it upstream soon.

Regards,
Stijn
