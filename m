Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RScC7-00075q-FQ
 for linux-mtd@lists.infradead.org; Mon, 21 Nov 2011 22:18:36 +0000
Received: by wwe32 with SMTP id 32so7378038wwe.18
 for <linux-mtd@lists.infradead.org>; Mon, 21 Nov 2011 14:18:28 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4E730494.7030509@st.com>
References: <1301474413-28821-1-git-send-email-b32955@freescale.com>
 <1301474413-28821-4-git-send-email-b32955@freescale.com>
 <201103301046.04357.ffainelli@freebox.fr>
 <4D92F277.7060607@freescale.com>
 <1301566248.2828.40.camel@localhost>
 <AANLkTi=59br1KueZupGevB4DgP7UqBKRgbGgRvsjgH-8@mail.gmail.com>
 <CAN8TOE9-iEPyWXLsxddeofazgrCWDWKgrx6eBkr7vdKErfgeCA@mail.gmail.com>
 <4E730494.7030509@st.com>
Date: Mon, 21 Nov 2011 14:18:28 -0800
Message-ID: <CAN8TOE_87PvCbSemkM5auioo1z0FDTnmoQ813N9Xj09O36S2rA@mail.gmail.com>
Subject: Re: [PATCH V3 3/6] MTD : add the database for the NANDs
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie8@gmail.com>, Florian Fainelli <ffainelli@freebox.fr>,
 linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Huang Shijie <b32955@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang, Angus (and anyone else interested in NAND ID decoding),

I have some responses to both Huang and Angus.

Huang:

On Wed, Sep 14, 2011 at 7:21 PM, Huang Shijie <b32955@freescale.com> wrote:
> I do not need the SLC/MCL info. But i do need the ECC strength for the BC=
H.
> Currently i compute it myself based on the ECC chunk size to be 512 bytes=
.
> It's ok now.
...
> So, add the ECC strength to nand is worthful ( at least, it's useful for
> ONFI nand) .

For ONFI NAND, you can pull information from the ONFI parameter page
(found in chip->onfi_params.ecc_bits) plus you need to read and decode
the ECC information block. That's up to you to code and submit,
though, which you haven't taken the time to do so far.

>> Thus, it seems to me like we will need some form of the approach
>> provided by Huang. As I've found, there are some things that just
>> can't be decoded from the ID these days, so our ID table will need to
>> be able to track:
>> * full ID string (not just the 2nd byte "Device ID")
>
> The same idea as mine. :)   I also thought it's better to store all the I=
D
> bytes.

We cannot store all the strings for all chips. I think Angus has a
little better of an idea, discussed below.

Angus:

On Fri, Sep 16, 2011 at 1:11 AM, Angus CLARK <angus.clark@st.com> wrote:
> On 09/14/2011 04:44 PM, Brian Norris wrote:
>> I see nothing has happened with this thread recently. It doesn't
>> deserve to die though.
>
> Having played around with the nand_ids.c and nand_get_flash_type(), I
> also think the approach is in need of a bit of an overhaul. =A0The code i=
s
> getting increasingly difficult to follow, given the growing number of
> non-standard decoding exceptions.

Personally, I've spent a lot of time verifying and using this code, so
I don't have a particular problem with its difficulty. But if there
are real improvements that are coupled with some reorganization for
clarity, then I'm fine with it.

> My first attempt was rather similar to Huang's -- using a static table
> of READIDs and extended device properties.

We cannot maintain a full static table of all chips.

> We could add a
> "matching-mask" to the table, and enforce some ordering to the binding
> process (e.g. bind against the first match in the table, or perhaps the
> most-specific match in the table?), but the semantics of the
> table-ordering is difficult to enforce, especially when new devices are
> added later.

I think it'd be easy enough to order chips in "specificity" order; for
instance, divide the table (via comments) into 6-byte, 5-byte, 4-byte,
2-byte, etc. strings (similar to the current nand_ids.c table, where
we section off the 256 Mbit, 512 Mbit, etc.)

> Using a static table also has other disadvantages, such as
> size and the need to continually update as new devices emerge (my list
> is now over 300 devices!).

This is the key reason for the code as it stands. We try to write
rules that limit the number of exceptions and prevent having to
describe each and every device in a table. This is not possible for
some chips/manufacturers, however, when they make no attempt to
provide a pattern to their ID strings.

> I ended up refactoring the nand_get_flash_type() code, according to 3
> basic schemes:
>
> =A0 =A0 =A0 =A0'ID 2' : extract properties from nand_flash_ids[]. =A0For =
2-byte IDs, or
> where device ID gives a non-zero page-size (particularly SP devices).
>
> =A0 =A0 =A0 =A0'Extended ID': decode properties from ID string where poss=
ible, falling
> back to nand_flash_ids[]. =A0For 3/4/5-byte IDs.
>
> =A0 =A0 =A0 =A0'ID 6' =A0 =A0 =A0 : decode properties from ID string wher=
e possible,
> falling back to nand_flash_ids[]. =A0For 6-byte IDs.

As I see it, the only addition is the "ID 6" detection, correct? I
think this is a good start, but it could use more flexibility than
just a 6-byte string. Some 'exceptions' could have shorter or longer
known strings. Perhaps this is where we can use the masking approach
from above.

> I have also added a few more devices and columns to the table (#CS,
> #LUNs, #RBn) which I hope to submit shortly.

Might be useful. Patch it against the CSV in mtd-www.git
(nand-data/nanddata.csv) please.

> I was working on a non-standard NAND driver at the time, which made
> little use of nand_base.c, and on an older 2.6.32 tree. =A0However, if
> there is sufficient interest, I am happy at having a go at updating
> nand_get_flash_type() on mtd-2.6.
>
> Let me know if you think this might be useful.

Sure, it could be useful. It might be difficult to get everything
right, but if you have working suggestions, please send patches! I
think it's usually good to use l2-mtd-2.6 these days, since Artem does
most of the day-to-day MTD patch tracking in his git tree.

> =A0Perhaps posting the
> standalone test code I used on nanddata.html (actually a csv version of
> the table!) would be a good start?

Perhaps. If you have an easily testable framework for validating
against the CSV table from mtd-www.git, then it could be useful.
Personally, I've used a combination of spreadsheet formulas and manual
inspection to validate.

Brian
