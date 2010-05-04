Received: from mail-vw0-f49.google.com ([209.85.212.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1O9J0N-0003xB-S7
	for linux-mtd@lists.infradead.org; Tue, 04 May 2010 14:21:48 +0000
Received: by vws8 with SMTP id 8so1112130vws.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 04 May 2010 07:21:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100504132824.GM20932@elara.bln.innominate.local>
References: <t2q630851df1005040439hf116acd1ucd73738e90dc5731@mail.gmail.com>
	<20100504132824.GM20932@elara.bln.innominate.local>
Date: Tue, 4 May 2010 19:51:43 +0530
Message-ID: <x2t630851df1005040721i49a44970yfb3b0dd5e2f17d8e@mail.gmail.com>
Subject: Re: unable to run "flash_eraseall" on ARM target!!!
From: Murali N <nalajala.murali@gmail.com>
To: Christian Hohnstaedt <chohnstaedt@innominate.com>
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

file flash_eraseall produce
flash_eraseall: ELF 32-bit LSB executable, ARM, version 1 (SYSV),
dynamically linked (uses shared libs), not stripped.

It is linked against bionic libc (android specific) library. Aslo i am
able to see the libc.so under /system/lib/

On Tue, May 4, 2010 at 6:58 PM, Christian Hohnstaedt
<chohnstaedt@innominate.com> wrote:
> Hi,
>
> On Tue, May 04, 2010 at 05:09:57PM +0530, Murali N wrote:
>> Hi,
>> i have compiled the mtd-utils for android using arm-eabi-4.4.0 tool chai=
n.
>> I tried erasing the flash using "flash_eraseall" on target but i am
>> getting the below errors!!!
>>
>> # ./flash_eraseall
>> =C2=A0 =C2=A0 ./flash_eraseall
>> =C2=A0 =C2=A0 ./flash_eraseall: not found
>
> This looks like a missing library loader.
> Did you link dynamically ?
> Do you have ld-linux.so (glibc) or ld-uClibc.so (ulibc) in /lib ?
>
>
> Christian
>
> --
> Christian Hohnstaedt / Project Manager Hardware and Manufacturing
>
> Innominate Security Technologies AG / protecting industrial networks
> tel: +49.30.921028.208 / fax: +49.30.921028.020
> Rudower Chaussee 13, D-12489 Berlin / http://www.innominate.com
>
> Register Court: AG Charlottenburg, HR B 81603
> Management Board: Dirk Seewald
> Chairman of the Supervisory Board: Volker Bibelhausen
>



--=20
Regards,
Murali N
