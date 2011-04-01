Received: from eu1sys200aog104.obsmtp.com ([207.126.144.117])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5ckx-0000Hu-3o
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 11:43:11 +0000
Message-ID: <4D95BA32.6040709@st.com>
Date: Fri, 1 Apr 2011 17:12:42 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH resend] Newly erased page read workaround
References: <1301653534-22223-1-git-send-email-viresh.kumar@st.com>
	<1301657448.2789.44.camel@localhost>
In-Reply-To: <1301657448.2789.44.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Viresh KUMAR <viresh.kumar@st.com>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>,
	amitgoel <amit.goel@st.com>, Armando VISCONTI <armando.visconti@st.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/1/2011 5:00 PM, Artem Bityutskiy wrote:
> On Fri, 2011-04-01 at 15:55 +0530, ext Viresh Kumar wrote:
>> +		/*
>> +		 * This is a temporary erase check. A newly erased page read
>> +		 * would result in an ecc error because the oob data is also
>> +		 * erased to FF and the calculated ecc for an FF data is not
>> +		 * FF..FF.
>> +		 * This is a workaround to skip performing correction in case
>> +		 * data is FF..FF
>> +		 */
> 
> Sorry, but still questions.
> 
> The comment says this is temporary - why? When and how this going to be
> change to become "permanent".
> 

Temporary because the fsmc peripheral itself needs a fix for this problem

> And you still did not add words about the problem with bit-flips.
> 

OK, I would add that too
