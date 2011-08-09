MIME-Version: 1.0
In-Reply-To: <4E40D563.2090202@freescale.com>
References: <20110805135133.GA26981@pengutronix.de>
	<4E3F8087.6070206@freescale.com>
	<CAHMSPgMYP+5Hpa5sC-yt=1H-S=tEER8uNzj6uMSK403_DGYJ9Q@mail.gmail.com>
	<4E3FBC75.7010703@freescale.com>
	<CAHMSPgMdBmmNG41_QgGivSb+M1rG5nqJjtveyZueKHHJrA8vzA@mail.gmail.com>
	<4E40D563.2090202@freescale.com>
Date: Tue, 9 Aug 2011 09:58:23 +0200
Message-ID: <CAHMSPgPzVordYOn5wgp0OZLGbAqkSGKJxDre8bvRpTyAz85udw@mail.gmail.com>
Subject: Re: GPMI-NAND Status?
From: Koen Beel <koen.beel.barco@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: multipart/mixed; boundary=0016e6d5666d97a58704aa0ded6d
Cc: Wolfram Sang <w.sang@pengutronix.de>, linux-mtd@lists.infradead.org,
	Shawn Guo <shawn.guo@linaro.org>, shijie8@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	=?UTF-8?Q?Lothar_Wa=C3=9Fmann?= <LW@karo-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--0016e6d5666d97a58704aa0ded6d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,



On Tue, Aug 9, 2011 at 8:36 AM, Huang Shijie <b32955@freescale.com> wrote:
> Hi Koen:
>>
>> Hi,
>>
>> On Mon, Aug 8, 2011 at 12:37 PM, Huang Shijie<b32955@freescale.com>
>> =C2=A0wrote:
>>>
>>> Hi,
>>>>
>>>> On my target, the mxs-dma is working for sdio until the gpmi-nand
>>>> gives a timeout. After that the dma for sdio is *not fully* working
>>>> anymore.
>>>>
>>> We need more log in following aspects:
>>> [1] apbh-dma registers
>>> [2] clk registers
>>> [3] gpmi registers
>>>
>>> Please git-apply the patch in the attachment.
>>> It will print out more DMA information WHEN dma-timeout occur.
>>
>> Don't get it. What exactly are you trying to dump?
>> This patch dumps CTRL0, CTRL1, CTRL2, DEVSEL but also some registers
>> of APBH channel0 which is reserved....
>
> sorry, I intended to print out the channel 4(NAND_DEVICE0).
>
> I want to know that:
> =C2=A0When the dma timeout occurs, whether it caused by the GPMI or by th=
e DMA
> itself.

Ok, I was a little confused about the addresses, but it seems like you
are using mx28 (and corresponding addresses). APBH dma for mx23 has
different address according to the datasheet.
So I adjusted the patch a little for mx23, see attachment.

Here is the log with some comments added on the dma.

