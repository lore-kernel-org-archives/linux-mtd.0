Received: from mail-bw0-f218.google.com ([209.85.218.218])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NwxUa-0004fb-4c
	for linux-mtd@lists.infradead.org; Wed, 31 Mar 2010 12:57:56 +0000
Received: by bwz10 with SMTP id 10so76250bwz.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 31 Mar 2010 05:57:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1267559131.1883.1.camel@localhost.localdomain>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1267559131.1883.1.camel@localhost.localdomain>
Date: Wed, 31 Mar 2010 14:57:52 +0200
Message-ID: <t2q71cd59b01003310557v3c2b0775o6e90af812067e726@mail.gmail.com>
Subject: Re: Release of UBIL: ubi with log
From: Corentin Chary <corentin.chary@gmail.com>
To: Brijesh Singh <brij.singh@samsung.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, dedekind1@gmail.com, brijesh.s.singh@gmail.com,
	linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
	David Woodhouse <dwmw2@infradead.org>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 2, 2010 at 8:45 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
e:
> On Fri, 2010-02-26 at 18:28 +0530, Brijesh Singh wrote:
>> Hi,
>> =A0It gives me great pleasure in sharing UBIL: ubi with log. =A0We have
>> added logging functionality to ubi for reducing mount time.
>> UBIL uses the "same source base of UBI". The logging functionality can
>> be added or removed at compile time using "make menuconfig option".
>>
>> We have seen mount time reduction of 50% in 1GB NAND. We are expecting
>> even better results for larger flash memories.
>>
>> The source code of UBIL can be found in the following git tree:
>> http://git.infradead.org/users/brijesh/ubi-2.6.git
>>
>
> Sounds interesting! However, I'm out of office till end of March, and
> won't be able to look closely at this. But hopefully others will try it.
>

Hi,
Didn't took the time  to read the code, I'll try to do so soon.
Could you tell us more about what you did and how it works ?
Is it similar to yaffs checkpoints ? When are the log written ?
What will happen if you try to mount something that used UBIL with a
kernel without UBIL support ?
Thanks,

--=20
Corentin Chary
http://xf.iksaif.net
