Message-ID: <5076483F.5000102@st.com>
Date: Thu, 11 Oct 2012 09:47:03 +0530
From: Vipin Kumar <vipin.kumar@st.com>
MIME-Version: 1.0
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [PATCH 09/11] fsmc/nand:FIX: replace change_bit routine
References: <cover.1349778820.git.vipin.kumar@st.com>
 <ec169eb041e87e66c06108e85ea4a67e5797cecc.1349778821.git.vipin.kumar@st.com>
 <CACRpkdaot3DKCoJOBpUcJFVrJ89xRx2T58fDe4YKY_r4NFqEag@mail.gmail.com>
 <alpine.LFD.2.02.1210101559250.16518@xanadu.home>
In-Reply-To: <alpine.LFD.2.02.1210101559250.16518@xanadu.home>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 spear-devel <spear-devel@list.st.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

On 10/11/2012 1:51 AM, Nicolas Pitre wrote:
> On Wed, 10 Oct 2012, Linus Walleij wrote:
>
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
>>
>> Can the ARM change_bit() not be fixed, so that
>> long arguments are the only option?
>

Hello Nicolas

> No.  It is this code which is totally broken.
>

Yes, I understand and accept the probelm. That's why the fix

> The change_bit() is defined to operate on long values, in the _native_
> endian.  Now imagine what this is going to do to your data buffer if
> instead you are running on a big endian device.
>
> And I doubt there is anything requiring atomic bit manipulation here
> either.
>

No, there is no requirement for an atomic change_bit

>>>                  if (err_idx[i]<  chip->ecc.size * 8) {
>>> -                       change_bit(err_idx[i], (unsigned long *)dat);
>>> +                       uint8_t *p = dat + err_idx[i] / 8;
>>> +                       *p = *p ^ (1<<  (err_idx[i] % 8));
>>
>> I'm one of these people who would write>>3 and
>> &7 rather than /8 or %8 but I guess we are all
>> different. Atleast consider it if you stick with this...
>
> Better yet:
>
> 		dat[err_idx[i] / 8] ^= (1<<  (err_idx[i] % 8));
>
> The /8 and %8 will be changed into>>3 and&7 by the compiler anyway,
> while the /8 and %8 form is possibly a bit less obscure.
>

Yes, that's exactly why I kept /8 and %8. I would change the code as 
suggested by you

> Of course, this needs to be done over _all_ this driver, not only a few
> cases.
>

There is only one place which needs a change_bit. I would send a v2 with 
the suggested change

Vipin

>
> Nicolas
> .
>
