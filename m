Received: from yw-out-1718.google.com ([74.125.46.157])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LunRN-00011m-05
	for linux-mtd@lists.infradead.org; Fri, 17 Apr 2009 12:45:16 +0000
Received: by yw-out-1718.google.com with SMTP id 9so577736ywk.72
	for <linux-mtd@lists.infradead.org>;
	Fri, 17 Apr 2009 05:45:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.00.0904161936090.12608@baythorne.infradead.org>
References: <1239883845-17804-1-git-send-email-sr@denx.de>
	<fa686aa40904160626k118cea3cvc0db38a2277e45b8@mail.gmail.com>
	<200904161537.59048.sr@denx.de>
	<fa686aa40904160646v75a98e02s446fd89c08cfebae@mail.gmail.com>
	<1239889899.3390.216.camel@localhost.localdomain>
	<alpine.LFD.2.00.0904161936090.12608@baythorne.infradead.org>
Date: Fri, 17 Apr 2009 08:45:06 -0400
Message-ID: <625fc13d0904170545i25929e98qeaa060b850c67955@mail.gmail.com>
Subject: Re: [PATCH 1/3 v3] mtd: physmap_of: Add multiple regions and
	concatenation support
From: Josh Boyer <jwboyer@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linuxppc-dev@ozlabs.org, Stefan Roese <sr@denx.de>,
	linux-mtd@lists.infradead.org, devicetree-discuss@ozlabs.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Apr 16, 2009 at 2:38 PM, David Woodhouse <dwmw2@infradead.org> wrot=
e:
> On Thu, 16 Apr 2009, Artem Bityutskiy wrote:
>
>> On Thu, 2009-04-16 at 07:46 -0600, Grant Likely wrote:
>>> Okay. =A0It will be good to get this one into -next for some testing
>>> exposure. =A0Unless he asks me to do otherwise, I'll leave this one to
>>> David to pick up.
>>
>> David usually picks up stuff just before or during merge window,
>> so if you want linux-next exposure, you need to have some extra
>> care.
>
> I don't necessarily do that on purpose; it just works out that way when I=
'm
> busy.

Are you ever _not_ busy? ;)

josh
