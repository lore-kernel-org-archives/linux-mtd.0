Received: from dns-bn1lp0143.outbound.protection.outlook.com ([207.46.163.143]
 helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFE0V-0005ns-RW
 for linux-mtd@lists.infradead.org; Thu, 07 Aug 2014 03:04:49 +0000
From: "Wu, Aaron" <Aaron.Wu@analog.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: RE: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded flash
Date: Thu, 7 Aug 2014 03:03:35 +0000
Message-ID: <649EF91064D35D40B9C93A225BF416746123E637@NWD2MBX7.ad.analog.com>
References: <1404375214-3736-1-git-send-email-Aaron.wu@analog.com>
 <20140801063449.GD3095@norris-Latitude-E6410>
 <649EF91064D35D40B9C93A225BF416746123CC52@NWD2MBX7.ad.analog.com>
 <20140804202915.GV3711@ld-irv-0074>
In-Reply-To: <20140804202915.GV3711@ld-irv-0074>
Content-Language: en-US
Content-Type: multipart/mixed;
 boundary="_002_649EF91064D35D40B9C93A225BF416746123E637NWD2MBX7adanalo_"
MIME-Version: 1.0
Cc: Mike Frysinger <vapier@gentoo.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>, "Zhang,
 Sonic" <Sonic.Zhang@analog.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--_002_649EF91064D35D40B9C93A225BF416746123E637NWD2MBX7adanalo_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



>-----Original Message-----
>From: Brian Norris [mailto:computersforpeace@gmail.com]
>Sent: Tuesday, August 05, 2014 4:29 AM
>To: Wu, Aaron
>Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org; Zhang, Sonic; Mike
>Frysinger
>Subject: Re: [PATCH] gpio_flash: fix the CPLB miss bug for gpio expanded f=
lash
>
>Hi Aaron,
>
>Please don't top post (like I'm doing right now). It makes it harder to fo=
llow
>what's actually being said.
>
>And please *do* selectively quote (unlike me right now), so it's easy to s=
ee
>what you've responded to without too much other noise.
>
>Mike hasn't been involved in MTD recently, so I don't fully expect an answ=
er.
>
>The BUG_ON() is certainly useless, so we should drop it.
>
>It also seems like your patch is contradicting the other existing comments=
, so
>your patch should include more detailed explanation, and it should modify =
the
>comments appropriately. Particularly, you should note why this is no longe=
r
>the case:
>
>  "We rely on the MTD layer to chunk up copies such that a single
>  request here will not cross a window size. [...]"
>
>So yes, you need a new patch.

Hi Brian, I git send-email a newer version however I myself did not receive=
 it from the mtd mail list so attach it here. Thanks.=20

>Thanks,
>Brian
>
>On Fri, Aug 01, 2014 at 08:34:03AM +0000, Wu, Aaron wrote:
>> Hi Brian and Mike,
>>
>> AFAICT I agree with you, I think the BUG_ON is not likely to be executed=
, I'm
>OK with removing it, Mike, what's your idea.
>>
>> And do you want me to make a new patch or make another patch to
>remove the BUG_ON and the "," issue if we can reach agreement on this
>issue?
>>
>> Best regards,
>> Aaron
>>
>> -----Original Message-----
>> From: Wu, Aaron
>> Sent: Friday, August 01, 2014 3:00 PM
>> To: 'Brian Norris'
>> Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org; Zhang, Sonic;
>> Mike Frysinger
>> Subject: RE: [PATCH] gpio_flash: fix the CPLB miss bug for gpio
>> expanded flash
>>
>> Hi Brian,
>>
>> Thanks for your time and comments.
>>
>> This patch originally intend to solve the issue that Flash operation add=
ress
>passed in from upper layer may exceed the maxim address boundary allowed
>by the window size defined by the gpio style of flash.
>>
>> Take the read, memcpy_fromio for example, this address is described by
>(map->virt + (from % state->win_size)  +  this_len), where this_len varies=
 in
