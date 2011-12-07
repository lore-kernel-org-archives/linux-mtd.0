Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RYMYq-00008T-QX
 for linux-mtd@lists.infradead.org; Wed, 07 Dec 2011 18:49:46 +0000
Received: by wgbdt11 with SMTP id dt11so1212842wgb.18
 for <linux-mtd@lists.infradead.org>; Wed, 07 Dec 2011 10:49:41 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1323173269-19931-2-git-send-email-angus.clark@st.com>
References: <1323173269-19931-1-git-send-email-angus.clark@st.com>
 <1323173269-19931-2-git-send-email-angus.clark@st.com>
Date: Wed, 7 Dec 2011 10:49:41 -0800
Message-ID: <CAN8TOE9=Yh=pZkX3DePEwpnjZwqODwc-JLCSYkF_bKt5GzF4=A@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 02/13] nand-data: updates to S30ML-P devices
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Gernot Hoyler <gernot.hoyler@spansion.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 6, 2011 at 4:07 AM, Angus CLARK <angus.clark@st.com> wrote:
> Updates to Spansion S30ML-P devices:
> =A0 =A0 =A0 =A0- expand names to differentiate between x8 and x16 devices

Expanding the names is probably good, but I don't really like the
"-FI{00,50}" piece. There are a few places where I used a wildcard in
the table to represent "don't care" characters. I think a lower-case
`x' might make sense, for example:

S30ML512P30-FIx0
S30ML512P50-FIx1
S30ML256P30-FIx0
...

Or perhaps a hyphen, which I think the datasheet is already using as a
don't care marker:

S30ML512P30-FI-0
S30ML512P50-FI-1
S30ML256P30-FI-0
...

Whichever way we go (hyphen or `x') should be standardized across the
table from now on.

> =A0 =A0 =A0 =A0- fix ID 5th byte: 0x01 to 0x10 (checked with datasheet; s=
eems regression
> =A0 =A0 =A0 =A0 =A0introduced as part of commit 165cfaa9cdb1054bbafa98f24=
f179c6aa101fbe6
> =A0 =A0 =A0 =A0 =A0"nand-data: remove asterisks")

Hmm, not exactly a regression, but I overlooked it when merging in
changes to my local table. In fact, I have a data sheet that lists the
ID with 0x01, but it may be out of date. It's hard to find a current
one from Spansion's website, although a random copy I found off a
third party site confirms your given string, I think. Then, there's a
posting from Gernot Hoyler last year that gives this sample string.
It's slightly different (at id_data[2]):

   id_data[0]=3D0x01
   id_data[1]=3D0x56
   id_data[2]=3D0x00
   id_data[3]=3D0x01
   id_data[4]=3D0x10
   id_data[5]=3D0x00
   id_data[6]=3D0x00
   id_data[7]=3D0x00

I'm thinking:

id_data[2] =3D 0x00 or 0x01, depending on model as stated in data sheet.
I just ignored the 0x00 option.
id_data[4] =3D 0x10

Anyway, it may be apparent by now that I don't actually have a sample
of this chip myself. I'll go with whoever has a current data sheet
and/or actual chip.

Brian
