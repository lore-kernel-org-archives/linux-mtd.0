Received: from yw-out-1718.google.com ([74.125.46.152])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MBtiW-0006l9-Hi
	for linux-mtd@lists.infradead.org; Wed, 03 Jun 2009 16:53:41 +0000
Received: by yw-out-1718.google.com with SMTP id 9so47953ywk.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 03 Jun 2009 09:53:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243945279.5847.27.camel@localhost.localdomain>
References: <1c3f4270905281908g75069b39sbc2167b5a3d32d1b@mail.gmail.com>
	<1243945279.5847.27.camel@localhost.localdomain>
Date: Wed, 3 Jun 2009 09:53:29 -0700
Message-ID: <1c3f4270906030953i1ec7259br6b89c1699cc6e4f4@mail.gmail.com>
Subject: Re: ubiformat error
From: Manoj <manoj23@gmail.com>
To: dedekind@infradead.org
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yes, it seems to work fine now.

On Tue, Jun 2, 2009 at 5:21 AM, Artem Bityutskiy <dedekind@infradead.org> w=
rote:
> On Thu, 2009-05-28 at 19:08 -0700, Manoj wrote:
>> I am trying to flash an UBI image to NAND flash. But I get an error
>> about "No such file or directory".
>>
>> # cat /proc/mtd
>> dev: =9A =9Asize =9A erasesize =9Aname
>> mtd0: 01000000 00020000 "NAND-block1"
>> mtd1: 01e00000 00020000 "jffs2"
>> mtd2: 0d200000 00020000 "NAND-block2"
>> # ubiformat /dev/mtd1
>> ubiformat: error!: cannot get information about "/dev/mtd1"
>> =9A =9A =9A =9A =9A =9Aerror 2 (No such file or directory)
>> # ls -l /dev/mtd1
>> crw-rw-r-- =9A =9A1 root =9A =9A root =9A =9A =9A90, =9A 2 Dec 31 16:00 =
/dev/mtd1
>>
>> I am able to do ubiattach with mtd1, create an empty volume and mount
>> the volume as ubifs.
>
> Hi, I've just push a fix for this to mtd-utils git. Please,
> verify it. Thanks.
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
