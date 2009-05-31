Received: from yx-out-1718.google.com ([74.125.44.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MAg03-00043S-AS
	for linux-mtd@lists.infradead.org; Sun, 31 May 2009 08:02:41 +0000
Received: by yx-out-1718.google.com with SMTP id 6so3907393yxn.72
	for <linux-mtd@lists.infradead.org>;
	Sun, 31 May 2009 01:02:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1243613077.11172.120.camel@localhost.localdomain>
References: <1c3f4270905281908g75069b39sbc2167b5a3d32d1b@mail.gmail.com>
	<1243613077.11172.120.camel@localhost.localdomain>
Date: Sun, 31 May 2009 01:02:32 -0700
Message-ID: <1c3f4270905310102x4fe2aabaof187432e8f1136c@mail.gmail.com>
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

Hi Artem,

I picked up a snapshot up to this commit -
http://git.infradead.org/mtd-utils.git?a=3Dcommit;h=3De7454c3c3928ee7af7e76=
c0521f477881c9bf60f

and it worked for me.

Thanks.

On Fri, May 29, 2009 at 9:04 AM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
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
> Yeah, I'll look at this. For now just try to go several
> git commits down. I think this was working and I recently
> broke it.
>
> --
> Best regards,
> Artem Bityutskiy (=E2=C9=D4=C0=C3=CB=C9=CA =E1=D2=D4=A3=CD)
>
>
