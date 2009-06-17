Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MGteX-0001by-Kg
	for linux-mtd@lists.infradead.org; Wed, 17 Jun 2009 11:50:28 +0000
Received: by yw-out-1718.google.com with SMTP id 4so114079ywq.72
	for <linux-mtd@lists.infradead.org>;
	Wed, 17 Jun 2009 04:50:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090617112450.GA29067@logfs.org>
References: <1245235818-22649-1-git-send-email-vapier@gentoo.org>
	<20090617112450.GA29067@logfs.org>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Wed, 17 Jun 2009 07:49:43 -0400
Message-ID: <8bd0f97a0906170449y245dbee5o1c2f2e4d19a9ed3e@mail.gmail.com>
Subject: Re: [PATCH] [MTD] phram: cleanup error handling and associated
	messages
To: =?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: joern@lazybastard.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jun 17, 2009 at 07:24, J=C3=B6rn Engel wrote:
> On Wed, 17 June 2009 06:50:18 -0400, Mike Frysinger wrote:
>> The error handling in the phram driver is pretty bad -- in many places,
>> errors are silently ignored or logged, but then still ignored in the
>> return value. =C2=A0So convert all of the code to pass back the correct =
return
>> value and log error messages properly (and using the new pr_fmt() helper=
).
>
> I don't remember why I always returned 0 in phram_setup. =C2=A0Could well
> have been an oversight.
>
>> If everything does go smoothly, rather than exit silently, dump a helpfu=
l
>> info message like pretty much every other MTD driver does.
>>
>> Signed-off-by: Mike Frysinger <vapier@gentoo.org>
>
> Acked-by: Joern Engel <joern@logfs.org>
>
> Care to take over maintainership? =C2=A0I haven't used this driver in age=
s
> and don't foresee using it anytime soon.

i actually have no vested interest in this driver either, sorry.  i
was asked a question about the driver where the user was using wrong
parameters but they didnt get any feedback -- no kernel messages and
the driver loading did not error out.  figured i'd fix it up rather
than have to answer the question again :).
-mike
