Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Swjtr-0004Hu-91
 for linux-mtd@lists.infradead.org; Thu, 02 Aug 2012 01:08:27 +0000
Received: by ggcs5 with SMTP id s5so8304242ggc.36
 for <linux-mtd@lists.infradead.org>; Wed, 01 Aug 2012 18:08:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <50195605.90802@freescale.com>
References: <1343696537-2564-1-git-send-email-computersforpeace@gmail.com>
 <50178A45.3000406@parrot.com> <501803C5.8080105@freescale.com>
 <50192980.7050303@parrot.com> <50195605.90802@freescale.com>
Date: Wed, 1 Aug 2012 18:08:25 -0700
Message-ID: <CAN8TOE858JDY8fP3h8N=9S5jbW+BJgxdBa6JGro4+yKZ=ZLrOQ@mail.gmail.com>
Subject: Re: [PATCH RESEND] mtd: nand: allow NAND_NO_SUBPAGE_WRITE to be set
 from driver
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Marek Vasut <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 Matthieu CASTET <matthieu.castet@parrot.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 1, 2012 at 9:15 AM, Scott Wood <scottwood@freescale.com> wrote:
> On 08/01/2012 08:05 AM, Matthieu CASTET wrote:
>> Scott Wood a =E9crit :
>>> On 07/31/2012 02:33 AM, Matthieu CASTET wrote:
>>>> Hi,
>>>>
>>>> for ONFI flash (like this micron one) the information should be extrac=
ted form
>>>> the ONFI table (programs_per_page IIRC)
>>>>
>>>> This should be better than relying on the SOC driver for setting this =
flags.
>>>
>>> This is for cases where the constraint is the controller, not the chip.
>>>
>>>> Does the gpmi driver set this flag because it do not support partial w=
rite ?
>>>> In this case why it doesn't set  chip->ecc.steps to 1 ?
>>>
>>> Why is it better to lie about ECC geometry than to just say "subpage
>>> writes aren't supported"?  Does/will the ECC geometry get used by upper
>>> layers in evaluating the number of corrected bitflips?
>> If it is not because of ecc geometry, why the controller doesn't support=
 subpage
>> writes ?
>
> I can't answer for GPMI, but in the case of Freescale eLBC/IFC, the
> controller only does ECC when you do a full page transaction -- but the
> ECC is still done in steps, which is relevant for bitflip thresholds.

My controller (out-of-tree driver) *can* support subpage writes, but
disabling them gives performance benefits and allows stronger ECC
modes. My driver already performs a kind of hack by enabling
NAND_NO_SUBPAGE_WRITE in between nand_scan_ident() and
nand_scan_tail().

I agree that removing the mask allows a direct way of stating that the
controller does not support subpage writes, a property which is
orthogonal to the concept of ECC step size.

Brian
