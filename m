From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] alauda: do not use stack for URB transfer_buffers
References: <20130806120329.8864.36301.stgit@localhost6.localdomain6>
 <20130821073028.GB31788@brian-ubuntu>
Date: Wed, 21 Aug 2013 09:59:27 +0200
In-Reply-To: <20130821073028.GB31788@brian-ubuntu> (Brian Norris's message of
 "Wed, 21 Aug 2013 00:30:28 -0700")
Message-ID: <87li3v79uo.fsf@nemi.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Cc: Jussi Kivilinna <jussi.kivilinna@iki.fi>, Joern Engel <joern@logfs.org>,
 linux-usb@vger.kernel.org, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Brian Norris <computersforpeace@gmail.com> writes:
> On Tue, Aug 06, 2013 at 03:03:29PM +0300, Jussi Kivilinna wrote:
>> Patch fixes alauda not to use stack as URB transfer_buffer. URB buffers =
need to
>> be DMA-able, which stack is not.
>>=20
>> Patch is only compile tested.
>>=20
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Jussi Kivilinna <jussi.kivilinna@iki.fi>
>> ---
>>  drivers/mtd/nand/alauda.c |   74 ++++++++++++++++++++++++++++++++++----=
-------
>>  1 file changed, 56 insertions(+), 18 deletions(-)
>
> Just FYI, this driver is being removed, so I'm obviously not taking this
> patch :)

I think you should apply it anyway. The driver is still in v3.11 AFAICS,
and the patch should also go to the maintained stable kernels. You
cannot remove the driver from them, and I don't see a later driver
removal as a valid reason not to fix a known bug with a patch.


Bj=C3=B8rn
