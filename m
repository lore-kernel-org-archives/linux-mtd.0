Received: from node3.inaccessnetworks.com ([212.205.200.118]
	helo=vm-dmz.priv.inaccessnetworks.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1LFNhN-0002Gz-1O
	for linux-mtd@lists.infradead.org; Wed, 24 Dec 2008 06:58:29 +0000
MIME-Version: 1.0
Date: Wed, 24 Dec 2008 08:58:18 +0200
From: knakos <knakos@inaccessnetworks.com>
To: Sean MacLennan <smaclennan@pikatech.com>
Subject: Re: [PATCH] ndfc driver
In-Reply-To: <20081223170040.4e58de3f@lappy.seanm.ca>
References: <4950D8EA.7010905@inaccessnetworks.com>
	<20081223170040.4e58de3f@lappy.seanm.ca>
Message-ID: <4db52328813a57d9225b7d30393aa9f3@inaccessnetworks.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="UTF-8"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Sean,

Thanks for your comments.

On Tue, 23 Dec 2008 17:00:40 -0500, Sean MacLennan
<smaclennan@pikatech.com> wrote:
> I am not a DTS expert, I just use it ;) But are you sure the second
> value should be d0000000?

Same here :-) These values were used in the previous incarnation of the dts
file 
with a 2.6.26 kernel so I "migrated" them to 2.6.28-rc8. During my numerous
experiments to get the driver working, I *think* I have tried out both <0 0
2000> 
and <1 0 2000>, based on your provided template, and they yielded no good
results.
BTW, what I think the crash was all about when iomap()-ing to chip select
0,
was that addresses, in this instance, of "0d0000000" collided with the
kernel
somehow, as opposed to "1d0000000" or "2d0000000" which did not. Still,
this is
an un-educated guess :-)

> Are you using u-boot and, if so, what version? The ecc_code was
> changed to match u-boot. We are using a heavily modified 1.3.3.
> 
> This may need to be a config option, since we cannot guarantee what
> version of u-boot they are running.

Yep, we're using u-boot.
OK, this makes sense and I would also like to point out that I was trying
to
mount partitions created with the previous ndfc driver & kernel.

Unfortunately, I won't have access to the board until next week and I
cannot
remember accurately the u-boot version. So, if you're patient, I'll run
your
suggested reg <...> tests and provide more info on this after Xmas :-)

Thanks again,
Kostas
