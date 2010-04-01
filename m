Received: from qw-out-1920.google.com ([74.125.92.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NxPih-0004r1-Gg
	for linux-mtd@lists.infradead.org; Thu, 01 Apr 2010 19:06:24 +0000
Received: by qw-out-1920.google.com with SMTP id 4so550819qwk.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 01 Apr 2010 12:06:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <z2l71cd59b01004010459k91abccd8x9479276db49d3fd1@mail.gmail.com>
References: <6b5362aa1002260458j571852cbl2f2d86130828333a@mail.gmail.com>
	<1267559131.1883.1.camel@localhost.localdomain>
	<t2q71cd59b01003310557v3c2b0775o6e90af812067e726@mail.gmail.com>
	<k2h6b5362aa1004010414j1ce57f33w27ee1debe9cb7a68@mail.gmail.com>
	<z2l71cd59b01004010459k91abccd8x9479276db49d3fd1@mail.gmail.com>
Date: Fri, 2 Apr 2010 00:36:21 +0530
Message-ID: <k2q6b5362aa1004011206n1a0fb72due64fa6e3da749796@mail.gmail.com>
Subject: Re: Release of UBIL: ubi with log
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Artem.Bityutskiy@nokia.com, dedekind1@gmail.com,
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

On Thu, Apr 1, 2010 at 5:29 PM, Corentin Chary <corentin.chary@gmail.com> w=
rote:
> On Thu, Apr 1, 2010 at 1:14 PM, Brijesh Singh <brijesh.s.singh@gmail.com>=
 wrote:
>> Hi,
>>
>> On Wed, Mar 31, 2010 at 6:27 PM, Corentin Chary
>> <corentin.chary@gmail.com> wrote:
>>> On Tue, Mar 2, 2010 at 8:45 PM, Artem Bityutskiy <dedekind1@gmail.com> =
wrote:
>>>> On Fri, 2010-02-26 at 18:28 +0530, Brijesh Singh wrote:
>>>>> Hi,
>>>>> =A0It gives me great pleasure in sharing UBIL: ubi with log. =A0We ha=
ve
>>>>> added logging functionality to ubi for reducing mount time.
>>>>> UBIL uses the "same source base of UBI". The logging functionality ca=
n
>>>>> be added or removed at compile time using "make menuconfig option".
>>>>>
>>>>> We have seen mount time reduction of 50% in 1GB NAND. We are expectin=
g
>>>>> even better results for larger flash memories.
>>>>>
>>>>> The source code of UBIL can be found in the following git tree:
>>>>> http://git.infradead.org/users/brijesh/ubi-2.6.git
>>>>>
>>>>
>>>> Sounds interesting! However, I'm out of office till end of March, and
>>>> won't be able to look closely at this. But hopefully others will try i=
t.
>>>>
>>>
>>> Hi,
>>> Didn't took the time =A0to read the code, I'll try to do so soon.
>>> Could you tell us more about what you did and how it works ?
>>> Is it similar to yaffs checkpoints ? When are the log written ?
>> Not sure with yaffs checkpoints.
>
> Yaffs works by writting it's internal memory representation on the
> nand while unmounting, so it seems to be different.

Right now, all the valid log is kept in buffer. This is written at
umount/ when log is full.
However, I have got some code that dumps ram data structure(eba table
and wl trees). Right now it works only when
meta data is less than single block. This is certainly best approach,
and is much faster.

>> But commit writes only valid log entries.
>> Log is written when an eba mapping is changed or when ec of peb is chang=
ed.
>
> How this affect write performances ?
RIght now, as long as there is space in log, read/write performance is
the same.
The results we got, are almost same as old UBI. I will update the
results on monday,

>>> What will happen if you try to mount something that used UBIL with a
>>> kernel without UBIL support ?
>> It won't work.
>
> Could it work by using a separate UBI volume with the right flag ? Are
> the log per-volume ?
No. Log is per UBI instance. It is not per volume. I am not sure why
would this be necessary.
Any suggestion?
