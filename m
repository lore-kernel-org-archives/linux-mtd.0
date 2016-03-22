From: Lakshmi Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
To: Mark Brown <broonie@kernel.org>
CC: Michal Simek <michals@xilinx.com>, Soren Brinkmann <sorenb@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Javier Martinez Canillas
 <javier@osg.samsung.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Stephen Warren <swarren@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, "Andrew F. Davis" <afd@ti.com>,
 Marek Vasut <marex@denx.de>, Jagan Teki <jteki@openedev.com>,
 =?iso-8859-2?Q?Rafa=B3_Mi=B3ecki?= <zajec5@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, Harini Katakam <harinik@xilinx.com>,
 Punnaiah Choudary Kalluri <punnaia@xilinx.com>, Anirudha Sarangi
 <anirudh@xilinx.com>
Subject: RE: [LINUX PATCH 1/2] mtd: Added dummy entry in the spi_transfer
 structure.
Date: Tue, 22 Mar 2016 06:39:51 +0000
Message-ID: <4FF8F58FAA9D5D4193D4E554E4352C5902C6D34C@XAP-PVEXMBX02.xlnx.xilinx.com>
References: <1458562809-36114-1-git-send-email-lakshmis@xilinx.com>
 <20160321130734.GS2566@sirena.org.uk>
In-Reply-To: <20160321130734.GS2566@sirena.org.uk>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Mark,

<snip>
>On Mon, Mar 21, 2016 at 05:50:08PM +0530, P L Sai Krishna wrote:
>> This patch does following things.
>> 1. Added dummy entry in the spi_transfer structure.
>> 2. Assigned dummy cycles to dummy member in the transfer structure
>> during read operation.
>
>Please try to follow the patch submission process covered in
>SubmittingPatches, in particular please use subject lines reflecting the s=
tyle
>for the subsystem (which helps people identify relevant changes to
>review) and...
>
>>  drivers/mtd/devices/m25p80.c | 1 +
>>  include/linux/spi/spi.h      | 2 ++
>>  2 files changed, 3 insertions(+)
>
>...split things up into individual patches, for example here you're both a=
dding a
>new feature and adding a user of that feature in a single patch.

I will split the patch into two with appropriate commit messages.

>
>> + * @dummy: number of dummy cycles.
>
>This needs to be clearer about what a dummy cycle is and where it gets
>inserted.  We probably also want a better name, just "dummy" makes it look
>like a padding field in the structure.  How about dummy_cycles?

dummy_cycles is a better idea.
I will change it and add the usage of this in the description in a detailed=
 manner.

>
>> @@ -752,6 +753,7 @@ struct spi_transfer {
>>      u8              bits_per_word;
>>      u16             delay_usecs;
>>      u32             speed_hz;
>> +    u32             dummy;
>>
>>      struct list_head transfer_list;
>>  };
>
>This isn't enough to add the feature - a client driver trying to make use =
of this
>needs to be able to tell if the cycles are actually going to be inserted. =
 I'd
>expect to see a capability flag that can be checked and some error checkin=
g so
>that if we try to do a transfer with dummy cycles and can't support it we =
don't
>silently ignore the dummy cycles, ideally also something that'll handle
>multiples of 8 bits with SPI controllers that don't otherwise support this
>feature.

Currently, all fast reads use 8 cycles or 1 byte of dummy. This generally w=
orks.
But it can be vary based on the flash and the type of read command.
Dummy bytes are taken care of in m25p80.c by adjusting the len field:
Length =3D size of (command + address + dummy byte)

There might be controllers (like ZynqMP GQSPI) that would be able to use
the information that dummy byte(s) were added and the precise number
of dummy cycles. This patch does not disturb the existing implementation
of adjusting length (as described above). It adds an additional optional fe=
ature.
So there is no harm to controllers that can't support it - they can ignore =
it and
still work with the existing "length adjustment" implementation.
If you think there value in adding a capability flag, please let me know.

Thanks for your review.

Regards,
Sai Krishna


This email and any attachments are intended for the sole use of the named r=
ecipient(s) and contain(s) confidential information that may be proprietary=
, privileged or copyrighted under applicable law. If you are not the intend=
ed recipient, do not read, copy, or forward this email message or any attac=
hments. Delete this email message and any attachments immediately.
