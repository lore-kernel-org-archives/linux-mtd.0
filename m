Received: from mail-we0-f177.google.com ([74.125.82.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rlon1-0004uW-3V
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 21:35:59 +0000
Received: by werp12 with SMTP id p12so951291wer.36
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 13:35:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <4F0C2818.6020208@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
 <1325780040-19809-5-git-send-email-angus.clark@st.com>
 <CAN8TOE_VO29CuL2eAFEmb+xUbhpA1_eiH=podORq5wsYqTZaUA@mail.gmail.com>
 <4F0C2818.6020208@st.com>
Date: Fri, 13 Jan 2012 13:35:56 -0800
Message-ID: <CAN8TOE8umqGDJmi3Jtc=7vzqThhv6OxOz=GRmReNm9h_=SAVgw@mail.gmail.com>
Subject: Re: [PATCH (mtd-www) 5/7] nand-data: add columns to the table
From: Brian Norris <computersforpeace@gmail.com>
To: Angus CLARK <angus.clark@st.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Tue, Jan 10, 2012 at 3:59 AM, Angus CLARK <angus.clark@st.com> wrote:
> Thanks for reviewing the patches.

You're welcome! And thanks for your efforts. I'll try to finish the review =
soon.

> On 01/09/2012 07:38 PM, Brian Norris wrote:
>> On Thu, Jan 5, 2012 at 8:13 AM, Angus CLARK <angus.clark@st.com> wrote:
>> These patches get a little harder to deal with when there are columns
>> added, since line-by-line diff is pretty useless!
>
> Indeed, 'diff' is not particularly helpful when adding columns. =A0When r=
e-doing
> the patches, I will attach an openoffice (.ods) version of the file, with=
 the
> new columns highlighted in red. =A0This should make it easier to see what
> information has been added. =A0Then, by deleting the red columns, saving =
as CSV,
> and diff'ing with the previous version, we can check no other changes hav=
e been
> introduced. =A0What do you think?

This is essentially the same approach as already I used on the last
version of this patch; I applied your patches to a local mtd-www tree,
opened the new CSV in OpenOffice, removed the new columns, saved to
CSV and then diff'd with the original to check the side effects. This
isn't foolproof, but it worked OK.

I think your approach has a few less desirable side effects:

For one, I would be reviewing two independent pieces of work: your ODS
spreadsheet and your CSV patch. Although they *should* be fairly
interchangeable, I think it would be better for my review to be based
on the actual content.

Second, I think attachments are discouraged on this mailing list,
especially non-text. I could be wrong however, and anyway, mtd-www
development isn't really as strict, so this point isn't as important,
I believe.

Really, your approach only saves me the time of applying the patch, so
personally, while I appreciate the effort, it may work out better (for
my own work) to just go with a single data hunk (the patch diff) and I
can work from there to generate my own test spreadsheets.

>> ... However, I see that there are occasionally
>> multi-LUN chips where `Num. LUNs > Num. CS'. Apparently, there are
>> multiple LUNs on the same CE# and R/B# lines. Are such LUNs handled
>> transparently, such that no special board wiring is needed and that
>> software doesn't notice a difference? And is this where multi-plane
>> operations come into the picture?
>
> Yes, a device that comprises two LUNs on a single CS will handle the rout=
ing
> internally, based on upper address bit(s). =A0Typically, the device will =
also
> support multi-LUN, interleaved, operations. =A0(This is different to mult=
i-plane
> support though.)
...
> The Micron datasheets give some nice diagrams, see MT29F64G08CBAAA for ex=
ample
> (p20-25 on my Rev. E version). =A0This is a good example to look at, sinc=
e the
> family of devices support multi-LUN and multi-plane operations.

Thanks for the pointers (and your diagram). I had found some similar
diagrams in other Micron datasheets and was getting a better
understanding, but your perspective is enlightening as well.

Brian
