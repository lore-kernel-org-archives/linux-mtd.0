Received: from smtp.nokia.com ([147.243.128.24] helo=mgw-da01.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5h3Y-0003j6-CB
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 16:18:41 +0000
Subject: Re: [PATCH] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: ext Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <20110401160940.GB21475@parrot.com>
References: <1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost> <4D9595AB.1050604@st.com>
	<20110401121447.GA19151@parrot.com>
	<1301663081.2789.65.camel@localhost>
	<20110401140429.GB19151@parrot.com>
	<1301667361.2789.84.camel@localhost>
	<20110401160940.GB21475@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 19:16:07 +0300
Message-ID: <1301674567.2789.117.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Vipin Kumar <vipin.kumar@st.com>, Viresh KUMAR <viresh.kumar@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2011-04-01 at 18:09 +0200, ext Ivan Djelic wrote:
> I had a quick look at fsmc_nand.c, and I don't see anything in the controller
> preventing this approach. The driver provides an IO_ADDR_W address for sending
> data to the NAND device, and lets mtd upper layers do the job. By implementing
> the page writing function in the driver, one could clear the marker in the oob
> array before programming (and check it in the page reading function).

OK, cool!

> I would be very surprised if the controller did not allow control over oob
> contents other than ecc bytes. By doing so, it would prevent things like
> software bad block marking. But sometimes hardware can be very surprising :)

Well, I actually meant that programming OOB could be a separate
operation (not impossible): instead of "write data, oob data and ECC in
one go", something like "write data and oob, wait for completion, write
additional oob byte". So I meant that this could have write speed
impact. But this does not matter, since this is not the case now.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
