Received: from mika.eatserver.nl ([2001:67c:28fc:195:20:9:75:0])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TeRL4-0001m1-Cn
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2012 14:13:11 +0000
Message-ID: <50B8BEEA.3070808@aimvalley.nl>
Date: Fri, 30 Nov 2012 15:12:58 +0100
From: Norbert van Bolhuis <nvbolhuis@aimvalley.nl>
MIME-Version: 1.0
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Subject: Re: Handling bus locking of CFI Flash devices
References: <CAAXf6LU86rF1tkx-SRLup8rpvVG9cgD_nryn8UZG45-c7+FpRg@mail.gmail.com>
 <CAAXf6LWu1Qcuki_NnHJZfO3-RNnePqaqnxmV99hB=xH+CGUN3w@mail.gmail.com>
In-Reply-To: <CAAXf6LWu1Qcuki_NnHJZfO3-RNnePqaqnxmV99hB=xH+CGUN3w@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/29/12 16:39, Thomas De Schampheleire wrote:
> On Fri, Nov 23, 2012 at 7:34 PM, Thomas De Schampheleire
> <patrickdepinguin@gmail.com>  wrote:
>> Hi,
>>
>> I have an embedded PowerPC system with a CFI Flash located on the local bus.
>> Additionally, there is a control device with a 'flash-write-protect'
>> feature. By default, no writes can happen to the flash device on the
>> local bus, unless the flash-write-protect bit is cleared.
>>
>> This also means that detection of the flash chip using CFI commands
>> will fail by default, as this incurs write operations to the bus.
>>
>> Note that this flash-write-protect is different from the standard
>> flash 'lock/unlock' feature. The former is implemented on a specific
>> control logic chip of the board, while the latter is part of the flash
>> chip/controller itself.
>>
>> My question is: what is the best way to handle this flash-write-protect bit?
>> Right now, I am simply clearing the bit before booting the kernel,
>> which means that all write access to the flash is allowed. While this
>> works, it completely bypasses the protection feature.
>> Is there already a place in the MTD subsystem to handle such a
>> flash-write-protect bit, for example a hook that can be implemented
>> for a particular board?
>> If not, how do you suggest I proceed?
>
> Any feedback on this issue?
>



I do not think there is a hook for this.

You'd have to make such a hook yourself (in the mtd map_info struct ?)

or you can make your own mtd map driver that handles flash-write-protect
bit as desired.


---
N. van Bolhuis.
