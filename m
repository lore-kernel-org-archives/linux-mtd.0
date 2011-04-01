Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5foJ-0002dO-Fk
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 14:58:52 +0000
Date: Fri, 1 Apr 2011 16:58:47 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Subject: Re: [PATCH] Newly erased page read workaround
In-Reply-To: <20110401144906.GC19151@parrot.com>
Message-ID: <Pine.LNX.4.64.1104011653430.18181@lnxricardw.se.axis.com>
References: <1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost> <4D9595AB.1050604@st.com>
	<20110401121447.GA19151@parrot.com>
	<1301663081.2789.65.camel@localhost>
	<20110401140429.GB19151@parrot.com>
	<1301667361.2789.84.camel@localhost>
	<20110401144906.GC19151@parrot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Vipin Kumar <vipin.kumar@st.com>,
	Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Viresh KUMAR <viresh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 1 Apr 2011, Ivan Djelic wrote:

>> I'm curious, if the OOB area is so unreliable, how can we trust it to
>> store our ECC? We need a mini-ECC for the ECC then?
>
> The oob area is no different from the data area (same technology).
> Fortunately, Hamming and BCH codes (and usual ECC codes in general) actua=
lly
> have built-in robustness to corruption.

At least with Hamming, when the ECC has been calculated, if it differs=20
from the ECC read from the oob, and the difference is just a single bit,=20
it is assumed that the ECC stored in the oob was subjected to a bitflip,=20
and the data is in fact ok. (A long time ago there was a bug in this in=20
mtd, so that a (single) bit flip in the ECC bytes was flagged as an ECC=20
failure).

I don't know how BCH (and other multiple-error-bit algorithms) deals with=
=20
this though. Does it assume that there will be at most one bitflip within=
=20
the ECC data (which is much smaller than the bytes covered by the ECC), or=
=20
does it accept multiple bit errors also in the ECC data? One would assume=
=20
that it would start to get difficult to distinguish multiple bit errors in=
=20
the ECC data with valid ECC indicating bit errors in the data, but perhaps=
=20
this isn't so thanks to the algorithm used?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
