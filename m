Received: from eu1sys200aog115.obsmtp.com ([207.126.144.139])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkaMS-0000hx-KR
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 11:59:29 +0000
Message-ID: <4F0C2818.6020208@st.com>
Date: Tue, 10 Jan 2012 11:59:20 +0000
From: Angus CLARK <angus.clark@st.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH (mtd-www) 5/7] nand-data: add columns to the table
References: <1325780040-19809-1-git-send-email-angus.clark@st.com>
 <1325780040-19809-5-git-send-email-angus.clark@st.com>
 <CAN8TOE_VO29CuL2eAFEmb+xUbhpA1_eiH=podORq5wsYqTZaUA@mail.gmail.com>
In-Reply-To: <CAN8TOE_VO29CuL2eAFEmb+xUbhpA1_eiH=podORq5wsYqTZaUA@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

Thanks for reviewing the patches.

On 01/09/2012 07:38 PM, Brian Norris wrote:
> On Thu, Jan 5, 2012 at 8:13 AM, Angus CLARK <angus.clark@st.com> wrote:
> These patches get a little harder to deal with when there are columns
> added, since line-by-line diff is pretty useless! 

Indeed, 'diff' is not particularly helpful when adding columns.  When re-doing
the patches, I will attach an openoffice (.ods) version of the file, with the
new columns highlighted in red.  This should make it easier to see what
information has been added.  Then, by deleting the red columns, saving as CSV,
and diff'ing with the previous version, we can check no other changes have been
introduced.  What do you think?

> 
> Potential unintended changes:
> 
> * Under the ONFI column, you changed "1.0" to just "1" (on, for
> example, Numonyx NAND04GR3B2). I'm guessing that your CSV editor did
> this automatically, treating it like an integer. 

Yes, I forgot to set the column format!  Hopefully the work-flow mentioned above
will catch this type of error.

> * Scan page 1: you missed Samsung K9XDG08U5D, which should have 'Scan
> Page 1 = FALSE'

Yes, I will correct this in the next version of the patch.

> * CS, LUNs, R/B#: looks good, although I didn't do in-depth review of
> *all* the data sheets :)

It does get a bit tedious!  I also want to add the number of planes at some
point, but this will have to wait a while!

> * I/O I/F: is this an abbreviation for "Input/Output Interfaces"?

Yes, although different manufacturers tend to use different names.  It is used
here to mean the control signals (CL, AL, WE#, RE#) and the data lines (DQ[7:0]
or DQ[15:0]).  Some multi-CS devices share a single interface (typically on TSOP
packages), whereas some use a dual interface (typically BGA packages).

> * Under the "Base Part" column, you have a typo where "M29F2G08AAC"
> should be "MT29F2G08AAC"

Yes, I will correct this in the next version of the patch.

> * When you list "NAND04G-B2D" in the "Base Part" column, can you
> either use the lowercase "x" for a wildcard as we discussed or just
> state the exact chip name when possible?

I will use the exact chip name -- I should have used this in the first place!

> Overall, I've been a little fuzzy on how various multi-LUN
> configurations are handled; mostly, I deal with single-CS chips, but I
> thought I was getting the hang of how multiple LUNs were introduced
> via the CS and R/B pins. However, I see that there are occasionally
> multi-LUN chips where `Num. LUNs > Num. CS'. Apparently, there are
> multiple LUNs on the same CE# and R/B# lines. Are such LUNs handled
> transparently, such that no special board wiring is needed and that
> software doesn't notice a difference? And is this where multi-plane
> operations come into the picture?

Yes, a device that comprises two LUNs on a single CS will handle the routing
internally, based on upper address bit(s).  Typically, the device will also
support multi-LUN, interleaved, operations.  (This is different to multi-plane
support though.)

> Similarly, I'm not sure of the exact meaning of I/O I/F (as asked
> above). I see that it is delineated in some datasheets as "number of
> I/O", but it's not clearly defined.
> 

The Micron datasheets give some nice diagrams, see MT29F64G08CBAAA for example
(p20-25 on my Rev. E version).  This is a good example to look at, since the
family of devices support multi-LUN and multi-plane operations.

I did this little ascii diagram a while ago, but the Micron ones are probably
better:

           --------------------------------------------------------------
           |   Device (Package)                                         |
           |                                                            |
           |    ----------------------------------------------------    |
           |    | Chip 0 (Target 0)                                |    |
    CE0# --|--->|                                                  |    |
           |    |  ---------------------    ---------------------  |    |
           |    |  | LUN 0 (Die 0)     |    | LUN 1 (Die 1)     |  |    |
           |    |  |         |         |    |         |         |  |    |
           |    |  |         |         |    |         |         |  |    |
           |    |  | Plane 0 | Plane 1 |    | Plane 0 | Plane 1 |  |    |
           |    |  ---------------------    ---------------------  |    |
           |    |                                                  |    |
           |    ----------------------------------------------------    |
           |                                                            |
           |    ----------------------------------------------------    |
           |    | Chip 1 (Target 1)                                |    |
    CE1# --|--->|                                                  |    |
           |    |  ---------------------    ---------------------  |    |
           |    |  | LUN 0 (Die 0)     |    | LUN 1 (Die 1)     |  |    |
           |    |  |         |         |    |         |         |  |    |
           |    |  |         |         |    |         |         |  |    |
           |    |  | Plane 0 | Plane 1 |    | Plane 0 | Plane 1 |  |    |
           |    |  ---------------------    ---------------------  |    |
           |    |                                                  |    |
           |    ----------------------------------------------------    |
           |                                                            |
           --------------------------------------------------------------


Cheers,

Angus