# ubiformat /dev/mtd1
ubiformat: mtd1 (nand), size 20971520 bytes (20.0 MiB), 40 eraseblocks
of 524288 bytes (512.0 KiB), min. I/O size 4096 bytes
libscan: scanning eraseblock 0 --  2 % complete  [   86.720000] [
start_dma_without_bch_irq : 393 ] DMA timeout, last DMA :1
[   86.720000] ------------------------DMA DUMP BEGIN ----------
[   86.730000] APBH REG :0 : 30000000   // -> HW_APBH_CTRL0:
AHB_BURST8_EN, APB_BURST4_EN
[   86.730000] APBH REG :10 : 00FF0000   // -> HW_APBH_CTRL1:
CHX_CMDCMPLT_IRQ_EN, no cmdcmplt_irq
[   86.740000] APBH REG :20 : 00000000   // -> HW_APBH_CTRL2: no error_irq
[   86.740000] APBH REG :30 : 00000000   // -> HW_APBH_DEVSEL: "N/A
for apbh bridge dma."
[   86.750000] APBH CH4 REG :200 : 418D7098 // executing last dma
command of command chain (see below)
[   86.750000] APBH CH4 REG :210 : 00000000 // no next command, ok
[   86.750000] APBH CH4 REG :220 : 000001C8 // HW_APBH_CH4_CMD:
COMMAND =3D NO DMA TRANSFER, IRQONCMPLT, WAIT4ENDCMD, SEMAPHORE,
HALTONTERMINATE
[   86.760000] APBH CH4 REG :230 : 00000000 // HW_APBH_CH4_BAR:
"Address of system memory buffer to be read or written over the AHB
bus." -> strange value ...
[   86.760000] APBH CH4 REG :240 : 00010000 // HW_APBH_CH4_SEMA:
semaphore counter is 1
[   86.770000] APBH CH4 REG :250 : 03A00015 // HW_APBH_CH4_DEBUG1:
LOCK, NEXTCMDADDRVALID, RD_FIFO_EMPTY, WR_FIFO_EMPTY,  STATEMACHINE =3D
"WAIT_END =3D 0x15 When the Wait for Command End bit is set, the state
machine enters this state until the DMA device indicates that the
command is complete."
[   86.770000] APBH CH4 REG :260 : 00000000 // -> HW_APBH_CH4_DEBUG2:
no apb of ahb bytes remaining for transfer
[   86.780000] [ 0 ] : ME : 418d7000, next : 418d704c, bits :
00002304, bytes : 00000000, buf : 00000000
[   86.790000] [ 0 ] PIO[0] : 03800000
[   86.790000] [ 0 ] PIO[1] : 00000000
[   86.800000] [ 0 ] PIO[2] : 00000000
[   86.800000] [ 1 ] : ME : 418d704c, next : 418d7098, bits :
00006304, bytes : 00000001, buf : 4181b000
[   86.810000] [ 1 ] PIO[0] : 018010da
[   86.810000] [ 1 ] PIO[1] : 00000000
[   86.820000] [ 1 ] PIO[2] : 000011ff
[   86.820000] [ 2 ] : ME : 418d7098, next : 00000000, bits :
000023c8, bytes : 00000000, buf : 00000000
[   86.830000] [ 2 ] PIO[0] : 038010da
[   86.840000] [ 2 ] PIO[1] : 00000000
[   86.840000] [ 2 ] PIO[2] : 00000000
[   86.840000] ------------------------DMA DUMP END ------------
[   86.850000] [ gpmi_show_regs : 076 ] -------------- Show GPMI
registers ----------
[   86.860000] [ gpmi_show_regs : 079 ] offset 0x000 : 0x238010da
[   86.870000] [ gpmi_show_regs : 079 ] offset 0x010 : 0x00000000
[   86.870000] [ gpmi_show_regs : 079 ] offset 0x020 : 0x000011ff
[   86.880000] [ gpmi_show_regs : 079 ] offset 0x030 : 0x000010da
[   86.890000] [ gpmi_show_regs : 079 ] offset 0x040 : 0x40f0c480
[   86.890000] [ gpmi_show_regs : 079 ] offset 0x050 : 0x40f09000
[   86.900000] [ gpmi_show_regs : 079 ] offset 0x060 : 0x0004000c
[   86.910000] [ gpmi_show_regs : 079 ] offset 0x070 : 0x00010203
[   86.910000] [ gpmi_show_regs : 079 ] offset 0x080 : 0x05000000
[   86.920000] [ gpmi_show_regs : 079 ] offset 0x090 : 0x09020101
[   86.920000] [ gpmi_show_regs : 079 ] offset 0x0a0 : 0x00000030
[   86.930000] [ gpmi_show_regs : 079 ] offset 0x0b0 : 0x80000010
[   86.940000] [ gpmi_show_regs : 079 ] offset 0x0c0 : 0x100000ba
[   86.940000] [ gpmi_show_regs : 079 ] offset 0x0d0 : 0x03000000
[   86.950000] [ gpmi_show_regs : 081 ] -------------- Show GPMI
registers end ----------
[   86.960000] Kernel panic - not syncing: -----------DMA
FAILED------------------

Br,
Koen

>
>
> Please try the new patch.
>
> Best Regards
> Huang Shijie
>>
>> Then it prints some debug info on channel 1 (ssp1) and then alle
>> channel 2 register except the debug register (ssp2 =3D not used here).
>>
>> What info do you need?
>>
>> Br,
>> Koen
>>
>>> Best Regards
>>> Huang Shijie
>>>
>> _______________________________________________
>> linux-arm-kernel mailing list
>> linux-arm-kernel@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>
>

--0016e6d5666d97a58704aa0ded6d
Content-Type: text/x-patch; charset=US-ASCII;
	name="0008-Added-extra-dma-log-for-ch4-nand0.patch"
Content-Disposition: attachment;
	filename="0008-Added-extra-dma-log-for-ch4-nand0.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gr4kw9sa1

