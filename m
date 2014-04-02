Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVFar-0002lw-HK
 for linux-mtd@lists.infradead.org; Wed, 02 Apr 2014 07:28:18 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: David Mosberger <davidm@egauge.net>, Brian Norris
 <computersforpeace@gmail.com>
Subject: RE: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
Date: Wed, 2 Apr 2014 07:27:45 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAC059F@DBDE04.ent.ti.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
 <20140401063958.GA6400@brian-ubuntu>
 <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
In-Reply-To: <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Gerhard Sittig <gsi@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Artem
 Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

>From: David Mosberger [mailto:davidm@egauge.net]
>>On Tue, Apr 1, 2014 at 12:39 AM, Brian Norris ><computersforpeace@gmail.c=
om> wrote:
>>> On Mon, Mar 31, 2014 at 05:28:53PM -0600, David Mosberger wrote:
[...]

>>> +{
>>> +     u8 features[ONFI_SUBFEATURE_PARAM_LEN];
>>> +
>>> +     if (chip->onfi_get_features(mtd, chip, ONFI_FEATURE_ADDR_ARRAY_OP=
_MODE,
>>> +                                 features) < 0)
>>> +             return;
>>> +
>>> +     if (features[0] & ONFI_FEATURE_ARRAY_OP_MODE_ENABLE_ON_DIE_ECC) {
>>> +             /*
>>> +              * If the chip has on-die ECC enabled, we kind of have
>>> +              * to do the same...
>>> +              */
>>
>> That's not really true at all, is it? We can simply disable the on-die
>> ECC and use the provided spare area with a different ECC scheme, can't
>> we? (e.g., software BCH; or an SoC's HW ECC) In fact, I think disabling
>> the on-die ECC is a more reasonable default; nand_base is used by many
>> drivers, most of which provide their own implementations, and many of
>> which would not be compatible with the implementations you provide. A
>> system should have to "opt in" somehow to enable this, I think.
>>
>> Additionally, you need a way to inform the hardware driver that you're
>> using on-die ECC, so they can make the appropriate choices (to disable
>> their HW ECC, for instance).
>>
>> BTW, what driver/controller/SoC are you running this with?
>
>No, if you booted with on-die ECC enabled, presumably you have the
>on-die ECC layout and you can't switch (sure, you can turn off ECC
>but all hell will break lose when you actually try to read data with
>the wrong ECC layout).
>
You have to consider multiple scenarios here (as Brian also suggested).

(1) If a system does _not_ boot from NAND, instead it enables NAND
only in kernel (like for rootfs). Then you need a mechanism to
enable/disable on-die ECC in the kernel, the same way boot-loader does.

(2) If a boot-loader, has enabled on-die ECC, but kernel driver supports
even higher ECC scheme, then you need a hook in driver to allow user
to 'disable' this feature.

>There seems to be this misconception that somehow on-die ECC would
>be turned on "accidentially".  It is not.  Either a boot loader has to tur=
n
>it on or you have to pay Micron extra money (several dollars/chip, AFAIR)
>to have them send you custom chips with on-die ECC enabled by default.
>
>This is not to say that you may want a way to override it, but the patch
>as it stands is safe.
>
>  --david
>--
>eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768


with regards, pekon
