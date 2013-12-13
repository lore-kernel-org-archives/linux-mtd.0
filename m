Message-ID: <52AB2BBB.8090900@st.com>
Date: Fri, 13 Dec 2013 15:46:03 +0000
From: Angus Clark <angus.clark@st.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v3 08/36] mtd: devices: Provide header for shared OPCODEs
 and SFDP commands
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-9-git-send-email-lee.jones@linaro.org>
 <20131210214849.GE27149@ld-irv-0074.broadcom.com>
 <20131210222308.GG27149@ld-irv-0074.broadcom.com>
In-Reply-To: <20131210222308.GG27149@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Angus CLARK <angus.clark@st.com>, Lee Jones <lee.jones@linaro.org>,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 12/10/2013 10:23 PM, Brian Norris wrote:
> On Tue, Dec 10, 2013 at 01:48:49PM -0800, Brian Norris wrote:
>> It doesn't look to me like the dual/quad bitfields are laid out very
>> usefully. Can't they be divided so that their bit position is more
>> meaningful?
[...]
> I realized you are packing these tight because you're using them as
> combinable (bitwise OR) flags (hence the name FLASH_FLAG_*, duh!). So
> while my scheme is nicer for representing a single opcode w.r.t.
> controller requirements, it is not able to represent the exact opcodes
> supported by a particular flash. Hence, this is not the right place for
> it.

There is certainly scope to compact the opcode representation...

> But I don't want to imitate your flags in any generic framework; we need
> a method (that doesn't involve too many extra tables like in your
> driver; or that supports these tables generically, to share with other
> drivers) to map the "supported opcodes" flags to useful properties that
> the controller/driver can examine.

I believe a key function of any spi-nor framework should be to determine which
fundamental modes of operation are supported by the device (e.g. READ_1_1_2,
READ_1_2_2, READ_1_1_4, READ_1_4_4 etc) and how they are driven (i.e. opcode,
number of mode bits, number of dummy cycles).  A second stage would be to
configure the best read, write, erase configurations based on the combined
capabilities of the device and the H/W controller.

However, it is not obvious how best to achieve this functionality.  Given the
amount of information that needs to be represented, a static table is not going
to be popular.  The current approach in st_spi_fsm assumes some default
configurations for supported modes, with the option to override with
device/family-specific configurations.  To be honest, it is rather ugly, and the
result of historic evolutions rather than a clean design!

> Is it possible, for instance, to describe a range of opcodes supported
> using patterns? Like "this flash supports opcodes for 1-4 data pins and
> 1-2 address pins"? Or am I being too idealistic, and most flash really
> support a totally arbitrary combination of opcodes?

Yes, I am afraid so.  For example, the mx25l12836e supports READ_1_1_2(0x3b) and
READ_1_1_4(0x6b), whereas the mx25l12845e supports READ_1_2_2(0xbb) and
READ_1_4_4(0xeb).

Cheers,

Angus
