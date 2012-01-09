Received: from mail-ww0-f49.google.com ([74.125.82.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkL2t-00031K-NR
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 19:38:20 +0000
Received: by wgbdt13 with SMTP id dt13so1414558wgb.18
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 11:38:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1325780040-19809-5-git-send-email-angus.clark@st.com>
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
 <1325780040-19809-5-git-send-email-angus.clark@st.com>
Date: Mon, 9 Jan 2012 11:38:13 -0800
Message-ID: <CAN8TOE_VO29CuL2eAFEmb+xUbhpA1_eiH=podORq5wsYqTZaUA@mail.gmail.com>
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

On Thu, Jan 5, 2012 at 8:13 AM, Angus CLARK <angus.clark@st.com> wrote:
> Add the following columns to the table:
> =A0 =A0 =A0 =A0- "Scan Page 1"
> =A0 =A0 =A0 =A0- "No. CS"
> =A0 =A0 =A0 =A0- "No. LUNs"
> =A0 =A0 =A0 =A0- "No. R/B#"
> =A0 =A0 =A0 =A0- "I/0 I/F"
> =A0 =A0 =A0 =A0- "Base Part"

These patches get a little harder to deal with when there are columns
added, since line-by-line diff is pretty useless! I kinda predicted
this would be a problem when I chose CSV format, but I don't see much
better alternatives that would be efficient (e.g., XML could work, but
that's a lot of overhead for tags, etc.) Anyway, I have a few
comments.

Potential unintended changes:

* Under the ONFI column, you changed "1.0" to just "1" (on, for
example, Numonyx NAND04GR3B2). I'm guessing that your CSV editor did
this automatically, treating it like an integer. It's not exactly
incorrect, but I think it works nicer to appear as 1.0. Perhaps (as a
separate patch), these can all be changed to quoted strings (their
entries do not have quotes ATM) to prevent arbitrary editor handling?

Regarding new content:

* I was thinking of adding "Scan Page 1" at some point, just for
completeness. Thanks.
* Scan page 1: you missed Samsung K9XDG08U5D, which should have 'Scan
Page 1 =3D FALSE'
* CS, LUNs, R/B#: looks good, although I didn't do in-depth review of
*all* the data sheets :)
* I/O I/F: is this an abbreviation for "Input/Output Interfaces"?
* Under the "Base Part" column, you have a typo where "M29F2G08AAC"
should be "MT29F2G08AAC"
* When you list "NAND04G-B2D" in the "Base Part" column, can you
either use the lowercase "x" for a wildcard as we discussed or just
state the exact chip name when possible?

Overall, I've been a little fuzzy on how various multi-LUN
configurations are handled; mostly, I deal with single-CS chips, but I
thought I was getting the hang of how multiple LUNs were introduced
via the CS and R/B pins. However, I see that there are occasionally
multi-LUN chips where `Num. LUNs > Num. CS'. Apparently, there are
multiple LUNs on the same CE# and R/B# lines. Are such LUNs handled
transparently, such that no special board wiring is needed and that
software doesn't notice a difference? And is this where multi-plane
operations come into the picture?

Similarly, I'm not sure of the exact meaning of I/O I/F (as asked
above). I see that it is delineated in some datasheets as "number of
I/O", but it's not clearly defined.

In light of some of the confusions above, perhaps we should add a
little bit of a legend/key on the web version of the table. We can
handle that after this patch goes through. The only changes I request
for now are regarding the 1.0 vs 1 change and the small "Base Part"
discrepancies and typos.

Thanks a lot!

Brian
