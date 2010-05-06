Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O9vPU-00039k-RQ
	for linux-mtd@lists.infradead.org; Thu, 06 May 2010 07:22:17 +0000
Subject: Re: [PATCH] UBI: Fix s/then/than/ typos
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shinya Kuribayashi <shinya.kuribayashi.px@renesas.com>
In-Reply-To: <4BE26A87.4030206@renesas.com>
References: <4BE23A03.1030001@renesas.com>  <4BE23A6F.1010406@renesas.com>
	<1273128444.3702.202.camel@localhost>  <4BE26A87.4030206@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 06 May 2010 10:21:35 +0300
Message-ID: <1273130495.3702.205.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-05-06 at 16:06 +0900, Shinya Kuribayashi wrote:
> On 5/6/2010 3:47 PM, Artem Bityutskiy wrote:
> > Thanks for the patches, but they really look corrupted. Could you please
> > send applicable versions?
> 
> Ah, the culprit must be 'format=flowed'.  Recently I've migrated to
> Thunderbird3 and this was my first patch submission to communities.
> Should have disabled that option, sorry for inconvenience!
> 
> Will fix and resubmit a few hours later to wait for any feedbacks.

AFAIK, format=flowed is just about displaying quoted text, not changing
the contents.

I also tried to use thunderbird in the past, but it is very unfrienly to
patch submitters. So I switched to Evolution which is much better. But
for sending patches git send-email is the tool to use in most of the
cases, IMO.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
