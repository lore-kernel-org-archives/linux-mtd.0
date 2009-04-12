Received: from yw-out-1718.google.com ([74.125.46.158])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1Lssky-0008TR-2u
	for linux-mtd@lists.infradead.org; Sun, 12 Apr 2009 06:01:35 +0000
Received: by yw-out-1718.google.com with SMTP id 9so1082395ywk.72
	for <linux-mtd@lists.infradead.org>;
	Sat, 11 Apr 2009 23:01:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <200904071854.16818.sr@denx.de>
References: <1239093575-12147-1-git-send-email-sr@denx.de>
	<49DB8271.8050501@freescale.com> <200904071854.16818.sr@denx.de>
From: Grant Likely <grant.likely@secretlab.ca>
Date: Sun, 12 Apr 2009 00:01:12 -0600
Message-ID: <fa686aa40904112301q6bcdd23enc23c745b6198a447@mail.gmail.com>
Subject: Re: [PATCH 3/4 v2] mtd/powerpc: Remove unused "device-width" property
To: Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Scott Wood <scottwood@freescale.com>, linuxppc-dev@ozlabs.org,
	devicetree-discuss@ozlabs.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 7, 2009 at 10:54 AM, Stefan Roese <sr@denx.de> wrote:
> On Tuesday 07 April 2009, Scott Wood wrote:
>> Stefan Roese wrote:
>> > This property is unused. It's not handled as all by the physmap_of
>> > driver. So let's remove it from the documentation.
>> >
>> > Signed-off-by: Stefan Roese <sr@denx.de>
>> > CC: Grant Likely <grant.likely@secretlab.ca>
>>
>> The device tree describes the hardware, not what Linux happens to do
>> with it at the moment.
>>
>> I'd rather keep it.
>
> I find it rather confusing to "see" such bindings that are not supported. One
> could expect something to happen/change after defining this property. So in
> general I think adding unsupported properties to the Documentation is a bad
> idea. But that's just my 2 cents. If the general opinion is to keep this
> property, I'll keep it in of course.

I say keep it.  It is a valid way to describe the hardware regardless
of whether or not the driver supports it yet.

g.

-- 
Grant Likely, B.Sc., P.Eng.
Secret Lab Technologies Ltd.
