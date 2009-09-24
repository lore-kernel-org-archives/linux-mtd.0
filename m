Received: from an-out-0708.google.com ([209.85.132.245])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Mqx0P-00076E-QB
	for linux-mtd@lists.infradead.org; Thu, 24 Sep 2009 22:41:46 +0000
Received: by an-out-0708.google.com with SMTP id c38so740564ana.27
	for <linux-mtd@lists.infradead.org>;
	Thu, 24 Sep 2009 15:41:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090924140639.GB27905@nb.net.home>
References: <1251112316-18971-1-git-send-email-corentincj@iksaif.net>
	<20090924140639.GB27905@nb.net.home>
Date: Fri, 25 Sep 2009 00:41:40 +0200
Message-ID: <71cd59b00909241541y645c40farac56a7eadb84c02b@mail.gmail.com>
Subject: Re: [PATCH 0/3] Add support for UBI and UBIFS
From: Corentin Chary <corentin.chary@gmail.com>
To: Karel Zak <kzak@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: util-linux-ng@vger.kernel.org, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 24, 2009 at 4:06 PM, Karel Zak <kzak@redhat.com> wrote:
> On Mon, Aug 24, 2009 at 01:11:53PM +0200, Corentin Chary wrote:
>> Hi,
>> Here is some patchs to add support for UBI and UBIFS in libblkid.
>>
>> UBIFS works on top of UBI volumes, there are 3 subsystems involved:
>> =A0 * MTD subsystem, which provides uniform interface to access flash ch=
ips.
>> =A0 =A0 MTD provides an notion of MTD devices (e.g., /dev/mtd0) which ba=
sically represents raw flash;
>> =A0 * UBI subsystem, which is a wear-leveling and volume management syst=
em for flash devices;
>> =A0 =A0 UBI works on top of MTD devices and provides a notion of UBI vol=
umes (e.g.m /dev/ubi0_0);
>> =A0 * UBIFS file system, which works on top of UBI volumes.
>
> =A0Applied.
>
> =A0Please, "git pull" and test "mics-utils/blkid -p" against a real UBI
> =A0device. I did some minor changes to the code (it was necessary to
> =A0rebase your patches to the current HEAD).
>
> =A0Thanks for your patience :-)
>
> =A0 =A0Karel
>

$ ../../misc-utils/blkid /dev/ubi0_0
/dev/ubi0_0: UUID=3D"6358dcea-6e46-40c9-8d76-072eac24d909" TYPE=3D"ubifs"

Working

$ ../../mount/mount /dev/ubi0_0 /mnt/key
UBIFS error (pid 28250): ubifs_get_sb: cannot open "/dev/ubi0_0", error -22

*patching UBIFS*

$ sudo ../../mount/mount /dev/ubi0_0 /mnt/key/
Yeah, working !

--=20
Corentin Chary
http://xf.iksaif.net
