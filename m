Received: from eu1sys200aog116.obsmtp.com ([207.126.144.141])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q6g5T-0000bb-06
	for linux-mtd@lists.infradead.org; Mon, 04 Apr 2011 09:28:44 +0000
Message-ID: <4D998F3A.1030109@st.com>
Date: Mon, 4 Apr 2011 14:58:26 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH resend] Newly erased page read workaround
References: <1301653534-22223-1-git-send-email-viresh.kumar@st.com>	
	<1301657448.2789.44.camel@localhost> <4D95BA32.6040709@st.com>	
	<1301658275.2789.45.camel@localhost> <4D995AF9.9030601@st.com>	
	<1301898474.2760.0.camel@localhost> <4D9988A1.1030405@st.com>
	<1301907725.2760.45.camel@localhost>
In-Reply-To: <1301907725.2760.45.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Viresh KUMAR <viresh.kumar@st.com>,
	"David.Woodhouse@intel.com" <David.Woodhouse@intel.com>,
	Shiraz HASHIM <shiraz.hashim@st.com>, amitgoel <amit.goel@st.com>,
	Armando VISCONTI <armando.visconti@st.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 4/4/2011 2:32 PM, Artem Bityutskiy wrote:
> On Mon, 2011-04-04 at 14:30 +0530, Vipin Kumar wrote:
>> On 4/4/2011 11:57 AM, Artem Bityutskiy wrote:
>>> On Mon, 2011-04-04 at 11:15 +0530, ext Vipin Kumar wrote:
>>>> On 4/1/2011 5:14 PM, Artem Bityutskiy wrote:
>>>>> On Fri, 2011-04-01 at 17:12 +0530, ext Vipin Kumar wrote:
>>>>>> Temporary because the fsmc peripheral itself needs a fix for this problem
>>>>>
>>>>> Do you mean a hardware fix?
>>>>>
>>>> Ideally speaking, Yes
>>>
>>> Then the comment is not saying the truth I think - this solution is
>>> permanent.
>>>
>>
>> That's why it is a workaround
>> I thought "workaround" says it all
> 
> I thought we were talking about word "temporary". Temporary means "will
> be fixed very very soon".
> 

OK. May be I misunderstood it...
This patch would not be needed for devices using the fixed hardware
And I thought since it is the hardware which is at fault, this patch is a 
workaround, but yes, it may need a longer time to get fixed

Regards
Vipin
