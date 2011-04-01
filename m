Received: from eu1sys200aog118.obsmtp.com ([207.126.144.145])
	by canuck.infradead.org with smtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5aJv-00062P-SR
	for linux-mtd@lists.infradead.org; Fri, 01 Apr 2011 09:07:09 +0000
Message-ID: <4D9595AB.1050604@st.com>
Date: Fri, 1 Apr 2011 14:36:51 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>
Subject: Re: [PATCH] Newly erased page read workaround
References: <c7baa4a77775b54f2ef8450d8d1f44d1dc011b41.1298527669.git.viresh.kumar@st.com>	
	<1301579475.2828.82.camel@localhost> <4D95708A.7080204@st.com>	
	<1301640710.2789.11.camel@localhost> <4D958DC2.5000607@st.com>
	<1301647180.2789.35.camel@localhost>
In-Reply-To: <1301647180.2789.35.camel@localhost>
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

On 4/1/2011 2:09 PM, Artem Bityutskiy wrote:
> On Fri, 2011-04-01 at 14:03 +0530, Vipin Kumar wrote:
>>>>> Also, Ivan pointed you the right thing - you might have bit-flips
>> on an
>>>>> erased eraseblock. If not on freshly, then on an erasblock which
>> was
>>>>> erased and then not used for long time. If this is not of your
>> concern,
>>>>
>>>> In that case an ecc error would be reported since the ecc wont
>> match the stored 
>>>> ecc i.e FFFF and the driver would mark it as a normal corrupted
>> page
>>>
>>> I'm confused. So you erased eraseblock A. Everything there contains
>>> 0xFFs, including the OOB area.
>>>
>>> Now you have one of the modern lashes. You gen bit-flips in the
>> page.
>>> Say, a couple of bits flip. You read this page. You compare the
>> contents
>>> of the page with 0xFF and find out that the contends in not all
>> 0xFFs.
>>> What do you do then?
>>>
>>
>> Then, the normal driver takes over and it reports an error because
>> the 
>> number of errors in the page are beyond 8 bits (maximum the FSMC ecc 
>> logic can correct).
> 
> Why 8? It may be just 1 single bit-flip. Just one bits becomes 0 instead
> of 1.
> 

It is a maximum of 8. So, the logic can correct any number of bitflips from 
1 to 8 in 512 bytes of data

>>  Effectively speaking, the read page returns an error 
>> indicating that the page could not be read properly
> 
> But why? It can be read properly. If this is just 1 wrong bit, you
> should be able to correct it. And as Ivan indicated, modern flashes are
> so crappy that 1 bit-flip on erased eraseblock is just normal there.
> 

That's the problem. Ideally the ecc should have been programmed in OOB and then 
the driver would be able to correct the flipped bits. The problem happens only 
if we try to read the erased pages.

>> Ideally, any filesystem would mark it as a bad block 
> 
> That's the point - no. This is normal on modern flashes.
> 
> I think one solution could be that you make your check more
> sophisticated. You check for 0xFFs, if this is not true, you see is this
> "almost all 0xFFs" and count amount of non-0xFF bits. If the count is,
> say, 2, you assume this page contains all 0xFFs plus 2 bit-flips. But
> I'm not sure it would work.
> 
> Anyway, If you do not care about such bit-flips for your SoC - fine. I
> just wanted you to understand and accept the issue and write about it in
> the comment. And I also wanted you to _not_ do expensive 0xFF comparison
> every time - but it seems you accepted this :-)
> 

Yes, I had to accept this :-)
The flip side is that the hardware itself should not report errors when it 
reads all ff data and ff ecc..It should assume it as an erased page and not 
report any errors

Yes, I understand the issue and would write more details about it in the 
patch comment. Moreover, the comparison id only expensive when the page 
contains all FFs.. Most of the time comparison would fail at first few bytes

Regards
Vipin
