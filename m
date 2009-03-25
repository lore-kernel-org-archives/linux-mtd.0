Received: from wf-out-1314.google.com ([209.85.200.170])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LmWsT-0006BD-63
	for linux-mtd@lists.infradead.org; Wed, 25 Mar 2009 17:27:13 +0000
Received: by wf-out-1314.google.com with SMTP id 23so128348wfg.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 25 Mar 2009 10:26:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49CA3503.5040006@grandegger.com>
References: <1237975701-23201-1-git-send-email-wg@grandegger.com>
	<1237975701-23201-2-git-send-email-wg@grandegger.com>
	<fa686aa40903250631w6a0cc8b9p3b2e3c1348e0acee@mail.gmail.com>
	<fa686aa40903250632o759921c8n1ae8d17286c1f976@mail.gmail.com>
	<49CA3503.5040006@grandegger.com>
Date: Wed, 25 Mar 2009 11:26:54 -0600
Message-ID: <fa686aa40903251026q4a618810vcbac025f047153e7@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] NAND: FSL-UPM: add multi chip support
From: Grant Likely <grant.likely@secretlab.ca>
To: Wolfgang Grandegger <wg@grandegger.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org,
	devicetree-discuss list <devicetree-discuss@ozlabs.org>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Mar 25, 2009 at 7:43 AM, Wolfgang Grandegger <wg@grandegger.com> wr=
ote:
> Grant Likely wrote:
>> On Wed, Mar 25, 2009 at 7:31 AM, Grant Likely <grant.likely@secretlab.ca=
> wrote:
>>> On Wed, Mar 25, 2009 at 4:08 AM, Wolfgang Grandegger <wg@grandegger.com=
> wrote:
>>>> This patch adds support for multi-chip NAND devices to the FSL-UPM
>>>> driver. This requires support for multiple GPIOs for the RNB pins.
>>>> The NAND chips are selected through address lines defined by the
>>>> FDT property "chip-offset".
>>>>
>>>> Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
>>> Hi Wolfgang,
>>>
>>> Can you please send a sample device tree snippit for this and add
>>> documentation updates to your patch for the extended binding?
>>
>> Oh, and cc: devicetree-discuss@ozlabs.org in your next posting.
>
> OK, does patch 3/4 not already contain what you are looking for? See:
>
> http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069787.html

Oops, sorry.  Missed that.

> I separated it from the NAND patches because they go through the MTD
> maintainer(s).
>
> BTW: did you have a chance to look into the following RFC on I2C bus
> speed setting?
>
> =A0http://ozlabs.org/pipermail/linuxppc-dev/2009-March/069489.html

No.  Looking at it now.

g.

--=20
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