RnJvbSA0NTdlNzMyOGUwYjExZTdmYzg4ODg0NDEyOTUyMDM4YTljYWU1MjQ4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBLb2VuIEJlZWwgPGtvZW4uYmVlbEBiYXJjby5jb20+CkRhdGU6
IFR1ZSwgOSBBdWcgMjAxMSAwOTo1Njo0MiArMDIwMApTdWJqZWN0OiBbUEFUQ0ggOC84XSBBZGRl
ZCBleHRyYSBkbWEgbG9nIGZvciBjaDQgKG5hbmQwKS4KCi0tLQogZHJpdmVycy9kbWEvbXhzLWRt
YS5jICAgICAgICAgICAgICAgICAgfCAgIDM3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystCiBkcml2ZXJzL210ZC9uYW5kL2dwbWktbmFuZC9ncG1pLW5hbmQuYyB8ICAgIDIgKwogMiBm
aWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZG1hL214cy1kbWEuYyBiL2RyaXZlcnMvZG1hL214cy1kbWEuYwppbmRleCA4
OGFhZDRmLi4wOWM2YzdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RtYS9teHMtZG1hLmMKKysrIGIv
ZHJpdmVycy9kbWEvbXhzLWRtYS5jCkBAIC0xMzAsNiArMTMwLDcgQEAgc3RydWN0IG14c19kbWFf
ZW5naW5lIHsKIAlzdHJ1Y3QgbXhzX2RtYV9jaGFuCQlteHNfY2hhbnNbTVhTX0RNQV9DSEFOTkVM
U107CiB9OwogCitzdHJ1Y3QgbXhzX2RtYV9jaGFuICpnX214c19jaGFuOwogc3RhdGljIHZvaWQg
bXhzX2RtYV9yZXNldF9jaGFuKHN0cnVjdCBteHNfZG1hX2NoYW4gKm14c19jaGFuKQogewogCXN0
cnVjdCBteHNfZG1hX2VuZ2luZSAqbXhzX2RtYSA9IG14c19jaGFuLT5teHNfZG1hOwpAQCAtMjM5
LDYgKzI0MCw3IEBAIHN0YXRpYyBkbWFfY29va2llX3QgbXhzX2RtYV90eF9zdWJtaXQoc3RydWN0
IGRtYV9hc3luY190eF9kZXNjcmlwdG9yICp0eCkKIAlzdHJ1Y3QgbXhzX2RtYV9jaGFuICpteHNf
Y2hhbiA9IHRvX214c19kbWFfY2hhbih0eC0+Y2hhbik7CiAKIAlteHNfZG1hX2VuYWJsZV9jaGFu
KG14c19jaGFuKTsKKwlnX214c19jaGFuID0gbXhzX2NoYW47CiAKIAlyZXR1cm4gbXhzX2RtYV9h
c3NpZ25fY29va2llKG14c19jaGFuKTsKIH0KQEAgLTM3MCw2ICszNzIsNyBAQCBzdGF0aWMgdm9p
ZCBteHNfZG1hX2ZyZWVfY2hhbl9yZXNvdXJjZXMoc3RydWN0IGRtYV9jaGFuICpjaGFuKQogCWNs
a19kaXNhYmxlKG14c19kbWEtPmNsayk7CiB9CiAKK3N0YXRpYyBpbnQgaWR4Owogc3RhdGljIHN0
cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqbXhzX2RtYV9wcmVwX3NsYXZlX3NnKAogCQlz
dHJ1Y3QgZG1hX2NoYW4gKmNoYW4sIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLAogCQl1bnNpZ25l
ZCBpbnQgc2dfbGVuLCBlbnVtIGRtYV9kYXRhX2RpcmVjdGlvbiBkaXJlY3Rpb24sCkBAIC0zODEs
NyArMzg0LDYgQEAgc3RhdGljIHN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqbXhzX2Rt
YV9wcmVwX3NsYXZlX3NnKAogCXN0cnVjdCBzY2F0dGVybGlzdCAqc2c7CiAJaW50IGksIGo7CiAJ
dTMyICpwaW87Ci0Jc3RhdGljIGludCBpZHg7CiAKIAlpZiAobXhzX2NoYW4tPnN0YXR1cyA9PSBE
TUFfSU5fUFJPR1JFU1MgJiYgIWFwcGVuZCkKIAkJcmV0dXJuIE5VTEw7CkBAIC02MDYsNiArNjA4
LDM5IEBAIGVycl9vdXQ6CiAJcmV0dXJuIHJldDsKIH0KIAorCit2b2lkIGR1bXBfZG1hX3JlZyh2
b2lkKQoreworCWludCBpOworCXUzMiBzdGF0MTsKKworCXN0cnVjdCBteHNfZG1hX2NoYW4gKm14
c19jaGFuID0gZ19teHNfY2hhbjsKKwlzdHJ1Y3QgbXhzX2RtYV9lbmdpbmUgKmdfbXhzX2RtYSA9
IG14c19jaGFuLT5teHNfZG1hOworCXN0cnVjdCBteHNfZG1hX2NjdyAqY2N3OworCisJcHJpbnRr
KCItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1ETUEgRFVNUCBCRUdJTiAtLS0tLS0tLS0tXG4iKTsK
Kwlmb3IgKGkgPSAwOyBpIDwgNDsgaSsrKSB7CisJCXN0YXQxID0gcmVhZGwoZ19teHNfZG1hLT5i
YXNlICsgMHgxMCAqIGkpOworCQlwcmludGsoIkFQQkggUkVHIDoleCA6ICUuOFhcbiIsIDB4MTAg
KiBpLCBzdGF0MSk7CisJfQorCWZvciAoaSA9IDA7IGkgPCA3OyBpKyspIHsKKwkJc3RhdDEgPSBy
ZWFkbChnX214c19kbWEtPmJhc2UgKyAweDEwICogaSArIDB4MjAwKTsKKwkJcHJpbnRrKCJBUEJI
IENINCBSRUcgOiV4IDogJS44WFxuIiwgMHgxMCAqIGkgKyAweDIwMCwgc3RhdDEpOworCX0KKwor
CWZvciAoaSA9IDA7IGkgPCBpZHg7IGkrKykgeworCQlpbnQgajsKKworCQljY3cgPSAmbXhzX2No
YW4tPmNjd1tpXTsKKwkJcHJpbnRrKCJbICVkIF0gOiBNRSA6ICUuOHgsIG5leHQgOiAlLjh4LCBi
aXRzIDogJS44eCwgYnl0ZXMgOiAlLjh4LCBidWYgOiAlLjh4XG4iLAorCQkJaSwgbXhzX2NoYW4t
PmNjd19waHlzICsgc2l6ZW9mKCpjY3cpICogaSwKKwkJCWNjdy0+bmV4dCwgY2N3LT5iaXRzLCBj
Y3ctPnhmZXJfYnl0ZXMsIGNjdy0+YnVmYWRkcik7CisJCWZvciAoaiA9IDA7IGogPCAzOyBqKysp
CisJCQlwcmludGsoIlsgJWQgXSBQSU9bJWRdIDogJS44eFxuIiwgaSwgaiwgY2N3LT5waW9fd29y
ZHNbal0pOyAKKwl9CisJcHJpbnRrKCItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1ETUEgRFVNUCBF
TkQgLS0tLS0tLS0tLS0tXG4iKTsKK30KKwogc3RhdGljIGludCBfX2luaXQgbXhzX2RtYV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogewogCWNvbnN0IHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2VfaWQgKmlkX2VudHJ5ID0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvbXRkL25hbmQvZ3Bt
aS1uYW5kL2dwbWktbmFuZC5jIGIvZHJpdmVycy9tdGQvbmFuZC9ncG1pLW5hbmQvZ3BtaS1uYW5k
LmMKaW5kZXggMWMyY2JjNS4uM2Q2ODk1YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tdGQvbmFuZC9n
cG1pLW5hbmQvZ3BtaS1uYW5kLmMKKysrIGIvZHJpdmVycy9tdGQvbmFuZC9ncG1pLW5hbmQvZ3Bt
aS1uYW5kLmMKQEAgLTM3OCw2ICszNzgsNyBAQCBpbnQgc3RhcnRfZG1hX3dpdGhvdXRfYmNoX2ly
cShzdHJ1Y3QgZ3BtaV9uYW5kX2RhdGEgKnRoaXMsCiB7CiAJc3RydWN0IGNvbXBsZXRpb24gKmRt
YV9jID0gJnRoaXMtPmRtYV9kb25lOwogCWludCBlcnI7CisJZXh0ZXJuIHZvaWQgZHVtcF9kbWFf
cmVnKHZvaWQpOwogCiAJaW5pdF9jb21wbGV0aW9uKGRtYV9jKTsKIApAQCAtMzkxLDYgKzM5Miw3
IEBAIGludCBzdGFydF9kbWFfd2l0aG91dF9iY2hfaXJxKHN0cnVjdCBncG1pX25hbmRfZGF0YSAq
dGhpcywKIAlpZiAoZXJyKSB7CiAJCXByX2luZm8oIkRNQSB0aW1lb3V0LCBsYXN0IERNQSA6JWRc
biIsIHRoaXMtPmxhc3RfZG1hX3R5cGUpOwogCQlpZiAoZ3BtaV9kZWJ1ZyAmIEdQTUlfREVCVUdf
Q1JBWlkpIHsKKwkJCWR1bXBfZG1hX3JlZygpOwogCQkJZ3BtaV9zaG93X3JlZ3ModGhpcyk7CiAJ
CQlwYW5pYygiLS0tLS0tLS0tLS1ETUEgRkFJTEVELS0tLS0tLS0tLS0tLS0tLS0tIik7CiAJCX0K
LS0gCjEuNy40LjEKCg==
--0016e6d5666d97a58704aa0ded6d--
