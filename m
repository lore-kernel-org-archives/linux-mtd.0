Received: from mail-qy0-f183.google.com ([209.85.221.183])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NzQyu-0000fp-Q1
	for linux-mtd@lists.infradead.org; Wed, 07 Apr 2010 08:51:29 +0000
Received: by mail-qy0-f183.google.com with SMTP id 13so948761qyk.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 07 Apr 2010 01:51:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1270542698.6754.7.camel@localhost>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1270542698.6754.7.camel@localhost>
Date: Wed, 7 Apr 2010 14:21:27 +0530
Message-ID: <m2u6b5362aa1004070151u60fa27f1k3ba409017b2a7d45@mail.gmail.com>
Subject: Re: Release of UBIL: ubi with log
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, rohitvdongre@gmail.com,
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

Hi,
On Tue, Apr 6, 2010 at 2:01 PM, Artem Bityutskiy <dedekind1@gmail.com> wrot=
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
>> We have tested ubil for samsung nand and onenand. The test results can
>> be found in the following git tree:
>> http://git.infradead.org/users/brijesh/ubil_results
>>
>> We are working on utilities and design document of UBIL. I will share
>> those as soon as possible.
>
> Is there any doc available?
Working on it.
> I've briefly looked at the source code, and found out that:
>
> 1. It looks like code from UBIFS, but tweaked and transformed, is this
> right?
Yes,some parts like compression.
> 2. Various small coding style things which do not correspond to UBI
> coding style. I usually want contributors to use the same style to keep
> the UBI code uniform and consistent.
We have tried to do this as much as possible. If there is anything
missing, I will fix it.
> 3. A design document would be cool.
Working on it. I will send the patches earliest possible.

Thanks and Regards,
Brijesh
