Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Pk0Hb-0002lq-Sw
	for linux-mtd@lists.infradead.org; Mon, 31 Jan 2011 20:23:32 +0000
Received: by wwb17 with SMTP id 17so6405055wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 31 Jan 2011 12:23:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimkjy7KcO=QULXYubEPnrh4H1gPpYBL3yE7NDSy@mail.gmail.com>
References: <AANLkTimVCusWk1qkeY4geXBQ0Bw=rM0mUAaFO32tyoy=@mail.gmail.com>
	<AANLkTimSqWO_7hBhmBsRKtmm-S=dtJK1wjDv8ekby+3H@mail.gmail.com>
	<AANLkTimkjy7KcO=QULXYubEPnrh4H1gPpYBL3yE7NDSy@mail.gmail.com>
Date: Mon, 31 Jan 2011 15:23:29 -0500
Message-ID: <AANLkTikAJ+NgaZ8-_WJSNZ=QJyh0qNM5WqPnem44D3Sw@mail.gmail.com>
Subject: Re: Question about CFI allocation
From: Josh Boyer <jwboyer@gmail.com>
To: Mitsutaka Amano <mitsutaka.amano@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jan 31, 2011 at 12:48 AM, Mitsutaka Amano
<mitsutaka.amano@gmail.com> wrote:
> On Wed, Jan 26, 2011 at 11:43 PM, Josh Boyer <jwboyer@gmail.com> wrote:
>> On Wed, Jan 26, 2011 at 6:09 AM, Mitsutaka Amano
>> <mitsutaka.amano@gmail.com> wrote:
>>> Hi all, I'm a newbie about mtd.
>>>
>>> I'm trying to use the cfi on the mpc85xx board. Part of mtdblock is
>>> used by rootfs. So I have questions.
>>>
>>> Why does CFI(or other flash memory) have to alloc to the vmalloc
>>> area(such as PHYSMAP or PHYSMAP_OF)?
>>
>> The CFI code is not calling vmalloc explicitly. =A0It's calling ioremap,
>> which happens to come from vmalloc space on most (all?) architectures.
>> =A0It has to do that because otherwise the CFI driver can't get access
>> to the physical flash because of the MMU.
> I understand that CFI needs ioremap() -> vmalloc space for accessing
> to the physical flash via MMU.
>
> Why allocate amount of flash memory size? my board has 256MB flash
> memory and be allocated 256MB over by of_flash_probe.

It's either do that so you can address the whole flash space, or
implement a sliding window in the mapping driver.  That can be rather
complicated when you consider concurrent access to the flash, and
doing repeated ioremap/iounmap calls so I would guess simplicity is
why.

That is mostly applicable for NOR flash directly accessible.  If there
is a controller in front of the flash that only needs a small area
ioremapped, then it shouldn't use physmap_of.c and should write a
proper driver for it.  The NDFC driver is an example of something like
that.

josh
