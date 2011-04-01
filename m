Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5e4G-0001CY-BQ
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 13:07:13 +0000
Subject: Re: [PATCH] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
In-Reply-To: <20110401121447.GA19151@parrot.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost> <4D9595AB.1050604@st.com>
	<20110401121447.GA19151@parrot.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 16:04:41 +0300
Message-ID: <1301663081.2789.65.camel@localhost>
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

On Fri, 2011-04-01 at 14:14 +0200, Ivan Djelic wrote:
> Did you consider this idea: if you have an unused byte available in oob,
> program it to 0x00 when a page is programmed.

I guess this depends on the the controller, but probably this could mean
a substantial write  overhead, not?

> That way, you just need to check a single byte when you read a page in order
> to distinguish erased pages from programmed pages. And by counting the number
> of 1s in the byte, you can be robust to bitflips.

Could you please explain some more what do you mean? So you write the
0x00 byte. Then when you read, you count the number of "1" bits in the
byte. And what exactly this count gives you and to which bitflips you
become robust?

> As a special refinement, you could also "cleanup" pages detected as erased, in
> order to iron out possible bitflips.

What do you mean by "cleanup" a page?

Thanks!

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
