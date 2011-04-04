Received: from smtp.nokia.com ([147.243.128.26] helo=mgw-da02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6fiF-0000OL-9R
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 09:04:43 +0000
Subject: Re: [PATCH resend] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: Vipin Kumar <vipin.kumar@st.com>
In-Reply-To: <4D9988A1.1030405@st.com>
References: <1301653534-22223-1-git-send-email-viresh.kumar@st.com>
	<1301657448.2789.44.camel@localhost> <4D95BA32.6040709@st.com>
	<1301658275.2789.45.camel@localhost> <4D995AF9.9030601@st.com>
	<1301898474.2760.0.camel@localhost>  <4D9988A1.1030405@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 12:02:05 +0300
Message-ID: <1301907725.2760.45.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Viresh KUMAR <viresh.kumar@st.com>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>, amitgoel <amit.goel@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2011-04-04 at 14:30 +0530, Vipin Kumar wrote:
> On 4/4/2011 11:57 AM, Artem Bityutskiy wrote:
> > On Mon, 2011-04-04 at 11:15 +0530, ext Vipin Kumar wrote:
> >> On 4/1/2011 5:14 PM, Artem Bityutskiy wrote:
> >>> On Fri, 2011-04-01 at 17:12 +0530, ext Vipin Kumar wrote:
> >>>> Temporary because the fsmc peripheral itself needs a fix for this problem
> >>>
> >>> Do you mean a hardware fix?
> >>>
> >> Ideally speaking, Yes
> > 
> > Then the comment is not saying the truth I think - this solution is
> > permanent.
> > 
> 
> That's why it is a workaround
> I thought "workaround" says it all

I thought we were talking about word "temporary". Temporary means "will
be fixed very very soon".

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
