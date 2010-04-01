Received: from mail-qy0-f191.google.com ([209.85.221.191])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NxPX8-0000jo-GV
	for linux-mtd@lists.infradead.org; Thu, 01 Apr 2010 18:54:27 +0000
Received: by qyk29 with SMTP id 29so1537471qyk.2
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 Apr 2010 11:54:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1270040348.15073.8.camel@localhost>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1267559131.1883.1.camel@localhost.localdomain>
	<t2q71cd59b01003310557v3c2b0775o6e90af812067e726@mail.gmail.com>
	<1270040348.15073.8.camel@localhost>
Date: Fri, 2 Apr 2010 00:24:24 +0530
Message-ID: <u2z6b5362aa1004011154hcbda8b4do21d1b82bd6ad5062@mail.gmail.com>
Subject: Re: Release of UBIL: ubi with log
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Artem.Bityutskiy@nokia.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <dwmw2@infradead.org>,
	"rohitvdongre@gmail.com" <rohitvdongre@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Corentin Chary <corentin.chary@gmail.com>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Wed, Mar 31, 2010 at 6:29 PM, Artem Bityutskiy
<Artem.Bityutskiy@nokia.com> wrote:
> On Wed, 2010-03-31 at 14:57 +0200, ext Corentin Chary wrote:
>> On Tue, Mar 2, 2010 at 8:45 PM, Artem Bityutskiy <dedekind1@gmail.com> w=
rote:
>> > On Fri, 2010-02-26 at 18:28 +0530, Brijesh Singh wrote:
>> >> Hi,
>> >> =A0It gives me great pleasure in sharing UBIL: ubi with log. =A0We ha=
ve
>> >> added logging functionality to ubi for reducing mount time.
>> >> UBIL uses the "same source base of UBI". The logging functionality ca=
n
>> >> be added or removed at compile time using "make menuconfig option".
>> >>
>> >> We have seen mount time reduction of 50% in 1GB NAND. We are expectin=
g
>> >> even better results for larger flash memories.
>> >>
>> >> The source code of UBIL can be found in the following git tree:
>> >> http://git.infradead.org/users/brijesh/ubi-2.6.git
>> >>
>> >
>> > Sounds interesting! However, I'm out of office till end of March, and
>> > won't be able to look closely at this. But hopefully others will try i=
t.
>> >
>>
>> Hi,
>> Didn't took the time =A0to read the code, I'll try to do so soon.
>> Could you tell us more about what you did and how it works ?
>> Is it similar to yaffs checkpoints ? When are the log written ?
>> What will happen if you try to mount something that used UBIL with a
>> kernel without UBIL support ?
>> Thanks,
>
> Right.
>
> And Brijesh, just go ahead, split your stuff on patches, and submit them
> to the MTD ML. Send your docs/URL to docs there as well.
>
> Please, do not wait, just go ahead and start pushing it out.
Thank you. We will rebase the git and start posting right away.
