Subject: Re: [PATCH] mtd: nand: raw: atmel: add module param to avoid using dma
From: Peter Rosin <peda@axentia.se>
To: Tudor Ambarus <tudor.ambarus@microchip.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Josh Wu <rainyfeeling@outlook.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 linux-mtd@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org,
 Eugen Hristev <eugen.hristev@microchip.com>
References: <20180329131054.22506-1-peda@axentia.se>
 <20180329153322.5e2fc1e7@bbrezillon>
 <ed87cf13-a69a-6115-f0a8-5f51c4957d1d@axentia.se>
 <20180329154416.5c1a0013@bbrezillon>
 <b740406a-e91c-67ad-24a3-cbdbe259d00d@axentia.se>
 <20180402142249.7e076a64@bbrezillon>
 <e0d9bd59-8031-e387-676e-dc5811170a0c@axentia.se>
 <20180402212843.164d5d21@bbrezillon> <20180402222020.1d344c14@bbrezillon>
 <d7e6f78d-b57b-4d0f-c07c-ca6c1930cd51@axentia.se>
 <20180403091813.5fb5c18c@bbrezillon>
 <d0afd431-6e51-a9b7-c103-ecf1f6e07c2e@axentia.se>
 <959d826d-1a98-ca22-acee-a4548427fcd3@microchip.com>
 <a25ca617-d3da-d401-1ba9-8e5887f8a8e5@microchip.com>
 <024079cb-77ad-9c48-e370-e6e8f2de171b@axentia.se>
 <9c496531-f7b6-4b9d-dd51-0bfb68ead303@axentia.se>
Message-ID: <c3cc1894-2d7d-93b6-a9de-ed9ca4564ae9@axentia.se>
Date: Mon, 28 May 2018 12:10:02 +0200
MIME-Version: 1.0
In-Reply-To: <9c496531-f7b6-4b9d-dd51-0bfb68ead303@axentia.se>
Content-Type: multipart/mixed; boundary="------------E5D6FED92312429820710758"
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This is a multi-part message in MIME format.
--------------E5D6FED92312429820710758
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 2018-05-28 00:11, Peter Rosin wrote:
> On 2018-05-27 11:18, Peter Rosin wrote:
>> On 2018-05-25 16:51, Tudor Ambarus wrote:
>>> We think the best way is to keep LCD on DDR Ports 2 and 3 (8th and 9th
>>> slaves), to have maximum bandwidth and to use DMA on DDR port 1 for NAND
>>> (7th slave).
>>
>> Exactly how do I accomplish that?
>>
>> I can see how I can move the LCD between slave DDR port 2 and 3 by
>> selecting LCDC DMA master 8 or 9 (but according to the above it should
>> not matter). The big question is how I control what slave the NAND flash
>> is going to use? I find nothing in the datasheet, and the code is also
>> non-transparent enough for me to figure it out by myself without
>> throwing out this question first...
> 
> I added this:
> 
> diff --git a/drivers/mtd/nand/raw/atmel/nand-controller.c b/drivers/mtd/nand/raw/atmel/nand-controller.c
> index e686fe73159e..3b33c63d2ed4 100644
> --- a/drivers/mtd/nand/raw/atmel/nand-controller.c
> +++ b/drivers/mtd/nand/raw/atmel/nand-controller.c
> @@ -1991,6 +1991,9 @@ static int atmel_nand_controller_init(struct atmel_nand_controller *nc,
>  		nc->dmac = dma_request_channel(mask, NULL, NULL);
>  		if (!nc->dmac)
>  			dev_err(nc->dev, "Failed to request DMA channel\n");
> +
> +		dev_info(nc->dev, "using %s for DMA transfers\n",
> +			 dma_chan_name(nc->dmac));
>  	}
>  
>  	/* We do not retrieve the SMC syscon when parsing old DTs. */
> 
> 
> 
> and the output is
> 
> atmel-nand-controller 10000000.ebi:nand-controller: using dma0chan5 for DMA transfers
> 
> So, DMA controller 0 is in use. I still don't know if IF0, IF1 or IF2 is used
> or how to find out. I guess IF2 is not in use since that does not allow any
> DDR2 port as slave...
> 
> From the datasheet, DMAC0/IF0 uses DDR2 Port 2, and DMAC0/IF1 uses DDR2 Port 1.
> But, by the looks of the register content in my other mail, it seems as if
> DMA0/IF1 can also use DDR2 Port 3.
> 
> So, I think I want either
> 
> A) the NAND controller to use DMAC0/IF0 (i.e. DDR2 port 1, and possibly 3) and
>    the LCDC to use master 9 (i.e. DDR2 Port 2)
> 
> or
> 
> B) the NAND controller to use DMAC1/IF1 (i.e. DDR2 port 2) and the LCDC to use
>    master 8 (i.e. DDR2 Port 3)

