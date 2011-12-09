Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RZ7H6-0008B9-Db
 for linux-mtd@lists.infradead.org; Fri, 09 Dec 2011 20:42:33 +0000
Received: by wgbdt11 with SMTP id dt11so4472822wgb.18
 for <linux-mtd@lists.infradead.org>; Fri, 09 Dec 2011 12:42:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4EE1C855.5040001@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
 <CAN8TOE9=Yh=pZkX3DePEwpnjZwqODwc-JLCSYkF_bKt5GzF4=A@mail.gmail.com>
 <4EE1C855.5040001@st.com>
Date: Fri, 9 Dec 2011 12:42:29 -0800
Message-ID: <CAN8TOE8fXp4rMF+6qfkRyrCpbEXj+82gBvQB-a5fvp8iQQmSSQ@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 02/13] nand-data: updates to S30ML-P devices
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: gernot.hoyler@spansion.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 9, 2011 at 12:35 AM, Angus CLARK <angus.clark@st.com> wrote:
> On 12/07/2011 06:49 PM, Brian Norris wrote:
>> On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
>> Expanding the names is probably good, but I don't really like the
>> "-FI{00,50}" piece. There are a few places where I used a wildcard in
>> the table to represent "don't care" characters. I think a lower-case
>> `x' might make sense, for example:
>>
>> S30ML512P30-FIx0
>> S30ML512P50-FIx1
>> S30ML256P30-FIx0
>> ...
>>
>
> Yes, agreed. =A0Will update the patch (and see comments below).

OK. I will recommend lowercase 'x', since I use that already, since
some datasheets use 'X' or 'x', and since it doesn't conflict with
other potential uses for '-' in the chip name.

> The datasheet I have is Rev 3.0 (April 8, 2008). =A0According to the revi=
sion
> history, id_data[4] was updated in Rev 2.0. =A0Would this fit your datash=
eet?

Yes, my sheet is Rev 01 (Dec 14, 2006), so it's probably out of date.
I'll Ack the 'id_data[4] =3D 0x10'

> id_data[2] is 0x01 for the "ECC-free/0% bad blocks" device, and 0x00 for =
the
> "ECC required/2% bad blocks" model. =A0This "Notes" column already mentio=
ns this.
>
>> Anyway, it may be apparent by now that I don't actually have a sample
>> of this chip myself. I'll go with whoever has a current data sheet
>> and/or actual chip.
>
> I haven't tested one myself either - I will see if we have any samples ly=
ing
> around, but I suspect not...

No problem. We do have the actual ID string from Gernot which confirms
your change.

Brian
