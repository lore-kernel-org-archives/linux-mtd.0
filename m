Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1YxW-00056X-Fv
 for linux-mtd@lists.infradead.org; Thu, 18 Dec 2014 11:09:31 +0000
MIME-Version: 1.0
Message-ID: <trinity-03861656-4f4e-47fd-bcc5-aa493202c0bd-1418900934280@3capp-1and1-bs05>
From: "markus.heininger@online.de" <markus.heininger@online.de>
To: hujianyang <hujianyang@huawei.com>
Subject: Aw: Re: UBIFS: Is it possible to get the compressed size of a file?
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Dec 2014 12:08:54 +0100
In-Reply-To: <54912109.50505@huawei.com>
References: <trinity-a1228aa8-8eaa-4950-9c14-5d6b6db5f3d7-1418371801058@3capp-1and1-bs02>,
 <54912109.50505@huawei.com>
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

in our system we=C2=B4re using ring buffers where it is necessary to
remove old files from certain directories when the physical usage
of each directory is above a certain level which is different for each=20
folder.

Evaluating the output of "df" after write access might be difficult
since there are several concurrent writing processes.

But many thanks for your answer, it seems that there is no easy
way to get the information needed and we must investigate further on
our own.

With best regards,
Markus

Gesendet:=C2=A0Mittwoch, 17. Dezember 2014 um 07:22 Uhr
Von:=C2=A0hujianyang <hujianyang@huawei.com>
An:=C2=A0"markus.heininger@online.de" <markus.heininger@online.de>
Cc:=C2=A0linux-mtd@lists.infradead.org, "Artem Bityutskiy" <dedekind1@gmai=
l.com>
Betreff:=C2=A0Re: UBIFS: Is it possible to get the compressed size of a fi=
le?
On 2014/12/12 16:10, markus.heininger@online.de wrote:
> Hello,
>
> when using compression along with UBIfs, fstat reports the uncompressed =
file size
> (as it should do). Is there a simple way to get the compressed file size=
, thus the real space
> a single file needs on the flash memory?

Why you need this?

I know *df* shows the space of a partition. Run *sync* after
a file created or appended, the space change of this partition
maybe could show you the compressed size of this file.

Is that enough for you?

>
> Many thanks,
> Markus
>

=C2=A0
