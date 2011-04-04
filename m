Received: from smtp.nokia.com ([147.243.1.48] helo=mgw-sa02.nokia.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6dIx-0007li-NL
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 06:30:29 +0000
Subject: Re: [PATCH resend] Newly erased page read workaround
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
To: ext Vipin Kumar <vipin.kumar@st.com>
In-Reply-To: <4D995AF9.9030601@st.com>
References: <1301653534-22223-1-git-send-email-viresh.kumar@st.com>
	<1301657448.2789.44.camel@localhost>  <4D95BA32.6040709@st.com>
	<1301658275.2789.45.camel@localhost>  <4D995AF9.9030601@st.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 04 Apr 2011 09:27:54 +0300
Message-ID: <1301898474.2760.0.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Viresh KUMAR <viresh.kumar@st.com>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>,
	amitgoel <amit.goel@st.com>, Armando VISCONTI <armando.visconti@st.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>,
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

On Mon, 2011-04-04 at 11:15 +0530, ext Vipin Kumar wrote:
> On 4/1/2011 5:14 PM, Artem Bityutskiy wrote:
> > On Fri, 2011-04-01 at 17:12 +0530, ext Vipin Kumar wrote:
> >> Temporary because the fsmc peripheral itself needs a fix for this problem
> > 
> > Do you mean a hardware fix?
> > 
> Ideally speaking, Yes

Then the comment is not saying the truth I think - this solution is
permanent.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
