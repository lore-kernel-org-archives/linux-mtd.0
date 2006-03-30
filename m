Received: from wproxy.gmail.com ([64.233.184.234])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FOwED-0001wk-Lu
	for linux-mtd@lists.infradead.org; Thu, 30 Mar 2006 07:26:31 -0500
Received: by wproxy.gmail.com with SMTP id i7so674675wra
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Mar 2006 04:26:16 -0800 (PST)
Message-ID: <6516efa10603300419u3ad488ds8f8fa13c8195c66c@mail.gmail.com>
Date: Thu, 30 Mar 2006 14:19:36 +0200
From: "Mikolaj Kolakowski" <mikolaj.kolakowski@gmail.com>
To: linux-mtd@lists.infradead.org
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_Part_2775_1480594.1143721176987"
Subject: JFFS2 erase suspend
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

------=_Part_2775_1480594.1143721176987
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,


Anybody can explain how erase suspend should work from the macro
perspective?

I assume that when I delete huge file and JFFS2 starts erasing sectors then
when I try to write small amount of data I shouldn't wait until all the
sectors on a erase pending list will be erased? The write should stop
erasing. Is it true?

On my system I observe that erase suspend is supported but when I delete 5M=
B
file then copy of a small file (20 bytes) to the partition takes a few
seconds. Is it a bug?

Thank you,

Mikolaj

------=_Part_2775_1480594.1143721176987
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline



<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>Hi,</span></p>



<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>&nbsp;<br>Anybody can
explain how erase suspend should work from the macro perspective?</span></p=
>

<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>I assume
that when I delete huge file and JFFS2 starts erasing sectors then when I t=
ry
to write small amount of data I shouldn't wait until all the sectors on a e=
rase
pending list will be erased? The write should stop erasing. Is it true?</sp=
an></p>







<p class=3D"MsoNormal"><span style=3D"font-size: 10pt; font-family: Arial;"=
>On my
system I observe that erase suspend is supported but when I delete 5MB file
then copy of a small file (20 bytes) to the partition takes a few seconds. =
Is
it a bug?<br>&nbsp;<br>Thank you,</span></p>

<p class=3D"MsoNormal" style=3D""><a name=3D"_MailAutoSig"><span style=3D"f=
ont-size: 10pt; font-family: Arial;">Mikolaj</span></a></p>


------=_Part_2775_1480594.1143721176987--
