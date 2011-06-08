Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QUNDP-0001x3-RI
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 18:10:52 +0000
Received: by fxm14 with SMTP id 14so702754fxm.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 11:10:47 -0700 (PDT)
MIME-Version: 1.0
Sender: vapier.adi@gmail.com
In-Reply-To: <1307533635.31223.63.camel@localhost>
References: <1307460482-3745-1-git-send-email-vapier@gentoo.org>
	<1307461925-6420-1-git-send-email-vapier@gentoo.org>
	<1307533635.31223.63.camel@localhost>
From: Mike Frysinger <vapier@gentoo.org>
Date: Wed, 8 Jun 2011 14:10:27 -0400
Message-ID: <BANLkTik4QVDOePb1xXZEQi=Zhq90ewoT=A@mail.gmail.com>
Subject: Re: [PATCH v3] libmtd: add helper funcs for getting regioninfo and
	locked info
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 8, 2011 at 07:47, Artem Bityutskiy wrote:
> On Tue, 2011-06-07 at 11:52 -0400, Mike Frysinger wrote:
>> This extends the libmtd with the helper functions:
>> =C2=A0 =C2=A0 =C2=A0 mtd_regioninfo: interface to MEMGETREGIONINFO
>> =C2=A0 =C2=A0 =C2=A0 mtd_islocked: interface to MEMISLOCKED
>>
>> Users of these functions will follow shortly ...
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>> ---
>> v3
>> =C2=A0 =C2=A0 =C2=A0 - add a "islocked_supported" field to handle older =
kernels nicely
>
> Umm, I meant a user-visible flag, so that the user could check it and
> not even try to print the map.

there is an option to not print the map ... "-M --map".  not sure what
you mean other than that.

> There does not seem to be much point having this flag otherewise
> - we can just call the ioctl, and return
> error if it fails, without printing any error message.

built-in optimization.  no point in doing the ioctl() over and over if
you know it's going to fail.

although thinking about it a bit more, i think the optimization is
incorrect.  it binds the status to the libmtd_t handle which is
per-library, not per-mtd.  so using it on different mtd devices would
result in misbehavior.
-mike