>different situation.  If the address do exceed the boundary then we repeat
>read to work around it.
>>
>> I actually did not pay enough attention on the BUG_ON condition from Mik=
e,
>I will check later and be back.
>>
>> At last this patch fixed a customer reported issue so I suppose this "cr=
oss the
>boundary" bug do exits and this patch roughly fixed it.
>>
>> Best regards,
>> Aaron
>>
>> -----Original Message-----
>> From: Brian Norris [mailto:computersforpeace@gmail.com]
>> Sent: Friday, August 01, 2014 2:35 PM
>> To: Wu, Aaron
>> Cc: linux-mtd@lists.infradead.org; dwmw2@infradead.org; Zhang, Sonic;
>> Mike Frysinger
>> Subject: Re: [PATCH] gpio_flash: fix the CPLB miss bug for gpio
>> expanded flash
>>
>> + Mike Frysinger
>>
>> Hi Aaron,
>>
>> I'm trying to judge the quality of your patch, but I'm very distracted f=
rom this
>by trying to figure out the original intent of this code.
>> Perhaps Mike can comment.
>>
>> On Thu, Jul 03, 2014 at 04:13:34PM +0800, Aaron Wu wrote:
>> > In this bug, the address operation range may exceed the window size
>> > defined by gpio expanded flash MTD partition.
>> >
>> > Signed-off-by: Aaron Wu <Aaron.wu@analog.com>
>> > ---
>> >  drivers/mtd/maps/gpio-addr-flash.c |   34
>++++++++++++++++++++++++++++------
>> >  1 file changed, 28 insertions(+), 6 deletions(-)
>> >
>> > diff --git a/drivers/mtd/maps/gpio-addr-flash.c
>> > b/drivers/mtd/maps/gpio-addr-flash.c
>> > index a4c477b..ca9282f 100644
>> > --- a/drivers/mtd/maps/gpio-addr-flash.c
>> > +++ b/drivers/mtd/maps/gpio-addr-flash.c
>> > @@ -108,13 +108,24 @@ static void gf_copy_from(struct map_info *map,
>> > void *to, unsigned long from, ssi  {
>> >  	struct async_state *state =3D gf_map_info_to_state(map);
>> >
>> > -	gf_set_gpios(state, from);
>> > +	int this_len;
>> >
>> >  	/* BUG if operation crosses the win_size */
>> >  	BUG_ON(!((from + len) % state->win_size <=3D (from + len)));
>>
>> What do you think of this BUG_ON()? AFAICT, the BUG_ON() predicate is
>> provably false [1], at least whenever
>>
>> 	from >=3D 0 && len >=3D 0 && state->win_size > 0.
>>
>> Was the intent more like this?
>>
>> 	BUG_ON((from + len - 1) / state->win_size !=3D from / state->win_size);
>>
>> If so, then it seems like maybe this patch is trying to address the case=
 that
>was previously considered a BUG()?
>>
>> In any case, if we can't figure out what the BUG_ON() really should have
>been, then maybe we should kill it and take something like your patch to f=
ix
>the case you're looking at, Aaron.
>>
>> >
>> > -	/* operation does not cross the win_size, so one shot it */
>> > -	memcpy_fromio(to, map->virt + (from % state->win_size), len);
>> > +	while (len) {
>> > +		if ((from % state->win_size) + len > state->win_size)
>> > +			this_len =3D state->win_size - (from % state->win_size);
>> > +		else
>> > +			this_len =3D len;
>> > +
>> > +		gf_set_gpios(state, from);
>> > +		memcpy_fromio(to, map->virt + (from % state->win_size)
>> > +			, this_len);
>> > +		len -=3D this_len;
>> > +		from +=3D this_len;
>> > +		to +=3D this_len;
>> > +	}
>> >  }
>> >
>> >  /**
>> > @@ -147,13 +158,24 @@ static void gf_copy_to(struct map_info *map,
>> > unsigned long to,  {
>> >  	struct async_state *state =3D gf_map_info_to_state(map);
>> >
>> > -	gf_set_gpios(state, to);
>> > +	int this_len;
>> >
>> >  	/* BUG if operation crosses the win_size */
>> >  	BUG_ON(!((to + len) % state->win_size <=3D (to + len)));
>>
>> Same here. I think the BUG_ON() condition is a no-op (always false).
>>
>> >
>> > -	/* operation does not cross the win_size, so one shot it */
>> > -	memcpy_toio(map->virt + (to % state->win_size), from, len);
>> > +	while (len) {
>> > +		if ((to % state->win_size) + len > state->win_size)
>> > +			this_len =3D state->win_size - (to % state->win_size);
>> > +		else
>> > +			this_len =3D len;
>> > +
>> > +		gf_set_gpios(state, to);
>> > +		memcpy_toio(map->virt + (to % state->win_size), from, len);
>> > +
>> > +		len -=3D this_len;
>> > +		to +=3D this_len;
>> > +		from +=3D this_len;
>> > +	}
>> >  }
>> >
>> >  static const char * const part_probe_types[] =3D {
>>
>> Brian
>>
>> [1] If it was provably false, then I should be able to write out a proof=
! It relies
>on something like this:
>>
>> 	If x >=3D 0 and y > 0, then x % y <=3D x.

--_002_649EF91064D35D40B9C93A225BF416746123E637NWD2MBX7adanalo_
Content-Type: application/octet-stream;
	name="0001-mtd-gpio_flash-fix-the-bug-in-handling-gpio-flash-re.patch"
Content-Description: 0001-mtd-gpio_flash-fix-the-bug-in-handling-gpio-flash-re.patch
Content-Disposition: attachment;
	filename="0001-mtd-gpio_flash-fix-the-bug-in-handling-gpio-flash-re.patch";
	size=3033; creation-date="Thu, 07 Aug 2014 02:51:42 GMT";
	modification-date="Thu, 07 Aug 2014 02:48:22 GMT"
Content-Transfer-Encoding: base64

RnJvbSBlNTY2YjM5MTllNTJlMjQ2Yjk4MDc1ODM4M2UxMTA5ZmVmNzg4NjczIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBYXJvbiBXdSA8QWFyb24ud3VAYW5hbG9nLmNvbT4KRGF0ZTog
VHVlLCA1IEF1ZyAyMDE0IDEzOjI2OjA0ICswODAwClN1YmplY3Q6IFtQQVRDSF0gW210ZF0gZ3Bp
b19mbGFzaDogZml4IHRoZSBidWcgaW4gaGFuZGxpbmcgZ3BpbyBmbGFzaAogcmVhZC93cml0ZSB3
aGVuIG9mZnNldCArIGxlbiBmcm9tIG10ZCBleGNlZWRzIHRoZSB3aW5kb3cKIHNpemUKClNpZ25l
ZC1vZmYtYnk6IEFhcm9uIFd1IDxBYXJvbi53dUBhbmFsb2cuY29tPgoKZml4IHRoZSBidWcgaW4g
aGFuZGxpbmcgZ3BpbyBmbGFzaCByZWFkL3dyaXRlIHdoZW4gb2Zmc2V0ICsgbGVuCmZyb20gbXRk
IGV4Y2VlZHMgdGhlIHdpbmRvdyBzaXplCi0tLQogZHJpdmVycy9tdGQvbWFwcy9ncGlvLWFkZHIt
Zmxhc2guYyB8ICAgNDMgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9tdGQvbWFwcy9ncGlvLWFkZHItZmxhc2guYyBiL2RyaXZlcnMvbXRkL21hcHMv
Z3Bpby1hZGRyLWZsYXNoLmMKaW5kZXggYTRjNDc3Yi4uOTQ3NjMxYSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tdGQvbWFwcy9ncGlvLWFkZHItZmxhc2guYworKysgYi9kcml2ZXJzL210ZC9tYXBzL2dw
aW8tYWRkci1mbGFzaC5jCkBAIC05OSwyMiArOTksMjkgQEAgc3RhdGljIG1hcF93b3JkIGdmX3Jl
YWQoc3RydWN0IG1hcF9pbmZvICptYXAsIHVuc2lnbmVkIGxvbmcgb2ZzKQogICoJQGZyb206IGZs
YXNoIG9mZnNldCB0byBjb3B5IGZyb20KICAqCUBsZW46ICBob3cgbXVjaCB0byBjb3B5CiAgKgot
ICogV2UgcmVseSBvbiB0aGUgTVREIGxheWVyIHRvIGNodW5rIHVwIGNvcGllcyBzdWNoIHRoYXQg
YSBzaW5nbGUgcmVxdWVzdCBoZXJlCi0gKiB3aWxsIG5vdCBjcm9zcyBhIHdpbmRvdyBzaXplLiAg
VGhpcyBhbGxvd3MgdXMgdG8gb25seSB3aWdnbGUgdGhlIEdQSU9zIG9uY2UKLSAqIGJlZm9yZSBm
YWxsaW5nIGJhY2sgdG8gYSBub3JtYWwgbWVtY3B5LiAgUmVhZGluZyB0aGUgaGlnaGVyIGxheWVy
IGNvZGUgc2hvd3MKLSAqIHRoYXQgdGhpcyBpcyBpbmRlZWQgdGhlIGNhc2UsIGJ1dCBhZGQgYSBC
VUdfT04oKSB0byBmdXR1cmUgcHJvb2YuCisgKlRvZ2dsZSB0aGUgY29ycmVjdCBHUElPIGFjY29y
ZGluZyB0byBAZnJvbSB0byBlbmFibGUgdGhlIHJpZ2h0IGZsYXNoIGJhbmssCisgKnN0aWxsIHRo
ZSByZWFkIG9mZnNldCBwbHVzIGxlbiBtYXkgZXhlY2NlZHMgdGhlIGFjdHVhbCBXaW5kb3cgc2l6
ZSx3aGVuCisgKnRoaXMgaGFwcG5lcywgcmV2ZXJ0cyB0aGUgdmFsdWUgZm9yIG11bHRpcGxlIHJl
YWQgdW50aWwgYWxsIGRhdGEgaXMgcmVhZC4KICAqLwogc3RhdGljIHZvaWQgZ2ZfY29weV9mcm9t
KHN0cnVjdCBtYXBfaW5mbyAqbWFwLCB2b2lkICp0bywgdW5zaWduZWQgbG9uZyBmcm9tLCBzc2l6
ZV90IGxlbikKIHsKIAlzdHJ1Y3QgYXN5bmNfc3RhdGUgKnN0YXRlID0gZ2ZfbWFwX2luZm9fdG9f
c3RhdGUobWFwKTsKIAotCWdmX3NldF9ncGlvcyhzdGF0ZSwgZnJvbSk7CisJaW50IHRoaXNfbGVu
OwogCi0JLyogQlVHIGlmIG9wZXJhdGlvbiBjcm9zc2VzIHRoZSB3aW5fc2l6ZSAqLwotCUJVR19P
TighKChmcm9tICsgbGVuKSAlIHN0YXRlLT53aW5fc2l6ZSA8PSAoZnJvbSArIGxlbikpKTsKKwl3
aGlsZSAobGVuKSB7CisJCWlmICgoZnJvbSAlIHN0YXRlLT53aW5fc2l6ZSkgKyBsZW4gPiBzdGF0
ZS0+d2luX3NpemUpCisJCQl0aGlzX2xlbiA9IHN0YXRlLT53aW5fc2l6ZSAtIChmcm9tICUgc3Rh
dGUtPndpbl9zaXplKTsKKwkJZWxzZQorCQkJdGhpc19sZW4gPSBsZW47CiAKLQkvKiBvcGVyYXRp
b24gZG9lcyBub3QgY3Jvc3MgdGhlIHdpbl9zaXplLCBzbyBvbmUgc2hvdCBpdCAqLwotCW1lbWNw
eV9mcm9taW8odG8sIG1hcC0+dmlydCArIChmcm9tICUgc3RhdGUtPndpbl9zaXplKSwgbGVuKTsK
KwkJZ2Zfc2V0X2dwaW9zKHN0YXRlLCBmcm9tKTsKKwkJbWVtY3B5X2Zyb21pbyh0bywgbWFwLT52
aXJ0ICsgKGZyb20gJSBzdGF0ZS0+d2luX3NpemUpLAorCQkJIHRoaXNfbGVuKTsKKwkJbGVuIC09
IHRoaXNfbGVuOworCQlmcm9tICs9IHRoaXNfbGVuOworCQl0byArPSB0aGlzX2xlbjsKKwl9CiB9
CiAKIC8qKgpAQCAtMTQ3LDEzICsxNTQsMjEgQEAgc3RhdGljIHZvaWQgZ2ZfY29weV90byhzdHJ1
Y3QgbWFwX2luZm8gKm1hcCwgdW5zaWduZWQgbG9uZyB0bywKIHsKIAlzdHJ1Y3QgYXN5bmNfc3Rh
dGUgKnN0YXRlID0gZ2ZfbWFwX2luZm9fdG9fc3RhdGUobWFwKTsKIAotCWdmX3NldF9ncGlvcyhz
dGF0ZSwgdG8pOworCWludCB0aGlzX2xlbjsKKworCXdoaWxlIChsZW4pIHsKKwkJaWYgKCh0byAl
IHN0YXRlLT53aW5fc2l6ZSkgKyBsZW4gPiBzdGF0ZS0+d2luX3NpemUpCisJCQl0aGlzX2xlbiA9
IHN0YXRlLT53aW5fc2l6ZSAtICh0byAlIHN0YXRlLT53aW5fc2l6ZSk7CisJCWVsc2UKKwkJCXRo
aXNfbGVuID0gbGVuOwogCi0JLyogQlVHIGlmIG9wZXJhdGlvbiBjcm9zc2VzIHRoZSB3aW5fc2l6
ZSAqLwotCUJVR19PTighKCh0byArIGxlbikgJSBzdGF0ZS0+d2luX3NpemUgPD0gKHRvICsgbGVu
KSkpOworCQlnZl9zZXRfZ3Bpb3Moc3RhdGUsIHRvKTsKKwkJbWVtY3B5X3RvaW8obWFwLT52aXJ0
ICsgKHRvICUgc3RhdGUtPndpbl9zaXplKSwgZnJvbSwgbGVuKTsKIAotCS8qIG9wZXJhdGlvbiBk
b2VzIG5vdCBjcm9zcyB0aGUgd2luX3NpemUsIHNvIG9uZSBzaG90IGl0ICovCi0JbWVtY3B5X3Rv
aW8obWFwLT52aXJ0ICsgKHRvICUgc3RhdGUtPndpbl9zaXplKSwgZnJvbSwgbGVuKTsKKwkJbGVu
IC09IHRoaXNfbGVuOworCQl0byArPSB0aGlzX2xlbjsKKwkJZnJvbSArPSB0aGlzX2xlbjsKKwl9
CiB9CiAKIHN0YXRpYyBjb25zdCBjaGFyICogY29uc3QgcGFydF9wcm9iZV90eXBlc1tdID0gewot
LSAKMS43LjkuNQoK

--_002_649EF91064D35D40B9C93A225BF416746123E637NWD2MBX7adanalo_--
