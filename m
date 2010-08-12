Received: from mms1.broadcom.com ([216.31.210.17])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OjgrT-0002AG-U9
	for linux-mtd@lists.infradead.org; Thu, 12 Aug 2010 23:07:00 +0000
Message-ID: <4C647E87.3050205@broadcom.com>
Date: Thu, 12 Aug 2010 16:06:47 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Florian Fainelli" <ffainelli@freebox.fr>
Subject: Re: [PATCH 3/3] NAND: add support for reading ONFI parameters
	from NAND device
References: <201008121453.50207.ffainelli@freebox.fr>
	<4C644426.9010106@broadcom.com>
	<201008122147.54733.ffainelli@freebox.fr>
In-Reply-To: <201008122147.54733.ffainelli@freebox.fr>
Content-Type: text/plain;
 charset=iso-8859-1;
 format=flowed
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 08/12/2010 12:47 PM, Florian Fainelli wrote:
>> Also, previously, you said:
>>> +   if (!is_power_of_2(val) || val == 1 || val > (1 << 4)) {
>>> the !is_power_of_2 check does not work for ONFI version 2.1 (3), so I
>>> would only keep the two other checks."
>>
>> So why is it now:
>>> +   if (is_power_of_2(val) || val == 1 || val > (1 << 4)) {
>>
>> Is that a typo? Perhaps it's better to throw that test out altogether.
>
> That was not a typo, I actually misread the ONFI specification and confused bit
> is set, with the actual value. So this is the correct check, sorry about that.

Again, I might be mistaken, but it seems that the "is_power_of_2" would 
weed out ONFI 1.0, since val would be simply 1 << 1, i.e., val == 2. 
Really, it seems that the ONFI version number may or may not be a power 
of two. If so, then we should just check individual bits as performed in 
the other tests (and perhaps include a test to be sure "val & 1 == 0")

>> I "fixed" the changes I mentioned as well as a few coding style, logic
>> cleanups, etc. (e.g. too many levels of logic, creating lines > 80 chars).
>> Here's a new patch. I didn't change over the crc function to the library
>> function because that would require configuring the Kbuild options and
>> setting a dependency, which I'm not familiar with. I'm certainly not an
>> expert on most of this, so take my patch with a grain of salt!
>
> It is usually as simple as doing the proper select FOO in the related Kconfig.

Thanks for the tip. It worked for me.

Brian
