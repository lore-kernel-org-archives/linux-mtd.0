Received: from mail-qy0-f177.google.com ([209.85.216.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oz0y8-0005cV-Om
	for linux-mtd@lists.infradead.org; Fri, 24 Sep 2010 05:37:13 +0000
Received: by qyk34 with SMTP id 34so3790453qyk.15
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Sep 2010 22:37:12 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093ED5FC9C@Cloud.RL.local>
References: <1285293221-25028-4-git-send-email-vapier@gentoo.org>
	<70E876B0EA86DD4BAF101844BC814DFE093ED5FC9C@Cloud.RL.local>
From: Mike Frysinger <vapier@gentoo.org>
Date: Fri, 24 Sep 2010 01:36:51 -0400
Message-ID: <AANLkTim3U4i0y0jtV1SmJvGUR8vAiyiqv8HetVHXFN6a@mail.gmail.com>
Subject: Re: [PATCH 4/4] mtd-utils: unify flash_erase and flash_eraseall
To: Jon Povey <Jon.Povey@racelogic.co.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 24, 2010 at 00:35, Jon Povey wrote:
> linux-mtd-bounces@lists.infradead.org wrote:
>> These have overlapping functionality, and while
>> flash_eraseall supports
>> newer 64bit ioctls, flash_erase does not. =C2=A0So rather than
>> graft support
>> onto flash_erase, merge the functionality of two into
>> flash_erase so we
>> only have to support one util from now on.
>>
>> A simple wrapper is provided to ease old flash_eraseall users into the
>> new combined flash_erase util.
>
>> -TARGETS =3D ftl_format flash_erase flash_eraseall nanddump
>> doc_loadbios \ +TARGETS =3D ftl_format flash_erase nanddump
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 doc_loadbios \ ftl_check mkfs.jffs2 flash_lo=
ck flash_unlock
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 flash_info \ flash_otp_info flash_otp_dump m=
td_debug flashcp
>> nandwrite nandtest \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 jffs2dump \
>
> But anyway; will the flash_eraseall script still get installed by
> make install? it needs to.

it will not, but i didnt think that to be too much of a problem.
people usually dont use `make install` for their embedded system ...
they pluck out the one or two utils they actually need.
-mike
