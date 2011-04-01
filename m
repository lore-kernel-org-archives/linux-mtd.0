Received: from eu1sys200aog107.obsmtp.com ([207.126.144.123])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Xqd-00027K-6M
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 06:28:44 +0000
Message-ID: <4D95708A.7080204@st.com>
Date: Fri, 1 Apr 2011 11:58:26 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH] Newly erased page read workaround
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>
	<1301579475.2828.82.camel@localhost>
In-Reply-To: <1301579475.2828.82.camel@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Viresh KUMAR <viresh.kumar@st.com>,
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

On 3/31/2011 7:21 PM, Artem Bityutskiy wrote:
> Hi,
> 

Hello Artem,

> sorry for late reply, was too busy and also missed your patch somehow.
> 
> On Thu, 2011-02-24 at 11:40 +0530, Viresh Kumar wrote:
>> From: Vipin Kumar <vipin.kumar@st.com>
>>
>> A newly erased page contains ff in data as well as spare area. While reading an
>> erased page, the read out ecc from spare area does not match the ecc generated
>> by fsmc ecc hardware accelarator. This is because ecc of data ff ff is not ff
>> ff. This leads to errors when jffs2 fs erases and reads back the pages to
>> ensure consistency.
>>
>> This patch adds a software workaround to ensure that the ecc check is not
>> performed for erased pages. An erased page is checked by checking data as ff ff.
>>
>> Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
>> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
>> Acked-by: Linus Walleij <linus.walleij@stericsson.com>
> 
> ...
> 
>> +		/*
>> +		 * This is a temporary erase check. A newly erased page read
>> +		 * would result in an ecc error because the oob data is also
>> +		 * erased to FF and the calculated ecc for an FF data is not
>> +		 * FF..FF.
>> +		 * This is a workaround to skip performing correction in case
>> +		 * data is FF..FF
>> +		 */
>> +		for (k = 0; k < eccsize; k++) {
>> +			if (*(p + k) != 0xff)
>> +				break;
>> +		}
>> +
> 
> So eccsize is 512, and you are going to compare 512 bytes on every read?
> Isn't it a very bad and wasteful solution? May be you could invent
> something less straight-forward but more optimal?
> 
> Let's suppose ECC corresponding to all 0xFFs is P. May be you could do
> this wasteful check only if ECC == P, not all the time?
> 

Basically, the hardware only reports the flipped bit offset and not the actual ecc 
at the time of reading. It reports ecc only at the time of writing. So, comparing 
ECCs is not a possibility while reading.

The other solution can be to write P into OOB every time a page is erased. In that 
case we put a hook in erase. But since the read implementation was anyway specific 
for fsmc bch ecc4 scheme, this implementation was more convinient...

> Also, Ivan pointed you the right thing - you might have bit-flips on an
> erased eraseblock. If not on freshly, then on an erasblock which was
> erased and then not used for long time. If this is not of your concern,

In that case an ecc error would be reported since the ecc wont match the stored 
ecc i.e FFFF and the driver would mark it as a normal corrupted page

> then at least write this in the comments and tell that you know about
> this issue but for reasons X and Y you do not handle them.
> 

OK. I would add this in the patch comments

> Thanks!
> 

Regards
Vipin
