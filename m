Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1KKs-0002tZ-E4
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 14:42:15 +0000
Received: by eye22 with SMTP id 22so917052eye.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 30 Sep 2010 07:42:13 -0700 (PDT)
MIME-Version: 1.0
Sender: glikely@secretlab.ca
In-Reply-To: <AANLkTinBDdEyMDt3KoauNdmTCz1ZAJ5mZ23iMWiwsUm4@mail.gmail.com>
References: <841976.76219.qm@web180306.mail.gq1.yahoo.com>
	<AANLkTinBDdEyMDt3KoauNdmTCz1ZAJ5mZ23iMWiwsUm4@mail.gmail.com>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Thu, 30 Sep 2010 23:41:40 +0900
Message-ID: <AANLkTi=GydTyhf3TOzCZOtrme1Jh0UmNDHqTVP59q=LH@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] mtd: m25p80: add a read function to read page by
	page
To: David Brownell <david-b@pacbell.net>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, Mingkai Hu <Mingkai.hu@freescale.com>,
	linux-mtd@lists.infradead.org, kumar.gala@freescale.com,
	spi-devel-general@lists.sourceforge.net
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Sep 30, 2010 at 11:16 PM, Grant Likely
<grant.likely@secretlab.ca> wrote:
> On Thu, Sep 30, 2010 at 7:46 PM, David Brownell <david-b@pacbell.net> wro=
te:
>>
>> --- On Thu, 9/30/10, Mingkai Hu <Mingkai.hu@freescale.com> wrote:
>>
>>> From: Mingkai Hu <Mingkai.hu@freescale.com>
>>> Subject: [PATCH v3 6/7] mtd: m25p80: add a read function to read page b=
y page
>>
>> NAK.
>>
>> We went over this before.
>
> Yes, I agree with David on this. =A0If large transfers don't work, then
> it is the SPI master driver that is buggy.

By the way, does this fix your problem?

https://patchwork.kernel.org/patch/184752/

g.
