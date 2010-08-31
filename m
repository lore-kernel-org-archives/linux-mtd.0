Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OqS9m-00049P-QT
	for linux-mtd@lists.infradead.org; Tue, 31 Aug 2010 14:49:51 +0000
Received: by pxi4 with SMTP id 4so2912112pxi.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 31 Aug 2010 07:49:48 -0700 (PDT)
From: Kevin Hilman <khilman@deeprootsystems.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/6] davinci: add support for aemif timing configuration
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
	<1283082501.2131.29.camel@brekeke>
	<877hj8b20x.fsf@deeprootsystems.com>
	<1283254660.2018.29.camel@brekeke>
Date: Tue, 31 Aug 2010 07:49:41 -0700
In-Reply-To: <1283254660.2018.29.camel@brekeke> (Artem Bityutskiy's message of
	"Tue, 31 Aug 2010 14:37:40 +0300")
Message-ID: <877hj6vnui.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	Sekhar Nori <nsekhar@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Mon, 2010-08-30 at 07:36 -0700, Kevin Hilman wrote:
>> > Pushed to l2-mtd-2.6.git / dunno.
>> 
>> Hi Artem,
>> 
>> If it's OK with you, and with your Ack, I'd prefer to merge this series
>> via the davinci tree.
>> 
>> The reason is because the files touched in arch/arm/mach-davinci/* are
>> also getting lots of other changes for 2.6.37, and I'd like to minimize
>> conflicts.
>
> Right, I've just removed them from my tree.
>
>> Let me know if that's OK with you and if I can add your signoff to the
>> drivers/mtd/* patches.  
>
> The MTD part is small there, feel free to add
>
> Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Thanks Artem,

Kevin