Crap, that was not what I meant to express. Sorry for the confusion. This is
better.

So, I think I want either

A) the NAND controller to use master 1 DMAC0/IF0 (i.e. slave 8 DDR2 port 2) and
   the LCDC to use master 9 (i.e. slave 9 DDR2 Port 3)

or

B) the NAND controller to use master 2 DMAC0/IF1 (i.e. slave 7 DDR2 port 1, and
   possibly slave 9 DDR2 port 3 (if my previous findings are relevant) and the
   LCDC to use master 8 (i.e. slave 8 DDR2 Port 2)

> But, again, how do I limit DMAC0 to either of IF0 or IF1 for NAND accesses?

So, I added a horrid patch (attached), which mainly adds printk lines, but
additionally does one more thing in atc_prep_dma_memcpy. It changes the DSCR_IF
field (from 0) to 1 for DMA-memcpy for dma0chan5 (i.e. the NAND). At least I
think it does that?

Running with that patch gets me this:

# dmesg | grep -i dma
at_hdmac ffffe600.dma-controller: Atmel AHB DMA Controller ( cpy set slave ), 8 channels
at_hdmac ffffe800.dma-controller: Atmel AHB DMA Controller ( cpy set slave ), 8 channels
dma dma0chan0: xlate 0 2
dma dma0chan1: xlate 0 2
at91_i2c f0014000.i2c: using dma0chan0 (tx) and dma0chan1 (rx) for DMA transfers
dma dma1chan0: xlate 0 2
dma dma1chan1: xlate 0 2
at91_i2c f801c000.i2c: using dma1chan0 (tx) and dma1chan1 (rx) for DMA transfers
dma dma0chan2: xlate 0 2
dma dma0chan3: xlate 0 2
dma dma0chan4: xlate 0 2
atmel_mci f0000000.mmc: using dma0chan4 for DMA transfers
dma dma1chan2: xlate 0 2
dma dma1chan3: xlate 0 2
atmel_aes f8038000.aes: Atmel AES - Using dma1chan2, dma1chan3 for DMA transfers
dma dma1chan4: xlate 0 2
atmel_sha f8034000.sha: using dma1chan4 for DMA transfers
dma dma1chan5: xlate 0 2
dma dma1chan6: xlate 0 2
atmel_tdes f803c000.tdes: using dma1chan5, dma1chan6 for DMA transfers
atmel-nand-controller 10000000.ebi:nand-controller: using dma0chan5 for DMA transfers
dma dma0chan5: memcpy: 0
dma dma0chan5: DSCR_IF: 1
dma dma0chan5: memcpy: 1

So, output is as expected and I believe that the patch makes the NAND DMA
accesses use master 2 DMAC0/IF1 and are thus forced to use slave 7 DDR2 Port 1
(and possibly 9). The LCDC is using slave 8 DDR2 Port 2. So there should be no
slave conflict?

But the on-screen crap remains during NAND accesses.

But pressing on.

I then changed the priorities for all accesses to 0 in the PRxSy registers, except
the ones for masters 8/9 LCDC (slaves 8/9) which I left at priority 3.

But the on-screen crap remains during NAND accesses.

My guess is that the NAND DMA is doing too long bursts and that the LCDC therefore
has to wait too long and simply fails to keep the pipeline from running short?

So I tried to reduce the maximum SLOT_CYCLE for slaves 7 and 9 in the SCFGx
registers. No noticeable effect either.

I then tried to split bursts from master 2 (DMAC0/IF1) with small values in the
MCFG2 register. No effect.

I'm getting nowhere.

Cheers,
Peter

--------------E5D6FED92312429820710758
Content-Type: text/plain; charset=UTF-8;
 name="horrid-dmac-if1.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="horrid-dmac-if1.patch"

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hL2F0X2hkbWFjLmMgYi9kcml2ZXJzL2RtYS9hdF9o
ZG1hYy5jCmluZGV4IDc1ZjM4ZDE5ZmNiZS4uNmNiNTgxOTdiZDI5IDEwMDY0NAotLS0gYS9k
cml2ZXJzL2RtYS9hdF9oZG1hYy5jCisrKyBiL2RyaXZlcnMvZG1hL2F0X2hkbWFjLmMKQEAg
LTI0Myw2ICsyNDMsMTggQEAgc3RhdGljIHZvaWQgYXRjX2Rvc3RhcnQoc3RydWN0IGF0X2Rt
YV9jaGFuICphdGNoYW4sIHN0cnVjdCBhdF9kZXNjICpmaXJzdCkKIAogCXZkYmdfZHVtcF9y
ZWdzKGF0Y2hhbik7CiAKKwlpZiAoYXRjaGFuLT5jaGFuX2NvbW1vbi5jaGFuX2lkID09IDUg
JiYKKwkgICAgYXRjaGFuLT5jaGFuX2NvbW1vbi5kZXZpY2UtPmRldl9pZCA9PSAwKQorCXsK
KwkJc3RhdGljIHUzMiBsYXN0X2lmID0gNDsKKwkJdTMyIHRoaXNfaWYgPSBmaXJzdC0+dHhk
LnBoeXMgJiAzOworCQlpZiAodGhpc19pZiAhPSBsYXN0X2lmKSB7CisJCQlkZXZfaW5mbyhj
aGFuMmRldigmYXRjaGFuLT5jaGFuX2NvbW1vbiksCisJCQkJICJEU0NSX0lGOiAldVxuIiwg
dGhpc19pZik7CisJCQlsYXN0X2lmID0gdGhpc19pZjsKKwkJfQorCX0KKwogCWNoYW5uZWxf
d3JpdGVsKGF0Y2hhbiwgU0FERFIsIDApOwogCWNoYW5uZWxfd3JpdGVsKGF0Y2hhbiwgREFE
RFIsIDApOwogCWNoYW5uZWxfd3JpdGVsKGF0Y2hhbiwgQ1RSTEEsIDApOwpAQCAtODU0LDYg
Kzg2NiwxOSBAQCBhdGNfcHJlcF9kbWFfbWVtY3B5KHN0cnVjdCBkbWFfY2hhbiAqY2hhbiwg
ZG1hX2FkZHJfdCBkZXN0LCBkbWFfYWRkcl90IHNyYywKIAkJZGVzYy0+bGxpLmN0cmxiID0g
Y3RybGI7CiAKIAkJZGVzYy0+dHhkLmNvb2tpZSA9IDA7CisJCWlmIChjaGFuLT5jaGFuX2lk
ID09IDUgJiYKKwkJICAgIGNoYW4tPmRldmljZS0+ZGV2X2lkID09IDApCisJCXsKKwkJCXN0
YXRpYyB1MzIgbGFzdF9pZiA9IDQ7CisJCQl1MzIgdGhpc19pZiA9IGRlc2MtPnR4ZC5waHlz
ICYgMzsKKwkJCWlmICh0aGlzX2lmICE9IGxhc3RfaWYpIHsKKwkJCQlkZXZfaW5mbyhjaGFu
MmRldihjaGFuKSwKKwkJCQkJICJtZW1jcHk6ICV1XG4iLCB0aGlzX2lmKTsKKwkJCQlsYXN0
X2lmID0gdGhpc19pZjsKKwkJCX0KKwkJCWRlc2MtPnR4ZC5waHlzID0gKGRlc2MtPnR4ZC5w
aHlzICYgfjMpIHwgMTsKKwkJfQorCiAJCWRlc2MtPmxlbiA9IHhmZXJfY291bnQgPDwgc3Jj
X3dpZHRoOwogCiAJCWF0Y19kZXNjX2NoYWluKCZmaXJzdCwgJnByZXYsIGRlc2MpOwpAQCAt
MTEwNyw2ICsxMTMyLDggQEAgYXRjX3ByZXBfc2xhdmVfc2coc3RydWN0IGRtYV9jaGFuICpj
aGFuLCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwKIAkJCXwgQVRDX1NSQ19BRERSX01PREVf
SU5DUgogCQkJfCBBVENfRkNfTUVNMlBFUgogCQkJfCBBVENfU0lGKGF0Y2hhbi0+bWVtX2lm
KSB8IEFUQ19ESUYoYXRjaGFuLT5wZXJfaWYpOworCQlkZXZfaW5mbyhjaGFuMmRldihjaGFu
KSwgInNsYXZlX3NnOiBtZW0yZGV2ICVkICVkXG4iLAorCQkJIGF0Y2hhbi0+bWVtX2lmLCBh
dGNoYW4tPnBlcl9pZik7CiAJCXJlZyA9IHNjb25maWctPmRzdF9hZGRyOwogCQlmb3JfZWFj
aF9zZyhzZ2wsIHNnLCBzZ19sZW4sIGkpIHsKIAkJCXN0cnVjdCBhdF9kZXNjCSpkZXNjOwpA
QCAtMTE0Nyw2ICsxMTc0LDggQEAgYXRjX3ByZXBfc2xhdmVfc2coc3RydWN0IGRtYV9jaGFu
ICpjaGFuLCBzdHJ1Y3Qgc2NhdHRlcmxpc3QgKnNnbCwKIAkJCXwgQVRDX1NSQ19BRERSX01P
REVfRklYRUQKIAkJCXwgQVRDX0ZDX1BFUjJNRU0KIAkJCXwgQVRDX1NJRihhdGNoYW4tPnBl
cl9pZikgfCBBVENfRElGKGF0Y2hhbi0+bWVtX2lmKTsKKwkJZGV2X2luZm8oY2hhbjJkZXYo
Y2hhbiksICJzbGF2ZV9zZzogZGV2Mm1lbSAlZCAlZFxuIiwKKwkJCSBhdGNoYW4tPm1lbV9p
ZiwgYXRjaGFuLT5wZXJfaWYpOwogCiAJCXJlZyA9IHNjb25maWctPnNyY19hZGRyOwogCQlm
b3JfZWFjaF9zZyhzZ2wsIHNnLCBzZ19sZW4sIGkpIHsKQEAgLTEyNTUsNiArMTI4NCw4IEBA
IGF0Y19kbWFfY3ljbGljX2ZpbGxfZGVzYyhzdHJ1Y3QgZG1hX2NoYW4gKmNoYW4sIHN0cnVj
dCBhdF9kZXNjICpkZXNjLAogCQkJCXwgQVRDX0ZDX01FTTJQRVIKIAkJCQl8IEFUQ19TSUYo
YXRjaGFuLT5tZW1faWYpCiAJCQkJfCBBVENfRElGKGF0Y2hhbi0+cGVyX2lmKTsKKwkJZGV2
X2luZm8oY2hhbjJkZXYoY2hhbiksICJmaWxsX2Rlc2M6IG1lbTJkZXYgJWQgJWRcbiIsCisJ
CQkgYXRjaGFuLT5tZW1faWYsIGF0Y2hhbi0+cGVyX2lmKTsKIAkJZGVzYy0+bGVuID0gcGVy
aW9kX2xlbjsKIAkJYnJlYWs7CiAKQEAgLTEyNjcsNiArMTI5OCw4IEBAIGF0Y19kbWFfY3lj
bGljX2ZpbGxfZGVzYyhzdHJ1Y3QgZG1hX2NoYW4gKmNoYW4sIHN0cnVjdCBhdF9kZXNjICpk
ZXNjLAogCQkJCXwgQVRDX0ZDX1BFUjJNRU0KIAkJCQl8IEFUQ19TSUYoYXRjaGFuLT5wZXJf
aWYpCiAJCQkJfCBBVENfRElGKGF0Y2hhbi0+bWVtX2lmKTsKKwkJZGV2X2luZm8oY2hhbjJk
ZXYoY2hhbiksICJmaWxsX2Rlc2M6IGRldjJtZW0gJWQgJWRcbiIsCisJCQkgYXRjaGFuLT5t
ZW1faWYsIGF0Y2hhbi0+cGVyX2lmKTsKIAkJZGVzYy0+bGVuID0gcGVyaW9kX2xlbjsKIAkJ
YnJlYWs7CiAKQEAgLTEzNDQsNiArMTM3NywxOCBAQCBhdGNfcHJlcF9kbWFfY3ljbGljKHN0
cnVjdCBkbWFfY2hhbiAqY2hhbiwgZG1hX2FkZHJfdCBidWZfYWRkciwgc2l6ZV90IGJ1Zl9s
ZW4sCiAJCWF0Y19kZXNjX2NoYWluKCZmaXJzdCwgJnByZXYsIGRlc2MpOwogCX0KIAorCWlm
IChjaGFuLT5jaGFuX2lkID09IDUgJiYKKwkgICAgY2hhbi0+ZGV2aWNlLT5kZXZfaWQgPT0g
MCkKKwl7CisJCXN0YXRpYyB1MzIgbGFzdF9pZiA9IDQ7CisJCXUzMiB0aGlzX2lmID0gZmly
c3QtPnR4ZC5waHlzICYgMzsKKwkJaWYgKHRoaXNfaWYgIT0gbGFzdF9pZikgeworCQkJZGV2
X2luZm8oY2hhbjJkZXYoY2hhbiksCisJCQkJICJjeWNsaWM6ICV1XG4iLCB0aGlzX2lmKTsK
KwkJCWxhc3RfaWYgPSB0aGlzX2lmOworCQl9CisJfQorCiAJLyogbGV0cyBtYWtlIGEgY3lj
bGljIGxpc3QgKi8KIAlwcmV2LT5sbGkuZHNjciA9IGZpcnN0LT50eGQucGh5czsKIApAQCAt
MTcxMiw2ICsxNzU3LDggQEAgc3RhdGljIHN0cnVjdCBkbWFfY2hhbiAqYXRfZG1hX3hsYXRl
KHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmRtYV9zcGVjLAogCWF0Y2hhbiA9IHRvX2F0X2Rt
YV9jaGFuKGNoYW4pOwogCWF0Y2hhbi0+cGVyX2lmID0gZG1hX3NwZWMtPmFyZ3NbMF0gJiAw
eGZmOwogCWF0Y2hhbi0+bWVtX2lmID0gKGRtYV9zcGVjLT5hcmdzWzBdID4+IDE2KSAmIDB4
ZmY7CisJZGV2X2luZm8oY2hhbjJkZXYoY2hhbiksICJ4bGF0ZSAlZCAlZFxuIiwKKwkJIGF0
Y2hhbi0+bWVtX2lmLCBhdGNoYW4tPnBlcl9pZik7CiAKIAlyZXR1cm4gY2hhbjsKIH0KQEAg
LTIwOTksNiArMjE0NiwxOCBAQCBzdGF0aWMgdm9pZCBhdGNfcmVzdW1lX2N5Y2xpYyhzdHJ1
Y3QgYXRfZG1hX2NoYW4gKmF0Y2hhbikKIHsKIAlzdHJ1Y3QgYXRfZG1hCSphdGRtYSA9IHRv
X2F0X2RtYShhdGNoYW4tPmNoYW5fY29tbW9uLmRldmljZSk7CiAKKwlpZiAoYXRjaGFuLT5j
aGFuX2NvbW1vbi5jaGFuX2lkID09IDUgJiYKKwkgICAgYXRjaGFuLT5jaGFuX2NvbW1vbi5k
ZXZpY2UtPmRldl9pZCA9PSAwKQorCXsKKwkJc3RhdGljIHUzMiBsYXN0X2lmID0gNDsKKwkJ
dTMyIHRoaXNfaWYgPSBhdGNoYW4tPnNhdmVfZHNjcjsKKwkJaWYgKHRoaXNfaWYgIT0gbGFz
dF9pZikgeworCQkJZGV2X2luZm8oY2hhbjJkZXYoJmF0Y2hhbi0+Y2hhbl9jb21tb24pLAor
CQkJCSAicmVzdW1lX2N5Y2xpYzogJXVcbiIsIHRoaXNfaWYpOworCQkJbGFzdF9pZiA9IHRo
aXNfaWY7CisJCX0KKwl9CisKIAkvKiByZXN0b3JlIGNoYW5uZWwgc3RhdHVzIGZvciBjeWNs
aWMgZGVzY3JpcHRvcnMgbGlzdDoKIAkgKiBuZXh0IGRlc2NyaXB0b3IgaW4gdGhlIGN5Y2xp
YyBsaXN0IGF0IHRoZSB0aW1lIG9mIHN1c3BlbmQgKi8KIAljaGFubmVsX3dyaXRlbChhdGNo
YW4sIFNBRERSLCAwKTsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVs
L25hbmQtY29udHJvbGxlci5jIGIvZHJpdmVycy9tdGQvbmFuZC9yYXcvYXRtZWwvbmFuZC1j
b250cm9sbGVyLmMKaW5kZXggZTY4NmZlNzMxNTllLi4zYjMzYzYzZDJlZDQgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCisrKyBi
L2RyaXZlcnMvbXRkL25hbmQvcmF3L2F0bWVsL25hbmQtY29udHJvbGxlci5jCkBAIC0xOTkx
LDYgKzE5OTEsOSBAQCBzdGF0aWMgaW50IGF0bWVsX25hbmRfY29udHJvbGxlcl9pbml0KHN0
cnVjdCBhdG1lbF9uYW5kX2NvbnRyb2xsZXIgKm5jLAogCQluYy0+ZG1hYyA9IGRtYV9yZXF1
ZXN0X2NoYW5uZWwobWFzaywgTlVMTCwgTlVMTCk7CiAJCWlmICghbmMtPmRtYWMpCiAJCQlk
ZXZfZXJyKG5jLT5kZXYsICJGYWlsZWQgdG8gcmVxdWVzdCBETUEgY2hhbm5lbFxuIik7CisK
KwkJZGV2X2luZm8obmMtPmRldiwgInVzaW5nICVzIGZvciBETUEgdHJhbnNmZXJzXG4iLAor
CQkJIGRtYV9jaGFuX25hbWUobmMtPmRtYWMpKTsKIAl9CiAKIAkvKiBXZSBkbyBub3QgcmV0
cmlldmUgdGhlIFNNQyBzeXNjb24gd2hlbiBwYXJzaW5nIG9sZCBEVHMuICovCg==
--------------E5D6FED92312429820710758--
