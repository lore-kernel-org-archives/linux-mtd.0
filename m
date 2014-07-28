Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XBerz-0007i5-9j
 for linux-mtd@lists.infradead.org; Mon, 28 Jul 2014 06:57:16 +0000
Message-ID: <53D5F42C.5020404@nod.at>
Date: Mon, 28 Jul 2014 08:56:44 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: Using UBIFS as an FTL
References: <CAAK6Zt03J=0=tv5rPvZH0pTZWM8ha5eu0gqFbZ6P_FgSrgwW-A@mail.gmail.com>
 <53D2EB45.9060302@huawei.com>
 <CAFLxGvxDFxtBzKutVUAaJyt54WC3R1qzKyko2cKSEyMGd832fA@mail.gmail.com>
 <20140728030616.GA1545@arch.cereza>
In-Reply-To: <20140728030616.GA1545@arch.cereza>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Daniel Ehrenberg <dehrenberg@google.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 artem.bityutskiy@linux.intel.com, hujianyang <hujianyang@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 28.07.2014 05:06, schrieb Ezequiel Garcia:
> On 27 Jul 09:20 AM, Richard Weinberger wrote:
>> On Sat, Jul 26, 2014 at 1:41 AM, hujianyang <hujianyang@huawei.com> wrote:
>>> On 2014/7/26 2:21, Daniel Ehrenberg wrote:
>>>> - loopback-mounting a file on ubifs--From skimming the code, it looks
>>>> to me like ubifs uses some nice datastructures to handle writes within
>>>> a file without doing read-modify-writes all the time as ubiblock
>>>> forces. ubifs authors/maintainers, do you see any downside to using
>>>> ubifs this way?
>>>
>>> This way seems most easily to realize. Synchronize the loop file and
>>> maybe you will never worry about power cut.
>>>
>>> How about using UBI-layer and writing a new block driver to handle
>>> bio? This driver should care about which leb on the flash has data
>>> and other thing else(I don't have a clear idea now). The 'leb_change'
>>> ops in UBI-layer maybe helpful for in-place update and atomic write.
>>> But This way is harder than using a loop file.
>>
>> Instead of adding another UBI block layer, please integrate such functionality
>> in Ezequiel's UBI block.
>>
> 
> Daniel already mentioned it didn't git his needs. Quoting him:

I did not promote it as the ultimate solution.
But if we add such functionality it should reuse existing stuff instead
of adding another UBI block layer....

Thanks,
//richard
