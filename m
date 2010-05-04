Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9HFE-000746-1Y
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 12:29:00 +0000
Received: by vws8 with SMTP id 8so997661vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 May 2010 05:28:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <Pine.LNX.4.64.1005041343380.16385@lnxricardw.se.axis.com>
References: <t2q630851df1005040439hf116acd1ucd73738e90dc5731@mail.gmail.com>
	<Pine.LNX.4.64.1005041343380.16385@lnxricardw.se.axis.com>
Date: Tue, 4 May 2010 17:58:58 +0530
Message-ID: <h2m630851df1005040528w501d89dctd8d3ac0fe91f9e3@mail.gmail.com>
Subject: Re: unable to run "flash_eraseall" on ARM target!!!
From: Murali N <nalajala.murali@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
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

yes, permissions are clearly set.

-rwxrwxrwx root     root   17189 2010-05-04 11:03 flash_eraseall

On Tue, May 4, 2010 at 5:14 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Tue, 4 May 2010, Murali N wrote:
>
>> Hi,
>> i have compiled the mtd-utils for android using arm-eabi-4.4.0 tool chai=
n.
>> I tried erasing the flash using "flash_eraseall" on target but i am
>> getting the below errors!!!
>>
>> # sh ./flash_eraseall
>> =C2=A0 =C2=A0sh ./flash_eraseall
>> =C2=A0 =C2=A0./flash_eraseall: 1: Syntax error: word unexpected (expecti=
ng ")")
>> # ./flash_eraseall
>> =C2=A0 ./flash_eraseall
>> =C2=A0 ./flash_eraseall: not found
>> # sh /data/flash_eraseall
>> =C2=A0 sh /data/flash_eraseall
>> =C2=A0 /data/flash_eraseall: 1: Syntax error: word unexpected (expecting=
 ")")
>> #
>>
>> Why "flash_eraseall" was not found? i am running from the same
>> directory where i have copied.
>
> Have you made flash_eraseall executable? Looks like you've just copied it
> without doing =C2=A0 chmod +x flash_eraseall =C2=A0afterwards.
>
> /Ricard
> --
> Ricard Wolf Wanderl=C3=B6f =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0www.axis.com
> Phone +46 46 272 2016 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Fax +46 46 13 61 30
>



--=20
Regards,
Murali N
