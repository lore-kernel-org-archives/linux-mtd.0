Received: from mailserver2.vizimax.com ([216.208.233.162])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RG94p-0008MT-Kf
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 12:47:28 +0000
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: UBIFS recovery fails
Date: Tue, 18 Oct 2011 08:47:26 -0400
Message-ID: <225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
In-Reply-To: <1318882668.2172.10.camel@koala>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
From: =?iso-8859-1?Q?Jean-S=E9bastien_Gagnon?= <jsgagnon@vizimax.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,=20
Actually, I think the empty space corruption is the only thing to =
address in this=20
Specific problem, since any other error cause by unstable bits on valid =
data should be=20
corrected by the parities in the flash driver.

This problem could be addressed by the NAND driver reading the pages and =
correcting=20
empty ones, or by correcting UBIFS to address this problem.


J-S Gagnon

>
> On Mon, 2011-10-17 at 15:29 +0200, Daniel Kuhn wrote:
>> Hi,
>>=20
>> I have a problem with a device which uses UBI + UBIFS on a 32GB NAND=20
>> Flash (16*2GB). The
>> filesystem worked without problems for a couple of months but now I =
get=20
>> an error if I try to mount the volume.
>> Attaching the UBI-Device works fine as you can see in the following=20
>> messages:
>
> This issue looks like one of the MLC-specific ones. Unfortunately,
> no one really invested time into making UBIFS support MLC very well.
> It needs some more work. It also have some issues related to unstable
> bits in modern SLC.
>
> In short - if you want to use UBIFS on MLC - you should not have =
unclean
> reboots. If you want to make UBIFS 100% uclean-reboot save on MLC - =
you
> need to work on it some more.
>
> We (the original authors) developed and tested it on very robust SLC
> NAND.
>=20
> Unfortunately, I do not work with MTD for few years already and have
> no spare time to make it MLC-robust. My last attempt was this spring -
> I started making integck test (in mtd-utils) support emulated power
> cuts. The idea was to improve UBIFS power-cut emulation infrastructure
> and make it emulating unstable bits, and then test and fix all issues.
> But then I realized that I simply will not have time to finish it,
> so left the work half-done.
>
> If someone wants to see UBIFS 100% or near 100% power-cut safe on
> MLC or one of shitty modern SLCs - he needs to invest men-hours.
> I can help by suggesting and reviewing. Although the funny thing is
> that eMMCs die and lose data in case of power cuts very often :-)
>
>> UBI: wear-leveling threshold:    4096
> Are you sure it is good for MLC? What is your eraseblock life-cycle?
>
>> Is there a way to recover the data on the device?
>
> If you just have precious data which you need - I think:
> 1. Make a dump of the flash.
> 2. Verify that on another device you can flash it and reproduce this
> issue.
> 3. Just hack the function in kernel that fails to return 0 instead
> of error for that case, and I think you will be able to mount your
> flash and copy your data.
>
> But if you want this to never happen again - you need to prepare
> for a several months project (providing you have a good kernel
> engineer).
>
> HTH :-)



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
