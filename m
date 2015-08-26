Message-ID: <55DE4623.8090508@st.com>
Date: Wed, 26 Aug 2015 16:05:07 -0700
From: vikas <vikas.manocha@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
CC: Marek Vasut <marex@denx.de>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Graham Moore
 <grmoore@opensource.altera.com>, Alan Tull <atull@opensource.altera.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH 2/2] mtd: spi-nor: Add driver for Cadence Quad SPI Flash
 Controller.
References: <1440148851-14621-1-git-send-email-marex@denx.de>
 <1440148851-14621-2-git-send-email-marex@denx.de> <55DCE7AE.5070501@st.com>
 <201508260819.02535.marex@denx.de> <55DDDF99.4030701@st.com>
 <20150826180631.GS81844@google.com>
In-Reply-To: <20150826180631.GS81844@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 08/26/2015 11:06 AM, Brian Norris wrote:
> On Wed, Aug 26, 2015 at 08:47:37AM -0700, vikas wrote:
>> On 08/25/2015 11:19 PM, Marek Vasut wrote:
>>> On Wednesday, August 26, 2015 at 12:09:50 AM, vikas wrote:
>>>> the patch failed to apply, please rebase it to master.
>>>
>>> it's based on -next, I'm sure you can fix trivial conflicts yourself if you
>>> need to apply it elsewhere. Do you have any other review comments ?
>>
>> Always rebase the patch on master.
> 
> Development works against -next, not Linus' master:
> 
> https://lwn.net/Articles/289013/
> 
> This is also noted here:
> 
> https://www.kernel.org/doc/man-pages/linux-next.html
> 
> Technically, you should work off of the respective subsystem tree (see
> entries in MAINTAINERS). For MTD, this is also documented here:
> 
> http://linux-mtd.infradead.org/source.html
> 
> In the end, most MTD patches get applied to l2-mtd.git, but l2-mtd.git
> and linux-next.git should provide pretty similar MTD patching
> experiences, as the former is included in the latter.

Thanks Brian for these useful links, appreciate it.

Rgds,
Vikas

> 
> Regards,
> Brian
> .
> 
