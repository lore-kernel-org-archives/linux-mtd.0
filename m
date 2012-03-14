Received: from eu1sys200aog102.obsmtp.com ([207.126.144.113])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7jU8-0001LE-2S
 for linux-mtd@lists.infradead.org; Wed, 14 Mar 2012 08:23:04 +0000
Message-ID: <4F605535.7090506@st.com>
Date: Wed, 14 Mar 2012 13:52:13 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: [PATCH 08/18] fsmc/nand: Add support for default partitions for
 several NAND devices
References: <cover.1331119143.git.vipin.kumar@st.com>
 <1331647621.3595.64.camel@sauron.fi.intel.com> <4F603BC0.7050808@st.com>
 <201203140810.10964.sr@denx.de>
In-Reply-To: <201203140810.10964.sr@denx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Armando VISCONTI <armando.visconti@st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 "dbaryshkov@gmail.com" <dbaryshkov@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Vincenzo FRASCINO <Vincenzo.FRASCINO@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3/14/2012 12:40 PM, Stefan Roese wrote:
> On Wednesday 14 March 2012 07:33:36 Vipin Kumar wrote:
>> On 3/13/2012 7:37 PM, Artem Bityutskiy wrote:
>>> On Tue, 2012-03-13 at 14:36 +0100, Stefan Roese wrote:
>>>> No problem.
>>>>
>>>> But the patch still applies clean onto kernel.org.
>>>
>>> OK.
>>
>> I am sorry for pitching in too late. It seems that Stefan, Linus and I
>> have sent the same patch (in the same order) achieving same result. It
>> was a mistake on my part to not have rebased on either of these patches.
>>
>> Artem, please suggest how to proceed as there would be conflicts if you
>> try to apply Stefan's patch before my patch-set
>
> I suggest to just drop my patch then, since I still have to rebase it on-top
> of the l2 tree. So easiest is most likely, to apply Vipins's patchset now.
>
> Okay?
>

Thanks Stefan

> Thanks,
> Stefan
