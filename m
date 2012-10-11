Message-ID: <507648F5.1030404@st.com>
Date: Thu, 11 Oct 2012 09:50:05 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 09/11] fsmc/nand:FIX: replace change_bit routine
References: <cover.1349778820.git.vipin.kumar@st.com>
 <ec169eb041e87e66c06108e85ea4a67e5797cecc.1349778821.git.vipin.kumar@st.com>
 <CACRpkdaot3DKCoJOBpUcJFVrJ89xRx2T58fDe4YKY_r4NFqEag@mail.gmail.com>
 <20121010204546.GK4625@n2100.arm.linux.org.uk>
In-Reply-To: <20121010204546.GK4625@n2100.arm.linux.org.uk>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Nicolas Pitre <nico@linaro.org>,
 "plagnioj@jcrosoft.com" <plagnioj@jcrosoft.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/11/2012 2:15 AM, Russell King - ARM Linux wrote:
> On Wed, Oct 10, 2012 at 07:22:04PM +0200, Linus Walleij wrote:
>> On Tue, Oct 9, 2012 at 12:44 PM, Vipin Kumar<vipin.kumar@st.com>  wrote:
>>
>>> change_bit routine accepts only ulong pointers as buffer, so an unaligned char
>>> pointer passed to change_bit may lead to a crash.
>>>
>>> Fix this bug by accessing the buffer as char pointer.
>>
>> Why not see if we can fix change_bit() instead?
>> Since I suspect this is on ARM I bet Russell and Nico
>> want to hear about this if there is a problem.
>
> Not particularly.  There's a reason the argument to change_bit() is typed
> 'unsigned long' and that's not because it can take a void, char, or a
> short.  It's because it _expects_ the buffer to be aligned to an
> "unsigned long" quantity.
>
> That's because on many architectures, misaligned loads and stores are
> not atomic operations - and in this case, load/store exclusive will
> fail when they're misalighed.
>
> So...
>
> -                       change_bit(err_idx[i], (unsigned long *)dat);
>
> is highly invalid code.
>

Thanks. Got your point

>> Can the ARM change_bit() not be fixed, so that
>> long arguments are the only option?
>
> Spot the intentional cast:
>
>>> -                       change_bit(err_idx[i], (unsigned long *)dat);
>
> which tries to work around this.  Remember my attitude towards casts:
> if you're having to use a cast, you are _probably_ doing something
> wrong.  In this case, it's hiding a warning which was saying that
> the code is doing something wrong, and then the result blows up.
> By adding that cast, the wrong wire was cut... you get to keep the
> remains. ;)
> .

I agree with you. Although I was a bit relaxed this time, I would really 
think before adding a cast explicitly just to avoid a warning

-Vipin
