Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5au8-0007jm-MJ
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 09:44:33 +0000
Subject: Re: [PATCH] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Vipin Kumar <vipin.kumar@st.com>
In-Reply-To: <4D9595AB.1050604@st.com>
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost>  <4D9595AB.1050604@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 01 Apr 2011 12:42:06 +0300
Message-ID: <1301650926.2789.40.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Viresh KUMAR <viresh.kumar@st.com>,
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

On Fri, 2011-04-01 at 14:36 +0530, Vipin Kumar wrote:
> Yes, I understand the issue and would write more details about it in the 
> patch comment. Moreover, the comparison id only expensive when the page 
> contains all FFs.. Most of the time comparison would fail at first few bytes

OK, actually yes, probably this ECC check is not needed. Anyway, will
you send the updated patch please?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
